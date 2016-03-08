Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65E116080F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 11:38:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u28BcFBS022903
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Mar 2016 03:38:15 -0800 (PST)
Received: from [128.224.124.174] (128.224.124.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 8 Mar 2016 03:38:14 -0800
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Otavio Salvador
	<otavio@ossystems.com.br>
References: <1457361291-14009-1-git-send-email-daniel.dragomir@windriver.com>
	<1457361291-14009-2-git-send-email-daniel.dragomir@windriver.com>
	<CAP9ODKq7M5kMuaQGeoUSssTEvhsnK-j-LqLeKQ6AqXJVoaeViQ@mail.gmail.com>
	<CAP9ODKrM+q11scZdSsKnzeKACvPj2u7RTBb=t8V+XYuvONzdHA@mail.gmail.com>
From: Dragomir Daniel <daniel.dragomir@windriver.com>
Message-ID: <56DEB981.2030801@windriver.com>
Date: Tue, 8 Mar 2016 13:37:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrM+q11scZdSsKnzeKACvPj2u7RTBb=t8V+XYuvONzdHA@mail.gmail.com>
X-Originating-IP: [128.224.124.174]
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 08 Mar 2016 11:38:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks, Otavio!

I'll update also the arch-arm64.inc file to have 64bit support for armv8a
in a new version for the patch.

On 03/08/2016 04:26 AM, Otavio Salvador wrote:
> Hello Daniel,
>
> On Mon, Mar 7, 2016 at 9:55 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Mon, Mar 7, 2016 at 11:34 AM, Daniel Dragomir
>> <daniel.dragomir@windriver.com> wrote:
>>> This patch adds tunes for 32-bit armv8 platforms. The user can select
>>> the vector floating-point instruction set: vfpv4 or fp-armv8
>>> and the thumb, neon, crc and crypto extensions.
>>>
>>> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
>> First I would like to thank you for working on this. This is very
>> helpful and a good step in extending the ARMv8 platform support in
>> OE-Core.
>>
>> I think you should also change the arch-arm64.inc file to use the
>> armv8a.inc file. So it is more consistent.
> When I tried to use armv8at-crc-crypto-fp-armv8-neon as default tune,
> it fails with:
>
> Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
> (armv8a-crc-crypto-fp-armv8-vfp).
>

Did you used master or jethro?
Did you get this kind of error only for this tuneor there are also other
armv8a tunes that fails?

Thanks,
Daniel



