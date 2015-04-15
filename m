Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E3845605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 13:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3FDZi81025596; Wed, 15 Apr 2015 14:35:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fyJNPbwMZWqv; Wed, 15 Apr 2015 14:35:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3FDZUhe025587
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Apr 2015 14:35:41 +0100
Message-ID: <1429104930.6976.117.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 15 Apr 2015 14:35:30 +0100
In-Reply-To: <552DC73E.5090002@windriver.com>
References: <cover.1428915889.git.liezhi.yang@windriver.com>
	<23b227aea2cf5a59a34099160df37b0c50077701.1428915889.git.liezhi.yang@windriver.com>
	<552DC73E.5090002@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] syslinux: add syslinux-nomtools to PACKAGES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Apr 2015 13:35:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-04-15 at 10:04 +0800, Robert Yang wrote:
> 
> On 04/13/2015 05:05 PM, Robert Yang wrote:
> > The default installed syslinux depends on mtools, we install
> > syslinux-nomtools too, which has the ext2/3/4 support.
> >
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >   meta/recipes-devtools/syslinux/syslinux_6.03.bb |    5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
> > index 33dd776..ddb8744 100644
> > --- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
> > +++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
> > @@ -66,14 +66,17 @@ do_install() {
> >   	install -d ${D}${datadir}/syslinux/
> >   	install -m 644 ${S}/bios/core/ldlinux.sys ${D}${datadir}/syslinux/
> >   	install -m 644 ${S}/bios/core/ldlinux.bss ${D}${datadir}/syslinux/
> > +	install -m 644 ${S}/bios/linux/syslinux-nomtools ${D}${bindir}/
> 
> Sorry, I updated this patch a little, it should be:
> 
> -m 0755, not 0644.
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/syslinux
> 
> Thanks to Adrian.

I merged master-next which contained this patch before seeing this. I've
created a fix for master-next. With this tweak in it. This is the
downside to tweaking branches already in master-next though :(.

Cheers,

Richard


