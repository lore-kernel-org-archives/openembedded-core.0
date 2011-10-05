Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBPqo-0003NG-8K for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 13:41:26 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95BgLJJ016524 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 12:42:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wCEnKdv25Kex
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 12:42:21 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95BgI4c016519
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 12:42:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Oct 2011 12:35:48 +0100
In-Reply-To: <4E8B9F2C.5030706@gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-5-git-send-email-msm@freescale.com>
	<4E8B9F2C.5030706@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317814555.14671.137.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 5/6] Fix sysprof for powerpc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Oct 2011 11:41:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-04 at 17:05 -0700, Khem Raj wrote:
> On 10/4/2011 3:03 PM, Matthew McClintock wrote:
> > sysprof will not build properly without this defined
> >
> > Signed-off-by: Matthew McClintock<msm@freescale.com>
> > ---
> > No comments on original patch sent
> >
> >   meta/recipes-kernel/sysprof/sysprof_git.bb |    2 ++
> >   1 files changed, 2 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
> > index 10bde04..271b5d8 100644
> > --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
> > +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
> > @@ -16,6 +16,8 @@ SRC_URI_append_arm  = " file://rmb-arm.patch"
> >   SRC_URI_append_mips = " file://rmb-mips.patch"
> >   SRC_URI_append_powerpc = " file://ppc-macro-fix.patch"
> >
> > +export CFLAGS_append_powerpc64 = " -D__ppc64__"
> > +
> 
> this is a gcc built-in define I wonder why you need to add it explicitly

Are you sure? Is the built-in define not __powerpc64__ ?

Cheers,

Richard



