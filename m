Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC6674765
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 19:23:46 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 14-v6so13011472oie.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UnjAPikb8alAklHlF/cxx0olIdVB39hwRvThlIZxSJM=;
	b=1HKwUJgJoinKACugqzMueveKflQUJk55XlSIUDiBTC4s9BQQdr3EyZnxxl4oxL2zb8
	F7kc16HoezvHInjdmiHFB3TTf/L9y98dZn4ajI0vIZxhtlDOv/HRpDoTVZhjbBNswZ25
	3Ctjd8GQB38A3Om9BmhaLKfPkepZPBaHXkcLiljF/yrgxwHyyjuSfyUr5dIhC6Mag5Xe
	4k7TvL1OQkhQa3Co7Tm0dHK2L+K7UiQnydGHWgD2lLauZ5GlvxvQdXXvGfrn336WXg2g
	FShTJ3rAo6Fs311SKO4Pt4Fa6W9aqT955Tsjc/hZGg4ThOy2pOeXzu8I9QxdOgWiBqlp
	aLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UnjAPikb8alAklHlF/cxx0olIdVB39hwRvThlIZxSJM=;
	b=LtwFsz5js5aXfEOsjf4IjS76kAwQYCnJvTLlSRR3Ra/dXzWik1My1hu6o0j6UnyC2k
	PoUUxeefMcRa5CyeJzQdeLpL8W/abc24NigI0ornEwwSKDssFF6jyiqIWCSqS3T6eSqO
	HsWjPB/j0qj9iaX0J2u0RagPrtvigFurz02xGe2pkOqxz3qRebsCsmXCdP+m/bCE7Gzf
	DQSNU/0OWnQNBGFDHpMZpopa9nadtyiffLN8OTG9Fqo3Rz+GdZcifOntEcG+t4+VA0ql
	Xjy20OOnoJm2+wtq/HAhMtk7SNgE3fyDxkAcuuFTaibl+sLlS2AkKjMnZThuH93+zzKz
	FLRQ==
X-Gm-Message-State: APt69E2jIEXrjhzNTW/iFthvRfBRx3Hjw4zHCk0SR4+NL8j3tQfNFnBK
	tYV4lkPPC8/5gqXLy4pLhqChT73Tki2NlpI7aQnQJA==
X-Google-Smtp-Source: ADUXVKLh0FQX1HuOUVnYj83Tan2MAOS7PdYEj5XGrnrhUfpil/JoBYPvGYaIcwHyvH2rl6x40BMSXDo1ho4v2lWuKsw=
X-Received: by 2002:aca:5406:: with SMTP id
	i6-v6mr5791725oib.115.1529263427710; 
	Sun, 17 Jun 2018 12:23:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Sun, 17 Jun 2018 12:23:27
	-0700 (PDT)
In-Reply-To: <793e32c5-c468-0df7-8c9c-6da7174fe857@gmail.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
	<1526696034-3857-6-git-send-email-akuster@mvista.com>
	<CAJTo0LbV4mAKK1drQ-LcgsrL8JC_MmYrqhYmM1QPGhJRSx+cPw@mail.gmail.com>
	<62741663-6b5c-c4d3-6376-2e5ffe8e197c@gmail.com>
	<108ea3e8-8aef-7bec-ca9c-cda47772a1fe@gmail.com>
	<CAJTo0LYxERWufiGVoMnq8V+B0r3WaK46GCtTmgQFaPYRLibPMg@mail.gmail.com>
	<793e32c5-c468-0df7-8c9c-6da7174fe857@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 17 Jun 2018 20:23:27 +0100
Message-ID: <CAJTo0LYaeQJNhBSsRJKo4F-MWOt9EohTb8SsqDSaNBi-+bt0bA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] xserver-xorg: upgrade 1.19.6 -> 1.20.0
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
X-List-Received-Date: Sun, 17 Jun 2018 19:23:46 -0000
Content-Type: text/plain; charset="UTF-8"

I've already got patches for -intel in mut (pretty sure I sent them to
the list, if I didn't then I shall tomorrow).  Personally I think for
omap and omapfb, we just remove them.  I've got patches for that too,
I'll sent them aswell.

Ross

On 17 June 2018 at 20:14, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 06/13/2018 09:34 AM, Burton, Ross wrote:
>> On 1 June 2018 at 16:15, akuster808 <akuster808@gmail.com> wrote:
>>>
>>> On 05/28/2018 07:25 AM, akuster808 wrote:
>>>> On 05/23/2018 04:01 AM, Burton, Ross wrote:
>>>>> This is breaking a number of other bits of X:
>>>>>
>>>>> - xf86-video-intel (was DRI1 removed or disabled in 1.20?)
>>> DRI 1 is still there.
>> https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=359477215092ac1b602ad1e2f17a28963d9224c2
>> claims otherwise.  Trivial enough to disable in our recipe, I'll send
>> a patch shortly.
>
> xf86-video-intel fails without the update so this is a preexisting condition.  I used the latest git hash with includes that fix and it still fails.
>
> I poke at it some more.
> Armin
>
>> Ross
>

