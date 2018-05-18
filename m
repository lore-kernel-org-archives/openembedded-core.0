Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 68DBD747A5;
	Fri, 18 May 2018 05:55:19 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id i5-v6so3939967plt.2;
	Thu, 17 May 2018 22:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E9eB6YniNXrdIsXZ7/XGjBVKU4Wp+sNG3UQcTMO7PRY=;
	b=HXJ0xghH82RZ9XWQYi38g9AIsxJ3+WfMaHUGVyNiIV8aUQGi73Ko6r+xcRG3Ng+HHj
	0uOex7Z8Wu1DnIuVNX2Q3a/MNMnM0HhUOEW7gdc1WyLysKWVnnEhjYeDDwJIlJ5emsbX
	t+QPzcr+mqDfbTtk3cisufGB+UOMLF89zDSRLClMqqNBQUkX8bzfK3RGMsTemKGozXXs
	kN16t45kFeNncYbDFZdBy2/COVMKcAHhnXltIt+dqWt2WboE5Dgb1fzI9Ug1jrTaavR+
	3Ys871bh9hB72HoxE+s9lhfuEmpr10P77oVeClvBDaFcBu7Fd9E3/AjDkILNMkVX+opX
	vpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E9eB6YniNXrdIsXZ7/XGjBVKU4Wp+sNG3UQcTMO7PRY=;
	b=eADE9u1TJKrUDF+M5JpPYM8p6/n/nXcBORhlVpSyFaFXajzsFNgkMi9OJj3zyqL6Tz
	ke013bKcuMZIQp42vLwkVrCavujusXXkbRTFqUCYa0Bq1ucVSg7Yd7WQfzqBMKC0vvlL
	RnCTuV3sjGF9rJUJ9lE6Tnk4/wQvrB4x02coCSkifzulp+YSak9lAWNuohcXXO7ERb53
	iFqxwif6uVbQYZo3/GK4eoQleH2b+9ssQ1E/4+QIRxoyutfZY6IKlzB9mFFBBfRP2NUx
	qnfpGlqrUep6R86efPdUZMCUTy+T9Qo25KL4EScSazDZoEQEiN5393Sd6/6qQ6h21rCv
	p6kQ==
X-Gm-Message-State: ALKqPwdWs59QY71xFojlOmxEgIjsNxolVdb5HAzNU0uo3myt+jBAC1+j
	iQdshiW27b2Ky/Xv8lz0IZl4RAOsxg6aYV0MEKo=
X-Google-Smtp-Source: AB8JxZot2IIOo2OpS8cZOnbLNGY3UJod5J7V/gs+i1DbpdBl+5zg7zARXCfZHcWJ+Li6Hn0rL0HuP2ENk3PjOF8Ebzg=
X-Received: by 2002:a17:902:14d:: with SMTP id
	71-v6mr8098398plb.275.1526622921112; 
	Thu, 17 May 2018 22:55:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Thu, 17 May 2018 22:54:50
	-0700 (PDT)
In-Reply-To: <20180517104640.GA1398@jama>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama> <20180517104640.GA1398@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 May 2018 22:54:50 -0700
Message-ID: <CAMKF1soKXsC6_FG2g116KusAf=rBMDoi0mdfjdKtYKeASS+Whw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Fri, 18 May 2018 05:55:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 17, 2018 at 3:46 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, May 10, 2018 at 09:11:45PM +0200, Martin Jansa wrote:
>> > > 5) nativesdk-libxcrypt fails to build (not sure which change caused
>> > > this, it build OK with sumo since the -std=gnu99 addition.
>> > > ../git/crypt-sunmd5.c:189:13: error: 'snprintf' output may be truncated
>> > > before the last format character [-Werror=format-truncation=]
>> > >               "$" CRYPT_ALGNAME "," ROUNDS "%u$%s$",
>> > >               ^~~
>> > >
>> >
>> > something new, I will look into reproducing this.
>
> The fix from you worked for me, thanks!

There is a followup here which now doesnt need local patch

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=0924a69244892097f60adbf6c7f576375bea7870

> Just FYI if someone needs similar fix, backporting this:
> https://patchwork.kernel.org/patch/9170055/
>
> fixed the issue for me, now I have successful kernel build.
>
> The failing code was always in put_user calls, e.g. kernel/exit.s was showing:
> @ 1581 "kernel-source/kernel/exit.c" 1
>         .ifnc r0,r0; .ifnc r0r0,fpr11; .ifnc r0r0,r11fp; .ifnc r0r0,ipr12; .ifnc r0r0,r12ip; .err; .endif; .endif; .endif; .endif; .endif
>         .ifnc r5,r2; .ifnc r5r2,fpr11; .ifnc r5r2,r11fp; .ifnc r5r2,ipr12; .ifnc r5r2,r12ip; .err; .endif; .endif; .endif; .endif; .endif
>         .ifnc r1,r1; .ifnc r1r1,fpr11; .ifnc r1r1,r11fp; .ifnc r1r1,ipr12; .ifnc r1r1,r12ip; .err; .endif; .endif; .endif; .endif; .endif
>         bl      __put_user_4
> @ 0 "" 2
>
> with the error triggered on the middle line.
> /tmp/ccHq8ugv.s: Assembler messages:
> /tmp/ccHq8ugv.s:1179: Error: .err encountered
> /tmp/ccHq8ugv.s:1331: Error: .err encountered
> /tmp/ccHq8ugv.s:4617: Error: .err encountered
> /tmp/ccHq8ugv.s:6222: Error: .err encountered
> /tmp/ccHq8ugv.s:8705: Error: .err encountered
> /tmp/ccHq8ugv.s:14486: Error: .err encountered
> /tmp/ccHq8ugv.s:14646: Error: .err encountered
> /tmp/ccHq8ugv.s:14806: Error: .err encountered
> /tmp/ccHq8ugv.s:14966: Error: .err encountered
> /tmp/ccHq8ugv.s:15126: Error: .err encountered
> /tmp/ccHq8ugv.s:15286: Error: .err encountered
>
> That leaves only few issues in our internal components and strange failure with perf which fails to include various header files:

perf is building file for qemux86 on o-core
I wonder if this is an issue related to your
kernel version.


>
> Cheers,

