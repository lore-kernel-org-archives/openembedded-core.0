Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9183561CBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 13:40:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s5so12195748wrg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=/64e5dUX88PuILYgrCMCBI6fCpKUMeWVbCqje/vPA9M=;
	b=FbO+6XdiHT9mEO3XzpqiYFggLLqHTU64+nrad77/uCfj73sosHLCacED2FhDwN0WoX
	r9B4JMFy88SG3hEfgKkXyMhMhm0yDT5+to9uG7Iw0Gv2dVYNIGmOA/DVtKto/SQBbsiK
	N0e3dceIq+Hhz5+qbtOnvelmxp9RjTDlgZU9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/64e5dUX88PuILYgrCMCBI6fCpKUMeWVbCqje/vPA9M=;
	b=AJEpzS7DDTCLolq2CVIDdwJ98jHzW0Tg3id4OTPVJkbOnnq+SowpQyjHBPpQHd5sPO
	Rakjgcz6en4rCI7vnx3LPLFP55cm9FV0XFjRJLg7Cf2XhhMVA5M+zKxu4OwCi7AB/Phs
	E9KuugHsz6e7Q2lJWYzYv9iUjv3z/pI7nHE8c7bJ3b5zmKwzNQbv71hqtUKEY8DiHd5u
	q7B7kwTD+DVXSZh6484q4JRMFCezjC4BFdrq/knhThhMwDpK+DLcbnuFRu0xCGCbQYfG
	8qK65V9Rs99NWPDYCtNH1oHq/MqhfR2/h4tHVzgLMvUq/ZtGqY7wSO7/kK6pz8r0RAhh
	VI2w==
X-Gm-Message-State: ANhLgQ2+8a9KnnpqpsNCnFoG9j2jOw5SdtNs4VvGQmyCzHXHhR5NzFF7
	FAC8MSa/HtWJCjG0oousNCtFz3hza/w=
X-Google-Smtp-Source: ADFU+vvXvbBZ3Y2cUIgtjtGCwLu+XDjEBHSDvlx3b6QaiSFJRX6R7Zrb1L7qLEsW/Uh7OQYDwUsbjA==
X-Received: by 2002:a5d:4dc7:: with SMTP id f7mr17355499wru.72.1584106838201; 
	Fri, 13 Mar 2020 06:40:38 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v14sm43551447wrr.34.2020.03.13.06.40.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Mar 2020 06:40:37 -0700 (PDT)
Message-ID: <280c60ac662ccfe0388f43718309aca1cf03a87f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>, 
	mingli.yu@windriver.com
Date: Fri, 13 Mar 2020 13:40:36 +0000
In-Reply-To: <20200312143304.GC30953@joraj-alpa>
References: <1583934573-94011-1-git-send-email-mingli.yu@windriver.com>
	<20200312143304.GC30953@joraj-alpa>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] babeltrace2: initialize the other_entry pointer
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
X-List-Received-Date: Fri, 13 Mar 2020 13:40:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-12 at 10:33 -0400, Jonathan Rajotte-Julien wrote:
> Hi Mingli,
> 
> Thanks for also posting this on the lttng-dev mailing list. I'm sure
> we can get
> this in fairly quickly upstream.
> 
> This is more a question for Richard and other core members of oe, is
> this kind of patch pertinent for upstream oe considering it is only
> silencing a warning (based on [1])?
> 
> [1]  
> https://lists.lttng.org/pipermail/lttng-dev/2020-March/029550.html

I took it based on the fact it was submitted upstream and I thought it
was fixing some kind potential data init issue. If it is just a
compiler warning then my opinion of it at this point in the release
cycle would be quite different. It does show the importance of commit
descriptions.

It was tested and merged so I'll leave it but you make some good
points.

Cheers,

Richard


