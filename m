Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 12FF8795E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 23:37:33 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id m11-v6so10518119uao.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 16:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZheS5x79K/mCoKNZdyakKJN+g0p7vLY52S7DaV3b3AY=;
	b=tRKosNNEw34o61xlRDjRPoksLk1c88DGhL3xWfD7Jwy+3sOz1siE/f2g/it3A3M++v
	PCi2Diiv3MhOQTpfbEduu2EosVX4fYuPAasygUQjkanDMyKONd47GsHe8UQffhF01u5L
	NfOQFIbNxtYHuEkNJ9LWBSQX0sJ+QLpgMs5X4wPcfFbvnsMmhEYbppQOPHhkPCegGO2F
	eUHiha6M3+o8xHxE89fiwuHO7QC0QqYC0/Rrh2/yIv1S440b9pkMVSywYMwqYO/uQ7Nb
	0kUnth6SjAztNF8wj1aKuqdEyidIgc3uhEmSzuV38lETxsM/s7yDP7IdoWio8MQxtyE/
	BOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZheS5x79K/mCoKNZdyakKJN+g0p7vLY52S7DaV3b3AY=;
	b=iDjTIMjy2OCLzG5rglTPSj8Zygg/4/9Dswnynw5b8Dx6bnMXfbgKuuijOCGsFoThmH
	2tGEgSvoz4Ns5J3fTpwDQfWdOUVW//PKpxWMIeQnZvGuYg3tIzdQz6gMPF4JgP0BSwDl
	D2OHYTFbPyTM4xziVE04/gfrBvFAz3AJJ0mt01I7fLgOSXTB2kdGls5s0LpDEdznv3Z1
	cBMGgoWIOKLFvNrP2rx8fXIyt02Oua8rJMuFXPocmi7pjUtyScxHsL6BLassJjyTT0pV
	rurPf+TBodT5xG0razYf1eLyvMQI6+R1dDjU0Lv8yor+ZaQTrog4K8ZNhKi8nHe9jCej
	8Mcg==
X-Gm-Message-State: APzg51DyBSjBtEfJK0YXsFuuNW+o/TZnBvXDXBpbDSGqtKUACC66MWg3
	GdKMesqoIAY+on3Tc1p6/FAzwokCcU3ydVZMTQI=
X-Google-Smtp-Source: ANB0VdYH50TcILZJco8mKAiqydwD7fqbjg7Bez6X2tfU0RoI/miEfCxrXNV1SYUlzDV4+P3wqFGGos4phr4jykjUwa4=
X-Received: by 2002:a67:3515:: with SMTP id
	c21-v6mr1978436vsa.42.1536277054910; 
	Thu, 06 Sep 2018 16:37:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP;
	Thu, 6 Sep 2018 16:37:34 -0700 (PDT)
In-Reply-To: <CAHUNapQ7s-GGYkGOp=ehd0EZCas7mtD=vqsdycWQVPSY1-R5Fw@mail.gmail.com>
References: <0D62475714C01347BCA118AE7A61400376B2C64D@FMSMSX109.amr.corp.intel.com>
	<5e8c54728e6990907fa60f2454ab7961c7561a93.camel@linuxfoundation.org>
	<0D62475714C01347BCA118AE7A61400376B2C8A3@FMSMSX109.amr.corp.intel.com>
	<CAJ86T=W4pbBfk2GxKz4dGdXptd2ndfezHdgqEWh4yN5PQo_8Xw@mail.gmail.com>
	<CAHUNapQ7s-GGYkGOp=ehd0EZCas7mtD=vqsdycWQVPSY1-R5Fw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 6 Sep 2018 16:37:34 -0700
Message-ID: <CAJ86T=VeCFOV_0VJ-bAAfV=3o56g45i6agFgbc2gpq4+eOtNOA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: "Ocampo Coronado, Omar" <omar.ocampo.coronado@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Strip kernel modules and signatures
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
X-List-Received-Date: Thu, 06 Sep 2018 23:37:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 6, 2018 at 2:04 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Fri, Aug 3, 2018 at 4:16 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Thu, Aug 2, 2018 at 9:54 AM, Ocampo Coronado, Omar
>> <omar.ocampo.coronado@intel.com> wrote:
>> > Neither 'nm' or 'readelf' provide a symbol that we can use to strip.
>> > I'm having a hard time reading kernel-source/scripts/sign-file.c and how
>> > exactly how the sign works and what bytes are being added, so we can avoid
>> > stripping them.
>> >
>> > Looking into dracut, they simple avoid strip signed modules:
>> >         From dracut.sh:1671 # strip kernel modules, but do not touch
>> > signed modules
>> >
>> > Perhaps we can do the same as dracut within meta/lib/oe/package.py.
>>
>> Some more information here:
>>
>> https://www.kernel.org/doc/html/v4.17/admin-guide/module-signing.html#signed-modules-and-stripping
>
> Reading the above "between the lines", could the module be stripped /then/
> signed?

I think so. But right now the default assumption is that signing
happens as part of the kernel's build process and stripping happens
later, as part of OE's packaging process. Stripping before signing
implies switching things around a little, e.g. either the kernel build
process takes care of both stripping and signing, or OE is able to
(re)sign modules after stripping them. Probably not a huge task to
figure out, but not trivial either.

