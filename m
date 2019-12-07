Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D8D3D7E648
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 11:16:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q9so10497041wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2019 03:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=NKNCl3GzjwCjH8m9Sz8j9BdlRKSRT5VXT4nrct8peNg=;
	b=Z6q4ekHkBk5UWtN6oV5EERyRv6Bvruy3E03bAQwfycgUnTULcozTBnVJ3GgPK/o498
	NEx5I8IRssDL5njetNlUd+RzmtpFPGwCv7eOdY1wrO8PkeAxsclFCfpGFPZmuqlDSkmR
	J1QX3Cz4NQJNiU91pdnfqi8OO3YB7D1wYyLy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NKNCl3GzjwCjH8m9Sz8j9BdlRKSRT5VXT4nrct8peNg=;
	b=rB2YF4PD71rK1hOB69jcYWRUXkRwhGFv5fJJVjen1Og/LVTXE07WMMB/n0r9ETPpSB
	h4lL22x1R6gIv0DrWZXjPw8YHqjJzC9wrHA9ycfkIoCcd/2eL1xfrm5aQb5VEzB1yPlC
	1Swsp/icfQcwELRGvbkbieDDdNpMA159f0lEfJT7ZfWoGijVKBrLCIaiHgd75Z34u7F6
	Uxe9Oo42SjnS9W5diQhhNYnCcIjcemI5apG9iiMCXHvyx8CtsC3IgFIXkAQxKf1eJqU2
	39yiN+pzEY1wX2jxkeN90czgRXQBS6wJmVsy1K9MVmgXGREbUoUYBLnj450SWj4LLTqK
	DXww==
X-Gm-Message-State: APjAAAXD808LOC+Iz+eNfHULhSeMBgMUMdqg0djxcg+LamTxCrW8wSsc
	oxMb3Kdr7nbJQ+81F3COuJ3N2Q==
X-Google-Smtp-Source: APXvYqxAwQUQLDtjFFfmGBDdSZ/wUgiBvX/aal6B9Ij9guLzcnr5tXKWs5h7mSOLDUfs3MLFIuUIog==
X-Received: by 2002:a05:600c:2144:: with SMTP id
	v4mr16050072wml.31.1575717394403; 
	Sat, 07 Dec 2019 03:16:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id u8sm4941831wmm.15.2019.12.07.03.16.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 03:16:33 -0800 (PST)
Message-ID: <115b7125290e36e572ab3b5712dca286bced0e8f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 07 Dec 2019 11:16:32 +0000
In-Reply-To: <20191206180949.59953-9-alex.kanavin@gmail.com>
References: <20191206180949.59953-1-alex.kanavin@gmail.com>
	<20191206180949.59953-9-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 09/10] at-spi2-atk: update to 2.34.1
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
X-List-Received-Date: Sat, 07 Dec 2019 11:16:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-12-06 at 19:09 +0100, Alexander Kanavin wrote:
> License-Update: license updated to LGPL v2.1
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../atk/{at-spi2-atk_2.32.0.bb =3D> at-spi2-atk_2.34.1.bb}  | 8 ++++
> ----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-support/atk/{at-spi2-atk_2.32.0.bb =3D> at-spi2-
> atk_2.34.1.bb} (65%)


https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/381

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/qemux86-64-ltp/build/meta/rec=
ipes-support/atk/at-spi2-atk_2.34.1.bb:do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

gcc -Itests/59830eb@@testutils@sta -Itests -I../at-spi2-atk-2.34.1/tests -I=
. -I../at-spi2-atk-2.34.1/ -I/home/pokybuild/yocto-worker/qemux86-64-ltp/bu=
ild/build/tmp/work/x86_64-linux/at-spi2-atk-native/2.34.1-r0/recipe-sysroot=
-native/usr/lib/pkgconfig/../../../usr/include/glib-2.0 -I/home/pokybuild/y=
octo-worker/qemux86-64-ltp/build/build/tmp/work/x86_64-linux/at-spi2-atk-na=
tive/2.34.1-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/gli=
b-2.0/include -I/home/pokybuild/yocto-worker/qemux86-64-ltp/build/build/tmp=
/work/x86_64-linux/at-spi2-atk-native/2.34.1-r0/recipe-sysroot-native/usr/l=
ib/pkgconfig/../../../usr/include -I/home/pokybuild/yocto-worker/qemux86-64=
-ltp/build/build/tmp/work/x86_64-linux/at-spi2-atk-native/2.34.1-r0/recipe-=
sysroot-native/usr/lib/pkgconfig/../../../usr/include/at-spi-2.0 -I/home/po=
kybuild/yocto-worker/qemux86-64-ltp/build/build/tmp/work/x86_64-linux/at-sp=
i2-atk-native/2.34.1-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/include/dbus-1.0 -I/home/pokybuild/yocto-worker/qemux86-64-ltp/build/buil=
d/tmp/work/x86_64-linux/at-spi2-atk-native/2.34.1-r0/recipe-sysroot-native/=
usr/lib/pkgconfig/../../../usr/lib/dbus-1.0/include -I/home/pokybuild/yocto=
-worker/qemux86-64-ltp/build/build/tmp/work/x86_64-linux/at-spi2-atk-native=
/2.34.1-r0/recipe-sysroot-native/usr/share/pkgconfig/../../../usr/include -=
pipe -D_FILE_OFFSET_BITS=3D64 -std=3Dc99 -D_DEFAULT_SOURCE -DATK_DISABLE_DE=
PRECATION_WARNINGS -O2 -isystem/home/pokybuild/yocto-worker/qemux86-64-ltp/=
build/build/tmp/work/x86_64-linux/at-spi2-atk-native/2.34.1-r0/recipe-sysro=
ot-native/usr/include -fPIC '-DTESTS_BUILD_DIR=3D"/home/pokybuild/yocto-wor=
ker/qemux86-64-ltp/build/build/tmp/work/x86_64-linux/at-spi2-atk-native/2.3=
4.1-r0/build/tests"' -MD -MQ 'tests/59830eb@@testutils@sta/atk_test_util.c.=
o' -MF 'tests/59830eb@@testutils@sta/atk_test_util.c.o.d' -o 'tests/59830eb=
@@testutils@sta/atk_test_util.c.o' -c ../at-spi2-atk-2.34.1/tests/atk_test_=
util.c
../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function =E2=80=98assert_cl=
ean_exit=E2=80=99:
../at-spi2-atk-2.34.1/tests/atk_test_util.c:30:3: warning: implicit declara=
tion of function =E2=80=98kill=E2=80=99 [-Wimplicit-function-declaration]
   kill (child_pid, SIGTERM);
   ^
../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function =E2=80=98get_root_=
obj=E2=80=99:
../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: variable =E2=80=
=98timeout=E2=80=99 has initializer but incomplete type
   struct timespec timeout =3D { .tv_sec =3D 0, .tv_nsec =3D 10 * 1000000 }=
;
          ^
../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field =E2=
=80=98tv_sec=E2=80=99 specified in initializer
../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess elements=
 in struct initializer [enabled by default]
../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near initializ=
ation for =E2=80=98timeout=E2=80=99) [enabled by default]
../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field =E2=
=80=98tv_nsec=E2=80=99 specified in initializer
../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess elements=
 in struct initializer [enabled by default]
../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near initializ=
ation for =E2=80=98timeout=E2=80=99) [enabled by default]
../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: error: storage size of =
=E2=80=98timeout=E2=80=99 isn=E2=80=99t known
   struct timespec timeout =3D { .tv_sec =3D 0, .tv_nsec =3D 10 * 1000000 }=
;
                   ^
../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5: warning: implicit declara=
tion of function =E2=80=98nanosleep=E2=80=99 [-Wimplicit-function-declarati=
on]
     nanosleep(&timeout, NULL);
     ^
../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function =E2=80=98terminate=
_app=E2=80=99:
../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: variable =E2=80=
=98timeout=E2=80=99 has initializer but incomplete type
   struct timespec timeout =3D { .tv_sec =3D 0, .tv_nsec =3D 10 * 1000000 }=
;
          ^
../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown field =
=E2=80=98tv_sec=E2=80=99 specified in initializer
../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess element=
s in struct initializer [enabled by default]
../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near initiali=
zation for =E2=80=98timeout=E2=80=99) [enabled by default]
../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown field =
=E2=80=98tv_nsec=E2=80=99 specified in initializer
../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess element=
s in struct initializer [enabled by default]
../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near initiali=
zation for =E2=80=98timeout=E2=80=99) [enabled by default]
../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19: error: storage size of =
=E2=80=98timeout=E2=80=99 isn=E2=80=99t known
   struct timespec timeout =3D { .tv_sec =3D 0, .tv_nsec =3D 10 * 1000000 }=
;
                   ^

On centos7.

Cheers,

Richard


