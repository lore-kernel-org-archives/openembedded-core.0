Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1T50Ad-0005Io-DH
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 22:07:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7OJtljo009473
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 12:55:47 -0700 (PDT)
Received: from e6410-2 (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 24 Aug 2012 12:55:46 -0700
Date: Fri, 24 Aug 2012 14:55:28 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Peter Seebach <peter.seebach@windriver.com>
Message-ID: <20120824145528.6f7409c8@e6410-2>
In-Reply-To: <eef91770e809fcde924c197427cf4e1e956a29ae.1345686284.git.peter.seebach@windriver.com>
References: <cover.1345686284.git.peter.seebach@windriver.com>
	<eef91770e809fcde924c197427cf4e1e956a29ae.1345686284.git.peter.seebach@windriver.com>
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
X-List-Received-Date: Fri, 24 Aug 2012 20:07:55 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 22 Aug 2012 20:47:23 -0500
Peter Seebach <peter.seebach@windriver.com> wrote:

> +PSEUDO_LOCALSTATEDIR="$pseudo_state_dir

... This quote really IS missing. Something must have gone horribly
wrong with my merge attempt.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


