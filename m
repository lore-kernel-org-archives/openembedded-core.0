Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id CEF6473180
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 16:40:22 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id e65so84048059pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 08:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=ZUQtqojXSLbwcNERKoGZLyWw35SRUzvlPTdErfGdMyc=;
	b=BoaxgXizT+XlA9zsC6HueyfozdnQgNJHeZDrBBJRPh+Pv5Uzheqt9ajeHxzDiraBUd
	xjrDTSX+zj3qr113+Izh4EGS5muQ59cQPWmgcaHJnP65OHwcIYOhRg+1ffK7d9fHAoMr
	UmB7bEsgImu8ytxinaREy2L2GdrpkXkfEQYMpnPm3FZ+PH/6KJAssCbLO2RFbZge9UTN
	tIhqTEg9fIHaI+UUEXajqSf+Xvxiir1FAT5V+w5QfcPVed0phpj7IHRYtmrsy4gRUz5K
	ypLC7iF47kgkCKu/aIF0Ohwmi853Z/010MfBHVDYxCHg9/ImXdYJlTcwjqhtV587H2jD
	ExPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=ZUQtqojXSLbwcNERKoGZLyWw35SRUzvlPTdErfGdMyc=;
	b=LKrky66yk6Ovuze/jzyOfOVSkv10cKEyi7DIjtQMLyH1npl/5I4/cSe5SWpYZg3A0o
	W4bBgxvsyL/Sz7wbWuQvRU2JLPaS5CdX3tFmPaIHBq7TNT76EfK+hAW2gzeiYj78lBUB
	nQRul1ewWVJhnRysUw/r5znwYDbZVXG7W60/2tdvi1zjiYGbmsIK56Uqe7Lv89s5ERUx
	Pm5YOMJnpscdAcoTYRq/ocOBFpO9AmiO5L3ZPDyc7xj7IH7D6QbOFZf+ipPVdj8f0oqq
	3qae3bJciwf6dx/TQA5pWOtytSVHldh8uOKdAcOY+FfSzwO97bBl/B9R7XpaPtYzgNo5
	FNiA==
X-Gm-Message-State: ALoCoQkxXuLqEVN8lZ6SGvngHBoUnTmlKspyYLmCkGa/NtYm9ZDXQPscjg1aFzOTphu7UtPr/P0scnvLmj4pKGD5qny2TC45OQ==
X-Received: by 10.98.18.208 with SMTP id 77mr33525995pfs.94.1452703223123;
	Wed, 13 Jan 2016 08:40:23 -0800 (PST)
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com.
	[209.85.192.177]) by smtp.gmail.com with ESMTPSA id
	u69sm3719154pfa.61.2016.01.13.08.40.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2016 08:40:20 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f177.google.com with SMTP id 65so83793196pff.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 08:40:20 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.74.135 with SMTP id c7mr15803339pfj.129.1452703220434;
	Wed, 13 Jan 2016 08:40:20 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Wed, 13 Jan 2016 08:40:20 -0800 (PST)
In-Reply-To: <201601131730.04848.marex@denx.de>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<201601131653.11865.marex@denx.de>
	<CAP9ODKo4fvFS0wWtQJfO_kVOZMyNqfNohHw=wRC5z2M19Bu9kQ@mail.gmail.com>
	<201601131730.04848.marex@denx.de>
Date: Wed, 13 Jan 2016 14:40:20 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpjBu42wpQNMntA8b33e2wL371ViXu4cXz7-P2vi3X0Sw@mail.gmail.com>
Message-ID: <CAP9ODKpjBu42wpQNMntA8b33e2wL371ViXu4cXz7-P2vi3X0Sw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Wed, 13 Jan 2016 16:40:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 13, 2016 at 2:30 PM, Marek Vasut <marex@denx.de> wrote:
> On Wednesday, January 13, 2016 at 04:55:56 PM, Otavio Salvador wrote:
>> On Wed, Jan 13, 2016 at 1:53 PM, Marek Vasut <marex@denx.de> wrote:
>> > On Wednesday, January 13, 2016 at 04:39:53 PM, Otavio Salvador wrote:
>> >> On Wed, Jan 13, 2016 at 12:34 PM, Marek Vasut <marex@denx.de> wrote:
>> >> > On Wednesday, January 13, 2016 at 01:04:31 PM, Otavio Salvador wrote:
>> >> >> On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de> wrote:
>> >> >> > Upgrade U-Boot to latest version and drop upstreamed patches.
>> >> >> >
>> >> >> > Repair configuration of U-Boot during build. It is no longer
>> >> >> > possible to run "make foomachine" in U-Boot. Instead, it is
>> >> >> > necessary to do "make foomachine_defconfig ; make". Fix this
>> >> >> > in u-boot.inc and u-boot-fw-utils*.bb .
>> >> >>
>> >> >> Please drop this config suffix, from u-boot.inc. The config value
>> >> >> should be used as is and the respective BSP ought to be fixed to
>> >> >> change _config to _defconfig.
>> >> >
>> >> > If I don't have the _defconfig there AND I define UBOOT_MACHINE in my
>> >> > machine file, it will call "make machine", which no longer works.
>> >>
>> >> I know and the right fix is to use the right value to UBOOT_MACHINE as
>> >> we do for KERNEL_DEVICETREE.
>> >
>> > So what is the right value ? UBOOT_MACHINE := "foo_defconfig" ? This does
>> > not sound right at all.
>> >
>> > And what is the right value of UBOOT_CONFIG then ?
>>
>> foo_defconfig.
>>
>> This is what we pass for make to configure the board and should be the
>> given value.
>
> OK, that makes sense. You didn't answer my question about UBOOT_MACHINE though.
> Any thoughts on that ?

If using UBOOT_MACHINE = "foo_defconfig" will work just fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

