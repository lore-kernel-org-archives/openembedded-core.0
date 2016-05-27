Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1739573192
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 13:57:15 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id g64so42352198pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=qLk6bisV+gfbVMtW9tJ+ag+wcUmhiA2OBH7d51gmByY=;
	b=geqzXMWjoIChhmJwC3HP6DR5zm6u1Dtbq38t32dVXczPL3Kl1cH4HkY5S5OaGg8uFj
	4KVzp1u1s4XOmW6QzJ79wpV8tnnmXKHJzsluc+tdGDsEw1K04sY6Xs+Q1dhfQX0Y/97q
	Z/X316IrSDn25qmA4Ygf7eiQmWSCY45QLe7/Ja9RdlMaz+fh7DFI5fXFaizwI1wExUnW
	EU/lmIQ4k1lBbm+yVNFYwRf2gftO+W5blaD2Ixr+PJIiQLjaZdeZeC3jUv39FWCcdxRO
	32GGMiPGhGvGSJPJR0b0b7O3Erb09IMZBxUZ/rUIIADgkTgG4/arrk/Mh2aTVZIleFrK
	+e7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=qLk6bisV+gfbVMtW9tJ+ag+wcUmhiA2OBH7d51gmByY=;
	b=HZQnM9LZrJtvr3aOeExgQkReP8p2FD6whQPjOwHhi24PUM4Pev8JxwChdHexPsXi7X
	miq7Xv3vTh4cN6BaRbGi0MgiKdjbXfhohSEglaQp+IPKP6nkdLs8vVthbpi3vlXZfc9v
	TM05mWy5FIdA1aZIynoyfiAKw9xTSYAdMsyQ6OXjT+l6NcTh+lnTFD2y3B4yloQce8DV
	Jvbxhf3jbCh8z+vFAaC8MoTReq0h9wgrUHmHQnkLh11AHohZAX3EeQ0AqO1jDk+cPlNV
	bGDiMkW/9DgZWQhCmK1Wwkv1aYfDGkxoTccNNceo/tGPj+j9xKRJogPB0cBwGa1pE/wy
	LJfA==
X-Gm-Message-State: ALyK8tI3CFDidqqsnVNjHcakFzTWfe+9sHysZil6qUPkKsbuYY0GmUmUMFu7tlHp0CDjvw==
X-Received: by 10.98.28.74 with SMTP id c71mr18501913pfc.131.1464357436192;
	Fri, 27 May 2016 06:57:16 -0700 (PDT)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	c82sm14091894pfd.42.2016.05.27.06.57.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 May 2016 06:57:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f51.google.com with SMTP id fy7so23972443pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 06:57:14 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.67.14.7 with SMTP id fc7mr22763148pad.1.1464357434073; Fri,
	27 May 2016 06:57:14 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Fri, 27 May 2016 06:57:14 -0700 (PDT)
In-Reply-To: <1464275590-6623-1-git-send-email-andrew.shadura@collabora.co.uk>
References: <1464275590-6623-1-git-send-email-andrew.shadura@collabora.co.uk>
Date: Fri, 27 May 2016 10:57:14 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo5a3t0=P-AbQw0FihTXGdGm4exJW6BoMnNGWbwHgi7ig@mail.gmail.com>
Message-ID: <CAP9ODKo5a3t0=P-AbQw0FihTXGdGm4exJW6BoMnNGWbwHgi7ig@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: replace old-style shell syntax with the modern one
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
X-List-Received-Date: Fri, 27 May 2016 13:57:16 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 26, 2016 at 12:13 PM, Andrew Shadura
<andrew.shadura@collabora.co.uk> wrote:
> Use "-n" operation instead of comparing with an "x"-ed empty string,
> use $(...) notation instead of the deprecated backticks.
>
> Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

