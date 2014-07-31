Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E934070675
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 13:45:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6VDjVHi011168; Thu, 31 Jul 2014 14:45:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 758cUCtt-tNH; Thu, 31 Jul 2014 14:45:31 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6VDjQUo010935
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 31 Jul 2014 14:45:28 +0100
Message-ID: <1406814326.13346.179.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 31 Jul 2014 14:45:26 +0100
In-Reply-To: <53D9FBF1.3050900@windriver.com>
References: <cover.1406794207.git.liezhi.yang@windriver.com>
	<989bf32313d1405858f7839e5474fe9be93fd182.1406794207.git.liezhi.yang@windriver.com>
	<53D9FBF1.3050900@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] local.conf.sample.extended: update for preferred ABI
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
X-List-Received-Date: Thu, 31 Jul 2014 13:45:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-31 at 16:18 +0800, Robert Yang wrote:
> 
> On 07/31/2014 04:15 PM, Robert Yang wrote:
> > [YOCTO #4073]
> >
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >   meta/conf/local.conf.sample.extended |   15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >
> > diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
> > index 89b80a6..8ad7b6f 100644
> > --- a/meta/conf/local.conf.sample.extended
> > +++ b/meta/conf/local.conf.sample.extended
> > @@ -145,6 +145,13 @@
> >   #MULTILIBS = "multilib:lib32"
> >   #DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> >
> > +# Set RPM_PREFER_COLOR to configure preferred ABI when using rpm packaging
> > +# backend to generate a rootfs, choices are:
> > +# 1: ELF32 wins
> > +# 2: ELF64 wins
> > +# 3: ELF64 N32 wins (for mips64 or mips64el only)
> > +#RPM_PREFER_COLOR ?= "2"
> > +

Is x86 x32 also color 3?

Cheers,

Richard


