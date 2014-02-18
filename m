Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id D9CFD6E8A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 16:10:17 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id lx4so589153iec.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 08:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gjiN5ToM3Svlo+VSuuWjw2fY3HAT72zuUuJ+qaBT1n0=;
	b=WeCmAXWRtr8XEMqxywJWAw6apAal9dk5L1Hi0bfT33if/EGIwz6LxeYpwvEMAFMWHU
	HbL2XJW62n6nEROjqKiaBWYM+oJ6/xpGqGRbv7tB0sgfu0LotZbg7zG5JTR3yv4DXwG4
	OxfxEl3Md4fRvsJ1g99RPqv+KJ1V5vFQoTEBIpmklPUJ51u1QaFEzAWabXLkDrGv2fgB
	8TT3+Pr/1MO0VgEPqJdykPlJnZiiRI47UhyNQZisRfliWRfmcucGc20gQnM/1FP0KK+9
	lEQV34rhvK5EN0rfi67PM0UZQ2rdXDFF5zDRUL2eOzfmxeQinrqiMCRQHvDQT7v5yqMF
	hstQ==
X-Received: by 10.50.43.170 with SMTP id x10mr22833223igl.20.1392739818702;
	Tue, 18 Feb 2014 08:10:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Tue, 18 Feb 2014 08:09:48 -0800 (PST)
In-Reply-To: <CAMCfZKEBmZOGh7oxoPuVLG95gPK86WgyZQ=oezQJhxwpk6AXZg@mail.gmail.com>
References: <CAMCfZKE1+RDpEE8HehL_GDp2WxrVWjpjVL0Fb94Y_729Zi0A=w@mail.gmail.com>
	<CAMCfZKFBnmFip9qdUxjf60F_T5yBBEUfENULR_Bxt_b+Hso77g@mail.gmail.com>
	<1392334278.14081.26.camel@ted>
	<CAMCfZKEJJdCgCdhHHa_944+adDA2h6sBR9b9nwL=gTpy+dUPJQ@mail.gmail.com>
	<CAMKF1sqQQQD82FeRg_hgK-Q5=VQDPArpJrz7wUxe8kGy7KNe=A@mail.gmail.com>
	<CAMCfZKFO6G8pFprNR_62k4UhG1=S0sbxNew7VfzFSRKXtMG1RA@mail.gmail.com>
	<CAMCfZKEBmZOGh7oxoPuVLG95gPK86WgyZQ=oezQJhxwpk6AXZg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2014 08:09:48 -0800
Message-ID: <CAMKF1soDAWZ26e9Exh85GnMbE8L6h+k1RK8FSf1bF13=wGnBgg@mail.gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qte-4.8.5 missing libQtUiToolsE.a on toolchain
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
X-List-Received-Date: Tue, 18 Feb 2014 16:10:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 18, 2014 at 7:56 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
>
> On Fri, Feb 14, 2014 at 9:58 PM, Diego Sueiro <diego.sueiro@gmail.com>
> wrote:
>>>
>>> then package the needed static library in -dev package. Now its not
>>> recommended practice however sometimes
>>> exceptions are made but I would recommend to check first if its an
>>> oversight/bug in QT5 to not generate a .so
>>> for the given library or it could be a architectural need to have it
>>> static either way some clarification is needed
>>> before this change is made
>>
>>
>> Khem,
>>
>> Looking at some references it seems that qt just builds the static
>> library:
>> https://bugs.archlinux.org/task/37447
>>
>> http://rpmfind.net/linux/RPM/epel/6/x86_64/qt5-qttools-static-5.2.0-1.el6.x86_64.html
>>
>> http://fr2.rpmfind.net//linux/RPM/opensuse/factory/armv7hl/armv7hl/libqt4-devel-4.8.5-10.1.armv7hl.html
>
>
> Any conclusions?
>

Well. Do the needed in packaging it accordingly then

