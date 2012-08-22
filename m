Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1T4Gfa-0000iP-2R
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 21:32:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7MJKeGt025283
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Aug 2012 12:20:40 -0700 (PDT)
Received: from e6410-2 (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 22 Aug 2012 12:20:40 -0700
Date: Wed, 22 Aug 2012 14:20:23 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Scott Garman <scott.a.garman@intel.com>
Message-ID: <20120822142023.229797bc@e6410-2>
In-Reply-To: <50350A1B.4060505@intel.com>
References: <cover.1345573717.git.peter.seebach@windriver.com>
	<511616ed1761453ec1323aa945c559ca6cafffd1.1345573717.git.peter.seebach@windriver.com>
	<50350A1B.4060505@intel.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] runqemu-export-rootfs and friends: don't put pseudo db in target fs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 19:32:50 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 22 Aug 2012 09:34:35 -0700
Scott Garman <scott.a.garman@intel.com> wrote:

> This would mean that if someone tried to put multiple rootfs
> directories in the same subdirectory, they could clobber each other's
> pseudo_state data, correct? Putting multiple rootfs directories in
> the same subdir is a common use case already, I don't think we could
> break that.

Good catch!

I didn't realize this was a common use case.

> If you appended the top-level rootfs directory name
> to ../pseudo_state, e.g, ../pseudo_state_<dirname>, that would keep
> the pseudo_state directories separate and make it fairly obvious what
> rootfs they belonged to.

Good idea.

> Also, neither of these schemes would support having $target_sysroot 
> directly under / (though I'm not sure why someone would do that).

Yeah. I don't really like having the pseudo stuff outside the
directory, but I dislike it less than I dislike having it in the
directory. :)

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


