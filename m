Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B47CD7D660
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 10:51:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t17so8004205wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=5Jw7z1bwk4S2GrVSpaqXx8gpPYg3/tNO/4GQ99qJuh8=;
	b=aOrKJc9cMci+H/hkl0n/Q2PTRiKOI/Z+zpK0NczQavl826xLuGeh4hEvVIVWcAFD8/
	BOQOwwtWNG7ekYsgoRWdcM5iquk1cIT4ekqAkZ4DuAbN9hSU8rhSu6qEXG/ry8NGl3m5
	ruFLNgrw1oH8RFdkxJp0sm6vf+ArbPaE3jzAW7iftuegiCgzysaJ4j/FEPOc3mzm3JF2
	JRRlegXWp4H3EcFvNIWnP+QkT1ofZKOkVYGMKfv43w4GpQEDkig0fKlwkUiRJ2JNjhle
	mw/3k/kntMHnyVwI2c/IIOWI1IYUkqD4skW0SmwkOHax+M9h2DMxvoReAo9ETs8DHQYA
	KBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=5Jw7z1bwk4S2GrVSpaqXx8gpPYg3/tNO/4GQ99qJuh8=;
	b=mGuRnhZzcNhOmYAY23qOczEbtVgXJYY4dllnmT8d/3+DtpWAyFKHB1xG8yt0DeRhfY
	Jud6F+MZMX8TeqdnUHSsod2DAe5fHjavVSr2uH/R/smX5bmXPErfRFmXT2Ad2Ui/Gbir
	5nFdryaoAyurUDAacF7wjsSwFNR4zz6GjWiz8LXLp4ZWvtm5J0az8+FSQESV4HXHRVgJ
	IMtReSwm4XrOE0Rj5+cp0/XkS+TrXZ7o8I9yWQOHMe6pCNJcdVH8RpmtenJobvCg3ifQ
	kpUxj3tmhmUXVSbwYrV2h809sT+rnf0shzOb/I+fFopistr7chdlmP+FY3/DrkSyUITM
	tp3Q==
X-Gm-Message-State: APjAAAULhIy0oURPwjLEsnFundw5rRWqdwCR82Re5yURwTLepTDiLPrw
	29lOq+SVvLctyoNq6St4t5A=
X-Google-Smtp-Source: APXvYqzxA3W+O7TAUo0Xa+RfF8wHax0Ep0J3yiSaueYL/Cp6pc6GBuzCWRgxOKHG+KbF8iz6IemFGg==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr24267973wrv.79.1556362280537; 
	Sat, 27 Apr 2019 03:51:20 -0700 (PDT)
Received: from ?IPv6:2a02:8109:b5c0:1267:f14e:659c:1edd:c8ce?
	([2a02:8109:b5c0:1267:f14e:659c:1edd:c8ce])
	by smtp.gmail.com with ESMTPSA id
	w12sm64638826wrg.29.2019.04.27.03.51.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Apr 2019 03:51:19 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <CALbNGRQUmLRMzXmMeLx21x5ZCuj+00EOL5Oo8S2JoVeeYqGfiA@mail.gmail.com>
Date: Sat, 27 Apr 2019 12:51:14 +0200
Message-Id: <4C482E9C-6F89-40FD-A1AF-3F090BB73C25@gmail.com>
References: <20190424091318.18154-1-schnitzeltony@gmail.com>
	<e290569afc4a08a1489cf033195e32d58ba78e19.camel@linuxfoundation.org>
	<CALbNGRTMzeWHgAO6MdLs1HmiCrMWfmpd3=OLUrJdSDBbbT44Gg@mail.gmail.com>
	<CALbNGRSjZ1mDoDNT7SXyKfFad4r7Yn8pLdL8ddMhKE-nctFBtw@mail.gmail.com>
	<BC6A3A88-2393-4AD1-8153-1301759A9646@gmail.com>
	<CALbNGRQUmLRMzXmMeLx21x5ZCuj+00EOL5Oo8S2JoVeeYqGfiA@mail.gmail.com>
To: =?utf-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte: upgrade 0.52.2 -> 0.56.1
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
X-List-Received-Date: Sat, 27 Apr 2019 10:51:20 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Look at the step2d section, the actual error is there. Errors section includ=
es only the high level errors.

Alex

> On 27 Apr 2019, at 12.44, Andreas M=C3=BCller <schnitzeltony@gmail.com> wr=
ote:
>=20
> On Sat, Apr 27, 2019 at 12:02 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>>=20
>> The build log makes it rather clear?
>>=20
>> configure: error: *** A compiler with support for C++17 language features=
 is required.
>>=20
>>=20
> It is not that I cannot read how about a link?
>=20
> Followed Richard's link
>=20
> and find nothing which helps:
> ERROR: vte-native-0.56.1-r0 do_configure: configure failed
> ERROR: vte-native-0.56.1-r0 do_configure: Function failed:
> do_configure (log file is located at
> /home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/x86=
_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196)
> ERROR: Logfile of failure stored in:
> /home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/x86=
_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196
> ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/oe-selftest/build=
/meta/recipes-support/vte/vte_0.56.1.bb:do_configure)
> failed with exit code '1'
> ERROR: vte-native-0.56.1-r0 do_configure: configure failed
> ERROR: vte-native-0.56.1-r0 do_configure: Function failed:
> do_configure (log file is located at
> /home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/x86=
_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196)
> ERROR: Logfile of failure stored in:
> /home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/x86=
_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196
> ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/oe-selftest/build=
/meta/recipes-support/vte/vte_0.56.1.bb:do_configure)
> failed with exit code '1'
> ERROR: Command . ./oe-init-build-env; ${SCRIPTSDIR}/checkvnc;
> DISPLAY=3D:1 oe-selftest --skip-tests
> distrodata.Distrodata.test_checkpkg
> buildoptions.SourceMirroring.test_yocto_source_mirror -j 15 failed
> with exit code 1, see errors above. (1556308938.9: 9403.3)
>=20
> Andreas

