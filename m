Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFEA731B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 17:16:02 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 65so84264118pff.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 09:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=HhCsrmgnJAitn9AMcue5cABGtS5fL3BdTMXt0+gRe20=;
	b=1Yz1jLKiOW6T0p7NMUFJvSCU8lwzknU3t29T45WaA0anly3mai3MYI6U/BY9y+/vVT
	/Vl0xmuzNfFO+uq34JDKlO8xVaWlk9J8+ae50aI+q99krN2eX9fqlrZLYXXt3hIhA3AC
	ezSXFZO0H7OWxcwUWI6H/Wx/z3FAU9/mWoysepEmtsqMmUSQdvJncfADj/bUnXyAKuyq
	8VF/mBwYGNb+sOLwc6ko+0btCtkriPrbqg1DN+k1ircfOqSSW3kshhuHcNPXeJZlTbdj
	8/S7XY2yF9PlnqjJZp2jZNGc5wsQR2XE/0bt7jDz634qI8d69v9RtCXLFwMipDml0qAf
	aIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=HhCsrmgnJAitn9AMcue5cABGtS5fL3BdTMXt0+gRe20=;
	b=bZjnvYAH62aCKqbvD/+/zEIaLKpU/pd0k6/nrpAA7y0ryvJAajOymU9+gOM+hMYrVR
	J4zurV0oDbSSjfsf/1khVq7wFnwBYD78Po42uPkdelDpQ78VkyTJP7WeZErTnntqH9m5
	DoHT1/pzIESztpmkCXjfLFwJXLw91pNNbttCJGrfdH56qvFMFC6IF6ULtP/X0MsdlekT
	dYqP9os10iD2mRiS1xIGY41RbFVuhSFAKr3Byd8ocudltpcpMsgcQVRnJrL8Y5ka5vsp
	FkrLhFlropO1SDHtga7578qs3nptMBdKWKzg7u0lYUN79XicQs4XMchti/Ckjqx0DWXW
	9oYw==
X-Gm-Message-State: ALoCoQnYtFCutxonwcttTINWVA2y6txa/71S4I30Fde6iU/DsusmVJtHuCTo1ZSmZAZ8hnYZxD58tWGREpYeiy1hoC4MRVJ5aQ==
X-Received: by 10.98.73.29 with SMTP id w29mr41185779pfa.106.1452705363755;
	Wed, 13 Jan 2016 09:16:03 -0800 (PST)
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com.
	[209.85.220.48]) by smtp.gmail.com with ESMTPSA id
	g26sm3913279pfg.35.2016.01.13.09.16.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2016 09:16:02 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f48.google.com with SMTP id yy13so268736592pab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 09:16:01 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.129.232 with SMTP id nz8mr161206269pab.102.1452705361553; 
	Wed, 13 Jan 2016 09:16:01 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Wed, 13 Jan 2016 09:16:01 -0800 (PST)
In-Reply-To: <201601131809.49390.marex@denx.de>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<201601131730.04848.marex@denx.de>
	<CAP9ODKpjBu42wpQNMntA8b33e2wL371ViXu4cXz7-P2vi3X0Sw@mail.gmail.com>
	<201601131809.49390.marex@denx.de>
Date: Wed, 13 Jan 2016 15:16:01 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr-L6dqnsuSQW3M=W5o3vUMfNTzAnX96udYaHa4G2Ku+A@mail.gmail.com>
Message-ID: <CAP9ODKr-L6dqnsuSQW3M=W5o3vUMfNTzAnX96udYaHa4G2Ku+A@mail.gmail.com>
To: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>
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
X-List-Received-Date: Wed, 13 Jan 2016 17:16:05 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 13, 2016 at 3:09 PM, Marek Vasut <marex@denx.de> wrote:
> On Wednesday, January 13, 2016 at 05:40:20 PM, Otavio Salvador wrote:
>> On Wed, Jan 13, 2016 at 2:30 PM, Marek Vasut <marex@denx.de> wrote:
>> > On Wednesday, January 13, 2016 at 04:55:56 PM, Otavio Salvador wrote:
>> >> On Wed, Jan 13, 2016 at 1:53 PM, Marek Vasut <marex@denx.de> wrote:
>> >> > On Wednesday, January 13, 2016 at 04:39:53 PM, Otavio Salvador wrote:
>> >> >> On Wed, Jan 13, 2016 at 12:34 PM, Marek Vasut <marex@denx.de> wrote:
>> >> >> > On Wednesday, January 13, 2016 at 01:04:31 PM, Otavio Salvador wrote:
>> >> >> >> On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de> wrote:
>> >> >> >> > Upgrade U-Boot to latest version and drop upstreamed patches.
>> >> >> >> >
>> >> >> >> > Repair configuration of U-Boot during build. It is no longer
>> >> >> >> > possible to run "make foomachine" in U-Boot. Instead, it is
>> >> >> >> > necessary to do "make foomachine_defconfig ; make". Fix this
>> >> >> >> > in u-boot.inc and u-boot-fw-utils*.bb .
>> >> >> >>
>> >> >> >> Please drop this config suffix, from u-boot.inc. The config value
>> >> >> >> should be used as is and the respective BSP ought to be fixed to
>> >> >> >> change _config to _defconfig.
>> >> >> >
>> >> >> > If I don't have the _defconfig there AND I define UBOOT_MACHINE in
>> >> >> > my machine file, it will call "make machine", which no longer
>> >> >> > works.
>> >> >>
>> >> >> I know and the right fix is to use the right value to UBOOT_MACHINE
>> >> >> as we do for KERNEL_DEVICETREE.
>> >> >
>> >> > So what is the right value ? UBOOT_MACHINE := "foo_defconfig" ? This
>> >> > does not sound right at all.
>> >> >
>> >> > And what is the right value of UBOOT_CONFIG then ?
>> >>
>> >> foo_defconfig.
>> >>
>> >> This is what we pass for make to configure the board and should be the
>> >> given value.
>> >
>> > OK, that makes sense. You didn't answer my question about UBOOT_MACHINE
>> > though. Any thoughts on that ?
>>
>> If using UBOOT_MACHINE = "foo_defconfig" will work just fine.
>
> This makes no sense at all, does it ? How can UBOOT_MACHINE contain _defconfig ?
> This sounds like a crude hack, not a systematic solution.

I think it makes more sense than it adding _defconfig suffix behind
the scenes...

Adding Tom, on Cc, so he can also comment.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

