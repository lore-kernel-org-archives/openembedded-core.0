Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7716007A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 13:50:54 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 4so4710929wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=nsFeO+c4FZT+KANjNgH1NySSUlZjSVEXd2h3vVkMrAU=;
	b=bWB7yzuXXcG+6hAWWxgRKOFnATLGvXlfi7O37y9axjX3pyL39OVAu9mR9ngVxQ0qCw
	S+57f7Qv7HRn3Fs//hUy4TNlb01gfnXWS0lrY5nP/ey8lE3/UvxtxD4HOcyL33AObLXt
	LNYDGubvqY2Z2KGGkUOIbefeK/7Xkh8h1V1n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nsFeO+c4FZT+KANjNgH1NySSUlZjSVEXd2h3vVkMrAU=;
	b=VIcOectG6wYg9w8JmrBqvC/PFkL8NLd6ILNMzv7/Ne754LO6nC77ptLvApXakJZTuD
	4VQSq66A1FzhZS5UzSePSgsxZ0fRn7RDAo/n5eiEIwvv5rjFJJyYy1XNCs98rWKZLYt+
	fprFFINM52jcY37uifM556Cd2PMvWfTrgKqyQIvHzlmw+SjcR0BH8Nj4VlA7JX6A3coN
	fgyMIzXyiXs+HPIXqJDPU14wgBcjjdstSpOafoz4hNYOJWmM3Dh+bYjt3pHRkztcPRgn
	zOeSpZRoqBR+Smz8j9+NYrTVTEqsfksjJD0PNaHEGKxiV0R0cze19l/YZRx/P0Gshvn6
	FGjg==
X-Gm-Message-State: APjAAAXt5QsONkuvpeKsQDq7OYVF9s4QuSDj4TXX2els4ZcJ1zamahRJ
	uXK4XFxq9auKrNEbOuphP+b+Vw==
X-Google-Smtp-Source: APXvYqyhQWlyw4UREm0HoSAoZKuCURnEAYdB+bUBOckzmoB8kc0BmzULwQYC843Zm2UQkVdN5EJwvw==
X-Received: by 2002:a1c:cbc5:: with SMTP id b188mr7007881wmg.87.1556113854771; 
	Wed, 24 Apr 2019 06:50:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g17sm8732677wrw.43.2019.04.24.06.50.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Apr 2019 06:50:54 -0700 (PDT)
Message-ID: <61f5389ee7e594055a18f5ce7a2e040a2b04de90.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Tom Rini <trini@konsulko.com>
Date: Wed, 24 Apr 2019 14:50:51 +0100
In-Reply-To: <20190424112943.GB31207@bill-the-cat>
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
	<1555869425-7613-2-git-send-email-trini@konsulko.com>
	<6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
	<20190423220106.GA30419@bill-the-cat>
	<e6b4feb2584669c83dabbf50761f2e68b990140f.camel@linuxfoundation.org>
	<20190424011742.GE30419@bill-the-cat>
	<f0092d0d82b7fe8fda61bb0baee724926264820f.camel@linuxfoundation.org>
	<20190424112943.GB31207@bill-the-cat>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] vim: Update to 8.1.1198
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
X-List-Received-Date: Wed, 24 Apr 2019 13:50:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-24 at 07:29 -0400, Tom Rini wrote:
> On Wed, Apr 24, 2019 at 08:40:01AM +0100, 
> richard.purdie@linuxfoundation.org wrote:
> 
> > What does "locale -a" show for you?
> 
> On Fedora Core 29:
> C
> C.utf8
> en_AG
> en_AG.utf8
> en_AU
> en_AU.iso88591
> en_AU.utf8
> en_BW
> en_BW.iso88591
> en_BW.utf8
> en_CA
> en_CA.iso88591
> en_CA.utf8
> en_DK
> en_DK.iso88591
> en_DK.utf8
> en_GB
> en_GB.iso88591
> en_GB.iso885915
> en_GB.utf8
> en_HK
> en_HK.iso88591
> en_HK.utf8
> en_IE
> en_IE@euro
> en_IE.iso88591
> en_IE.iso885915@euro
> en_IE.utf8
> en_IL
> en_IL.utf8
> en_IN
> en_IN.utf8
> en_NG
> en_NG.utf8
> en_NZ
> en_NZ.iso88591
> en_NZ.utf8
> en_PH
> en_PH.iso88591
> en_PH.utf8
> en_SC.utf8
> en_SG
> en_SG.iso88591
> en_SG.utf8
> en_US
> en_US.iso88591
> en_US.iso885915
> en_US.utf8
> en_ZA
> en_ZA.iso88591
> en_ZA.utf8
> en_ZM
> en_ZM.utf8
> en_ZW
> en_ZW.iso88591
> en_ZW.utf8
> POSIX
> 
> And then my Ubuntu 16.04 regular build env:
> C
> C.UTF-8
> en_AG
> en_AG.utf8
> en_AU.utf8
> en_BW.utf8
> en_CA.utf8
> en_DK.utf8
> en_GB.utf8
> en_HK.utf8
> en_IE.utf8
> en_IN
> en_IN.utf8
> en_NG
> en_NG.utf8
> en_NZ.utf8
> en_PH.utf8
> en_SG.utf8
> en_US.utf8
> en_ZA.utf8
> en_ZM
> en_ZM.utf8
> en_ZW.utf8
> POSIX

Does vim build cleanly on the 16.04 box? My working theory was the lack
of iso88591 locale variants may be causing some kind of issue...

Failing that can you send me the log.do_compile from a successful build
offlist and I can compare to my failing one (or send you my failing
compile log).

Cheers,

Richard





