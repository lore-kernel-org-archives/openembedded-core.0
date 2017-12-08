Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D7FC8782A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 19:36:31 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n138so4924534wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Dec 2017 11:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=u+T5nRT4f8ALBY21rFvo7bb8h8p1W5WMyLHG3Y8hCsc=;
	b=atFrZNnSXPbJW9nR/KzfjJjtJR6CZ0LHcAoqNXb38UvkOJgpwzQ+VaO2jQAVOeLcbI
	4j2SbspqoCt1l4AeSRkAQszacmYOA+Ll63NSMcxAHgFK94mF97xdQh/lXfiCzoNmygYW
	KiGrhI56kqdGGNSuBFPW1wOUdEOcLML/w/wSFzdD0raNH45FzDGwJb+9gwmuUaZlC18F
	ueSdtvM/cNJ1JEQjM2y+Bm8g5Z9Rs8L55TV9jy7folLD2UDdy0x2SJs/IJEcpBiVVWFe
	vxbDN+lDMtwyYnginWKypjGgNzM5rYVMayv8aatUhx8OKMh+KKEyfBx0z998JV8kF46B
	JIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=u+T5nRT4f8ALBY21rFvo7bb8h8p1W5WMyLHG3Y8hCsc=;
	b=a9iRRCN9lkB06q+1xlLTw6RcsKt/YFCN2ceSh6NBsCqM+0G5zvHKamxp35i5Fq4YlF
	Ent3kOu4BG2B2FYbPeH65nESrDIp6WuQqj+23qb1V51lsgljmSLIssteLekTtCSWonEv
	xrzpIirkRQYaplXYjbunen2ejUbWb+8Y79v4Dt4AelDR+DLZmV77dTG1rYFPZdJEBvka
	fpRjdhsNt6fKPva01KKcLUdaP4IuB4e21GClhyvvbrxsoO4+8R353TMUmGYeYNcc5anZ
	QYNRIHUGSWPJqxGICMcRs3DwReNycKVRxMYRIoKSjqFaLpto9518YqZMcbNITzNk+HaJ
	mPAA==
X-Gm-Message-State: AKGB3mIr6xc9BN7+8MA4/bUEaqZePBt0HjW9MkZxDCqG5z2Cgn7hv9n7
	6Cel1e1ssyuCcn/Gq5ULX8XPIDPy3UDWrDDEhHc=
X-Google-Smtp-Source: AGs4zMbhbF/7B/iOLtrMex/DwCRGQ4ImpVvyEzaj2RWZL/w5A4eaUW+PKKuWT+Xih8HieVbOof5Ru9ufVTqjY1JXum4=
X-Received: by 10.28.31.137 with SMTP id f131mr4366968wmf.110.1512761792592;
	Fri, 08 Dec 2017 11:36:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Fri, 8 Dec 2017 11:36:32 -0800 (PST)
In-Reply-To: <e03ac54c-11c9-2546-a622-c21169979cc5@windriver.com>
References: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
	<e03ac54c-11c9-2546-a622-c21169979cc5@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 8 Dec 2017 11:36:32 -0800
Message-ID: <CAJ86T=UFGsp0-TDdS8WAEOwr1Xc8aUH0DYv3qh21LcV6TDKxaA@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: create wheel sysuser group offline
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
X-List-Received-Date: Fri, 08 Dec 2017 19:36:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2017 at 10:44 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
> =E5=9C=A8 2017=E5=B9=B411=E6=9C=8810=E6=97=A5 13:54, Andre McCurdy =E5=86=
=99=E9=81=93:
>>
>> The default systemd-tmpfiles config file expects to be able to create
>> files etc belonging to the wheel system group. Currently the wheel
>> group is created at run time by systemd-sysusers, but that doesn't
>> happen if systemd-sysusers is disabled (as it currently is by default
>> when building with musl libc).
>
> For sysvinit, we follow the Debian rule which doesn't have wheel group in
> the system. Should we have to break this rule for systemd? Is this necess=
ary
> to use this group in systemd?

The default systemd-tmpfiles config file expects to be able to create
files etc belonging to the wheel system group. Unless we patch or
over-ride the default systemd-tmpfiles config file to change that then
yes, the wheel group appears to be necessary for systemd.

