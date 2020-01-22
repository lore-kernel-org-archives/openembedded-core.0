Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 85D957F957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 16:02:01 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id t2so5509649ilq.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 08:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=0zLXwCiIq/r3osn+hZaHr7Kga9ew5IbpmXbsfI80vwo=;
	b=jlUhljEJaHHjcsCEm5yfsO4sYgwA8pelRDLtZ8nhGwW9Rfx41FmnXr3VMm4dLCwJjD
	w2TCZPIKJODwoO+S9GOM/nxRb90CpEBXdwrTcWnZYHnMT6pyCBgzS5vUxchCg5alc3bb
	tPVSR2XoLV+GKS+i7j0R3kL6efMtdCAsCAr3+I+ua2n17ZX9GVD3TJ+nHHy1+gOW9pTM
	0JZFZP5brhdBVCGcgaFTF1qD2/1u5mzbQurPyggkrTskYm4+luL1ocmS37Nkoy0Jabk4
	S3lzWe++Sn5MnNx50yyyUaGnB9CcLCHqMdnikZadmo4BLGZ9xhVQxogDj5UJWCGKWE0U
	rk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=0zLXwCiIq/r3osn+hZaHr7Kga9ew5IbpmXbsfI80vwo=;
	b=DrkkMJvC9hHqjZXE/AJCzvn+T/J8g/4mHzZ6ESppTjCYC6imAlgJO3watSY+2VAB3+
	6N0gzu8Il+hcjTnqh7GTdVh2RTd9Pv/oAkcX07jssMp2y+YV+OtU8NKN2LXLvTC5GcEE
	5M1C6d8iW6aeigEYzFM+6ZpyyEfi+NXlmJCPHmnlZzJRZ7HqzLZ6N+SKmaU8zak8X8mv
	rPyuVxD+SFxbx/nEaoJgy2jtbJ+Ac8Ow69449N1Y7f1Z7Lk7KNWt8DKlvsxUxQJ8sOud
	lVkrkIq6dBQkhnqGIuDI2O6ss1aI/biQS5KoGowrWNxLF+9nkZ2t3RJiQY7jPcbs1qP4
	rC5Q==
X-Gm-Message-State: APjAAAUfH2L/sfgvG3BS0az+Eu6t88+wmlK6ZyPGmnHJJZ03XgeSE9Nn
	eiourBalyIozbc0wxWJWI5VQWUNoYWc=
X-Google-Smtp-Source: APXvYqy2U9Gmaj9IFn7FXeU4RPzO+a247TM3mxdq0k0Qlli2sjnhxeXIyAtGhxCKvFXtS9a3nPaZAg==
X-Received: by 2002:a05:6e02:685:: with SMTP id
	o5mr8328532ils.248.1579708922104; 
	Wed, 22 Jan 2020 08:02:02 -0800 (PST)
Received: from [10.30.196.43] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	c12sm14414666ile.12.2020.01.22.08.02.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 22 Jan 2020 08:02:01 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200119185959.406212-1-JPEWhacker@gmail.com>
	<20200119185959.406212-4-JPEWhacker@gmail.com>
	<d3f6ae17e1a4da2e9aea675d37654a1fe0b1df3d.camel@linuxfoundation.org>
Message-ID: <b1001ab8-5972-b791-b9db-9aab7fa34da0@gmail.com>
Date: Wed, 22 Jan 2020 10:02:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <d3f6ae17e1a4da2e9aea675d37654a1fe0b1df3d.camel@linuxfoundation.org>
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
X-List-Received-Date: Wed, 22 Jan 2020 16:02:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/22/20 9:53 AM, Richard Purdie wrote:
> On Sun, 2020-01-19 at 12:59 -0600, Joshua Watt wrote:
>> Do not strip packages when testing reproducible builds. In some cases,
>> stripped data differs between builds, but then gets removed. However,
>> the contents affect the generation of the GCC build-id, which then
>> differs in the resulting ELF files, even though the data that caused
>> this is no longer there. Inhibit stripping so that their causes can be
>> evaluated.
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/reproducible.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
>> index c00b92d2e90..34462a0b3a4 100644
>> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
>> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
>> @@ -149,6 +149,7 @@ class ReproducibleTests(OESelftestTestCase):
>>           config = textwrap.dedent('''\
>>               INHERIT += "reproducible_build"
>>               PACKAGE_CLASSES = "{package_classes}"
>> +            INHIBIT_PACKAGE_STRIP = "1"
>>               TMPDIR = "{tmpdir}"
>>               ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
>>                           tmpdir=tmpdir)
> This generates quite the failure list:
>
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-dbg_20190110-r0_all.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-dev_20190110-r0_all.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-doc_20190110-r0_all.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates_20190110-r0_all.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/acl-ptest_2.2.53-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/attr-ptest_2.4.48-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/bc-doc_1.07.1-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/binutils-doc_2.33.1-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/busybox-ptest_1.31.1-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/coreutils-doc_8.31-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/e2fsprogs-doc_1.45.4-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/elfutils-ptest_0.178-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/ethtool-ptest_5.3-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/flex-ptest_2.6.4-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-dbg_3.24.13-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-src_3.24.13-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/icu-dev_64.2-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libevdev-src_1.8.0-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgcrypt-dbg_1.8.5-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgcrypt_1.8.5-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgtk-3.0_3.24.13-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libidn2-dev_2.3.0-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libinput-dbg_1.14.3-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libinput10_1.14.3-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libx11-locale_1.6.9-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxml2-ptest_2.9.10-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxshmfence-dbg_1.3-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxshmfence1_1.3-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/m4-ptest_1.4.18-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/mc-doc_4.8.23-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/mc-helpers-perl_4.8.23-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/ncurses-doc_6.1+20190803-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/openssl-doc_1.1.1d-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/openssl-ptest_1.1.1d-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/opkg-utils-doc_0.4.2-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-dbg_5.30.1-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-dev_5.30.1-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-config-heavy_5.30.1-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-data-dumper_5.30.1-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-ptest_5.30.1-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl_5.30.1-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo-dbg_1.8.29-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo-doc_1.8.29-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo_1.8.29-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tar-dbg_1.32-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tar_1.32-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tcp-wrappers-src_7.6-r10_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/time-doc_1.9-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/xserver-xorg-dbg_1.20.6-r0_amd64.deb
>   /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/xserver-xorg_1.20.6-r0_amd64.deb
>
> (I lined wrapped it)
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/629


Ok, thanks. Did the offending packages get captured somewhere so I can 
take a look at them?


>
> Cheers,
>
> Richard
>
>
>

