Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id A6CAE6023B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 15:14:56 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id if17so5043595vcb.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 08:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=s49lzHMVHV6ke/67i/PMkJv8kIBeNYxscugRbtLKjjw=;
	b=gYopKZowWjgH7Hy9sSCUXBs3siLZuysR0AHqEvX1f4YY5SEw3RxM7sQ8xYvy/v6+hL
	wlT9c6ULwS9/ht8eNAo1D2Ct0myd0AV8axzZxkrTKNgAW94hyxxdAHcwy8iJZ2tzFr+/
	wrHiLxVgUFcgG3AMvtb5FDdY9YNBTDcqO9jECHLh6jhVb5DnznSMWtTQnskNrHiP58Z6
	g5poukFznrEfRuM67ZTnL8T1JgtLatr7SXOQJKrQrmM5DIhd3z4a2U1y3/G9siIw/FWe
	Xd0Xf+75eAZlBbjVlaf/k8CkRVh3EDDxQakuK6y6bIXDYp5ZcmnijOiiiWEZQuUay8K3
	iqfw==
X-Received: by 10.220.164.70 with SMTP id d6mr16840843vcy.19.1379517297996;
	Wed, 18 Sep 2013 08:14:57 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.109.72 with HTTP; Wed, 18 Sep 2013 08:14:17 -0700 (PDT)
In-Reply-To: <521264DA.8010404@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<1376512209-11622-9-git-send-email-mark.hatle@windriver.com>
	<52125F35.10305@linux.intel.com> <521264DA.8010404@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 18 Sep 2013 16:14:17 +0100
X-Google-Sender-Auth: bdZA4hJFJH7GmF9R-V4MeNt6fuU
Message-ID: <CANyK_8cSzYGQHDCeCCz7HM5yWm=Uq_fkpyr6gbYMJXPxuQxy-Q@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] opkg: Add --no-install-recommends option.
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
X-List-Received-Date: Wed, 18 Sep 2013 15:14:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 19 August 2013 19:32, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 8/19/13 1:08 PM, Saul Wold wrote:
>>
>> On 08/14/2013 01:30 PM, Mark Hatle wrote:
>>> +Upstream-status: Pending
>>

I'm the new maintainer for opkg, I'd be happy to look at this patch
and any others if you could send them to opkg-devel@googlegroups.com
via git send-email. I like the idea of both '--no-install-recommends'
and '--add-exclude'.

I stumbled on these as I'm looking at upgrading the opkg recipe to use
the newly released opkg-0.2.0 rather than pulling from subversion.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

