Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA326139B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 15:49:11 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id a5so3278632wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 07:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=S7w0K/rsQ8oPsQTLGz5gh4XFPrK6sEzz3vforZoKLOM=;
	b=dTFr0C3c1bHlHOma5SCXU6nOhkf6iDia+ZbddC49tl8DXCmmYJMjEzIocIPSV5ai8/
	Cq+Cpc3w4jc621gRVrZf0gBd4Ll9aeM8hqi2Wzm51vfKrN7muqcqbX1m19CEad2vIEwl
	fVKrYgYnTcPniycfFaxjwZZZtsHG7xRpmLqE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=S7w0K/rsQ8oPsQTLGz5gh4XFPrK6sEzz3vforZoKLOM=;
	b=BAB+hV09zHuDHb4cfK/r6EnZC9UqAkik8Oq+S0j3pxPYp1YamC8xEOGm8HlyoKv9sf
	8zo+an7pKK1MNoYPj+MX1spJUvu1EPJzhH4L54U33iQH2lE/vlttUi8QM3jh9sEHY6fV
	h76Z1SxbTh1OpndTeINPhHBQmiH2pCgJp6+yg1knkUNONrlWA4LE2pZdEEIgerl40Uxu
	u6126CN2ttGqXhzbVixS80ovMarDMDuwahLlwzPb+tlv+sQ/YMQE/pytCKlcMrS4xHYq
	uZ3+vzy94JY0JPZvpW7K5xS/xYSpuTWkmRb8AooBghUsjhx3qdA01D6M5SsWT/TiOLSO
	Hpmg==
X-Gm-Message-State: APjAAAXpzqnqgBU1FWw2NYDFlTZWlyU5obr26UkGb4hFjPSqsfbUcWI9
	uwDda6LVQ9iJCodylPLmOc7Lzw==
X-Google-Smtp-Source: APXvYqyM8wB2WHK1ARX0Oxe9B/aAYheSUq0xCqNQ7l1PX+PsWixWeNgMywgCNLWYFdIBGuL+JDp90w==
X-Received: by 2002:a7b:c218:: with SMTP id x24mr3617083wmi.149.1582040952774; 
	Tue, 18 Feb 2020 07:49:12 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d22sm3738544wmd.39.2020.02.18.07.49.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 07:49:11 -0800 (PST)
Message-ID: <de449babe3c4352a19928a05b569e7ca09cd89a1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, "chet.ramey@case.edu"
	<chet.ramey@case.edu>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "De.Huo@windriver.com"
	<De.Huo@windriver.com>, "preid@electromag.com.au"
	<preid@electromag.com.au>, "akuster808@gmail.com" <akuster808@gmail.com>
Date: Tue, 18 Feb 2020 15:49:10 +0000
In-Reply-To: <41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
	<444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
	<99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
	<9b99752af2094590137fdaacf6668f170b34158c.camel@linuxfoundation.org>
	<41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: bash: Fix CVE-2019-18276
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
X-List-Received-Date: Tue, 18 Feb 2020 15:49:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-18 at 15:43 +0000, Mittal, Anuj wrote:
> On Tue, 2020-02-18 at 15:35 +0000, Richard Purdie wrote:
> > On Tue, 2020-02-18 at 10:28 -0500, Chet Ramey wrote:
> > > On 2/17/20 9:46 PM, Huo, De wrote:
> > > >  I applied the patch to fix CVE defect CVE-2019-18276.
> > > 
> > > That's not exactly an answer to the question of who produced the
> > > patch.
> > > If that patch is the one causing failures when it's applied,
> > > doesn't it
> > > make sense to go back to the person who produced it and ask them
> > > to
> > > update it if necessary?
> > 
> > Its likely a general CVE patch where both configure and
> > configure.ac
> > are patched. For OE, we can drop the configure part since we
> > reautoconf
> > the code. Its therefore the OE port of the patch which is likely at
> > fault.
> > 
> > Someone just needs to remove that section of the patch.
> 
> There are other issues with this patch which should also be fixed I
> think. It has been marked as a Backport while it is not one. The
> patch
> includes changes that are irrelevant to the CVE. And, it should have
> gone to master first.

I shall await guidance from you/Armin then.

Cheers,

Richard


