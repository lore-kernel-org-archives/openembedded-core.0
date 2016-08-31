Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9E94A7318D;
	Wed, 31 Aug 2016 15:41:06 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id i184so15857833itf.1;
	Wed, 31 Aug 2016 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=YLISBAVk2isG2LCezqrqMA3FNc1m2eye3av5uJwIGqc=;
	b=bmypQffwehIjuyFwBlU8b5C0rCtbA7Y1imH/5vI8kBB4p+ndRtw3KeJMLb9MaNy4FJ
	ebLeCCFjIevfagsw/a9IwbauIWdi8yquQEB599gpSmDZXjI4G2VR2Lgl5/LdkMQ6Od/h
	CjqLl1DiSkV8fBodJz9ap2S/n4AZp+QaOVhdM9zyGC4cu4+/q+pXCTgkKnQMuDV5FZSr
	FVRfOqtdHJ2K9M+sIrSkhjMtglPqqM0JdArkz8ZfSRVE+bvqTfD75UuH3Bn3YfKGUM7u
	AaBzzfTLKEk8ggf7EqUbDWIVGKXqCSzdaZxUMXRqONPoEjsb3YIytWAr9Z+Q/o1W+s9j
	BdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=YLISBAVk2isG2LCezqrqMA3FNc1m2eye3av5uJwIGqc=;
	b=VxB0AFx5ofn7Bz4+swHoP0UgD7r3EvbaldPsDS2QNiZAnTgWqsi3FvPd0Mbu0EM4YR
	S7pqnTxqfcRh64jBetJfT6G8QPVuNOccb0YmAZgnebRV8/XBbkSvMhTSOqJUCqEbvUJQ
	1hKsk98OKHDTlxQw4zfMVhXhN631yKCpkAnEpO2AhvfCG5ZmGd2sMxN1W9kn+7YBosk2
	xVOO0GRLSy95Pux9++8XUjyMKuxCicndElZD9Evi8nlPSatyextBVv81QF/OwzfMbFfO
	5Fqp8hvAcSYAEjMdDadmJHFHsN1NM7zTSlKNgAevWTLjr9dniBRbByiid7ApSOIlDSin
	8tXg==
X-Gm-Message-State: AE9vXwP7gJ2xVuZTef9SWpyABTC6fkcxyzcfai3ox/wsu7vU5wa7zNhzVRSadGabeAkaNA==
X-Received: by 10.107.147.8 with SMTP id v8mr6041845iod.148.1472658067072;
	Wed, 31 Aug 2016 08:41:07 -0700 (PDT)
Received: from openSUSE-i7.site ([45.72.199.207])
	by smtp.gmail.com with ESMTPSA id
	f65sm4536749ita.10.2016.08.31.08.40.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 08:40:59 -0700 (PDT)
Date: Wed, 31 Aug 2016 11:40:55 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160831154055.GA26921@openSUSE-i7.site>
References: <20160826155154.6fzokkxh5hsuvxld@jama>
	<20160831094106.GA11085@openSUSE-i7.site>
MIME-Version: 1.0
In-Reply-To: <20160831094106.GA11085@openSUSE-i7.site>
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
X-List-Received-Date: Wed, 31 Aug 2016 15:41:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I performed a verbose build on my build machine to see how it compares to
yours.

On Wed 2016-08-31 @ 05:41:06 AM, Trevor Woerner wrote:
> On Fri 2016-08-26 @ 05:51:54 PM, Martin Jansa wrote:
> | [2278/20239] CXX obj.host/third_party/icu/source/common/icuuc.servrbf.o
> | FAILED: obj.host/third_party/icu/source/common/icuuc.servrbf.o
> | g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.servrbf.o.d =
-DU_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSIO=
N=3D1 -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=
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

Buried deep in all your compiler options is "-m32". On my machine all these
options are exactly the same except for this one; in my case my build has
"-m64".

Are you doing your world builds on a 32-bit machine?

Could this one change account for my build success and your build failure?

