Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 27B676D86B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 16:29:11 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id c14so9014809vea.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2013 08:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3DNfMLQJucYwUsZG6ewYU6/RpFJKNr8+nmpkbrmJptM=;
	b=gn/TvkC22/EbfgXRdvCeP3kGwRxQlK8EHPlXfhDaLwI6nFLwnxGShw0oBQ0DKwjIXB
	CbQcE7kpfD1NFz8fr1NydNw/4yi98r1/oCz/k+z87o2/mtk+iLciLb3wWW/Jad91E8iv
	T4ASmfF9p9/X9NBC8XAU5CwL1qpxEriWSxGYQ5csvtT2Uhtwoes5Zj9IO7mYylUcKX4E
	3g/7JZNdp23/xiva8T1hVxXEwlriVxMqpSpeOa0CSAo196uZrRDpZgBVKM+w0l1JeOtL
	pFzAwk3D5xMwiUjqsyNKAxGboajvx8qOCEk+my+6n9ofR38QNGQf4+Hn46RBIF3Aheii
	TbUA==
X-Gm-Message-State: ALoCoQlzAggbeeRUbV7xt2OMPvyHqk73TUtU0OgfH/qB+wTFp3wU0/9xroS2SAGxQ+jyyjl4q5a3
X-Received: by 10.58.133.104 with SMTP id pb8mr97932veb.73.1386001750553; Mon,
	02 Dec 2013 08:29:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 2 Dec 2013 08:28:50 -0800 (PST)
In-Reply-To: <1471026.rDxeBhQvgN@helios>
References: <1471026.rDxeBhQvgN@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Dec 2013 16:28:50 +0000
Message-ID: <CAJTo0LY3zfxRpoZ1pxXYj4NPu7m1Mdz1M1uZYVHPsjqYwWjyTQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: external toolchain recipes in OE-Core
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
X-List-Received-Date: Mon, 02 Dec 2013 16:29:11 -0000
Content-Type: text/plain; charset=UTF-8

On 2 December 2013 16:18, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> B) Remove it and just point to meta-sourcery as a maintained and working
> example of how to write an external toolchain recipe

This seems like the easiest option that will continue to work in the
long-term.  As toolchains are all different a less concrete example
doesn't seem very useful as it will be too abstract to be tested.

Ross

