Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD9078A9A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 12:09:57 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id z7so975201iti.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2018 04:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pHq3cMQ139D24pSTY7ryZo5ZdrSZcmchBWynKLyHp5o=;
	b=ByHNVLIp2UQ1A4h8tOCkZiFy0GMjLafc+IEkxIBIoPK7rmYkjmCH2ugplHocV9IkAi
	7zzfQETZou/CWt8QlOAxwfDYFOmpPAE6UTd3f8H+aZhfpuUGmcCfY3UlDK4MojnDOwF1
	FrSGoybMTieQ0V1c920IHA/so5oB5UT09k/U2LSOqFwoPOiSCKQ9tQNcBGee97uMeBOc
	NePJOxLfN4BGQPZUAVxI8ySOfwTJCm0/31PHTWtFnlFG8ipISX+kpilTh6P08CP1HtRC
	azfKINdQDRj85mX2gm07f3aiYQ2bDbGHQnzQQVg+iWNh26BreiUEvtoU5J7mM1/18+pi
	6JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pHq3cMQ139D24pSTY7ryZo5ZdrSZcmchBWynKLyHp5o=;
	b=Gig+iUVKWcSu+1so7JWjz+9Hdr6AOxZzjHEBJTyGurvaJ7clqDX9nMVD6X4JPJHDz9
	+siOgSOovGCWKpDh8XbzJW8aKN3xv4uPD4XQBGh0aEcABBgx3zIrLYiBUFwd7tSuuoae
	FUbCBk6x+zH0t8HwWORwrzypyHPoGR+RIDwB1MWKZVMFxNGzwXkV9Ca4uhDotayP4YNN
	cArjHFER4rkFVj43S4k6I7hdHYnppb1wjScTn2oWirIn/uXNhQLZ8o2W0ZuByzsmz3fh
	E13UzPVYtJr1Mfso4JIr5qNwsqYBUeDqxi+5HquY0g/AQ9UoVtUZ+RewZPXlPKbH4JhV
	/jWg==
X-Gm-Message-State: AA+aEWbAGvyGpRO2lkKlhfwQvXJwfHGPCkn44a1faDWT14vQfiZmMqmy
	gtD3Ib8XlGytW9lrWyJ0tXtm+Ysu32THZ2BvSwctnQ==
X-Google-Smtp-Source: AFSGD/VR4Up8JELZSJa8zoixaBGq7PgjxcCvfMHZ/6St5YcPue3fRrF1J4783haxazTWCMlKrgsgN1Vtc72kBy6Fm0I=
X-Received: by 2002:a24:c601:: with SMTP id j1mr12909648itg.130.1544098198613; 
	Thu, 06 Dec 2018 04:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20181206003355.18035-1-raj.khem@gmail.com>
In-Reply-To: <20181206003355.18035-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Dec 2018 12:09:47 +0000
Message-ID: <CAJTo0LaLiMd_JWeKxXS7xmvBLiFk4yavE5qSHWL6mLnu0037Hg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipeutils-test: Add missing LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 06 Dec 2018 12:09:57 -0000
Content-Type: text/plain; charset="UTF-8"

Might be easier to change the license to CLOSED, as that skips the
license QA entirely.

(arguably proprietary should do the same)

Ross

