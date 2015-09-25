Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA1F76E04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 18:12:06 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so14903496igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 11:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=cQudfFp5rzObdY8WDBEkfqNcq85p9+l9TxaEMHx1cYA=;
	b=YIU/9fm98Y631ndhypbgujhrydAMK+QxIpbVd5kyeK4xAkvXfOZCAEBD4f6GfYhwn5
	W6QHUqDyVspRGExxRmVcU7CmhT8Op4pldzy5vlfcUrZFL+f38qzQMX1INihE7qnZa4Mx
	etqAL7D+rfMzezk2gJSnnfyr4nP9Cw8L93s/q1APPn7bPCa4UYpuIV1SnqIKFHIeABZz
	jQ2poM0HZXZqb1xJ9MvDpPE6cbkC3gHiSK8vhE92zLavehOk8I1rn0He8qSG5r77DBBK
	90iEE+aVKz7wEbmbOCmqgEz7PTtxzGGnrAbQDmifdkf/ZGw1diIYNZvDkB9W48hc1N3x
	oUMA==
X-Gm-Message-State: ALoCoQlJ9Tzs3jkqQu4wfe4dBUAiJdapgjS79AqhQwnpHGz23LiCb5ueDsZ7+EDIObG/MpFcRspE
X-Received: by 10.50.62.81 with SMTP id w17mr4567679igr.0.1443204726488;
	Fri, 25 Sep 2015 11:12:06 -0700 (PDT)
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com.
	[209.85.223.172]) by smtp.gmail.com with ESMTPSA id
	n14sm2086064ioi.15.2015.09.25.11.12.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Sep 2015 11:12:05 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioii196 with SMTP id i196so119646410ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 11:12:05 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.7.225 with SMTP id g94mr8349197ioi.28.1443204725178;
	Fri, 25 Sep 2015 11:12:05 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 25 Sep 2015 11:12:05 -0700 (PDT)
In-Reply-To: <1443130818.19044.104.camel@linuxfoundation.org>
References: <1443047565.19044.44.camel@linuxfoundation.org>
	<CAP9ODKrBa6oiFm2Fj1XxtH5m2gx=6nSg4OhEs+s_KjgvAgFaFg@mail.gmail.com>
	<1443130818.19044.104.camel@linuxfoundation.org>
Date: Fri, 25 Sep 2015 15:12:05 -0300
Message-ID: <CAP9ODKoffgJTeV3_RY+P1sx4qnceC9aqNe-PV__HVQ5e4WrFMg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: Avoid rebuild failures
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
X-List-Received-Date: Fri, 25 Sep 2015 18:12:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 24, 2015 at 6:40 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2015-09-24 at 08:27 -0300, Otavio Salvador wrote:
>> Thanks for hunting this bug, this was very annoying and hard to
>> figure. It does seem to address the issue in our builder.
>
> Sadly, whilst I merged it and it does fix that problem, I suspect this
> causes:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/497/steps/BuildImages/logs/stdio

It does seem to be related. But why it did not include the .so files
in the sysroot again when resolving the dependencies?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

