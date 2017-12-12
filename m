Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 72633719A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 15:23:40 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 9so21347302wme.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 07:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TtOqVVtdpYsMj8J1ZArfsmPoVIa3l+n17IpwIUONgG4=;
	b=RD2Sj5UKmtPMlc6P6RgZcPGm6/YU6M+zYJbhlaAZCVEMkNrlJPUgvwo0iQg7eGYsLw
	x09qDzt9ZrwVbjiteXc/GVIkfomlS9ISSUSKz8YDbpksHpy3zemkzQdPNRk1tKY1SFRF
	HGmoDwDIPTQ0ewtWm492i5thMg8f+fOMl2E+WXNx6yd/OEmGCqaZp1mipz7T6GLKpuA0
	DE9cBK4eo+6+B0eEUSwCdSR+nVd361HsWNoapY6XHl/Br2NF0t4c0aib+Qm3A1jKkT2e
	JC568+g42tfSqmepIgbevZ3aZ7B1FYsBQBUfP4NXMwaEX2SDN+0Al9ziOFU42aIbeHGG
	ZB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TtOqVVtdpYsMj8J1ZArfsmPoVIa3l+n17IpwIUONgG4=;
	b=gGpzpgngqlDzCAdDFodSLEvj2HYX70w0NtB+K/pD12V4Ta8XMbpT6hzC2ecN5J9F8Q
	eaFhs9nVWGIyIOzoGmTAQZ3Z3GN72Qkswz4BXlsjzVJR9vtI+qhXbVag2fgo9prjIhQQ
	llFfPAlb1m57myVx01KLSS9yfi3IXmLcCrdwqET0YwZRBvyfKsupK9cBkk/Bhl/IubVX
	Z4alx1q6v2sra8WNLCOED0geBQ8L+MscUktCAdetNX/2PGrtLeOUf9d/2Ia8YFviyyc0
	kVH6VZrg5C9LrbdqQHUpndrXTJAIevDZzIa4dGx9AWooLGfw3pOO80NLU0Bq+6ZqIuny
	ZI5g==
X-Gm-Message-State: AKGB3mLtLSNIiUwLiGJiMOSCSfcWFUtFHzUO0Gx2yWAR182peNgkKGRH
	q9LtldMEbWhXA+bmE+jB1J1ECQhGv5lXJ7Xqy44=
X-Google-Smtp-Source: ACJfBotN6YbBs537vdVwfaVJbDEAMJqh2sLvh/MajgdFrX/sLhxjbGrzPqNa5yr46OyFe+WL3Xm/QHkiv2vxcgeGFRk=
X-Received: by 10.80.166.222 with SMTP id f30mr3379372edc.278.1513092221147;
	Tue, 12 Dec 2017 07:23:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.178.38 with HTTP; Tue, 12 Dec 2017 07:23:40 -0800 (PST)
In-Reply-To: <CAMKF1sp+6mEW8r65fDELAR=SO3oPcgv4Bx0s0ROaS=4euUum9w@mail.gmail.com>
References: <1510695882-31186-1-git-send-email-andrea.adami@gmail.com>
	<CAMKF1sp+6mEW8r65fDELAR=SO3oPcgv4Bx0s0ROaS=4euUum9w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 12 Dec 2017 16:23:40 +0100
Message-ID: <CAAQYJAt+B0Lx9OOiczpc8sQjk=pR3X2-rT2GnpPF=dJW4hrLNQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: use arm instruction set for armv4 and armv5
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
X-List-Received-Date: Tue, 12 Dec 2017 15:23:40 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

musl 1.18 recipe is still failing.
Please apply one of the a.m. patches, thanks

Andrea

On Wed, Nov 15, 2017 at 4:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Nov 14, 2017 at 1:44 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> thumb1 is not supported with musl.
>>
>> Fixes: [YOCTO #12336]
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  meta/recipes-core/musl/musl.inc | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
>> index 56c9d7f..b4b0de9 100644
>> --- a/meta/recipes-core/musl/musl.inc
>> +++ b/meta/recipes-core/musl/musl.inc
>> @@ -26,3 +26,7 @@ INSANE_SKIP_${PN} = "dev-so"
>>  # Doesn't compile in MIPS16e mode due to use of hand-written
>>  # assembly
>>  MIPS_INSTRUCTION_SET = "mips"
>> +
>> +# Doesn't support thumb1
>> +ARM_INSTRUCTION_SET_armv4 = "arm"
>> +ARM_INSTRUCTION_SET_armv5 = "arm"
>
> Ah I submitted a parallel fix that was sitting on my branch.
> is that fine ?
>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

