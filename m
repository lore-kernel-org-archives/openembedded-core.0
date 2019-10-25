Return-Path: <twoerner@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4F61F7FAA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:22:44 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id p4so2454396qkf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 10:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=OqFTs9dfbiq4PLv3kzp6HmgSWU0dAzGEUEevhTdkZJI=;
	b=cdA/CCcvgTtLFKRfmTZXYj7NtgivjOsdRkfEig/9YyJz8e68vvdNUuRgQFdq5/U2kD
	RorkJt0+ItHvva0WOuHYZn6fasBB7QJETFWFr/3lmfcANvOgbs5BMIADnYF/h6X2V/9R
	WTY7wi/WjgS8ZRitZoqitkkvHm3nTw34GrbFfA05I8YbDGHabEJVyXUD173pDxuabT26
	Toekz5CSDSjXBSCdYAVKIKDkoeq3reB0m8WHAupa6PNLOEJ0EHzz2aACznD0tv5O/K61
	N2gcqujZAAjh/lcrTdvsBqvYpndvzzeIQhxQ24Wg++ItJoHRy9056AYjBg6oy3OSXv0T
	RnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OqFTs9dfbiq4PLv3kzp6HmgSWU0dAzGEUEevhTdkZJI=;
	b=sqzONq3vwaspD+y+Mahqdl3CVrzgDAUGJgTfSQxZheATWwPT+C79PklhBZZHqQD6rT
	/cFZGhK5xNOlPZvoD2BG5n0WxqDb5t0fm0GDFCDpV2rT9kR6p60EwC9t4QAU6lOOi51Y
	5J5y0fo/0A2YxcZ0vp8wlRuI5AlAF+g9jr0jCasAzxFBbeANubxeAryANeOkxRD4FO4Q
	FuAG1PtU0mMUg4yitGvFBqYko+DV+tUQQBLzG+ttgzjr//d/0agE+CNDHtk2BgnNcFEE
	+2Nh4C574m8K4oGf8Cj3pTqH+cZ7VFU8Q7IDgtAEz6eGWpqwfp8iyj2bM6YZ80UUm0fQ
	DZBg==
X-Gm-Message-State: APjAAAUUSDcbYov0o+1Btxpbc8HfKORmhZzeKOAhP/IoRhE3iPs9hk/a
	jYlKAgMmgazcXXxtfvEwIP4=
X-Google-Smtp-Source: APXvYqzmDxuP3DD+AMIAPd1rI3Wj+okPqR2blCZuD7qsfCsXiyrT44uusiOagDdRNl1tv2h9CmQFsQ==
X-Received: by 2002:a37:8244:: with SMTP id e65mr3788316qkd.233.1572024164922; 
	Fri, 25 Oct 2019 10:22:44 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	a15sm1282875qkn.134.2019.10.25.10.22.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2019 10:22:44 -0700 (PDT)
Date: Fri, 25 Oct 2019 13:22:41 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <20191025172241.GA25729@linux-uys3>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
	<20191025132204.GB19333@linux-uys3>
	<20191025134458.GA22739@linux-uys3>
	<1e316ec4-e809-b66d-7a6f-53b0cc6fd1d5@gmail.com>
	<20191025151610.GA12316@linux-uys3>
	<7e7622dd-84b5-6cb3-ba66-ee207f0b0f85@windriver.com>
MIME-Version: 1.0
In-Reply-To: <7e7622dd-84b5-6cb3-ba66-ee207f0b0f85@windriver.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Fri, 25 Oct 2019 17:22:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri 2019-10-25 @ 11:44:14 AM, Trevor Gamblin wrote:
> On 10/25/19 11:16 AM, Trevor Woerner wrote:
> > Does this break on hosts where it had previously worked?
> Doesn't affect my (successful) Fedora build. Would also be interested to
> know.

Okay, thanks for the report! :-)

