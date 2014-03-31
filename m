Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id C1D976E716
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 19:29:56 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id hl10so329045igb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 12:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8AE0VSQPkL3LgrxwE62dBAVFMZ7WdSjJ/7d0gLZz99I=;
	b=Njj9kcRUSvvb0mYPa2rpgWvFPf6CPzC6KKk13aJG9oW5jZnb3COQUq22mA5xv25pL8
	CBEKRS5d8AosA2jkpDCcK2iUcpHx6Eu08xg1f/4YYcjVQ/WJmFvYsgKcLmtCIsEvDz2T
	Kv8WjTUyudTN4olN5P0NW3Pw8StJUYvc2KPFjm02xs8bbaB4VErLHdcBvqwt1Hs71yLb
	hnA8pKuJUIh6fj9AM6BcdVY75gMbVqF+XPEaMp7lPJv07NFqHzxSuAkF9biHiFTM5p4b
	9P2EWre+vBs/23zCw4v1MIpcbsUbgidN6TFM1+NCIjczabqBKUXtsQiC/oL5/OtbZziz
	CTZA==
X-Received: by 10.42.20.6 with SMTP id e6mr33292117icb.29.1396294196788; Mon,
	31 Mar 2014 12:29:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Mon, 31 Mar 2014 12:29:26 -0700 (PDT)
In-Reply-To: <e6015802086cbf8199d112a3e75a7391a417ede6.1396288310.git.bruce.ashfield@windriver.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>
	<e6015802086cbf8199d112a3e75a7391a417ede6.1396288310.git.bruce.ashfield@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2014 12:29:26 -0700
Message-ID: <CAMKF1srOv27-6SwSfYxFLL0-BvHk7hxWBmn6twtY+hpQ9rTYww@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libc-headers: set TC default to 3.14
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
X-List-Received-Date: Mon, 31 Mar 2014 19:29:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 31, 2014 at 10:56 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
>
> -LINUXLIBCVERSION ?= "3.10"
> +LINUXLIBCVERSION ?= "3.14"

Does this  buy us much ? Infact its too late to change usespace APIs
at this point. 3.10 being LTS
I would assume its a better option to keep at 3.10

