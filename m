Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 26A717E45D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 15:55:49 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j16so19329049wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=1HnU0HxC97XmbdgYVE4l9ndZK6/dI4nXN5jg8FIb9Uc=;
	b=X/JgwEmL+Ooq4ULCNeW5zQt9mDeMfxC7MQYiiadGn0GwfS0ltb0zZ3cG/+pEybwjLD
	3OMyIfqWsarw/wOaO+PAwGoonMM2fQ4tOe6LIg3zDAzqMwBG/BozUBx0E48yrHh3Hcln
	nw0FP+Zc+LfWlOpOlNoPW6Edc498JzjflANbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1HnU0HxC97XmbdgYVE4l9ndZK6/dI4nXN5jg8FIb9Uc=;
	b=R9WdewBGDTslNblgvvV2g/sBwvdNCYk2/kCqva7Akn4etDaj+mMh0bGc9SOSy60hu1
	yHk6Zh+3g9K4vHcp5hqqsTZ/PjbsDqX+yJwDCo0qDxx+8TBzco7XLGmsjCSq3OcdK1Os
	DszCn91+i1J3jhbvFa7KAvVEQ8vtr9bKc5FuTfuNzgThWaA9//ei27gEPHDTtJxMm6ef
	+V8jgLxmqIzTwOSH7QUVaRWIvifOPUylcDpy2SFx+eO3h++paKPEjjyj8fv0RUptaHus
	gOY7grdG9RFVtG3oBOfXpvWSurVwvf9oV9fSad1WFW5HUncNWR++GluxrBGsF/KRbL/r
	RqtQ==
X-Gm-Message-State: APjAAAUd6iN8Uo2jjehmGsDf6/lgGsBvD8GSp8hn18eah1T8j566+sW1
	ta1tbF26oAUs2PR01uYSM4ko5g==
X-Google-Smtp-Source: APXvYqw5qjF6+4xzNQ1gAyAd1/MFhLnTEdpDlAvJkzog2EPLpxQAFOe7a/lF6jgIo1MI+9xIQGUX6A==
X-Received: by 2002:a5d:698f:: with SMTP id g15mr31723041wru.310.1566921349904;
	Tue, 27 Aug 2019 08:55:49 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 2sm28127412wrg.83.2019.08.27.08.55.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 08:55:49 -0700 (PDT)
Message-ID: <1fefb859d786e7ff8ee9a57bd58e4c7d94f28dd5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 27 Aug 2019 16:55:48 +0100
In-Reply-To: <20190827135608.GA19259@localhost>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
	<1566593504-21918-9-git-send-email-armccurdy@gmail.com>
	<20190827135608.GA19259@localhost>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/13] glibc: drop obsolete packaging of glibc libnsl libs
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
X-List-Received-Date: Tue, 27 Aug 2019 15:55:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-27 at 16:56 +0300, Adrian Bunk wrote:
> On Fri, Aug 23, 2019 at 01:51:40PM -0700, Andre McCurdy wrote:
> > Packaging rules were left behind when libnsl was removed:
> > ...
> 
> How has this change been tested?
> 
> ERROR: glibc-2.30-r0 do_package: QA Issue: glibc: Files/directories
> were installed but not shipped in any package:
>   /lib/libnsl-2.30.so
>   /lib/libnsl.so.1
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> glibc: 2 installed and not shipped files. [installed-vs-shipped]
> ERROR: glibc-2.30-r0 do_package: Fatal QA errors found, failing task.

Showed up on the autobuilder too:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/981/steps/8/logs/step1b

Cheers,

Richard



