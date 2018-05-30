Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2C997745A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 06:41:18 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id f79-v6so1414742oib.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 23:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8sibntBbLz7QpbQvq52JXJbvcS48P6adlCMbpaZO9fw=;
	b=pHbmpwgYvxBPmwyZPrTF/GD8EdBihGgyzT9AEk73f97r1+F9Fievfpk4onxZTqeUnc
	Jtx9D56rdmKyYEo9a81Pd/hegASO/dp7dkZtxOm4RNMZGC0SdO1RB+eBl6/s1Jbp8bBy
	BQXlQKH7f2gpd3WJxaWn/kNwRYXEA+xHNnT1BadS54DW5dGPewXTY+gm/nshe4jYvkTF
	E6mNMrNIWLPWTC1n0LLvZeOAOpnAp4a2UUhNNmzU/s6lHO8lr89tqcOuVkXZZ4o//Gfp
	IwJmkMRc3fLGREyexkIIo+GNdISIrkuuFLW89yBKRI5EszO7AaYEuMNPBMjcDnhzDDJS
	ko0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8sibntBbLz7QpbQvq52JXJbvcS48P6adlCMbpaZO9fw=;
	b=UKLTRuBrQOM90A30sc3s5fZqthd5+es7jZab1E1nDU3if9BlXC+7JoNGGbzO7ZPz0d
	TmBm42u7/YZNyWc3YBAek6+3kD9UhOyVzxdIqZ1zVWhlCUExX413c6p/YzM46Ux93JGy
	13M8OpdLWRDHDxptnTBswZu9QJ4N33ZKYCYAHT+c88SQsDn69zNAjLEDCrYQaOz7VqpC
	3jzcbeXakPPml79kMs0WR9RPNXAFApjMNtGwqLQAk7OgYR90LUxM1vLAUycbgcZgcqzK
	l8uiHYWwI9cWvE2L+0+HXkXOJ/Prp2J85CvKt3SQR3S8/TB2aumsDLnMjJ56Tkbz0QJ1
	A1hw==
X-Gm-Message-State: ALKqPwd3CjpW06oTojCM1+5gKp9nKYNBuZZLaTrpP6GnaiG6mbTCij0v
	aNmnMlWsyXGWO2W2JhG3LGHVteCSSwNlkENDVvg=
X-Google-Smtp-Source: ADUXVKIih0uSX3lleMoRAtiZzlZVaw/9rl20koxYe3FeAkDxkEen5WUUOZYn44CoUAugflFeRQ9lcXFm8p9f3sIia1M=
X-Received: by 2002:aca:47cb:: with SMTP id
	u194-v6mr837821oia.45.1527662479998; 
	Tue, 29 May 2018 23:41:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Tue, 29 May 2018 23:41:19
	-0700 (PDT)
In-Reply-To: <1527654433-263632-1-git-send-email-changqing.li@windriver.com>
References: <1527654433-263632-1-git-send-email-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 May 2018 09:41:19 +0300
Message-ID: <CANNYZj8kCFWOfoDdn+F8LsGtT7oG6TKapBEnzPTSL=K0sttbRg@mail.gmail.com>
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemuwrapper-cross: fix postinst failed warning
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
X-List-Received-Date: Wed, 30 May 2018 06:41:19 -0000
Content-Type: text/plain; charset="UTF-8"

2018-05-30 7:27 GMT+03:00  <changqing.li@windriver.com>:
> From: Changqing Li <changqing.li@windriver.com>
>
> 1. some binary like udev-hwdb/pixbufcache/gio-module-cache/fontcache
> uses qemu usermode by default,  but some architecture such as Intel
> skylake does not support qemu usermode, this can lead to a build warning as below:
> 2. font is not arch related, but receipe like liberation-fonts inherit fontcache,
> fontcache called update_font_cache, update_font_cache use qemuwrapper,
> qemuwrapper is arch related, so update_font_cache will core dumped as below:

I need to apologize. I went ahead and fixed all of these issues myself
over the weekend, and improved a few other things in how postinsts
(and postinst intercepts) are handled. Should've told you immediately.
The seven patches have been sent, so if you can test and confirm that
they indeed fix these issues, I'd appreciate.
http://lists.openembedded.org/pipermail/openembedded-core/2018-May/151196.html

Alex

