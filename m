Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 91F71731B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 18:04:27 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id h8so206132iob.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 10:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=yQZkvTQozu1JW+NNQ3jSW4+UOZBZo2NQsDzzFTeH+rU=;
	b=ocJFV6xLKf+vfmzXpwNp5G9D0Sli6vwtUu56EW4eoyx7SRC3NGfSchYDQodKg/fANR
	48RSZVYT7rvY4Z6M5rgg8QQyx7OYw2eeVDBk6svB+R354WVmmNZA+O0OYROClsrBe6g6
	n8//SVfkEpXNWyYIejbmOxX5XJ3J66+jexWSa74OwPRN+23hlCfDXe9b/rNcKM7cYWPy
	SbWztbeyNdyiqgPMEKU81LpkD55rR4uBjP3amaRZFlh/If2KenLZBrcqX7rFozxwS6/s
	fkV94U1mPj1QSoLbaRIFGPx1iznbrKKxUoOAVO8z4VihD45lAKydPflC+C2LW87EwOo0
	BrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=yQZkvTQozu1JW+NNQ3jSW4+UOZBZo2NQsDzzFTeH+rU=;
	b=IwNRaJK1BlGu+lLB2Gzy6f+wvR4Nmdnz3265M2lhCDrRXcQNNCF01i6W2gj6L5knIZ
	DB12h6TfPjOFUI6nVtu21Uc15/Rn+HJPu0ncxHTSvQKuSZXgcNrms4cCWUzE346ld9JR
	CA2WhqPJ40/og66QX9PjzN3XylT674kIKaWmvVtzozlZ9LFzaE3ozKxwAnE/gXdD9ONc
	d/ILvuD1x5CSFInMgco/VcB/sH0g2L5FNdH4+5QBHomPA5bXjClg69ELQRdkth+9fBC6
	3AUvu3HXXh+KTd/SO9X0qE+Z9cU19A7dnsrBJkhlOHMK4i356BubOnys34Bxu8CfE5PG
	CIAQ==
X-Gm-Message-State: APjAAAV7yyMlRl7zT9PgHI0qoKK6t/qxwpWrFuY4BGRgBLZe4vAoM7hI
	vVpsvxNgq3+aDPAY/LARhLSj5Tkmc2M=
X-Google-Smtp-Source: APXvYqwtkz5TBMyz6VSz5efo0QYd6aKKGYP4H3iEIeC9PNmvcJxIT7lP1PBADVv0by/6L21Gjjc3zA==
X-Received: by 2002:a6b:b594:: with SMTP id e142mr7211830iof.99.1579716267766; 
	Wed, 22 Jan 2020 10:04:27 -0800 (PST)
Received: from [10.30.196.43] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	l22sm14769088ilh.37.2020.01.22.10.04.26
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 22 Jan 2020 10:04:26 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200119185959.406212-1-JPEWhacker@gmail.com>
	<20200119185959.406212-4-JPEWhacker@gmail.com>
	<d3f6ae17e1a4da2e9aea675d37654a1fe0b1df3d.camel@linuxfoundation.org>
	<b1001ab8-5972-b791-b9db-9aab7fa34da0@gmail.com>
	<e6c8ea7d5e9497e0f11da3da3babdf57660b3ebe.camel@linuxfoundation.org>
Message-ID: <69dcf6fc-8723-18f7-eeb5-cfcafe4c0e62@gmail.com>
Date: Wed, 22 Jan 2020 12:04:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <e6c8ea7d5e9497e0f11da3da3babdf57660b3ebe.camel@linuxfoundation.org>
Subject: Re: [PATCH 3/3] oeqa: reproducible: Do not strip packages
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
X-List-Received-Date: Wed, 22 Jan 2020 18:04:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/22/20 10:06 AM, Richard Purdie wrote:
> On Wed, 2020-01-22 at 10:02 -0600, Joshua Watt wrote:
>> On 1/22/20 9:53 AM, Richard Purdie wrote:
>>> On Sun, 2020-01-19 at 12:59 -0600, Joshua Watt wrote:
>>>> Do not strip packages when testing reproducible builds. In some cases,
>>>> stripped data differs between builds, but then gets removed. However,
>>>> the contents affect the generation of the GCC build-id, which then
>>>> differs in the resulting ELF files, even though the data that caused
>>>> this is no longer there. Inhibit stripping so that their causes can be
>>>> evaluated.
>>>>
>>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>>> ---
>>>>    meta/lib/oeqa/selftest/cases/reproducible.py | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
>>>> index c00b92d2e90..34462a0b3a4 100644
>>>> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
>>>> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
>>>> @@ -149,6 +149,7 @@ class ReproducibleTests(OESelftestTestCase):
>>>>            config = textwrap.dedent('''\
>>>>                INHERIT += "reproducible_build"
>>>>                PACKAGE_CLASSES = "{package_classes}"
>>>> +            INHIBIT_PACKAGE_STRIP = "1"
>>>>                TMPDIR = "{tmpdir}"
>>>>                ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
>>>>                            tmpdir=tmpdir)
>>> This generates quite the failure list:
>>>
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-dbg_20190110-r0_all.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-dev_20190110-r0_all.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-doc_20190110-r0_all.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates_20190110-r0_all.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/acl-ptest_2.2.53-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/attr-ptest_2.4.48-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/bc-doc_1.07.1-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/binutils-doc_2.33.1-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/busybox-ptest_1.31.1-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/coreutils-doc_8.31-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/e2fsprogs-doc_1.45.4-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/elfutils-ptest_0.178-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/ethtool-ptest_5.3-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/flex-ptest_2.6.4-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-dbg_3.24.13-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-src_3.24.13-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/icu-dev_64.2-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libevdev-src_1.8.0-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgcrypt-dbg_1.8.5-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgcrypt_1.8.5-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgtk-3.0_3.24.13-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libidn2-dev_2.3.0-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libinput-dbg_1.14.3-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libinput10_1.14.3-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libx11-locale_1.6.9-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxml2-ptest_2.9.10-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxshmfence-dbg_1.3-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxshmfence1_1.3-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/m4-ptest_1.4.18-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/mc-doc_4.8.23-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/mc-helpers-perl_4.8.23-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/ncurses-doc_6.1+20190803-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/openssl-doc_1.1.1d-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/openssl-ptest_1.1.1d-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/opkg-utils-doc_0.4.2-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-dbg_5.30.1-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-dev_5.30.1-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-config-heavy_5.30.1-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-data-dumper_5.30.1-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-ptest_5.30.1-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl_5.30.1-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo-dbg_1.8.29-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo-doc_1.8.29-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo_1.8.29-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tar-dbg_1.32-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tar_1.32-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tcp-wrappers-src_7.6-r10_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/time-doc_1.9-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/xserver-xorg-dbg_1.20.6-r0_amd64.deb
>>>    /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/xserver-xorg_1.20.6-r0_amd64.deb
>>>
>>> (I lined wrapped it)
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/629
>> Ok, thanks. Did the offending packages get captured somewhere so I can
>> take a look at them?
> I've placed them here:
>
> https://autobuilder.yocto.io/pub/repro-fail/build-st-12270/

OK. Thanks. I took a look at these, and FWIW, very few (if any) appear 
to be because of the addition of INHIBIT_PACKAGE_STRIP, and are instead 
due to actual reproducibility issues. I'm not sure why that patch caused 
them all to show up; perhaps because it made all the do_package tasks rerun?

>
> which is after I fixed that code:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=9f225cf966b8a96775d74f41423206d157bce2e3
>
> Perhaps we could make this a cofiguration parameter I could pass in and
> make it clean up empty directories if nothing is saved. I might then be
> able to make it "auto publish" these failures.

Ya, that would be nice. Were you thinking of making them configurable in 
the AB json config files?

>
> Cheers,
>
> Richard
>
>
>

