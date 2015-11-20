Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id BD26A60112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 11:02:52 +0000 (UTC)
Received: by wmec201 with SMTP id c201so66640024wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 03:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:cc:date:in-reply-to:references:content-type
	:mime-version:content-transfer-encoding;
	bh=CFru0ydZM19iaxM6rgwvqk7bkPpZL97VdPfHNGsKmiU=;
	b=eIg/E6uZsKZvd8wmxfJj/LgaYXjXngP6kL6bwOnYrf0bFq8q6c15c+TZXFX4JnSpYf
	3Qm9ScDC5Xh5lBKYGJRSS6Z4w/eEl8N7S7g4xRo+yYmPzEGkZNliaozVCmWwWMiRciiE
	6Z6ADq+IRIXqAyJLc6+hRj7f7WiGX9T265Z9NmQZ2VH/37GJsChEjrJFgb7Gs01VYq6d
	AeBDY0dyds1ozB+O/7co805cGjMyiydrN8aFyRLBNMflUxoXYr4L3qIP78LB5wAbtpDH
	ixKBXGd7tnaidzqbouUlQ9rnwPs/PUY/YJm7oDRPFiipMzGNbsGpoucLT5Wb+L6L/LZ9
	EkpQ==
X-Received: by 10.28.212.84 with SMTP id l81mr1761735wmg.50.1448017372422;
	Fri, 20 Nov 2015 03:02:52 -0800 (PST)
Received: from [192.168.0.7] (212-41-113-194.adsl.solnet.ch. [212.41.113.194])
	by smtp.gmail.com with ESMTPSA id
	jt9sm12165093wjc.24.2015.11.20.03.02.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Nov 2015 03:02:52 -0800 (PST)
Message-ID: <1448017370.2788.16.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Nov 2015 12:02:50 +0100
In-Reply-To: <CALbNGRTiMGfhtvtt+q_SFsKMpMMP-Y7XKQHUc2upqTNXnYrEmA@mail.gmail.com>
References: <CALbNGRTiMGfhtvtt+q_SFsKMpMMP-Y7XKQHUc2upqTNXnYrEmA@mail.gmail.com>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Subject: Re: Lots of [host-user-contaminated] warning
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
X-List-Received-Date: Fri, 20 Nov 2015 11:02:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Andreas

Am Dienstag, den 17.11.2015, 09:46 +0100 schrieb Andreas Müller:
> Hi,
> 
> this bugs me for a while and I wonder if I am again the only one
> facing this: I get floods of warnings for sourcecode files as
> 
> WARNING: QA Issue: qtserialport:
> /qtserialport-dbg/usr/src/debug/qtserialport/5.5.99+5.6.0-alpha1
+gitAUTOINC+2575d33fab-r0/git/src/serialport/qserialport_p.h
> is owned by uid 1000, which is the same as the user running bitbake.
> This may be due to host contamination [host-user-contaminated]
> WARNING: QA Issue: qtx11extras:
> /qtx11extras-dbg/usr/src/debug/qtx11extras/5.5.99+5.6.0-alpha1
+gitAUTOINC+d64ee96f0d-r0/git/src/x11extras/qx11info_x11.cpp
> is owned by uid 1000, which is the same as the user running bitbake.
> This may be due to host contamination [host-user-contaminated]
> WARNING: QA Issue: qtxmlpatterns:
> /qtxmlpatterns-dbg/usr/src/debug/qtxmlpatterns/5.5.99+5.6.0-alpha1
+gitAUTOINC+94136d4280-r0/git/src/xmlpatterns/type/qbuiltintypes.cpp
> is owned by uid 1000, which is the same as the user running bitbake.
> This may be due to host contamination [host-user-contaminated]
> 
> I checked PACKAGE_DEBUG_SPLIT_STYLE is not set globally - few recipes
> set PACKAGE_DEBUG_SPLIT_STYLE to debug-without-src.
> 
> Help appreciated
> 
> Andreas

I see this also in my builds. The warnings clutter the build output in a
way that makes the warnings mostly useless. Who will spot the one
important new warning in the hundreds of host-user-contaminated ones?
A fresh build of core-image-minimal today gave me 54 of these warnings.
All but one (glibc-locale) complaining on source files.

I checked a few recipes and most of them were not even using a custom
do_install but autotools generated 'make install' with something like
'cp -p src/* dest/' or so.

Even if I know how to do it I think we should not patch upstream sources
to suppress a warning introduced by the downstream build system with
loads of false positives and then have to maintain the patches as
upstream is progressing.

I haven't looked into how one does it but I'm inclined to switch of the
warning globally, e.g. in local.conf.

Max


