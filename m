Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id EA65F6B6D1;
	Mon,  3 Feb 2014 17:28:13 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id c10so4614740igq.0
	for <multiple recipients>; Mon, 03 Feb 2014 09:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hIRjMcAD7fBUTqP34UETUHaWnm8ntPOqwznpwDmNebU=;
	b=FxCXgXVcBlugvW/5Z3tJzGjreuUh7I2W8NVwoOgfID4FVMzPrJJ1fIwNHe7kOyfhnZ
	1CJ904TQ5B/xundJpUwjfqP8mTSzYYuWLyzepU4virla605UG2hWIDx3MyBGpk9h2wnh
	ayhsUUck4qfPAud7QRPFjWgukg7pp9Rbynkt3T8nv6WobfCbPr4t4B5kCyEzeRevQ42f
	gn/uM0H/ATEIsOzKTrwb5iWbGn2WTmuwaerhuUPt/ply+Cv0BOKi3GRJ6/Q0UL/hfImo
	Z00k5/FWZaS5nVC7VEPmVPM4u5Fe/g63YjENhsA3Ru9qAVzouZgFm8qiXh5n6e5xiz9K
	/w4w==
X-Received: by 10.43.182.74 with SMTP id pl10mr1296142icc.70.1391448494298;
	Mon, 03 Feb 2014 09:28:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Mon, 3 Feb 2014 09:27:44 -0800 (PST)
In-Reply-To: <20140203143127.GD3698@jama>
References: <20140202223258.8D272503AA@opal> <20140203143127.GD3698@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2014 09:27:44 -0800
Message-ID: <CAMKF1sqMOgxUa2P4JQVJpTT1NeGNE7tSL-UqfjcMdPMVnQFKxA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Khem Raj : binutils: Upgrade to 2.24
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
X-List-Received-Date: Mon, 03 Feb 2014 17:28:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 3, 2014 at 6:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi Khem,
>
> can you please check following QA warning:
>
> NOTE: recipe binutils-2.24-r0: task do_package: Started
> WARNING: QA Issue: binutils: Files/directories were installed but not shipped
>   /usr/bin/ld.bfd
>   /usr/bin/dwp
> NOTE: recipe binutils-2.24-r0: task do_package: Succeeded
>
> ld.bfd is there for very long time, but I think that dwp is new with
> 2.24
>

It seems you see these warnings when you have ld-is-gold in your
distro features right ?
since I don't see them normally. I have a patch here, can you test it
out and report back ?
I do not have gold setup here and it will be quicker in your setup to verify it

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/binutils-2.24&id=33dd773b4b701dff8184a346d532b11f1bd5d327

