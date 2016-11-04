Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id D9FDB71B59
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 20:29:29 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id p16so55434404qta.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 13:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dCvcBCjxsFkvosHMZfcL/LVA8E2bCZ21pHNgIoPn168=;
	b=iuBSPvQmbS+Cz1nYb23Vv68WfSHqVObM1fiYCuMQ2XD/UIFL9Yva/iWXo59+TXb+gn
	CYuJIGHRepcbCBucm3MCJy37NGiS9h0OTDApMjtQwJZeKKDCVj7h3AyMu5Tf1kZ+X3s6
	BZPhTij/AMplKWDrEgZnxJNGt7ITzGN/j5NHE5QNn9ZYCHSFfmLQqjIse2qT6XQBH3zV
	EFSdBCbwRll09tiJCJo/LQfljy9QTRdKIsHhz3B2Nff6oKCn18ZK2MqB9Sf/5Q4EH3ik
	xBWg2pxaBxgAUwVyLbtt2ZJHbhJeDH4d6ksC8bbY8AsNFtlDjp3xGkMzefJnRbLYWzvk
	Vdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dCvcBCjxsFkvosHMZfcL/LVA8E2bCZ21pHNgIoPn168=;
	b=aRIgFl8QL90VYvqyqkWJqXaWYJJFPEsv/HWia64KAN6X0bICThDGk3GHWggRjhnFad
	m3zC26NkjCDUZBEJThpwu4jdyjPv6SVj0rrzT1+rLM9GX5VNiXCaELxFe8J/k4RhcTZB
	DaP/BlVN7WzEWQ2IYfsp+2lPL0/wm3RjuQDn9BQkd/nNn0NtGqHIg5fBtDPpZGwZ/dOf
	/Civ/G+RZIVdepoUrqIQnZA9M7azKMFBvtobEKe3zISRRgKs+jaNKgIY4GkzVIeMR7n2
	Dl4wkahBxCQPFw9l0pQR6648g5peoI2gpu6DTQjiAa6UZjBptpQJofY3EzI3I1aNhhQI
	4eNw==
X-Gm-Message-State: ABUngvc+brbf8vSp3nWOQVrDcSUKNPfKF3HGmf5ULMKRkfDQpkr5feVas/HYFfPgFot5hHIhDWnhURc0ctxBof2O
X-Received: by 10.237.33.212 with SMTP id m20mr14639677qtc.130.1478291370689; 
	Fri, 04 Nov 2016 13:29:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Fri, 4 Nov 2016 13:29:10 -0700 (PDT)
In-Reply-To: <b3c8d5de-1d26-b37b-e28c-f8cca01c9ba3@gmail.com>
References: <20161104090719.30795-1-li.zhou@windriver.com>
	<b3c8d5de-1d26-b37b-e28c-f8cca01c9ba3@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Nov 2016 20:29:10 +0000
Message-ID: <CAJTo0LY+kSzuoa6Ub2fFweuNBXu6pmOaxs9P_z9EtoqVztdYRQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Fri, 04 Nov 2016 20:29:32 -0000
Content-Type: multipart/alternative; boundary=001a11498e0006679305407f88c4

--001a11498e0006679305407f88c4
Content-Type: text/plain; charset=UTF-8

On 4 November 2016 at 18:22, Khem Raj <raj.khem@gmail.com> wrote:

> it would be good to keep this for older < armv5 arches
>

Doesn't the C library support its own atomics for those?

Ross

--001a11498e0006679305407f88c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 November 2016 at 18:22, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":2pr" class=3D"a3s aXjC=
H m15830a5417ba21c0">it would be good to keep this for older &lt; armv5 arc=
hes<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>Doesn&#39;t the C =
library support its own atomics for those?</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11498e0006679305407f88c4--
