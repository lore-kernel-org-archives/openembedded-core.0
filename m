Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD137F745
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 22:45:13 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id g15so1398533qka.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 14:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kCPA68jibHYCVGIRFUY5dZOjh4hQFdchkYcyG5B2bbU=;
	b=b739jofMjtSffkW/uVuxkQWtpaG2WM2m7lUysdRA40Tv3jYSaIQ74haWxWklWXZGeC
	BQnkA3u//4bVGfFoJMwDOKaYfnbCy5vPkJ9bEGMv0CFzRB9sKVzyKf7MAnl9baS+6u9+
	qIkHIoy7j5zvstO3+1ugdhurqTlMG6G2pxNxXcYC0Gw9kXIo2CbhWAlG+LEsYNE3zeRF
	eEPoxoA2+TEUX3nqy+SuAM0d94++4utUiZ2onUiyiEU+MLxh8+vA8ybA39ISxmqQiMzg
	9jklVrsEVBlVFZKNSMPiktQJKOwaVDvk2Mm+cdqrh56Jj1dUU3pnRlntyyMkExdT9HKd
	fG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kCPA68jibHYCVGIRFUY5dZOjh4hQFdchkYcyG5B2bbU=;
	b=NLKpROLS37CjLmk3zfphnBFCOkwtY8u3K9Qd2u6ToUCJIt1AaqfeBjCTwQvCETXTmt
	yN0uGeZ8AdrgNiG+kmHhQeHfvMIWhwQAP6wI/kCaeLiDALxgf3o3tCyP8W81po4chFZi
	8dPJQkK90oUjWk3YH+23dOEzif/+Xxs7TjC8QbGFqNH25nqmEIcGHuUMw0rH1GOBujuH
	S0zlGsyfg/lKZq4bc16a+nBPtFsSkMtzPZcBQ0pjL9UA2HzbI+A+9NA+02JrglyVrF5j
	kWoytWeLSDrzseWigxxRl9DyUq7qfhBhSpJotRNCGBVdNx3Utc8kWQVMcHX5qIKfLoBF
	0Uyw==
X-Gm-Message-State: APjAAAXl56eR2rhAgkWlCQ0XJwbXvgn/2+pnQneZuLWdicY41sPhv/rF
	aGDzA8Kke44NyHLMTSD9ST4ps4hBZhysqsiaALo=
X-Google-Smtp-Source: APXvYqzNHtRmF9bncvGTstLe54GtqVamL22bcFT/RM+JkkilVJ6r2xkJgXvgXP9mJL/gF/2fQsEnrfvd8+tdNU/fqHc=
X-Received: by 2002:a37:a0cf:: with SMTP id j198mr1727213qke.9.1575326713478; 
	Mon, 02 Dec 2019 14:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-2-alex.kanavin@gmail.com>
	<33182b29-de6e-f918-2915-df016b854e81@intel.com>
	<20191202151051.GC1581@localhost>
	<CANNYZj-VDVRB4qQDRG9+uHk0+QSm4d+Af-U2DNyb8QjyAj+o=w@mail.gmail.com>
In-Reply-To: <CANNYZj-VDVRB4qQDRG9+uHk0+QSm4d+Af-U2DNyb8QjyAj+o=w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Dec 2019 14:44:47 -0800
Message-ID: <CAMKF1soeGLC48o0nsn=hZ2p89L43edF3SKuqXUP18-U=1=g99g@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 02/15] libdnf: upgrade 0.28.1 -> 0.38.1
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
X-List-Received-Date: Mon, 02 Dec 2019 22:45:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2019 at 7:25 AM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> It's using -std=3Dc++11. I'm not sure if switching to gnu flavour would h=
ave made a difference with gcc 4.8 provided in centos 7 and gcc 4.9 from De=
bian 8 - is it worth trying? Newer gcc versions don't complain and build th=
is without error while still using -std=3Dc++11.
>
> I'm leaning towards taking out the dnf/libdnf updates until these distros=
 are retired from the supported distro list.

try adding #include <atomic> in libdnf/dnf-context.cpp

>
> Alex
>
> On Mon, 2 Dec 2019 at 16:10, Adrian Bunk <bunk@stusta.de> wrote:
>>
>> On Mon, Dec 02, 2019 at 02:55:06PM +0000, Ross Burton wrote:
>> > FAILED: libdnf/CMakeFiles/libdnf.dir/dnf-context.cpp.o
>> > /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-li=
nux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:2618:8:
>> > error: =E2=80=98atomic_flag=E2=80=99 in namespace =E2=80=98std=E2=80=
=99 does not name a type
>> >  static std::atomic_flag cfgMainLoaded =3D ATOMIC_FLAG_INIT;
>> >         ^
>> > /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-li=
nux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:
>> > In function =E2=80=98libdnf::ConfigMain& libdnf::getGlobalMainConfig()=
=E2=80=99:
>> > /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-li=
nux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:2622:10:
>> > error: =E2=80=98cfgMainLoaded=E2=80=99 was not declared in this scope
>> >      if (!cfgMainLoaded.test_and_set()) {
>> >           ^
>> > This was on a Centos 7 worker...
>>
>> The build should also fail on Ubuntu 16.04.
>>
>> Building with -std=3Dgnu++11 should fix it (untested).
>>
>> > Ross
>>
>> cu
>> Adrian
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

