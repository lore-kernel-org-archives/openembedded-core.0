Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id DCC3862135
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 11:53:57 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id tt10so11265565pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 03:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=JKJ7yiAhZ9a78ykkplON++KcD2a7XrBxCf+dOqee2uw=;
	b=LZzhbnZVi1xMMFBmPEaOGtwEanf6FllXR1X64TOTCH0qkZvsqHQHdyBlT3GJSBJOPU
	MXJOSn3Id1nUfztZRS1QcpwPd7rqEF9nb+dTOjBpMX+lbiVA8wwHdY8vReCAWoa9CaFn
	47zBJs7jCcXNv/IE2KPj3u2z33F3kWwszPffLbg8v+bK2/B5QLL5qDSbQjud/D7Rdc9i
	cke4mKK8qdzUKj5+ViZi0peo9fe2Wz8RBR59PrvRrxNdHccIOKLfWNPjKNCyIE2P/Ebt
	KfRwMCrG1rXm7K1gIDE7sUmGXgFgPGgEJnEODQeGE56volbJ4Opnmy7l1ohez0L3xBPc
	tfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=JKJ7yiAhZ9a78ykkplON++KcD2a7XrBxCf+dOqee2uw=;
	b=eE9zu1aDh/12qXFCWAfp5JLJpuMZhTPhnKm7PVoIiHtH34XgU3AuiC3B1K70IpMhcX
	B0bWsLythIrwRtBqiqfBJ2OfjSO6appYEhhGEC59+O+Ex5oZu1Icq49hr+ynaCVQM1k2
	yF2XIoGHTyMWr0Lu0L0BRmCu70h6GLpeULeILml5w9UrQBZO+/BdAoWMf6enHi7+3kEY
	QCWdH/3E82L4MaxkGCv49sK2yPqteY8VTZSpovU98buevuu66+3Z4ACY6ErJRrbRUnQh
	qaaOWGXYl9MJMKG1qUe6NTu70BC1BcoScfcmLnSh0jdrHLGSUJyI2DdTp7aX4Olp6F6e
	DLkg==
X-Gm-Message-State: AD7BkJIJJEmfKPZWFWq7H1RvQqlEGzjnYTMrv6jQOuW6Iq+r2WvKxTAbC+r9PkNMmwNCcg==
X-Received: by 10.67.4.1 with SMTP id ca1mr40535324pad.7.1457438038718;
	Tue, 08 Mar 2016 03:53:58 -0800 (PST)
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com.
	[209.85.192.174])
	by smtp.gmail.com with ESMTPSA id 17sm4521961pfp.96.2016.03.08.03.53.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Mar 2016 03:53:57 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f174.google.com with SMTP id 124so11550976pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 03:53:57 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.87.5 with SMTP id l5mr41279214pfb.101.1457438036727; Tue,
	08 Mar 2016 03:53:56 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Tue, 8 Mar 2016 03:53:56 -0800 (PST)
In-Reply-To: <56DEB981.2030801@windriver.com>
References: <1457361291-14009-1-git-send-email-daniel.dragomir@windriver.com>
	<1457361291-14009-2-git-send-email-daniel.dragomir@windriver.com>
	<CAP9ODKq7M5kMuaQGeoUSssTEvhsnK-j-LqLeKQ6AqXJVoaeViQ@mail.gmail.com>
	<CAP9ODKrM+q11scZdSsKnzeKACvPj2u7RTBb=t8V+XYuvONzdHA@mail.gmail.com>
	<56DEB981.2030801@windriver.com>
Date: Tue, 8 Mar 2016 08:53:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpiG6+5z5MvQMG3MKRDqUsoXqrowhuwUL_ciSdLtgU5dQ@mail.gmail.com>
Message-ID: <CAP9ODKpiG6+5z5MvQMG3MKRDqUsoXqrowhuwUL_ciSdLtgU5dQ@mail.gmail.com>
To: Dragomir Daniel <daniel.dragomir@windriver.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master] Add tune for 32-bit ARMv8-a
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
X-List-Received-Date: Tue, 08 Mar 2016 11:53:59 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 8, 2016 at 8:37 AM, Dragomir Daniel
<daniel.dragomir@windriver.com> wrote:
> I'll update also the arch-arm64.inc file to have 64bit support for armv8a
> in a new version for the patch.

Please do.

> On 03/08/2016 04:26 AM, Otavio Salvador wrote:
>> On Mon, Mar 7, 2016 at 9:55 PM, Otavio Salvador <otavio@ossystems.com.br>
>> wrote:
>>>
>>> On Mon, Mar 7, 2016 at 11:34 AM, Daniel Dragomir
>>> <daniel.dragomir@windriver.com> wrote:
>>>>
>>>> This patch adds tunes for 32-bit armv8 platforms. The user can select
>>>> the vector floating-point instruction set: vfpv4 or fp-armv8
>>>> and the thumb, neon, crc and crypto extensions.
>>>>
>>>> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
>>>
>>> First I would like to thank you for working on this. This is very
>>> helpful and a good step in extending the ARMv8 platform support in
>>> OE-Core.
>>>
>>> I think you should also change the arch-arm64.inc file to use the
>>> armv8a.inc file. So it is more consistent.
>>
>> When I tried to use armv8at-crc-crypto-fp-armv8-neon as default tune,
>> it fails with:
>>
>> Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
>> (armv8a-crc-crypto-fp-armv8-vfp).
>>
>
> Did you used master or jethro?
> Did you get this kind of error only for this tuneor there are also other
> armv8a tunes that fails?

I applied your patch in a Jethro tree but it seems not related. Could
you test it at your side?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

