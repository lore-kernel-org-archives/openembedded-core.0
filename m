Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2901060616
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 10:21:59 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id l8so15672744oig.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Feb 2018 02:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Ze21NcFG+eBfeAdGGy8Sbxmc2PtPXCjvD+JFmfpLztM=;
	b=YVHf1lmkgFHUhnGwAxEF4z3HOMOAW8t0dlnRuN6hWh4S9ZHiUETZpwMmydn78gXPJ0
	i8SGub4GCM1T/D9jHC154DX1XBDgGD2n5IGPN8HWfvWHgeFPB0ENewYw+6ytc75/Mvh3
	asQZPpwKrhLZJYDJkkoATcfayzNEg78S9UNWIfVyt02cMpPej1AoBelbrngW1bTOTq8H
	slFfqrY7epWoTScPT2R/buORGiRibedmvMp4HMHaeOALbTf729Y0UicuRch4UXkKaqfb
	HA3TYJlxoaHuDjMLan3wHkB3IYCR/kjcMjDnUchMlbbpxddxfy5LLUGvFeHyfmyw7eBh
	aw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Ze21NcFG+eBfeAdGGy8Sbxmc2PtPXCjvD+JFmfpLztM=;
	b=qU5PL00vgQxN+PoeoKUTcnZx85wzgim8t8xea48RAb+soTJdYI0XXtBauK0gbIaOC+
	v+AzopxU2JQVJooiDO5p7VWGn5N0Mxp7SYqx2DCmJD7ojlnoww3QYIx/8pvufi8ru46K
	q9baV4AF+p54oy85xeV70W9K1XisXvApTblA9llIjpzitBgpIApIt/pKgWscjVSaXZG3
	EsgbDmt8OtN38jiP/Iac1Hyo0l20CjnbfOQ0nPl0+E5OJfAMXDwqmv/uFT/dnSs5VlXQ
	sBKLQhUIR3XTlUSc781RtsqY4BmfzjrpicEsPq/skNVCG3rxy64lsAfl3O24MGStUuc9
	bVww==
X-Gm-Message-State: AKwxytcMU32USlld83us2bS5udSidecdQcr5cHr0MXio7Z/QUvbU6IpN
	amvneaqfK3bRHMLGwiPbHzMblJxy
X-Google-Smtp-Source: AH8x2250MLZwu4Ng1z3QHSBXlAP9s22D8Xh0noHgc+5Bi9cUWr8NUwEs48C8GByWd3ODFZR4xjQE8A==
X-Received: by 10.202.192.84 with SMTP id q81mr28028311oif.170.1517566920741; 
	Fri, 02 Feb 2018 02:22:00 -0800 (PST)
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com.
	[74.125.82.173])
	by smtp.gmail.com with ESMTPSA id x4sm861497otx.38.2018.02.02.02.21.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Feb 2018 02:21:59 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f173.google.com with SMTP id m20so1439531otf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Feb 2018 02:21:59 -0800 (PST)
X-Received: by 10.157.17.68 with SMTP id p4mr8777338otp.191.1517566919029;
	Fri, 02 Feb 2018 02:21:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.13.115 with HTTP; Fri, 2 Feb 2018 02:21:58 -0800 (PST)
In-Reply-To: <4ffd5c90-c610-3295-2890-b0e83136723a@thecshore.com>
References: <90ac077a-5126-fb99-0512-9a12851be994@thecshore.com>
	<CAJTo0LY2whxu8P8u4-U9s7pn6KJZLX53x4ZJ8xH+dN2c6gciyA@mail.gmail.com>
	<e6645328-4252-1a0b-d69c-37578461c5cf@thecshore.com>
	<CAJTo0LZyLzYWAWcR7WUY+e9u2c=LhdqQg6WU2p8dCsB7umiv2A@mail.gmail.com>
	<05c5c737-f5e5-8215-01b9-f6a1ef744063@thecshore.com>
	<CAJTo0LY3xrYA4AK6OkBOCAn+CiO4PAuE9xLOmRAu9MUM3TYjwA@mail.gmail.com>
	<5afe874c-31b5-65eb-0f10-939b4a271902@thecshore.com>
	<CAJTo0LZ1tDquYwyHzLjp7c4ft6Zg+Qbnz+5+EK1uX1BUosso1w@mail.gmail.com>
	<4ffd5c90-c610-3295-2890-b0e83136723a@thecshore.com>
Date: Fri, 2 Feb 2018 08:21:58 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqgXEavJS2--G-rZCaZ8snPNGteUuAw=NCcQHjqugbcMg@mail.gmail.com>
Message-ID: <CAP9ODKqgXEavJS2--G-rZCaZ8snPNGteUuAw=NCcQHjqugbcMg@mail.gmail.com>
To: "Daniel F. Dickinson" <cshored@thecshore.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Adding a "tiny" DISTRO_FEATURE and having packages build smaller
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
X-List-Received-Date: Fri, 02 Feb 2018 10:22:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 2, 2018 at 3:21 AM, Daniel F. Dickinson
<cshored@thecshore.com> wrote:
> On 01/02/18 09:19 AM, Burton, Ross wrote:
>>
>> On 1 February 2018 at 14:17, Daniel F. Dickinson <cshored@thecshore.com
>> <mailto:cshored@thecshore.com>> wrote:
>>
>>     On 01/02/18 09:12 AM, Burton, Ross wrote:
>>
>>         On 1 February 2018 at 14:10, Daniel F. Dickinson
>>         <cshored@thecshore.com <mailto:cshored@thecshore.com>
>>         <mailto:cshored@thecshore.com <mailto:cshored@thecshore.com>>>
>>         wrote:
>>
>>              On 01/02/18 08:54 AM, Burton, Ross wrote:
>>
>>                  On 1 February 2018 at 13:44, Daniel F. Dickinson
>>
>>                  wrote:
>>
>>         A distribution can set other recipe's PACKAGECONFIGs directly:
>>
>>         PACKAGECONFIG_pn-recipename = "foo bar"
>>
>>         And distributions are welcome to bundle groups of those into inc
>>         files for the user to pull in as required at the distro level.
>>
>>     I wonder if it'd be useful to have some .inc's of this variety added
>>     and included (commented out) in the poky-tiny distro default
>> local.conf?
>>
>>
>> Included and enabled if they make sense, sure.  poky-tiny is, like
>> everything poky-specific, just an example.
>>
>> It already has one:
>>
>> PACKAGECONFIG_remove_pn-opkg-utils = "python"
>>
> Sorry, apparently I wasn't clear.  What I meant was having (either in poky
> or in a more appropriate place) .inc or classes that do PACKAGECONFIG for
> common sets of packages for various "tiny" use cases (e.g. router, nas
> firmware (v.s os on data disks), ap, small iot devices , etc), which may
> involve a lot of partitioning of existing packages to allow for smaller
> (tiny) builds that include only the relevant functionality.  I'm not sure
> what the situation is for oe-core, but when I look at meta-openwrt it is
> much less partitioned than say actual openwrt base system, and makes a
> number of 'bigger' choices than openwrt.  What I'd like to work on is making
> it easier to build pared down OE systems (whether poky-tiny reference design
> 'flavours', meta-openwrt/oe hybrids, or (basically) openwrt build with
> oe/meta-openwrt).
>
> In the case of the .inc's etc I'm thinking of this as 'pre-cooked'
> references designs like poky-tiny itself;  Perhaps a better place for this
> is as comments in poky-tiny's distro .conf? (Or as proof-of-concept distro
> layers based on poky-tiny and and listed in the layers index?)

I'd say it could be a layer with those. Like meta-tiny-common or
similar which other distros could include and use. This does not seem
to belong to poky.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

