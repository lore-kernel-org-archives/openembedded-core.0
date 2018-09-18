Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 177D47548B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 14:41:25 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id c12-v6so2221739otl.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HMsRm67jYnakq+Txq8o2i8dpo2LqzuAKDNkFdfgLrIY=;
	b=bIOhcr4xYKvzho8wN0Qs+rkiKnrZBlKOCcgNIcP2KfJcc/YAEFn8Q9HWy/XjcS2cJz
	pNcPkc+7l5BBMzZSciKP6fPKY99SL4gRXXkOube8+LRKKtVpkc1xYkkCvSd3bVlvSoZ0
	UAj46Q4oLrZ7KeuBgWOljibZnDcq4LF7h/8C8xM31YAS5lQmMo24VGW3rpABSuYtN0dR
	h85uQAApOD9is9P/hLOOL5IBKl1ih1eYwti4vq/CqJCSL6G1xTJzw3ohhetem8HIBSR7
	Zp73NLl6zZkGwtVJgpntZzEwKyrW/UFYnOuuVkN7Z+Qc4imyyiY4qCw3QJ2Q68hm+yaE
	CKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HMsRm67jYnakq+Txq8o2i8dpo2LqzuAKDNkFdfgLrIY=;
	b=m2ImiIlmq6rPM88xMQf9hGfHyglEuFueBCzFT07Av0+faub4DwT9otCgTnbZ9Yhvex
	XNBZ1sMMKwy//IdVRPkM83ujXutH2P0wO45GZz86uakf+EGClmyFuf29ui8nM8EA1gfr
	PBQbVTlesw7xa1wjtaQ/MzWGjIizHdY/C1DCw3BOH6NJU06NIGH1jvhE1BiCP23wcxEJ
	Cd18f7BWCkQh6zJmg7dwaMSaL28Lu65eVVXS1jyGWyxUgaXxX5uLr3fn3+cWxhvX2MEr
	mBJzkZRUwPUdE9bK8o9zIDrg2tu32xJAA+3GOC61CeR45k1dSpG+QEcNh3eeNqqKqs+b
	S4DQ==
X-Gm-Message-State: APzg51Ctp0uhZrKzPiTYHdy1YeRrLv/A4DDX8Ebhq/52fuwGVsYuw/MD
	y2O87yAq0EcwZ8VivKcow7+g/nX7JYcijrNV4gtF/g==
X-Google-Smtp-Source: ANB0VdavdCNzzGhM+Ztlza0hPrrmCI3Gdi6Sh9byLsSNqz+bkwUhuf6Ln51TNcyNG2SCGg0KtypJf11nf/JY+PmcV1Y=
X-Received: by 2002:a9d:514a:: with SMTP id
	u10-v6mr15281274oti.241.1537281686009; 
	Tue, 18 Sep 2018 07:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20180917184949.22961-1-sno@netbsd.org>
	<20180917190314.13844.30776@do.openembedded.org>
	<857A2B10-9583-4449-A252-29F4D3C29DA2@netbsd.org>
In-Reply-To: <857A2B10-9583-4449-A252-29F4D3C29DA2@netbsd.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Sep 2018 15:41:14 +0100
Message-ID: <CAJTo0LbHvcCCsqPrd2gU9oY4VbGtOF1870+v5Hzgc-jhkTpybA@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHB5dGhvbjN7LC1uYXRpdmV9OiB1cGRhdGUgdG8gMy43LjAgKHJldjMp?=
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
X-List-Received-Date: Tue, 18 Sep 2018 14:41:25 -0000
Content-Type: text/plain; charset="UTF-8"

In this case set the status to Pending.

Ross
On Tue, 18 Sep 2018 at 15:26, Jens Rehsack <sno@netbsd.org> wrote:
>
>
>
> Am 17.09.2018 um 21:03 schrieb Patchwork <patchwork@patchwork.openembedded.org>:
>
> == Series Details ==
>
> Series: python3{,-native}: update to 3.7.0 (rev3)
> Revision: 3
> URL   : https://patchwork.openembedded.org/series/13851/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format]
>  Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
>  Standard format  Upstream-Status: <Valid status>
>  Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
>
> I understand this policy. I have an issue wrt. this particular one.
> Why? Well - the patch seems to be reasonable submitted to upstream, since it's a
> quirk and likely an error. OTOH - supporting Yocto and OpenEmbedded in getting
> software up-to-date is one thing - having my name in the Python contributors is
> something complete different.
>
> Please find someone else doing that.
>
> Thanks in advance,
> Jens
> --
> Jens Rehsack - rehsack@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

