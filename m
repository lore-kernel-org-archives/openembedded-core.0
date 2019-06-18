Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3172B7E909
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 11:24:20 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id r21so11019087otq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 04:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5z3mCcyxl3T4uAZKWTXPaLq/dY28f/uDGm4XxCOGRp0=;
	b=jC2Gf9cRrFFSqMDufJznL22KFH+EBLeer3pHK1UabIqWoFcynJ8I65Zb+d/7jMiTC3
	IsfpxEgog8WvrqI9ttCuxGz0QNp6YILgTPlOqN9m/CCdPnvW4lsiLSFgmsCtSZU1l2kE
	HU6iG7v9RR591YSXWXHaSKPCgrQKoz9q6He9gbXkLuTEsD2/UdEBPgNrG/BHnNG7Vn0b
	0ICQnWfTJS/ek0JnRyvDtxlGGN94vSgGuZG/etlk9G/wRtHAuOMeaYLLrtp16udRtqdC
	+tF6Epkpsgwob1vt2w3kLB/XRF9sXAc4/RIuuY94b91y8PR0N0tMj9PB6dqUuP96XPPp
	ZXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5z3mCcyxl3T4uAZKWTXPaLq/dY28f/uDGm4XxCOGRp0=;
	b=meFDpGIxJuP4px7fSJ/tsF+wYE3GiaiAZlPYZD7s0IjZu/Tpl6ckm1ImkvTi4W5+QR
	NBQnKgLVPswStqnlM7Xhu+tAv6k7nwFeFvcYBp6C02COXnA8TaPGg//vRzxPAE6t8VvT
	261eiAPJYzT0V48ofCkoVgnKkE/QKBpGJJmruwCdrxa1MNPJo+5ef0jdnp+Ys9ux7FfQ
	mkEgsQVNgTKywgZl5ctYoTjzJT090HYV013aEDJSnPpO+/QDxwpiNJr3JP6yOf1RFBH3
	z+ZzAT7rp5oIPvO1DltBxTbvxFM3LCP1hs1wLTnH5MUcBpAkaqlgZqqKs59z3/eP96JW
	RYKg==
X-Gm-Message-State: APjAAAWkupwdUg0U42RYh1LIoAd03bhZi6J9Pq3Iq9iKqzjW4ebdlCKH
	cNstOBTBt3gax56+eXCjsgs8anCTYYufMo8UIjZvfMrBimw=
X-Google-Smtp-Source: APXvYqwHKM+xNdj9HCaFRka5RtRW3yNd/x9y3TUbdvGcysZ9tPQDUvomD0NsMS8POE3NNoGeDA2k3wJBWFOnEs/qkeY=
X-Received: by 2002:a9d:d87:: with SMTP id 7mr60979919ots.263.1560857061221;
	Tue, 18 Jun 2019 04:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <1559790305-34116-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1559790305-34116-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Jun 2019 13:24:10 +0200
Message-ID: <CANNYZj8AdHZYDJaoy75GUtMDAun+-kqb7x_26RZKb=eo+JWGUg@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] openssl: Fix a build bug on aarch64BE.
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
X-List-Received-Date: Tue, 18 Jun 2019 11:24:20 -0000
Content-Type: multipart/alternative; boundary="000000000000ade941058b975a3d"

--000000000000ade941058b975a3d
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Jun 2019 at 09:54, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:

> +Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/9151
>

Seems like a contributor agreement is needed for this patch?
https://www.openssl.org/policies/cla.html

Are you going to do tihs?

Alex

--000000000000ade941058b975a3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 18 Jun 2019 at 09:54, Lei Maohui =
&lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com">leimaohui@cn.fujitsu.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">+Upstream-Status: Submitted [<a href=3D"https://git=
hub.com/openssl/openssl/pull/9151" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/openssl/openssl/pull/9151</a><br></blockquote><div><br></di=
v><div>Seems like a contributor agreement is needed for this patch?</div><d=
iv><a href=3D"https://www.openssl.org/policies/cla.html">https://www.openss=
l.org/policies/cla.html</a></div><div><br></div><div>Are you going to do ti=
hs?</div><div><br></div><div>Alex<br> </div></div></div>

--000000000000ade941058b975a3d--
