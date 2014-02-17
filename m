Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 716FA6F08A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 11:23:39 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id k15so8283650qaq.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 03:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2dAs9OsgsMxeF+fXZ5Jq7pQlr26cXZVH8jMzfCgC698=;
	b=UtvMZAzE3qxHD939DHN+RJI6AZpDxZu2qW1KpR97BYVGiV3D44mxMPIZXwnwHrjgA5
	rGnpPWRFluxyNkrNJC20RVUpvrcKvI36l05lgwZtSoURr2/9DvmAQ6KyQgIBr7EP8CkA
	/FI5w9powQupwI0Fd2vaRDbTIKdEn1fSmTDcW2fcKjMjFOPInKqzpWHqo91JbE1yAHDi
	iNN6nhBAl5XO27PrVZuTu8ZUok3nn86fY1t73HEj8exgKwozF9wyKhxZjEFB+mbjpHLX
	u7LXCGpoH3eW6UUFZKh1msNSvgISNEJhNRnAQPh72q4Z1jYsFJUik1l7Opt88TO1iHmc
	Djdg==
X-Gm-Message-State: ALoCoQnW4bxCeXw4HFJUNQj6LC10RWd3AdfvZ7h2bWug1DpmUHpCdmYZk8Jga8MYKBfYoYSEstAz
X-Received: by 10.140.106.225 with SMTP id e88mr31405011qgf.66.1392636219663; 
	Mon, 17 Feb 2014 03:23:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 17 Feb 2014 03:23:19 -0800 (PST)
In-Reply-To: <20140216141351.GA21303@piout.net>
References: <1392482043-28060-1-git-send-email-alexandre.belloni@free-electrons.com>
	<1443af26500.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<20140216141351.GA21303@piout.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Feb 2014 11:23:19 +0000
Message-ID: <CAJTo0LaA4tVnh9aZ9F+i6Ti1zj9tCvN3BxRLEk8P_t6daUnVyA@mail.gmail.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] matchbox-keyboard: daemonize launch
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
X-List-Received-Date: Mon, 17 Feb 2014 11:23:40 -0000
Content-Type: text/plain; charset=UTF-8

On 16 February 2014 14:13, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
>> Also, why do you need another shell instance, out of curiosity. ISTM
>> that only wastes RAM..
>
> We create a shell and start in the background to wait for
> matchbox-desktop to start. This allows X continue to start and run the
> next Xsession scripts. And matchbox-desktop has to be the last started
> program si we don't have any other way. Anyway, once the
> matchbox-keyboard daemon starts, the shell will exit and not use ram
> anymore.

As matchbox-keyboard.sh is being sourced, I don't think we need to subshell.

Ross

