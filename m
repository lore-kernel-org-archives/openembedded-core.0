Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E53636D6F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 23:41:53 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j42so17997650wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2019 15:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=BdQsbBHDUv4+NwFweFyyKW4vBccxOGi4tyK4ZxOdux4=;
	b=P+pTDq7cOS2CnQVl8ER9JXOU9NqSK/yB4YL3Ycaj1kRF8YZhU6LRH+3b4q2BLqBPfm
	xTWd/5xzJTnACiLeYt4W3cM7eWwLGijt1o/nyEVP5x9frRKdO5U5golryFEOdI+oe2LC
	IhWz1wQKQqDNNv6LPA+fOVRuNIpn9oajuBmgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BdQsbBHDUv4+NwFweFyyKW4vBccxOGi4tyK4ZxOdux4=;
	b=aErNyFZHm/S3EtogOOYqGj6xXarj8OsNFoV4f5wXd0cKhQ6tomytr5GF8PwX2zaQPM
	2d3egrKTtdu+bTQUh+Ne7r89AROejG69mFnthwNEZq3mOfzKiYWCCEkwfIuzd//Gevan
	CS9v+2iD8G6tHoQicG0BFFbFsnktP8VY8uJlqus55xSNW53FzukwcwoAwfACiPicQaJR
	S46D91MRmEoXnqRUfOFNGoPsjdceCI1JaBJaoAN2h7sfvjWsVBW2vGAAFtpeLpmzIiHp
	SMV0ufrVKNWFfzQEafv3aE6EsStN6HnlSeSH+aUjV/b5qbMxfWbVPpf7pO2yMDpDdBuC
	FoXQ==
X-Gm-Message-State: APjAAAU9sLvdpsOIbFXmuVEXQFFgU2tJM6VMmF2uBBi7qLeZlcBaoB3a
	YHEjLKypCZZSCvjd9QjIrXmknQ==
X-Google-Smtp-Source: APXvYqzCs5mVgIomzgkd7S3lASWpO1K4ENzVJFcRtdUT2D5vmc1DJqc+F8kCHBvF39SwjABUQ4ylNg==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr4800726wrs.92.1575934914534;
	Mon, 09 Dec 2019 15:41:54 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n3sm997243wmc.27.2019.12.09.15.41.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 15:41:53 -0800 (PST)
Message-ID: <cd3cd74323732762097a80f32c594f33612730a4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 09 Dec 2019 23:41:52 +0000
In-Reply-To: <20191205154357.121346-11-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
	<20191205154357.121346-11-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 11/24] perl: update to 5.30.1
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
X-List-Received-Date: Mon, 09 Dec 2019 23:41:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-12-05 at 16:43 +0100, Alexander Kanavin wrote:
> Drop fix-setgroup.patch as the upstream has fixed the issue.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../perl/files/fix-setgroup.patch             | 49 ---------------
> ----
>  .../perl/{perl_5.30.0.bb => perl_5.30.1.bb}   | 11 ++---
>  2 files changed, 5 insertions(+), 55 deletions(-)
>  delete mode 100644 meta/recipes-devtools/perl/files/fix-
> setgroup.patch
>  rename meta/recipes-devtools/perl/{perl_5.30.0.bb => perl_5.30.1.bb}
> (97%)

I think a build race sneaked in with this upgrade:

https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/240

  /usr/share/man/man3/TAP::Parser::SourceHandler::Executable.3
  /usr/sinstallman: Can't open cpan/podlators/blib/script/pod2text: No such file or directory
ABORTED
hare/man/man3/TAP::Parser::SourceHandler::File.3
  /usr/share/man/man3/TAP::Parser::SourceHandler::Handle.3

Cheers,

Richard


