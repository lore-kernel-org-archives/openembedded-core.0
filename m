Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 18EF46010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 13:05:15 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so9267291pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 05:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=FAxr70kmM7ZNaGRRx9/9RUSCjjchdDz/TMUeR5t0rUc=;
	b=WhpFQxBVOtglnxbFYBgdQYejMJq+cXc4JVi9thMnNsf7/VTbWA71GIXcm3l9DxUEP0
	CfZwxbju9NsRKomQdgQ+gCC0uHETI7tM8Ch6GzDr3dHqYmETjjNPSQt6FVS4OFyZGChj
	iZFFYHdFbJK22OOQkrtYhGK7eBq6jf5J49TwnISuy2Tor9oACSVAVQGYghDskVaDYZeq
	2AWF2inhorkfZ1ISyA4hC3BnyDrjVn/2E7mWB2G/LvCktj8DPRmQrTniMY+r0qd8j0+V
	fL5ffS7+1Z6ZdyPsl1AoBmj9NpkbApFmLWSvttZDIwAfUFFttlVQ8xXR5MzJtkuvNFmv
	T0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=FAxr70kmM7ZNaGRRx9/9RUSCjjchdDz/TMUeR5t0rUc=;
	b=S4qe0XuCmZz+RbyXaObGZhTQUCrcRH8mF6v4b8iL7InjhqRgLDKrZyd8m8m5IjVeOJ
	a2fdHx6Nm/TIPlNTz5ajyZ6VIy0dx6mMdFS++qHPq/fbxNjsONEpR0RthtFgAfT4pljs
	ORc5K33+PSYOKzaoH4XXKqoeoPpNalV6ZemgCHoUGqPBC5Ki4VKHtHN8Kw6Dv5YOXeIe
	AxcRjy995fbKsSspDaZ9Sgmyrcz4cYMP9ASMRGX/UTT8QV8AvKbBfBarPpz4YF5NeQ8x
	uCVzPmjy27ieeYbdeJUFnlpUfdoErljLa9zm3TJSf9fXdyizAiI5YqGEZLGLG18G1Z9A
	gz6A==
X-Gm-Message-State: ALoCoQlylstl7nT8goUreRZPq2ZJdBQ1vV2w6BneZ5k+vrZCI8i7GTaVu55mCuxtdMlCj5+hmHpk
X-Received: by 10.67.22.99 with SMTP id hr3mr63064882pad.10.1447765516044;
	Tue, 17 Nov 2015 05:05:16 -0800 (PST)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	yi8sm43045896pab.22.2015.11.17.05.05.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 05:05:15 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacdm15 with SMTP id dm15so8790611pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 05:05:14 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.68.241.65 with SMTP id wg1mr62315548pbc.101.1447765514356;
	Tue, 17 Nov 2015 05:05:14 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Tue, 17 Nov 2015 05:05:14 -0800 (PST)
In-Reply-To: <CAJTo0LbACSOOgLwWGV83BpKcEcqmQn9bg5nz5sQxffQG7RXYHw@mail.gmail.com>
References: <1447673972-31812-1-git-send-email-otavio@ossystems.com.br>
	<1447673972-31812-2-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LbACSOOgLwWGV83BpKcEcqmQn9bg5nz5sQxffQG7RXYHw@mail.gmail.com>
Date: Tue, 17 Nov 2015 11:05:14 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrnV+TkTHK+hhP2GHBC43tV6w-K48xC6JhL4-NnXcdyyA@mail.gmail.com>
Message-ID: <CAP9ODKrnV+TkTHK+hhP2GHBC43tV6w-K48xC6JhL4-NnXcdyyA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Tue, 17 Nov 2015 13:05:18 -0000
Content-Type: text/plain; charset=UTF-8

Hello Ross,

On Tue, Nov 17, 2015 at 8:41 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 16 November 2015 at 11:39, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
>
> Fails with ptest enabled:
>
> DEBUG: Executing shell function do_install_ptest_base
> NOTE: make
> DESTDIR=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.7.0+gitAUTOINC+d71e55a5f1-r0/image/usr/lib/lttng-tools/ptest
> install-ptest
> cp -r ./tests
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.7.0+gitAUTOINC+d71e55a5f1-r0/image/usr/lib/lttng-tools/ptestfor
> m in $(find
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.7.0+gitAUTOINC+d71e55a5f1-r0/image/usr/lib/lttng-tools/ptest/tests
> -name Makefile); do \
>           sed -i -e 's|^Makefile:|_Makefile:|' $m; \
>         done
> sed: can't read
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.7.0+gitAUTOINC+d71e55a5f1-r0/image/usr/lib/lttng-tools/ptest/tests/regression/run-report.py:
> No such file or directory
>
> http://errors.yoctoproject.org/Errors/Details/21841/

Sorry for that; I am checking it. I will send a new patch revision soon.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

