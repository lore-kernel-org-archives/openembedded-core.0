Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id A9C216E7D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 23:32:23 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id le5so6484789vcb.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Af+qj7Ot85+KDXJaX9wV7nzfPE2BWcoew6ssAkwa5Kc=;
	b=QuWuLcQlCZaMmYoSmYjIjTmPHQge6dvJxxNKkaSKAFwV62vNymcFsWPW+vv+0fhkCZ
	daJkv1r+e555y0BRfaaTZ0ScglXH6VJUGoYQ/rsArIDd2meZE0QclqDS3M5CcHaQiTzE
	7sF+zdjuA+eWldphutz4Ptvi3diDW5cB7PmT8IFsvqAzUcaP5K2txAvUpkfMwXRjncTI
	pzodNwUK9RV2QnQ/4G0uLn74i7lYI/Deo46fyBgavCESWSYe1GKOj1jPFBhmzHWJTjg/
	dbPTsjLlTlKaJkHOImFQs2XRPGDDLNVrROX06pk/QFkWvONR71s0yM7nBhbASWVFRZ+S
	862A==
X-Received: by 10.220.188.10 with SMTP id cy10mr14567566vcb.36.1393284743904; 
	Mon, 24 Feb 2014 15:32:23 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Mon, 24 Feb 2014 15:31:43 -0800 (PST)
In-Reply-To: <1393282885.31769.18.camel@ted>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
	<52C0CDD6.4030904@windriver.com> <5014991.yOqVctVWSl@helios>
	<19353110.0dHagEzKPJ@peggleto-mobl5.ger.corp.intel.com>
	<1393261200.31769.17.camel@ted> <1393282885.31769.18.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 24 Feb 2014 23:31:43 +0000
X-Google-Sender-Auth: fJ9gAS8pCBM0BJkdFp5lUI6u-Jw
Message-ID: <CANyK_8d5OyuDZeumHU_rLS3qF6VWRYJLuTzs-5AhQSxUzKutYQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Saul Wold <saul.wold@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/38] *-basic: rename to *-standardlinux
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
X-List-Received-Date: Mon, 24 Feb 2014 23:32:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 24 February 2014 23:01, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I think I'm starting to lean to simply "cmdline"...
>

Speaking as a user of OpenEmbedded for about a year or so now: I've
never looked at core-image-basic, had no idea what it contained. I
assumed wrongly that -basic was smaller than -minimal (possibly due to
confusion with base). If I was looking for "an image with all the
common/basic command line tools" I probably wouldn't have looked at
core-image-basic due to my wrong assumption.

core-image-cmdline would, to me, be a lot clearer. Given no further
info I'd probably interpret that as "something with a usable command
line interface". I'd also probably assume it was larger and had more
features than -minimal. I say probably as having read this discussion
I now know what -cmdline would mean, but I think it would have been
clearer to me.

Hope this helps,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

