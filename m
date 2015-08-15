Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6868572A78
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 16:18:34 +0000 (UTC)
Received: by igui7 with SMTP id i7so31208430igu.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 09:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aPVjijqnvHkwLOQ7qF2AswzIvp7OPZtiWyWtCwgmq18=;
	b=Z1Fl19J78wW/38OOnVN7HFB5JT2n96Tck1A7+Xdc6PInsiR1gRuPrUmtCYr4sAGWoy
	hJ/NzlkLgNDNNkMsDZs0T1QtMdsB8UkhWK++oX/bN3yaKYjmYPADUdlKsz4X3U8lrxZG
	qZ9MHrpSRX8kyAoWxNnaNgNja/K5oNP0LRf+EnuXjL5SHzexHjGXl4Rqb0NY23gs18/r
	Rm3oCYjZdUGUfXQJynJCl/Pz0CZwyb9/GTiTnP81tbBmbOu1Dlg9nLi1qWGlouvbOKhz
	lB7XlL6em1xbubQfxqjYZna+CyKCzSPPCi6WkILdm2jabGHaQ3H3DBcMaEytUlytR1r2
	Om2A==
X-Received: by 10.50.17.66 with SMTP id m2mr8887703igd.77.1439655513869; Sat,
	15 Aug 2015 09:18:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Sat, 15 Aug 2015 09:18:04 -0700 (PDT)
In-Reply-To: <CAJTo0LZGbRGdJtPjeoQQYRS1nC1-jg2OKVwOgxXU-qgpCeEB9w@mail.gmail.com>
References: <cover.1436178756.git.liezhi.yang@windriver.com>
	<3a571bfe258bda28dd34a61b2a6bf323a06ca911.1436178756.git.liezhi.yang@windriver.com>
	<CAJTo0LZYJEmmPsgiQc8R2whGkOH3vQdAXn9vwXz7W8nYA9KUyA@mail.gmail.com>
	<559E8C63.20002@windriver.com>
	<CAJTo0LZGbRGdJtPjeoQQYRS1nC1-jg2OKVwOgxXU-qgpCeEB9w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Aug 2015 09:18:04 -0700
Message-ID: <CAMKF1sov_BqMfA60UC2uu-CGh1hVmp88DzXNH0vfo5mH6bjYxw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc-target 5.1: fix for libcc1
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
X-List-Received-Date: Sat, 15 Aug 2015 16:18:39 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 9, 2015 at 8:07 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 9 July 2015 at 15:59, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> I put libcc1plugin.so into $libexecdir is because lto-plugin is there,
>> do you know more about why lto-plugin is in $libexecdir, please ?
>
>
> No, you'd have to look at the git history to see what the reason was.  I'm
> not convinced there'll be a good reason. :)

these plugins have external implications thats why they are where they are, see
https://sourceware.org/ml/gdb-patches/2014-12/msg00358.html

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

