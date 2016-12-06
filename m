Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 13FD471A5B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 14:48:01 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n21so381709644qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 06:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W1xtBSPEZeZ7dVRUdBZFqZLM8e3BvX2oXW3I4KjZGEY=;
	b=o5MJHM9bpXYpRCNejCR7qn2fEenx7gPwfXqKyNjyHFWXg7LP+eCqr0ne5ZkGq2zfZe
	GP6U/v7Q2RhZkjJQK0+rJmV3FQHMFFYYi6zLnTaSRiZ/ZAKkjHbykPNyXrZxuL3TM2ET
	ojWSx5fw69HfQ2xHA7GBNuA4d5Hovod/MAxKm8nYiiqpDYs/VQkqmNciVcxBFA3h8zPQ
	oS59GOt6mjxXi8I7K/0oWM2pAnDrjNRqEA4sthGt7dC8UubEscQDWlCEVy85K+TiA5uH
	FRBkRstxAhCEp3E/G//6rq2FmMHkQwjrDSMHiuPkR2MFCrIEhtJeNC9sLmp8KiuYHbnA
	jMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W1xtBSPEZeZ7dVRUdBZFqZLM8e3BvX2oXW3I4KjZGEY=;
	b=A6YmnDY6PqUTu6jxFtaJM48HwIgXz4XSSI7a0DUZt7K7dEPJa3djIQlbwnlQV2+Liz
	WvzLPR5xOGZ4gl8FlmP0V2WCYTAjvCKgwlqyEmxI9PUQQ/w1BxrJPPXTOBq3m0MCTfgN
	mgj6YbvR+5wNjuZVcvzVRvBDFEruQNYB2gQynE85qGfEj5iMO7+3D4VQ4jLBiQVqF7ww
	8TLf0t3Qk+htlZCJbLJpb1eIes0NZJV3dfPprZdAiMmt9KZhLlV1qsjC8RwnUqxlz4PW
	R9iu3rvPUhcB2dYtZoe3oPZZ+4v4mkfIUEKNf/8PITNsjEtdfwXQ8uRr3aYly//A5lLr
	j6BQ==
X-Gm-Message-State: AKaTC01FCWU93yvazUKIytamgBTsMcy4ikp1bwFNQW6KpzL+b8Wx032UWe9KY47vBEhBsMHVDgb3cykSevaTz/R6
X-Received: by 10.55.75.17 with SMTP id y17mr47137556qka.26.1481035683059;
	Tue, 06 Dec 2016 06:48:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 06:47:42 -0800 (PST)
In-Reply-To: <20161206144400.GB3255@jama>
References: <20161130154845.8882.9798@opal.openembedded.org>
	<20161130154913.0EEAE50166@opal.openembedded.org>
	<20161206134904.GA3255@jama> <20161206144400.GB3255@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 14:47:42 +0000
Message-ID: <CAJTo0LbaSgpFSthT55QFroQ8Uc51x4KpOUK8GZK-8=NCf8oE8Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 67/76: gnutls: update to 3.5.6
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
X-List-Received-Date: Tue, 06 Dec 2016 14:48:02 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8c9e4d40542fe7d50

--001a114a88c8c9e4d40542fe7d50
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 14:44, Martin Jansa <martin.jansa@gmail.com> wrote:

> Probably caused by nettle upgrade which no longer enables gmp with older
> gmp 4.2.1 used in non-GPLv3 builds.
>

I was going to say I don't see this.  Clearly we need to extend the
non-GPL3 testing.

As you can reproduce this, is there a simple fix?

Ross

--001a114a88c8c9e4d40542fe7d50
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 14:44, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2hq" class=
=3D"a3s aXjCH m158d497b5055ae40">Probably caused by nettle upgrade which no=
 longer enables gmp with older<br>
gmp 4.2.1 used in non-GPLv3 builds.<br></div></blockquote></div><br>I was g=
oing to say I don&#39;t see this.=C2=A0 Clearly we need to extend the non-G=
PL3 testing.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">As you can reproduce this, is there a simple fix?</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a88c8c9e4d40542fe7d50--
