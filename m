Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D170E7785D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 16:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2BG5udw023718; Sat, 11 Mar 2017 16:05:56 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AYJ3y32jqWhv; Sat, 11 Mar 2017 16:05:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2BG5rRE023640
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 11 Mar 2017 16:05:54 GMT
Message-ID: <1489248353.13980.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 16:05:53 +0000
In-Reply-To: <1489240055.13980.19.camel@linuxfoundation.org>
References: <20170309202331.5595-1-alexander.kanavin@linux.intel.com>
	<20170309202331.5595-4-alexander.kanavin@linux.intel.com>
	<1489240055.13980.19.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 4/4] gpgme: fix python module build and installation
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
X-List-Received-Date: Sat, 11 Mar 2017 16:05:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2017-03-11 at 13:47 +0000, Richard Purdie wrote:
> On Thu, 2017-03-09 at 22:23 +0200, Alexander Kanavin wrote:
> > 
> > Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com
> > >
> > ---
> >  ...-Avoid-host-contamination-from-gpg-config.patch | 28
> > ++++++++++++++++++++++
> >  .../0001-Correctly-install-python-modules.patch    | 26
> > ++++++++++++++++++++
> >  meta/recipes-support/gpgme/gpgme_1.8.0.bb          |  2 ++
> >  3 files changed, 56 insertions(+)
> >  create mode 100644 meta/recipes-support/gpgme/gpgme/0001-Avoid-
> > host-
> > contamination-from-gpg-config.patch
> >  create mode 100644 meta/recipes-support/gpgme/gpgme/0001-
> > Correctly-
> > install-python-modules.patch
> > 
> > diff --git a/meta/recipes-support/gpgme/gpgme/0001-Avoid-host-
> > contamination-from-gpg-config.patch b/meta/recipes-
> > support/gpgme/gpgme/0001-Avoid-host-contamination-from-gpg-
> > config.patch
> > new file mode 100644
> > index 00000000000..b0a9645997c
> > --- /dev/null
> > +++ b/meta/recipes-support/gpgme/gpgme/0001-Avoid-host-
> > contamination-
> > from-gpg-config.patch
> > @@ -0,0 +1,28 @@
> > +From 96cfc76def123141d0cecaab857da3880396d5ef Mon Sep 17 00:00:00
> > 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Thu, 9 Mar 2017 22:11:00 +0200
> > +Subject: [PATCH] Avoid host contamination from gpg-config
> > +
> > +gpg-config gives us -L/usr/lib as the first item for linking.
> > +
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + lang/python/setup.py.in | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> I'm not sure which patch is doing it but you probably need to look
> at:
> 
> https://autobuilder.yocto.io/builders/nightly-world-lsb/builds/187

Which I now realise is from the missing security flag changes so I can
resolve this.

Cheers,

Richard


