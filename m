Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A8F757E03D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 12:29:28 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id w25so2614825ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E1Vf/DLzHSLHaQPUnf4RdSCjaD7115NB0ujXSGqHXs0=;
	b=Tl/rl6MJXo0ts1ps9AHuRMGP3x9QM3f74DIOfbki7+8WS60P8ZNq7XsKzCEEf/SGln
	tlrpZp2WxvTDOvA6QST4TwiafF6RianFA5nCZzmFb9Ln55tScuhHON5Qj1IHDEVXKiek
	zy5QMTPclwHo++7RzUm7SvfrNzfpYJ51/YNcQAbLhY4cMLpkdGm994wrqHkkcr2ccC88
	J4bdSlaQjsJvromYxTYxUmu+aq6qylMPEYh9So354pVoUZ5wPX5bNqb8L092Vv8OOOTh
	kJiD9//513zXGJkg/v1Awad6QYbPaBH/E5AO3brjfXCVI20wmNyZb88kkMM+p+C7E/JR
	xwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E1Vf/DLzHSLHaQPUnf4RdSCjaD7115NB0ujXSGqHXs0=;
	b=OcRxvj1XRrGTz/AWgsmLrwKJQBest0O0HqowET05QJArX4lWDJZRrAW6XxrjbExKhI
	PdTAt0l8IlgprM9B0En6RyfLDk2tqA9BmQ+Qyt63ZOHZKZ6Mn8G3rZyMTGj//Rj8yJ64
	l1q81d7uApPavFGS2LLXuQ3eAtmzrNvhWtIP0u5QwthKeDk6cvQZh1+AdvIJACBINss6
	7NHII6CFcD9bQDTsaDNyrbqpRs9d538BxXGiCJSxL8pGDlJ8dzDuqxPw24YOxt91ks08
	IXaXkGGMuSeAtaIwAEc68I8o8ooIPvK8a7Fink0BYp1dKoH7bJZVMLa3FLzN/wzczd8m
	yaVg==
X-Gm-Message-State: APjAAAUoy+E5PPfwH7pHrawh/IzB7X/yuNdEXE3ZDZYcCb/BO7hIV3ID
	haT/z7+O9rxA+s2f8vuisPFvfaKRTlCinDX2eZz/nA==
X-Google-Smtp-Source: APXvYqxozqD5pmCPcGJUhRhsp9S/WejhGg3QdyxplyvXhaNyZERG11gFwVV2NBWySL91lvAzEtak9lnmIK35buqk3bw=
X-Received: by 2002:a02:b798:: with SMTP id f24mr7554532jam.97.1561120169763; 
	Fri, 21 Jun 2019 05:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
	<CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
	<20190621110356.GO3459@hiutale>
In-Reply-To: <20190621110356.GO3459@hiutale>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Jun 2019 13:29:18 +0100
Message-ID: <CAJTo0LZNdM8zb7E4r++zWY44RC2y2PebWsA4CBY7c6CGA-FfQg@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Fri, 21 Jun 2019 12:29:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jun 2019 at 12:11, <Mikko.Rapeli@bmw.de> wrote:
> This adds python3 urllib3 (python3-urllib3 in Debian) to build environment
> dependencies. It's the first user of urllib3 in poky, AFAIK. Maybe
> documentation could be updated too, e.g.
> https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#brief-build-system-packages

Somehow I didn't notice it, thanks.

Pierre, can you rewrite this to use standard library instead of urllib3?

Ross

