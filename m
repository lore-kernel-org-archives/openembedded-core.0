Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id E89597F96A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 05:49:54 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id a13so682562ljm.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 21:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FbwdER94stXhgyyH/QDVcADZEVMAq95er9B6C7EpAP0=;
	b=Eo2BJpUJl2TkzKu1trGNlRLc1uz6hi2770Z0ZVziSClJ8dyqNjzEpOl9i73q9ErFUx
	0pNrFQpabZ3JNVbLFkWbrb2RrAkJ3G/PEAtXRwpcaDhgaS6Vl8+m2+yzR3V9+w68lZac
	sDkrh8Wjwf/fjO4igl4V+bTeymwyHeXnry58ye/lOxpiE6COsMiWWJbVZFf2isXQW5j1
	1zRIlu7voajJHZUTu1ZZk36Ob44y/5uAPF+Bqns4/wePxaBHBnC39LYtXXdAsqpm27ft
	ZloVEFlDNpRTEuIbhSsDpAV6MQ4R4lJ9rEn+D7HwfbScUK/0VJ0NEOPVceJDIX6uBg41
	AsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FbwdER94stXhgyyH/QDVcADZEVMAq95er9B6C7EpAP0=;
	b=fHNugWxuHKqxQ4cZ0OO70YUtJrSqE43jCXpHJZiwq50GJaAD+DKgXf0i/WExD/Evrb
	SE/AUUudf/vNBwcR1THgOjHwC1R/jCuQV3OtIdz2BdwD3xjHzlc1obwVTPouzg4vwMDc
	teiqurfEYuC5dZFlIcQIGJeDpd4ySxPNaUltHLoxTNPq76IzdBA+cTkIA0Y8Sit5xLqP
	xMikzH9C4Cuq318l5h1Lg0caw3uNvuPkyRI9tCq3tA/aDW5J33fe3IoJbGek4+z87Oe8
	zXi2VQQnQEloa4IboCGxcjYxtzoAKnWQ6UkS1m6bfwcjXDksVGWWDBnCFpiawnl9I48o
	xqjA==
X-Gm-Message-State: APjAAAVLLguKqf5FeOp9sCe71b6UwkrM7GicXovNAQMAX4AlIcu1antU
	3DTsWbC3NPY2r3p6834f779jSM4opky7dW79t1E=
X-Google-Smtp-Source: APXvYqy3w/DTfaxZdR1j8ABBKQFmCJP6qvPwYFVXC+FSS6NrjZZwdtPlSo1InKElNqLN2p2rsYEigos/Z33Ovh+JIcI=
X-Received: by 2002:a05:651c:30a:: with SMTP id
	a10mr347607ljp.101.1576648195520; 
	Tue, 17 Dec 2019 21:49:55 -0800 (PST)
MIME-Version: 1.0
References: <20191214180842.14879-1-alistair@alistair23.me>
	<a72aa388-a311-f680-3621-ada8350a9f16@intel.com>
	<CA+chaQeXWgqd+WMBBzuTfm_DSZUyWmcccVGLQOwYLPADnCTYQg@mail.gmail.com>
	<33e4bc34-336d-47e5-29d3-c0b72d58d967@intel.com>
In-Reply-To: <33e4bc34-336d-47e5-29d3-c0b72d58d967@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Dec 2019 21:49:26 -0800
Message-ID: <CAKmqyKP1E9eFnEEGARz+PTvrbyEa9KO3WFEn1gGuHSt9rfataw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 19.3.0
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
X-List-Received-Date: Wed, 18 Dec 2019 05:49:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 17, 2019 at 8:53 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 17/12/2019 16:26, Martin Jansa wrote:
> > Yes, see my reply in https://patches.openembedded.org/patch/165737/
>
> That's it!  I knew I'd seen it somewhere but couldn't remember where.
> Thanks Martin.

Thanks so much!

I think I have fixed all the issues, I'm just doing some builds to
double check. I'll send the patches when ready.

Alistair

>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

