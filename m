Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 562A07E71A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 16:12:18 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id x4so47451750iog.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=GYfzjZnUlvS43lToGmzmQrGZZAlZegWslGx1zmS9WWk=;
	b=YJmm4Lc6qfbunX7aTXI5FNzXJOFRL6RWM+WI28Q4Pj62G+Vmf29ccnA089zIv383jD
	w8wmFE9ZsCq5Esq7C0fiC+6cxR3w8MonKzs5Xz52I0aWRl2xsbAesK+xbbdUkHmeQaNu
	hKtxHZgCXPdeBC+aKv868bTv5soEX5GWG2Bd1s7uLwelNAJxwKLainnYlNZ16tM2VB5F
	QJxnjk8JA/7aNdFtX8CPkGDnm0qD0sRe9LuQGUH/tejd8fwRnBuJucfPfX6MvxKqsU4a
	VFcAbhBEeK2sz+A/cmtBJsEeYyjB4IYF+O4tODpxvYmyEIvdxAORzY2EBhSEVutUSPVY
	PuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=GYfzjZnUlvS43lToGmzmQrGZZAlZegWslGx1zmS9WWk=;
	b=ZkS/Q11NT1KkzAiGaiiY06+LISIeIVWaRbV+HweTTha1E52Nh/8URkXIjIQWLv0LUw
	AlASGPX+5cz7FNLCZk4lkNUy58ryu3Jmr9b9GrxXzw7tXi7tZwtEFz5qTfjsWJbAncas
	Cct44ryrYAEpOHTJNpJYqFTOQ1aO9A26phbzUE9vCw6MiKOwfMWE/soX5NMMxuPUI8Uk
	5A7Zg+Nacl/+x08CJTKjmpw37jPOrGHcDufsijPl/xIKAT1EfhFBcTpa4UDfiED10ALE
	lQ9w5VKwtlJizP57N6x4km0rb8QRgGFYLAuGxAjzQ1J0WkMP7WsITZ0dDMSyiz0Qpkkg
	woXw==
X-Gm-Message-State: APjAAAUzhAl1O5vFtt305NurbJdp1hAduGx6LUKIg8XsQskQyCXqGjps
	uwf6GyJa2f87Ie/9KTinpbJ9lnZU
X-Google-Smtp-Source: APXvYqyfuZL8Zw/85yppScKovVUIQVJ07CJFKr9BEJ0MAMurUfe9LLGDfHBZSPGbXKm4rktep0eYRg==
X-Received: by 2002:a05:6638:1e5:: with SMTP id
	t5mr23885975jaq.79.1566922338953; 
	Tue, 27 Aug 2019 09:12:18 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	t2sm29986906iod.81.2019.08.27.09.12.17
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 27 Aug 2019 09:12:18 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190827124617.18207-1-JPEWhacker@gmail.com>
	<CANNYZj_zr9+LbbGfhtd46pnUBYgpSW5LL5pE_fuvhxwne6yPrA@mail.gmail.com>
	<de80b1e5-dc0e-cabc-409a-0c8c84bc8ef2@gmail.com>
	<CANNYZj95TRH_+XELYLHGaBrg5gFfgOrpV+pvL5EjfQiXXWavEA@mail.gmail.com>
Message-ID: <9a4134dd-dbf3-929f-379b-4ea8e3e098ee@gmail.com>
Date: Tue, 27 Aug 2019 11:12:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj95TRH_+XELYLHGaBrg5gFfgOrpV+pvL5EjfQiXXWavEA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix documentation DEPENDS
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
X-List-Received-Date: Tue, 27 Aug 2019 16:12:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/27/19 8:25 AM, Alexander Kanavin wrote:
> On Tue, 27 Aug 2019 at 15:08, Joshua Watt <jpewhacker@gmail.com 
> <mailto:jpewhacker@gmail.com>> wrote:
>
>     RSS doesn't clear out the sysroots if it goes back and executes
>     previous
>     tasks as part of a rebuild. As such, if perl gets added by a later
>     task,
>     then bitbake goes back and re-executes the task (I don't remember
>     exactly which one... do_configure maybe?), perl may be present
>     when it
>     wasn't before.
>
>
> I am still not understanding. The sysroot is populated once before 
> anything in configure/compile/install/package executes. How would perl 
> then magically appear later on in the sysroot?

It's not populated just once. Any task can add things to the RSS as the 
build progresses. However, the RSS is only cleaned out at one specific 
point early in the build, which I can't recall ATM.

>
> Alex

