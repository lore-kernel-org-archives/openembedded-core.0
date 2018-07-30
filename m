Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 20EF378DC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 16:17:16 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id j8-v6so5768774pll.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 09:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=a8QdJ2AT0f5XwF8ySxlcCHYcAwpynhVdbip4AENUG54=;
	b=WAGX36EEAT6LVm0nBGmCznh1g3uwjSPpKi0Gfu88RMB89/6WNwTcSDQQ9fGgvweUQ4
	vehKFqAgS/9No5kUl/amuTXWKm4gxd607LofRbQ9qdNFzRUZupHnkksxyIe5F+x3w7CS
	5lebJDadheoYG7wuj5Mhpzz+Xi0lnbiZAtHMsVI4JQZ9VPiKR6mKyiphU6XKGAFmIcfq
	H9FTFuxXzt+7xQDIygZxnSLMApjMVHUoy6eq1xr6/2Ty0dJANBMxpcTLrD+kUci8O+Pu
	RnH+VmlR9AYQKuDlswUoaRP0ctxEDg3MBGwHdDeu4lMSYwCRj9fsLpkVVELnfxTqZNr0
	yPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=a8QdJ2AT0f5XwF8ySxlcCHYcAwpynhVdbip4AENUG54=;
	b=GX3ahV4T/zZJkjCRlPZlg7iPEc8R3fjF09erdlaeoqRkHyuxfcImFqihjsIvP5Dlkk
	6ug2bb31O1xg8pTdTe9+cniYu3RoWn171glwbeZc4tKgW9BmGqRUW5tCEWVgtf4jDyMh
	rE1/1w7cM50INRfAF9o618kgV2MW8MopS7rvaL+sukFU8L2rLOwtRwbnkOYHCTCMwmmN
	wu5//NR6+V/rW1BieM2Ww1awYxYpMoPOpUSOCmbaeYCNDMMUuJVB2R+nx/2hlGEI4DSU
	vFci5ZwGVklldQzXk/nM4Rvuf1crP/2+XrBghPcVyrviQePOReuLLSYzyzmJDnc/ncir
	SeqQ==
X-Gm-Message-State: AOUpUlGyF63+pS7PEUG2nKV9jYyiI57GGQ9Dqjw3O0W8IgoylM9mbZJa
	aGmE5JDbOLNSLUPCAS9LAGNdBSB+
X-Google-Smtp-Source: AAOMgpceIa6vahNtOBhT2jRrnPvzrnN21pEBPbw4DBcgRudls6D7u/MdSAj/Ti5BUitTeVEBFtGalw==
X-Received: by 2002:a17:902:d716:: with SMTP id
	w22-v6mr16846839ply.98.1532967437115; 
	Mon, 30 Jul 2018 09:17:17 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:f98c:c6a6:efae:e2fe?
	([2601:202:4180:c33:f98c:c6a6:efae:e2fe])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm12862431pgr.59.2018.07.30.09.17.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jul 2018 09:17:16 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1532963040-31606-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LZNTBvCSg7E+b0oUMHW=7tB0NZMPtLM-Khnc4PXxSZf5g@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <18c89497-1b7c-efa0-5e2b-2015323faabb@gmail.com>
Date: Mon, 30 Jul 2018 09:17:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZNTBvCSg7E+b0oUMHW=7tB0NZMPtLM-Khnc4PXxSZf5g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] parselogs: Add bluetoothd error to list of mips
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
X-List-Received-Date: Mon, 30 Jul 2018 16:17:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 07/30/2018 08:55 AM, Burton, Ross wrote:
> Wouldn't it be better to fix bluez?  It's crashing....
The quick search I did over the weekend found Mips is not listed as a
supported platforms on bluez.org. So it may be a case of adding support
for Mips for bluez.=C2=A0

So are you going to hold up the xorg-server update because bluez crashes?=


Why do we have all those exception errors in the parselog, if not used
for these cases? In any case, a new bug should be opened for the bluez.

- armin


>
> Ross
>
> On 30 July 2018 at 16:04, Armin Kuster <akuster808@gmail.com> wrote:
>> do_page_fault(): sending SIGSEGV to bluetoothd for invalid read access=
 from 0000000000000030
>> [   21.402249] epc =3D 000000852c3a0438 in libc-2.27.so[852c310000+19b=
000]
>> [   21.402505] ra  =3D 000000852c3ae0cc in libc-2.27.so[852c310000+19b=
000]
>>
>> This causes the xorg testcase to fail.
>>
>> [Yocto #12845]
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/=
runtime/cases/parselogs.py
>> index f0bcd16..e902299 100644
>> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
>> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
>> @@ -90,10 +90,12 @@ ignore_errors =3D {
>>          'Failed to load module "glx"',
>>          'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can=
\'t size)',
>>          'cacheinfo: Failed to find cpu0 device node',
>> +        'do_page_fault(): sending SIGSEGV to bluetoothd for invalid r=
ead access',
>>          ] + common_errors,
>>      'qemumips64' : [
>>          'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can=
\'t size)',
>>          'cacheinfo: Failed to find cpu0 device node',
>> +        'do_page_fault(): sending SIGSEGV to bluetoothd for invalid r=
ead access',
>>           ] + common_errors,
>>      'qemuppc' : [
>>          'PCI 0000:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]',
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



