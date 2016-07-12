Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 753D76067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 21:34:56 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id t190so10819772pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 14:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=6uq3goDsxGtpyMU0xXS8f5Az7gdGlGppz5nLCtFCt/M=;
	b=wbUlJEDF4ECE3Sdpc63d2gL8Hk1dqG1N1awC/4wf+eYef18tySZAa0K05ud0RcvTR0
	B4rmAKEAJ8NrhngOWf9JiJdM/rkZl6zd/fHkkohE16l6qn8UOFhQKDgEqfXkZyEz7AD1
	Ce+hsQyeU9wD4ZQXion8ulZvy/4gCr6HSzARL64XFYJCpO2PwmeXErAuEoryL6olzaHA
	iAJslsUyem6lf+6KmGq7sJG8o8HK2YUUt/WxP8hS/PkGmZpYi/MomT6inFI48ms57Sh9
	sm30KZKL0RnJ+D6TTsL5ePTo54o6TLZt//6oGE/OSmU+sryZl9eklck8NvI9b5e55x1N
	8IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=6uq3goDsxGtpyMU0xXS8f5Az7gdGlGppz5nLCtFCt/M=;
	b=MZ9h2P7NgXOvyDzgSoqIYV8/mBK+c4KTu/B9UchMh0iMlL3ltWYsEBmGD46aI1nojA
	5EXIeXkeJ6nWmNbYJ01N84ro1tvDdmQE60E3jtEvhmkRyL4tSg9kMVe2VJpmIZjalySB
	Sw5/h3guEQi7xtwly7i+5/L7vVkshWTlaMEVeLmlZrqFAOkxteKCkk8ZaWVvM3Ya7V0w
	+4gi7A6yfF7ZzOgXED/yLJ+sTAMBc3wooR6A3kZqpWlk5hlIQk+0C8GsaEdoitEWeAO/
	4QUxgdObDw3gRCth6dsgxYYkU6rc38sfZ8CNKhxrkRk9pEbdwW6KOyQFJ7sqUxRfbBFi
	k1nw==
X-Gm-Message-State: ALyK8tIW/RJPbp2Xfn1wqjqptAAUiAE1Ae1UD0e98g57/1Pf6hzKmp3P9x8BNJLkaWRuwA==
X-Received: by 10.98.27.200 with SMTP id b191mr23251290pfb.111.1468359295725; 
	Tue, 12 Jul 2016 14:34:55 -0700 (PDT)
Received: from [10.43.100.29] ([50.233.148.158])
	by smtp.googlemail.com with ESMTPSA id
	g189sm6375378pfc.46.2016.07.12.14.34.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 14:34:54 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <5784A2D0.9030902@mlbassoc.com>
	<CAJTo0LbByAsem7asRmieaeVvLHarr8D9zynCUncEqt0J2JvmfQ@mail.gmail.com>
	<57855DCA.1080807@gmail.com>
	<CAJTo0LbJfZSNr5U9G8rBLXfqWfjf3R7uSatEwuQFSA9SfWh+xQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5785627D.9080800@gmail.com>
Date: Tue, 12 Jul 2016 14:34:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbJfZSNr5U9G8rBLXfqWfjf3R7uSatEwuQFSA9SfWh+xQ@mail.gmail.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Future of GCC
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
X-List-Received-Date: Tue, 12 Jul 2016 21:34:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 07/12/2016 02:24 PM, Burton, Ross wrote:
> On 12 July 2016 at 22:14, akuster808 <akuster808@gmail.com> wrote:
> 
>>> Personally I was thinking that gcc 5.x and 6.x should stay in oe-core for
>>> this cycle, and then drop 5.x after the release.
>>
>>
>> Wouldn't that be dropped iff GCC 7.0 is release? or are you saying we
>> should only have one GCC version?
>>
> 
> Well, depends on the adoption and migration problems.  I don't think we
> should carry three versions,

I agree. 3 is too many.

 and ideally one, but two is acceptable to ease
> migration.

One makes Stable maintenance less costly in time.

- armin
> 


> Ross
> 

