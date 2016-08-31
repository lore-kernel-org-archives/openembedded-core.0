Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9FD6FF7B;
	Wed, 31 Aug 2016 09:41:09 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id e124so32855107ith.0;
	Wed, 31 Aug 2016 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=94m6vZtWcJG+xrMwsNN3967fJHKx2lVVSpLjggLCpRI=;
	b=B2adwE+LBYt9YLSrW64Bhd+zZvM75Fu26q10kwVMhYYCAR8F0+c2RTjyL5kQ2K3sjx
	gvOLophDRdaay895i7adLsN5G6vm86oJ6lJTdgb8LAcr9yH6T295qIu4VhyFAahLUtLr
	PnYrwWK/AiQMkl28iDOnFfbkvEwVjQeTeKW/uaAZhybuU347YANPdURr+qdoyI1Gn9Cf
	eKTyGwGp4wMawbWJLEojz3CVgNljAky9OBtNKlCn6AE17P7TomHEGw/jAwQ8icrsIPe7
	1TCui9kaJIKAzI/9vW1FJcUOTHy1//c8ROxV1hrLLKbLKSYkIxu/VaBrZi1FjcQRdbZY
	K/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=94m6vZtWcJG+xrMwsNN3967fJHKx2lVVSpLjggLCpRI=;
	b=BRnat4ALWIijGv8S9OyMOccGhRtw6Kvioprq0C5Qm3652wfcbVU0uNIA7KEtdCAuBv
	urMSpoXD0688gbB4b9wrKWwoHexbJ5OuLIOtjrvHURLziAa1SFz2gz6QriwEZk82PoW4
	c6ly3aMACw+FqtRWMsFnP8Rn7ornFPX81kPJKXOtzwEUk60mfMQzl41bPxFR7N52KAat
	Qv1EXrgzKv4yFoT+hikPj8cHAbpILBVDv/n0UuJukc/N3AVp4O6TCxBE7joVRFf5Os+C
	2jJown3HaG48w7o2K3TGaDPOUhtk8erfzak3LIHTrbKOOloHhk0Zy12q4yG1nND4MQyx
	DrKQ==
X-Gm-Message-State: AE9vXwNmIri4rxo4r4h6Ad/fCc9RZPcGCcwJYoe2of7WuyApOQo1Ajkpl6MUpUKH6jMtVw==
X-Received: by 10.36.88.131 with SMTP id f125mr10888370itb.46.1472636470640;
	Wed, 31 Aug 2016 02:41:10 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	f65sm4016654ita.10.2016.08.31.02.41.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 02:41:09 -0700 (PDT)
Date: Wed, 31 Aug 2016 05:41:06 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160831094106.GA11085@openSUSE-i7.site>
References: <20160826155154.6fzokkxh5hsuvxld@jama>
MIME-Version: 1.0
In-Reply-To: <20160826155154.6fzokkxh5hsuvxld@jama>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world 2016-08-24
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
X-List-Received-Date: Wed, 31 Aug 2016 09:41:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2016-08-26 @ 05:51:54 PM, Martin Jansa wrote:
> =3D=3D=3D common-x86 (1) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium-wayland_48.0.2548.0.=
bb:do_patch

It was pointed out to me that while re-organizing the chromium recipes I
dropped an important line in chromium-wayland. However this recipe didn't
succeed before and my goal was to make chromium (on x11) succeed. So even w=
ith
the fix I'm not sure chromium-wayland is going to be okay.

> =3D=3D=3D qemux86 (1) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_c=
ompile

This one surprised me since I perform a chromium build every night on my CI
farm. Looking at your build logs I find:

| [2278/20239] CXX obj.host/third_party/icu/source/common/icuuc.servrbf.o
| FAILED: obj.host/third_party/icu/source/common/icuuc.servrbf.o
| g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.servrbf.o.d -D=
U_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSION=
=3D1 -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=
=3D64 -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD -DUI_COMPOS=
ITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_D=
EFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1 -DUSE_CLIPBOA=
RD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=3D1 -DENABLE_PEPPE=
R_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1 -DUSE_UDEV -DFIELDT=
RIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D1 -DEN=
ABLE_PDF=3D1 -DENABLE_PLUGINS=3D1 -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THE=
MES=3D1 -DENABLE_PRINTING=3D1 -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PR=
EVIEW=3D1 -DENABLE_SPELLCHECK=3D1 -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DE=
NABLE_SUPERVISED_USERS=3D1 -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1=
 -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMM=
ON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0 -DU_NOEX=
CEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DNDEBUG -DNVAL=
GRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/source/comm=
on -I../../third_party/icu/source/i18n -Igen -fstack-protector --param=3Dss=
p-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra -Wno-unused-par=
ameter -Wno-missing-field-initializers -fvisibility=3Dhidden -pipe -fPIC -W=
no-unused-local-typedefs -Wno-deprecated-declarations -Wno-unused-function =
-m32 -O2 -fno-ident -fdata-sections -ffunction-sections -funwind-tables -fn=
o-exceptions -fno-rtti -fno-threadsafe-statics -fvisibility-inlines-hidden =
-frtti -Wno-deprecated -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/=
icu/source/common/servrbf.cpp -o obj.host/third_party/icu/source/common/icu=
uc.servrbf.o
| In file included from ../../third_party/icu/source/common/unicode/std_str=
ing.h:33:0,
|                  from ../../third_party/icu/source/common/unicode/unistr.=
h:31,
|                  from ../../third_party/icu/source/common/unicode/strenum=
=2Eh:14,
|                  from ../../third_party/icu/source/common/unicode/uenum.h=
:24,
|                  from ../../third_party/icu/source/common/unicode/uloc.h:=
25,
|                  from ../../third_party/icu/source/common/unicode/ures.h:=
27,
|                  from ../../third_party/icu/source/common/unicode/resbund=
=2Eh:51,
|                  from ../../third_party/icu/source/common/servrbf.cpp:13:
| /usr/include/c++/4.8/string:38:28: fatal error: bits/c++config.h: No such=
 file or directory
|  #include <bits/c++config.h>

Odd. It looks like your build is picking up your host's c++ compiler version
4.8 (?). The odd thing is, my build machine also does not have a
/usr/include/bits/c++config.h but my compile succeeds.

