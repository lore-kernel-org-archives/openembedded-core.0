Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id B130860111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 07:37:57 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id bz2so36412084pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 00:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=plHsSs825T1X2YKqFlyZfztmyqe00mAo3vG3O0+Dp0s=;
	b=FsQsA4aHS7Tk3Ki1eC7vo20nEvpUfX5TUt+cACaMQ11L0rDeNGPAcFIlSas1hbA2ke
	jY+qQCIO8zdXXeOu64ul0iR2Y0zKSmjJ12rWTxaCALZEGPyizxRjmegm0nymlY8oNijI
	08uPI47Vl+FelS1qVT5ddMD2ar03ZrsY7RdPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=plHsSs825T1X2YKqFlyZfztmyqe00mAo3vG3O0+Dp0s=;
	b=A6Tgd2lFl9xFpfrzzFu1qGDPLMO6ClnC3907c7qFb3VKcRlFpFFORSKURXlyCCXAxh
	jH0wVaV8Qr9w1zmodiONfH82s+Zq94uCYOHTa5gD2uP0XVzQjr7jSyRjHiMfzxQTkv/s
	n33nvzT2nTcev+w7J1tDARlW34loAYDvA/y1rJ0QY0tpcbfeyPBSgdAkUrKt+3Fzxdfz
	cT6WVlbG2rdokWzvF8XLHhlOvc/APVZrKEvLRG0dSEt4s02pEhdEFBtv2VG0Wo20THAV
	w9QSpJMJ226A1mS2YInya/Wo/1cAa7aq/T1qi1Lt5IAGzBi8YVkGOnJZ3qMa8QM1+VoQ
	1jWQ==
X-Gm-Message-State: ALyK8tJL2LaFBhHWylBvEWT2SE+w7IZxK5GLq3rSbr+LAEBFHMTOtuPu9raiF4JGgxbj1+6G
X-Received: by 10.66.75.72 with SMTP id a8mr28608288paw.99.1467358677767;
	Fri, 01 Jul 2016 00:37:57 -0700 (PDT)
Received: from yct-desktop.lan ([2001:470:b:16e:222:4dff:fe50:c906])
	by smtp.gmail.com with ESMTPSA id
	i68sm2838035pfe.64.2016.07.01.00.37.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jul 2016 00:37:56 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <ae4e2654-ca20-85d1-d53b-b0b05ab25a26@linuxfoundation.org>
	<CAMKF1srZ=NCMop1BWgZ9PACGJEjVguDngZT4tcAt0jqnBZt_rA@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Message-ID: <a4af0a4c-f6f2-a46d-2a0c-97220b0c3dc4@linuxfoundation.org>
Date: Fri, 1 Jul 2016 00:37:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srZ=NCMop1BWgZ9PACGJEjVguDngZT4tcAt0jqnBZt_rA@mail.gmail.com>
Subject: Re: [oe] Patchwork upgrade tonight
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
X-List-Received-Date: Fri, 01 Jul 2016 07:37:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

The new patchwork is in place at https://patchwork.openembedded.org/.
The performance changes appear to be working well. Please e-mail if you
notice any problems.

On 06/30/2016 04:11 PM, Khem Raj wrote:
> On Thu, Jun 30, 2016 at 4:03 PM, Michael Halstead
> <mhalstead@linuxfoundation.org> wrote:
>> Please reach out if you have concerns.
> 
> Hi Mike
> 
> I have been playing with the new instance no issues so far. Send a
> note when you bring down the system and again another when its all up.
> 
There should have been no down time. Both systems remain running and the
cut over was done with a DNS change.

-- 
Michael Halstead
Linux Foundation / SysAdmin

