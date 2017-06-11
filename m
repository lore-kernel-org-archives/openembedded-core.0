Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 657BD60762
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 07:09:38 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id q15so46691862uaa.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 00:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=18Qotn9FcBFJB03pEXddrlN95Gw7FEFJhikq/z5Z0jw=;
	b=QsHPWMgob98Y/lnrfy2lNmeL0ju+IpxfDWVy/UWxNLunWYcuMDWkkJPOuoyd39IQXq
	n2WHOJsVEKU0NMiCvmeMuGSWFloeB4twZnA2MRzSHVHF2OTLMwWY2z84FZGCXvzuDkd0
	umqvphCQJMec0PzIFFhWRC8gsA5ff3LymBrLvE+3+RNjqWthEjMRWhmjUez8cP7fJmcD
	yd5lxuYCJucEhg0ACHVaQk/MtE0JyG+VveAUfIpwog46vltqr/vBXaRFHUIpoBc8ib1l
	kDjtLAsU464uGdzytI1jhB2t/HqXa6ydVN3cIYyQxjfmOjMNrJFzZyuLLleXk/zjIsQY
	PPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=18Qotn9FcBFJB03pEXddrlN95Gw7FEFJhikq/z5Z0jw=;
	b=FHkqR5ZVA8dVJas2DvpWc0clPtNOmWD7HhdmrnkpR7wVWrvE/L+PvifcQqgXmAtTnL
	6PQ9kkMI5OSe4T2QaGY4rKEdZhk6xutUiWy3IOkPBovqHzkiQFqs56KLFOHyNkjdftgi
	BEtRWTTYVU7W8q+5OV5wx2gxG0NQILx3LLmz2Nq1bpUcDSSdJm8DMwmxB1bMdtxwyhY5
	dIVwWdZb3ObVM4/hza0wsz/imw6G8W4Wyu4ZrUMYUYLh7IIjfHSCgd6xWGEQUSmEGy/l
	uLcUHgUGWsliMht1XnvHcFm2YNd6k3ZPstaHe0ut3tcbBWhYLbdg1pbllQ8Jc+pTqzDk
	yDgg==
X-Gm-Message-State: AODbwcA7dpN4hMClJQsnz6DO95FuSyMBYsLCnPiKqDyvk045Nv9Uex6T
	f2E6iHI+vmmiebhgsq/bENSdLmBbUSal
X-Received: by 10.159.57.99 with SMTP id i35mr29435121uag.17.1497164980010;
	Sun, 11 Jun 2017 00:09:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.7.2 with HTTP; Sun, 11 Jun 2017 00:09:39 -0700 (PDT)
In-Reply-To: <20170611070133.1039.98132@do.openembedded.org>
References: <20170611064757.5937-1-twoerner@gmail.com>
	<20170611070133.1039.98132@do.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sun, 11 Jun 2017 03:09:39 -0400
Message-ID: <CAHUNapQpfSojDV5MjE6cewKK39YjQ4d6stbLswCRxhfkG7iBuQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sun, 11 Jun 2017 07:09:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 11, 2017 at 3:01 AM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence]
>   Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)


If I didn't write the patch, how am I responsible for its upstream status?

