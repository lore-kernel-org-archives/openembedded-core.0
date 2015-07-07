Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6669475D18
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 13:59:58 +0000 (UTC)
Received: by iecuq6 with SMTP id uq6so134740324iec.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=BzVUZ8IilpWY2Dmtyn8MVoJAkpr1GksoH1acwwuOV8k=;
	b=DkNBdy6dtP/yyTp4wUHDDcuE1wsLzoaTVWO8BBlOAt9TFHpipmm6p5eR2BpvQB6oFw
	Dfjl+th/Mj0nQiOl/xIG9dTweo8VU8Fb2+R81lFCRFs3pedm3zFuhsw9+to/ZKSV2oeI
	fhN13TKaTYwDTH331OFi3G5K5S1CwgnY/t6TLvdaphmaWnQAbu1nsQsq21PoHUMu9hF4
	kFhXrFrrGw2zaImMNvCUH15fY+721/fxD9x4OvGaSOgZE8aJEtifOHG13KyxT34rVDM1
	A2nn/0LkNRQdXbn7SEImpk5L24CpPGqlAaSbF/V/CBDVmzTYCtDB2ooj34PWiXnXmtkf
	wurw==
MIME-Version: 1.0
X-Received: by 10.50.57.39 with SMTP id f7mr31862076igq.35.1436277598390; Tue,
	07 Jul 2015 06:59:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.36.218.7 with HTTP; Tue, 7 Jul 2015 06:59:58 -0700 (PDT)
In-Reply-To: <559BDA5C.6060905@linux.intel.com>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAJ86T=XJeo31ntBEw16vCPuTyAwYvsij_Aoq=EKgRyhCnYyzOw@mail.gmail.com>
	<1B56A49860EB2D45ADE3731B15C959FDB29591@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0LZx5mPc+2_wmO8WfYs-s5smFuZYyAmYfZS4Bv+BoW7SEA@mail.gmail.com>
	<559BD488.8090306@linux.intel.com>
	<CAJTo0LY5fEmX8Of5d2prJ01fHvf7LV170qTz+r1kd0vtkGgesQ@mail.gmail.com>
	<559BDA5C.6060905@linux.intel.com>
Date: Tue, 7 Jul 2015 10:59:58 -0300
X-Google-Sender-Auth: j_3uuSCcHxJ215YNS7x5G7DgcUc
Message-ID: <CAP9ODKr6RVW9h8-92UQbbRyJ4jseUAC2qHGExkUNcfu==pEyUg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: FW: [oe] [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Tue, 07 Jul 2015 14:00:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 7, 2015 at 10:55 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 07/07/2015 04:38 PM, Burton, Ross wrote:
>
>>     How about renaming the recipe, so that it doesn't clash with the
>>     GPLv3 version? For example, parted1_1.8.6.bb
>>     <http://parted1_1.8.6.bb>. Then it can be kept outside of oe-core.
>>
>>
>> As they're just version variations that would be overly complex.
>> Dropping it in oe-core as it's a non-v3 alternative doesn't seem to be a
>> problem to me (as there's plenty of precedent for that already).
>
>
> My problem is that parted 1.8.6 was released in 2007, and the recipe already
> carries eight patches with it (and none of them has any information about
> their origin).
>
> Who's going to provide ongoing maintenance for all that? I would like Lei to
> establish himself as the maintainer (through the maintainers.inc file).

Agreed; 2007 I was still one of developers of it IIRC and since then,
Jim has improved it quite a lot.

To be honest, parted at that time has several issues with bigger disk
sectors and other stuff.  I wouldn't like to see projects relying on
such old and buggy version.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

