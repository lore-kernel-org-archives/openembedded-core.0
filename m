Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id B485677496
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 19:56:19 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id t8so27353936vke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 11:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3a/BndrRCE+MsgQpXbrBHGspAMLa06F29EmAmxqZDdc=;
	b=ewrV0RjScB63h2DAlHfMYwNxpeJKB+BIGTIHnvAbAQHX7nkJzBKKgDPMF0s+vYpnZX
	9Tf/PEuQQBVbF8bSzB2MXLLGFKU8DEEZkbYsAz4NYImPpwyO3qBPQaihdT5JApe23jwY
	NudmAqH/jUuOfRmg40YXTvO6rtog9lNC2zOFT4wFY9fN52BQh9MyfhfeYckUdnVDVIab
	GmOLuEWTEYHmUO2gwImhZbZHsYRbzLkWA8kWvP+mbXVKEmpXfiOUsYaMah/6kpXS+F4O
	7rmdrGlJDhImVSpjx70ecvnY3katKHNwGJl1IF3OsI+woXJP//zWYc+WvPQWxbyf4peo
	sgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3a/BndrRCE+MsgQpXbrBHGspAMLa06F29EmAmxqZDdc=;
	b=oJzyGTvLcLI5Fj062YJ7qckre+rVn9PLht5yyOcJzIIr4biJ7cVe8bsW/4GTM7tW9m
	cQWNrDskT1dXnE2QIwvpJ1u+ONqXpXEeVk/3TDPf6DQHhKdTsqmDmp/4mHD++WxSZv01
	RiW60JGp4OC05Lws0TWqv57xIUmaRXF18ReEd44HHThPwXt7F+x20mZuGEoq3mauXBNM
	Y7jDzlu7UxecS5AQOmUM7ZOoITrolO0sRTNNsXUidamGJpUNfUKUZIHFSy4Op8a9uJE0
	yrxFZyzGwBmmCBGAQVXljoN5I6yx/Qm/KVnAZPC6h6i+U2SKErKRt6Av4A5Ldcx3Ihew
	nvuw==
X-Gm-Message-State: AIkVDXLZv86Gb0wSHPxHjg/sY8832tvQhmnNDwQQ7r84sQ6Z2w5ykqyClmQ8ofYFD8oZlXSTHbA+mWuGvl8hrA==
X-Received: by 10.31.197.196 with SMTP id v187mr10952606vkf.84.1485806180134; 
	Mon, 30 Jan 2017 11:56:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 30 Jan 2017 11:55:49 -0800 (PST)
In-Reply-To: <20170130195317.GF15833@denix.org>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
	<ef36ec5c696cc690af21e560c82924e5dab51a1e.1484921498.git-series.patrick.ohly@intel.com>
	<1484924046.23233.126.camel@intel.com>
	<CAMKF1spnwmo4cLdnaA1p-fvscpYm2WQQM3vEkOeHqinpwvn-bQ@mail.gmail.com>
	<20170130195317.GF15833@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2017 11:55:49 -0800
Message-ID: <CAMKF1spbpp-hZ_8KvQ2UfTpRO5rNaDi7wsfPww-z1yko1VZ63g@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 02/12] acpica: work around flex 2.6.2 code generation issue
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
X-List-Received-Date: Mon, 30 Jan 2017 19:56:21 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 30, 2017 at 11:53 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sat, Jan 21, 2017 at 08:00:13PM -0800, Khem Raj wrote:
>> On Fri, Jan 20, 2017 at 6:54 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
>> > On Fri, 2017-01-20 at 15:12 +0100, Patrick Ohly wrote:
>> >> Without this patch, linking fails with a missing implementation of
>> >> yy_scan_string. This looks like a regression in flex, because 2.6.0 generated
>> >> different code that called PrParser_scan_string
>> >> resp. DtParser_scan_string.
>> >>
>> >> Working around that in acpica until this is better understood or fixed
>> >> in flex is the easiest solution for now.
>> >
>> > It turned out that flex 2.6.3 has a fix for the problem. But the github
>> > issue tracker for flex has several people who reported issues with 2.6.3
>> > (affecting gdb, binutils, grub) that we probably should wait a bit
>> > before trying to update to that release.
>>
>> I am seeing issues with qtwebkit as well.
>>
>> error: 'yyset_column' was not declared in
>>  this scope
>>
>> Similar errors for 'yyset_lineno' 'yylex' 'yylex_init_extra'
>> 'yyrestart' 'yylex_destroy'
>>
>> Haven't really dug into details but it seems to be caused by update to 2.6.2
>
> Having issues with flex 2.6.2 and doxygen as well. Supposed to be fixed in
> 2.6.3, but as mentioned above, that one breaks binutils, etc...
>
> Can we temporarily revert back to flex 2.6.0? It seems the update is breaking
> too many things, including numerous other layers, and the fix is not yet
> avaialble.
>

send a revert patch i would say

> --
> Denys

