Return-Path: <akuster808@gmail.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5742160248;
	Wed, 23 Mar 2016 22:11:48 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id h65so37459175ywe.0;
	Wed, 23 Mar 2016 15:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=BAazTvV0Vr0cFIWVXWdbseyelgAr+Ga6SmygmMixJPA=;
	b=HjqQ6x7GngSGwYcYltLX0bv4D7AvQ8IdV8OHyy016gklyj0ge4+Dv1BsPW/ibHt62B
	tPEa+wm2Z4ysfV84lvrZAsZw++cLb+KxvF3SGRkxPftb7KDJTmzhNVMLfyYjjKMx4Jlk
	cG5UGugW3M0bSyDshmZMNS9imHo+MyYgvrrDBAFxueoJx1bc8vvCZxTqWJFhAbMj6FgB
	fB0dWnar/4//kKHuE16Wb8AmkOfioL01qNI+rl04cTUpoTunwIiC7VSeZ3yOl5tRsKJO
	6KwX1oiTOuX4M0+bYL962j0M1slEIKmILwgj+8DZEsdDiRlX3fjlU9yOVANusFDAmlOk
	THZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=BAazTvV0Vr0cFIWVXWdbseyelgAr+Ga6SmygmMixJPA=;
	b=HGKohyHGiLStFIZggq3QBTWxrkddo1dyLmqA6PF4HYY8/e8WVj+lfI9Ns7wO6MQ/ku
	NChiX471efNZ7wo2voslNQvd5awaCQSPCXlp7uZBbwsupuJUJD3xuXkXchckICFuC/sj
	wIQiorZ66H4iH2joGLzRCPwqG1QAq930Z06JON9H1MQm7dgGW+7qxprptsoXKEIzVMlL
	ToQS+AGxEbjJe8W7ArkYGaAUg+bZw5xM0ydByYxNI+GIrQgVTy/UOk8mntpALoyF6LJA
	yn61122wGJl6KfLfs4QV1RIckSrEhebKWlYDiQebEUPxYfkDG/BDTGV6h+3Gsfj/TVTf
	sX9g==
X-Gm-Message-State: AD7BkJIsznKWRPoHqx2CVwWJf9ChPzyeZSNXYwAh/ItZzIiSm2WdcG3RkRUzklBGx2P/KQ==
X-Received: by 10.13.216.76 with SMTP id a73mr2614068ywe.179.1458771109498;
	Wed, 23 Mar 2016 15:11:49 -0700 (PDT)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	a202sm2684819ywe.22.2016.03.23.15.11.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2016 15:11:48 -0700 (PDT)
To: Jeff Osier-Mixon <jefro@jefro.net>, Philip Balister <philip@balister.org>
References: <56DEF97F.9070306@balister.org> <56F2C618.3050205@gmail.com>
	<20160323210850.GA5376@linux-yxv0> <1458767514382.89578@seescan.com>
	<56F30D13.6030909@balister.org>
	<CA+YB3rYNxkjsFaRzAQVTvLtZLu_0sb=-nurdmQ8xixruGLAmOg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56F314A2.70100@gmail.com>
Date: Wed, 23 Mar 2016 15:11:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CA+YB3rYNxkjsFaRzAQVTvLtZLu_0sb=-nurdmQ8xixruGLAmOg@mail.gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Fred Ollinger <Fred.Ollinger@seescan.com>
Subject: Re: [yocto] [oe] OEDAM, April 8 in San Diego after ELC
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
X-List-Received-Date: Wed, 23 Mar 2016 22:11:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 03/23/2016 03:03 PM, Jeff Osier-Mixon wrote:
>>>> There are only 10 people signed up.
>>>> Is that enough people to justify the expense room or even meet?
>>>
>>> I have no idea what the budget might be or what a room might cost. I'll leave
>>> it to those who do know to worry about the costs versus the benefits.
> 
> I would give an unequivocal "yes" to this (as the guy with the credit
> card). We need reliable internet access to loop in those who can't be
> there in person, plus this was actually a reasonable rate for the
> immediate area. 

tijuana? OEDMX

We can take up to 25 and these meetings usually gain 5
> or 6 people who never sign up on the wiki, so I think we are in
> excellent shape.
> 



