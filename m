Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U2Qwj-0004S0-7U
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 19:39:16 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r14INKIg022400
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Feb 2013 10:23:20 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Mon, 4 Feb 2013 10:23:17 -0800
Date: Mon, 4 Feb 2013 12:23:09 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20130204122309.12582d0b@e6410-2>
In-Reply-To: <1359977606-15432-1-git-send-email-constantinx.musca@intel.com>
References: <1359977606-15432-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: fix sqlite path and package missing files
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
X-List-Received-Date: Mon, 04 Feb 2013 18:39:17 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Mon, 4 Feb 2013 13:33:26 +0200
Constantin Musca <constantinx.musca@intel.com> wrote:

> - replace --enable-sqlite-static with --with-sqlite-static=.. in order
> to pass ${baselib} to configure (/lib doesn't work for the multilib
> lib32 build)

This looks eerily similar to, yet subtly different from, the changes I
made for pseudo-1.4.2/1.4.3. I'd spelled that as
"--with-static-sqlite=" for specifying an exact path to libsqlite.a,
but I eventually changed it to --with-sqlite-lib to allow an override
because bitbake's design seems to want libsqlite3.a to always be in
(host sysroot)/usr/lib, regardless of whether that's 64-bit or 32-bit.

> - use ${exec_prefix}/lib instead of ${libdir} because pseudo always
> uses /usr/lib

This seems right, but I hadn't done it in the recent submission of
1.4.3, and things were working anyway. So now I want to know why...

Anyway, I think these changes are probably redundant with the changes I
submitted over the weekend.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


