Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3324F770D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 11:08:10 +0000 (UTC)
Received: by ioc74 with SMTP id 74so54785376ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 03:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=VMaJkkE7KxYAgoZbrVC7xQbvx7GkZGG48UOgK2+/Mo4=;
	b=ohARbRM97w6zSg7SBsHhXjkSunBkJK6PgzoaXOrHbQEtjH2YTrp6L4O+5ovtYAAI/U
	civk+6lwIDPkEVj+B8sxjDQNIDcHsKrm5aV99Zfbw3v5nNoO6anzNVN/zwB4U5zqsBpt
	UEsO6qQ28FtWI3x/niZUwBH6sao7UY/Fp1lhvtjUxWb5xwcx7a50ce1U/pEN6zEc+a26
	ZrnSm7nuFlBqzparJy+LL4tsVQn0nnc0gzUAg++IsDZd7Yb1fNxVUpnfiP9jkQVMepsr
	YOyaZdtg0Hy7SKO7IyPyP0ppwVqeTNOBk7w+OpGzWhHSQVdJY58i8dvKpvsFjLz8gTaB
	7nsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=VMaJkkE7KxYAgoZbrVC7xQbvx7GkZGG48UOgK2+/Mo4=;
	b=KYe7J/hnL9R4fNRmiHF44XKhSZiNwGJMLMDg0+2UbTBfB97BiJ4bvrsJlFgDVjs0iV
	1f0FXfiUYZmP7viksdEVRsiQVuWTuw6k1DTqCwCivZ6RMojXbCyYo9RLk+5u23Lvldys
	aUoYexte8oQnR0S7BovfByaIGk7cZC/0Dt5D93THOJ6SxFNDSigw/24DerQiAkCceVTY
	fW2fTqoUspI8FNK+y+jVNUgeMp4DWErO4wMjLM2sl/EgbpPgVsHj6KW2vRxzMKI5pxvO
	uhpF4ToFBtNsuwpNsaghSCXdlh5BaZM5nNoa6xrraZQI7xYOaVgrlPgL5cwkrVU0PGN+
	jfxA==
X-Gm-Message-State: ALoCoQmwKTc/NebpI0jlghD0XJXYbQ2X3mM68bMM/6pC7Dr+IMm5Rbhvn3w/a5y3H9/B1qfRLKus
X-Received: by 10.107.9.37 with SMTP id j37mr17059411ioi.62.1446808090814;
	Fri, 06 Nov 2015 03:08:10 -0800 (PST)
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com.
	[209.85.223.169])
	by smtp.gmail.com with ESMTPSA id p4sm847344igj.8.2015.11.06.03.08.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 03:08:09 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iody8 with SMTP id y8so120245157iod.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 03:08:09 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.131.147 with SMTP id n19mr14316236ioi.192.1446808089547; 
	Fri, 06 Nov 2015 03:08:09 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Fri, 6 Nov 2015 03:08:09 -0800 (PST)
In-Reply-To: <CAP9ODKqpBeaHjWjsirLirO+cdSVtWF8XQAVKEbag7xods4b=bA@mail.gmail.com>
References: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LYA78vJehCoLLeGu8DwQCrRF=bV7RKs=BvH4fY8SsmSZQ@mail.gmail.com>
	<CAP9ODKqpBeaHjWjsirLirO+cdSVtWF8XQAVKEbag7xods4b=bA@mail.gmail.com>
Date: Fri, 6 Nov 2015 09:08:09 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpoPxr3YeG185q4ezDVhMNjc7CP6s9M=oeT0UQNus95Kw@mail.gmail.com>
Message-ID: <CAP9ODKpoPxr3YeG185q4ezDVhMNjc7CP6s9M=oeT0UQNus95Kw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2015.10 release
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
X-List-Received-Date: Fri, 06 Nov 2015 11:08:11 -0000
Content-Type: text/plain; charset=UTF-8

Hello Ross,

On Fri, Nov 6, 2015 at 8:54 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Fri, Nov 6, 2015 at 7:18 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 27 October 2015 at 16:05, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> >
>> > The U-Boot 2015.10 has been released at October 20th 2015. This also
>> > removes the GCC workaround, for the inline behavior, as this version
>> > properlu supports the GCC 5.2 as compiler.
>>
>> Breaks on the autobuilder:
>>
>> arch/powerpc/lib/cache.oarch/powerpc/cpu/mpc83xx/cpu.o: In function `ld_le16':
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-linux/u-boot/v2015.10+gitAUTOINC+5ec0003b19-r0/git/./arch/powerpc/include/asm/byteorder.h:12: multiple definition of `ld_le16'
>> arch/powerpc/cpu/mpc83xx/traps.o:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-linux/u-boot/v2015.10+gitAUTOINC+5ec0003b19-r0/git/./arch/powerpc/include/asm/byteorder.h:12: first defined here
>> arch/powerpc/cpu/mpc83xx/cpu.o: In function `ld_le16':
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-linux/u-boot/v2015.10+gitAUTOINC+5ec0003b19-r0/git/./arch/powerpc/include/asm/byteorder.h:12: multiple definition of `st_le16'
>> [and another hundred pages or so]
>>
>> http://errors.yoctoproject.org/Errors/Details/21468/
>
> I am checking it; thanks for putting it into AB.

The failure happens only when using GCC 5.2 for the machine; I tested
now using 4.9 and it works.

I will check this at upstream side and will get back with a v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

