Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id EBC8F6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 09:59:35 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id v6so58006006vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=J9cphY7+x88ylFsiTEHwXDaj34G85ZfRkF37949s8qE=;
	b=o3Nq1xhvDzG2ZpFn8aVFaRiJSzjh8Tc6nkJthYvVBR+c9+XrI0PSPSKKTBNCkF0Bdw
	VBUxX0gK8A25XUdla7ptW2kMfpPI/OW9d7uN0K1gi6FktJOrQFWB7U0SlET4jY+TmQ1C
	auyVeallmDZ5d9UL+SrBfbUKt0bHby1Cy47Yr2GhLa2EYXvEwTmRLSrIrR5kCclV5jxI
	tOYmE0O4ls9MFoxEcgm3bfdsEiLuVJ45xJA3zT91ZfcL8hARt/YLuHpmq7bi+wOdG37w
	web3ux5hhinq2IKIGiYfqK0PU2fY9vKikM8hfcaUeef2sQQPydV1+XlhvWoH2jIizHNL
	eX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=J9cphY7+x88ylFsiTEHwXDaj34G85ZfRkF37949s8qE=;
	b=KjyYJ2pA0WddYse5aWYf9VGphqWK5W262QtN3IRpAtw+g1yrzqfWBbh7tPGAtZ1qPE
	JWUPqJ5henZpnL/Yu8s0jhEwLpim90K8sEWyomIofX30I2NILGAS2Y8jajUPjquFZMer
	8QIfQTEAmBInPTDR+RPLTBaH5AC6cNuoxpz9YW2rRoMwWrL2xV/KVAptTQehdHHBMICx
	Zzg2Yp6rIEwKpuEnNLUStmzCYzuX6C/ZrVgTvkg3tWpxdb3qEYCdXle7L9arsuHqrdap
	+x9ecxddKlNWYt0Jd96YeOvY+vTQdVvZYhtoLm0L/mDgbtaL1FGpLgo7RGoJhiufgEQS
	1QRw==
X-Gm-Message-State: ALyK8tIts0fXDcxCw20/RVBPXf8AI7tR6biX/s0vz3qW+IMwFJVga78grxor/RAKYQtpPg==
X-Received: by 10.159.32.105 with SMTP id 96mr3474243uam.23.1468403975170;
	Wed, 13 Jul 2016 02:59:35 -0700 (PDT)
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com.
	[209.85.213.48])
	by smtp.gmail.com with ESMTPSA id 79sm6544729uaf.18.2016.07.13.02.59.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jul 2016 02:59:34 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f48.google.com with SMTP id x130so58212615vkc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 02:59:33 -0700 (PDT)
X-Received: by 10.31.163.72 with SMTP id m69mr3450833vke.72.1468403973550;
	Wed, 13 Jul 2016 02:59:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Wed, 13 Jul 2016 02:59:32 -0700 (PDT)
In-Reply-To: <CAMKF1srQZpiu1fkeTc9KYmc+p-jztbrL_5zywzPs2eipoE4G=Q@mail.gmail.com>
References: <57857E9B.2060607@gmail.com>
	<CAMKF1srQZpiu1fkeTc9KYmc+p-jztbrL_5zywzPs2eipoE4G=Q@mail.gmail.com>
Date: Wed, 13 Jul 2016 06:59:32 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoGdjPSq-=-XTYj+yRCz=9QWBJkPsUx8whiG_HMwyhYoA@mail.gmail.com>
Message-ID: <CAP9ODKoGdjPSq-=-XTYj+yRCz=9QWBJkPsUx8whiG_HMwyhYoA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: musl 1.1.15 for krogoth?
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
X-List-Received-Date: Wed, 13 Jul 2016 09:59:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 12, 2016 at 8:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jul 12, 2016 at 4:34 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>> Khem,
>>
>> would updating Krogoth musl to 1.1.15 be safe?
>
> It would be, since there are no ABI breaking changes between 1.1.14 and 1.1.15
> incremental fixes and new architectures primarily.
>
>>
>> I already pulled in the other musl tip updates.
>
> OK thanks

Most of 1.1.15 changes are already in, so I think it should go as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

