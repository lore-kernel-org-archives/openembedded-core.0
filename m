Return-Path: <ross@burtonini.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id ED59161134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 14:53:49 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id j11so1993170lfg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 07:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zOI1AW67S16xi0QW89RBkvquNvxvf6PcvCX/zMTT6IQ=;
	b=0FtHk6EXZb8oiTZ03w4kKEdRKyRZKgFPvWRzgwwecF7+0QdofvmcYs1SiuN/jD0wwi
	iJfmd3uILILfLVzU4c81FB5FxFcW54RY2pUtmteqHeHy8sMhtKXDPHJvwlKPCzDnyGVZ
	ZspZHPFZOjfn/AR0CDiOBYIUU3OM8C30KWQLElBn8gxY6GBzFJFfEuwfBEIzRmQ+rc1F
	WMAzLjewBGDfzW3aG0Bm/EilvogLwIMHFoOOp6W1OEU5/sY6uUQoVXCKViyCyM7t1vxN
	hv9jT7SBFI9uOTz0UhwYynsOPlmErk5f9v4sslwI70N8uZS3PUdnRd3+tjYmxAQcVzqI
	m4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zOI1AW67S16xi0QW89RBkvquNvxvf6PcvCX/zMTT6IQ=;
	b=uZkVjrZjY8v/ie8SJNAO1lFVO98xCi8kyDR3vkmfeksbkJWSM1OdJjdSlOgd5rFwsY
	bjLI/SFXiL0nWSFieIX1vJUBSBio1mQ7TydALBHbRh16kZ6UeasyxrIb275ab2XWxCPp
	lhH3VYkw6YERlv1fATZ57OQsu4VM6DzGgF3EvRHC2aL+Dcjd9docCPrD3wYvyldWWsiM
	wfOxp6/S7vWwGYTmiwuclqPs7OJ6jcCZtPj9jcHZMMXnHTbX7lUUjVcD9WyLowdtNG6i
	seqeedZwgevntdy0sLshoKBiHvVwMh/YuKZUxixKnvlLosovc6G3VL6tnQ1OCMCjfxa9
	UzaA==
X-Gm-Message-State: ANhLgQ321BeZmoNkCwZ91XEXfJJYjnhrHDmZxpz9DPTMkfEN9YAyGXQj
	bVpjuOe5Yvxd/yiGeOtNuGK2q25RN58o2xDavWMwLA==
X-Google-Smtp-Source: ADFU+vs23h7wdCAals1VNwJEB5NXiiQ4HGYYFbFempCar+PKmiCf0kEyFdKp8NEzDe8v3Cg7iMRozUHSbUZPvqTzUEc=
X-Received: by 2002:a05:6512:50f:: with SMTP id
	o15mr2376669lfb.216.1583938430265; 
	Wed, 11 Mar 2020 07:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
	<01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
	<20200306100422.GA17785@localhost>
	<877e317932176664bc7b0120439c56d4dda791af.camel@linuxfoundation.org>
	<20200308214610.GB1425@localhost>
	<CANNYZj_4sTc9vjhm1+S1GbjN=8SjChWt+gksxxKLXEZXeK9nPQ@mail.gmail.com>
	<20200309002308.GD1425@localhost>
	<f99fbcc5-bb47-a177-f1e9-815d3cf4e5c0@embexus.com>
	<CAAnfSTt5fwx3a7pPotvqrwgW58+n-UxCQiZqiAFuuJz6K+=aqg@mail.gmail.com>
	<1c4e1685-7b74-0dea-e08f-4887fca9eb66@embexus.com>
In-Reply-To: <1c4e1685-7b74-0dea-e08f-4887fca9eb66@embexus.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 11 Mar 2020 14:53:39 +0000
Message-ID: <CAAnfSTuvt5E+AEh8rFWqtmJN_R9fxci6+b8de6=ng7DrOUxGrA@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Wed, 11 Mar 2020 14:53:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Mar 2020 at 19:45, Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
> Security patches support is definitely for many companies a knock-out criterion.
> Probably in this case Debian or a commercial OSes like Qnx would be a choice for who can afford it.

If someone is using Yocto commercially and willing to pay money, then
they are entirely welcome to use a OSV such as Mentor/Wind
River/Montavista/etc who *will* make firm commitments on security
issues.

Ross

