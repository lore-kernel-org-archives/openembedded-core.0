Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 018D376D6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 15:15:34 +0000 (UTC)
Received: by qkct7 with SMTP id t7so858438qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 08:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QyHR/7Qws5e80BUIy+psEE9U2c7fH2Ct5RoLHd1z+1c=;
	b=VacCeDb+Zanjf3hQRO5sIzblBwyy/Zf2wDkGNYe5TgwJhoTmwDR9iCnXFZo7IsoDDk
	5wF6jxy3ZEp4Nh8LIw+LwbZqzaeDuYKoTJW2etPE9W22ECmjnaB/W+0PRlVfCFeg9UI7
	U2HiKMM+oscu6RimpUcEeWYFpCj2vqwbLtQi6qtYLOUJJQGoiZYmCQ49/U7QH3JknrWn
	pZYzLxZS0Xl5AkJ60e6HNvnNfTXj1Q5b9iFaf7KUGQjnkjVUhK8dvlvdl4kMkS2l591Y
	tOlFKAYExRneT7V/YZF4Il6WCKmiADQUMDq7AEz6MzoeW2gxdX+LIYBgwF7Q4jTTSZuu
	FRnQ==
X-Gm-Message-State: ALoCoQmfi1XiT2cGX3M7NsNEBFs5eeug6hWYuvi6vhJ8ai+eZpqujRsSXOQkVs+sCHQHLqCnIn1r
X-Received: by 10.55.195.66 with SMTP id a63mr9727967qkj.67.1441034134518;
	Mon, 31 Aug 2015 08:15:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.9 with HTTP; Mon, 31 Aug 2015 08:15:15 -0700 (PDT)
In-Reply-To: <CADwFkYfJn7SAhQMqpgz4NQW5V0PZi4z2_RONydy7ZN54frZ9pQ@mail.gmail.com>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
	<1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LYdwRnzLUr9egN1JSj+G8iWKmeaTyghh4amBXcBs0-Uhg@mail.gmail.com>
	<1440851805.32588.9.camel@linuxfoundation.org>
	<CAP71Wjy_i=DQOtJUL=NVbfK6jXgO8=+CYsG7LU2fATM=UX=TLQ@mail.gmail.com>
	<CAP9ODKpznObiFaXkxOPmRBA9vfpmeoz2620sSwjUbmevX2cEPQ@mail.gmail.com>
	<CAP71Wjwg3g-rv4H1u7F=owP8XW5B6QOLyeF2TTsP1a2dCHsGBw@mail.gmail.com>
	<CADwFkYfJn7SAhQMqpgz4NQW5V0PZi4z2_RONydy7ZN54frZ9pQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 31 Aug 2015 17:15:15 +0200
Message-ID: <CAP71Wjwm8SYUY1NqwOwom_4EYf9B=8pSDQwKFzdoaR-yXWB5UQ@mail.gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] android-tools: import android-tools from meta-smartphone into oe-core
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
X-List-Received-Date: Mon, 31 Aug 2015 15:15:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 5:07 PM, Yi Qingliang <niqingliang2003@gmail.com> wrote:
> can we compile android system using oe?
> the Makefile system of android is too complicated to load/use.

I believe this is fairly off topic. I am not trying to rebuild Android
here. Just trying to load a regular OE image on devices that typically
run Android.

