Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7F76562135
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:38:45 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id fl4so163924824pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=FVB4eiHdUg0Famy96FP/O95lLx0v9H85G5/VwEwAjOk=;
	b=jzrCH/AozQ8eUGX5Lle7MaRafYIDp3xnGyOK9p7L/QdYo5qKo2oYc0ldVw8prZvzra
	DTzOiUmoqszGUG3huy+9js6iY3yJxeEEKw81UOTR2TFJdcrmB62KYf83462Ju0NK3Rgk
	ie1/Hul0V7Rzxb0DS2l9WUcdenJolEeYcNwKT3Q2v7PSKy+nnplEdacA6cqiNLAIZ2Wc
	sMZH2uXCmIXyRZdJsMirhL41teJ1hj2pgrS7ZXdN+N/Yl3ZjKapV1tH450jmPcHVKRrt
	7c8QzY7u4LtQDZnBcP06UgSy58DxaoD18UDwfAZJv3sWqGoyvwso+XVDgV6tNHZRnC8M
	cNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=FVB4eiHdUg0Famy96FP/O95lLx0v9H85G5/VwEwAjOk=;
	b=iD2wU0nh3AdewjAnLLBH+KmovOvEoK6nl9UBSR7eiiQ3HBAnOSOQ+MWARA1t3kK1M2
	61cvJC3vrYodZ+go7f6NDtKCFFruFaaAckQ2d2qRYjFRji93ci3LF/xkf7QNSq1axrlD
	Bg7NFz43wdx6izl49j9ZZt7ioeqAW+tbmIh65iEFQDfjmcThxu8TtakzEySKR990Xp9k
	fgDo4G8sMsniwtrQ1gr+Bbp5ODoSpprU7vPOqOlD3k/VbIrCBNXgzfPi39rxaBYJBbXE
	g07Y36nnQhhCixBi/I/CwjlaswRM9bODX57ytgzo3B4UmQk/Vh567HDTmJLQluu8O95p
	Wceg==
X-Gm-Message-State: AD7BkJKsUueHA7DWzT7EBIrNrv4kboyRTk4EnysqL/TVw/Rcz4Q4NzEO31Nqw4YivWDuuA==
X-Received: by 10.67.14.6 with SMTP id fc6mr21981603pad.55.1457987926098;
	Mon, 14 Mar 2016 13:38:46 -0700 (PDT)
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com.
	[209.85.192.181])
	by smtp.gmail.com with ESMTPSA id 8sm31774300pfk.69.2016.03.14.13.38.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 13:38:44 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f181.google.com with SMTP id u190so113985017pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:38:44 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.87.23 with SMTP id l23mr33149391pfb.101.1457987923896;
	Mon, 14 Mar 2016 13:38:43 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 14 Mar 2016 13:38:43 -0700 (PDT)
In-Reply-To: <CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
Date: Mon, 14 Mar 2016 17:38:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
Message-ID: <CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 20:38:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2016 at 5:33 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 14 March 2016 at 19:12, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> Just for completeness, this is only need on Jethro.
>
>
> Wouldn't a better fix be to backport
> 161bb3409edee21827cf594cc011fe88185f1496?

This makes nativesdk and native feature set to differ. I don't think
it is a good move.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

