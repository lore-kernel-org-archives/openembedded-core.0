Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7114872F62
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 21:18:00 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id 68so32642856uas.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 14:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qdTuh82uGRWG0M+x07VV7IRhSqd4Rxeq2TDNLtLMX1g=;
	b=vR/0sbFAB7b1sBDz9AItvx5AQPm97BMdKcVHGr8xkjOdtCZhkq9lvxXQDIiMc5pb97
	jKhsjrza75E55DJ4QrZlb86Gpbom4Fb4k7ZC+PFiZ0n5L8t3dQUByhyh8LJuibHpZb60
	zd7uhgpGmKXy/w803eNqaYCPAnoyxAMCcakYY5W61gLmRPG7/23bRa406I2oY+laf9Tl
	6olg0Qwvy2Sk4D7ttN/D/8ILIkl4jth97ohZlhHxf1EbdOc2AEYP6rYaa1fVQ8qzSvKL
	OEv0XfJgloSbQPuEmGuusZhTAY1Tz1if2g07y4Mfs+vDuk49jt0s2TjsmzHx9Lx3UBg2
	Ip9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qdTuh82uGRWG0M+x07VV7IRhSqd4Rxeq2TDNLtLMX1g=;
	b=Ab7hLP76Uk1FUatalheeii05MJBx/MiUOF5F20fFnnbn4yoDx22wgwA2GU1ILV2Pnr
	Tnhhc+sLXYCHtQou+33oscZA3WSh74D9AMQEM+kv0PNaHO3Cg0CPBGihu7cygxY9TwIp
	vmaw8B/Rt6b5lEySWNPC8c1PhpCgMDQWUMWkRBi89jFuP9yq0GVBKFFCFT5vBCviS903
	M6VIYqYVUa/qg9P1fIylhymawQOxFD9um5yDSvksXPaiEZ2/O9LYZMTAFZ+06i3Fh1Kd
	W0ZSQCj2dFvE7tPgPkCah+utYz9WyRDKsEn3o1qceXzyT9339lzj+BAZKIwlBtXIXqgh
	MpSQ==
X-Gm-Message-State: AODbwcBY0GiOiSc2RJ4qxwN/rCQ1jkRsBiRZDOjPyIpy1RLGvsQTTdqi
	ZxKHFQsVFMtNAs963zaUC1iDhKzU8EHT
X-Received: by 10.176.71.25 with SMTP id h25mr30055165uac.140.1497215881714;
	Sun, 11 Jun 2017 14:18:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.7.2 with HTTP; Sun, 11 Jun 2017 14:18:01 -0700 (PDT)
In-Reply-To: <20170611165425.GO28053@denix.org>
References: <20170611064757.5937-1-twoerner@gmail.com>
	<20170611070133.1039.98132@do.openembedded.org>
	<CAHUNapQpfSojDV5MjE6cewKK39YjQ4d6stbLswCRxhfkG7iBuQ@mail.gmail.com>
	<20170611165425.GO28053@denix.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sun, 11 Jun 2017 17:18:01 -0400
Message-ID: <CAHUNapTiiGRhNy1iVOFA6pcue3a6vyC_SC75nM7YEnUwsF3MoA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG1lc2EuaW5jOiBwb3RlbnRpYWxseSBlbmFibGUgdGV4dHVyZSBmbG9hdCBmb3IgZ2FsbGl1bQ==?=
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
X-List-Received-Date: Sun, 11 Jun 2017 21:18:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 11, 2017 at 12:54 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sun, Jun 11, 2017 at 03:09:39AM -0400, Trevor Woerner wrote:
>> On Sun, Jun 11, 2017 at 3:01 AM, Patchwork
>> <patchwork@patchwork.openembedded.org> wrote:
>> > * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence]
>> >   Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)
>>
>>
>> If I didn't write the patch, how am I responsible for its upstream status?
>
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

Ah ok, thanks :-)

