Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 60899605F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 21:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t37LuQTj008047; Tue, 7 Apr 2015 22:56:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ai0E9dypaswG; Tue,  7 Apr 2015 22:56:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t37LuAcd008041
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Apr 2015 22:56:21 +0100
Message-ID: <1428443770.14020.483.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 07 Apr 2015 22:56:10 +0100
In-Reply-To: <F8FD5455-119C-4814-8871-320AF0E7B72F@gmail.com>
References: <1428418272.14020.467.camel@linuxfoundation.org>
	<F8FD5455-119C-4814-8871-320AF0E7B72F@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Allow gold to build even when not the default
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
X-List-Received-Date: Tue, 07 Apr 2015 21:56:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2015-04-07 at 12:33 -0700, Khem Raj wrote:
> > On Apr 7, 2015, at 7:51 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > It can be useful to have gold available for testing even when its not the
> > default, therefore build gold by default in all configurations.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> > index afb582a..3c65efc 100644
> > --- a/meta/recipes-devtools/binutils/binutils.inc
> > +++ b/meta/recipes-devtools/binutils/binutils.inc
> > @@ -73,7 +73,7 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
> > 
> > LDGOLD_class-native = ""
> > LDGOLD_class-crosssdk = ""
> > -LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '', d)}"
> > +LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default', d)}”
> > 
> 
> may be enable-gold could be done unconditionally ? and then —enable-gold|ld=default controlled with ld-is-gold ?
> ld-is-gold anyway meant that default linker is gold, it did not mean
> to just build gold, so we are not changing semantics

The above effectively does mean we're always building gold, it just
controls whether ld is gold or not as before?

Cheers,

Richard




