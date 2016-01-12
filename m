Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id B92316011F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 18:44:54 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id z14so150476664igp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 10:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xzrSbquoEuVFzPpbpGW1px/NFessLjXblNQ/5cYG7RI=;
	b=FXKqD7MA2IClKKAAZ4bcz6SerZmtsQVtjcwprwuM6X5I4xi0scbX11b9kBlN80wYe/
	zEOCyxGZscXUsQwnK2SLCvH0daCGtLkQfuv9nXrCbkbGO3eqOuQs0dtMPDa01Gw4GIM8
	AZQXCM1flcu8hciK4CtPy8rIEbZFCYSnk8s6tM2nr6Hl8gfqfS7ZSdJZFgUN85FQW/EA
	aoX9yoODQiVcROrnGrvtgN0eQEw9z1wW2oqv2B4mprnYE2aeGcaQPNbWPTILVAxinFlt
	EkVXhfxSJRRw/PeZjqm7F11BkcXDXEqX6Uux7kS4SsVUytsO4JMF1XJtvgGhNtySr4Rz
	5A7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xzrSbquoEuVFzPpbpGW1px/NFessLjXblNQ/5cYG7RI=;
	b=ayl0iKxRTsLQBxpLlDQxTtVzWCCEPr3CnhmGVTWshGIu0GrojFpEqbMMGMOkuIG1t8
	/ttdEwO7XR6ZbI18OxPNssif3Hs6YvtF0KDV1a/y3PvNuVSnfQoWO4l96hYxsy83n2Lg
	JA+lwQdFhgPniMCS/N7SzpBUs0u5Ie/cKt9yzPLHGIglT7vzDA6YNRptI4L2WfswmEEf
	5BVN8hPs8Zy2F3fhg/ku91fLKHZVUaE+kORqbYGvp2AQ0E2cFWBQ6qSEPPBJOaETF+mi
	diwHczFiSuzkh3mmrwENg9Te1enTcxnwHVENwHGgvqYByVKWO9uNmJPRamDB/99Nn+lw
	QA3w==
X-Gm-Message-State: ALoCoQlhGKciHtIvEcpg+oIhsInLtVKpyenYw5SlrpPo+i56Kg0g3SY2uLpb1MeLLrQJzbPkCWmPOPvNDCLyag3+N5GJbeqk5cEofIx7W8szDmknvUeI2Q4=
X-Received: by 10.50.111.111 with SMTP id ih15mr20152431igb.78.1452624294785; 
	Tue, 12 Jan 2016 10:44:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 12 Jan 2016 10:44:35 -0800 (PST)
In-Reply-To: <1452615632-5232-2-git-send-email-maxin.john@intel.com>
References: <1452615632-5232-1-git-send-email-maxin.john@intel.com>
	<1452615632-5232-2-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jan 2016 18:44:35 +0000
Message-ID: <CAJTo0LY1Zqd6qtve-LBaDKikidHihhjxGwhEWsQrkNouzAtK6A@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sqlite3: upgrade to version 3.10.0
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
X-List-Received-Date: Tue, 12 Jan 2016 18:44:55 -0000
Content-Type: multipart/alternative; boundary=089e0149be341553a30529277330

--089e0149be341553a30529277330
Content-Type: text/plain; charset=UTF-8

On 12 January 2016 at 16:20, Maxin B. John <maxin.john@intel.com> wrote:

> 3.9.2 -> 3.10.0
>
> Fixed a parallel build problem.
>

buildhistory-diff reports:

packages/corei7-64-poky-linux/sqlite3/sqlite3-dbg: RRECOMMENDS: removed
"readline-dbg"
packages/corei7-64-poky-linux/sqlite3/sqlite3: RDEPENDS: removed all items
"readline (['>= 6.3'])"

Which indicates that sqlite3 has a non-deterministic and autodetected
dependency on readline.  Can you add a PACKAGECONFIG or similar for this
please?

Ross

--089e0149be341553a30529277330
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 January 2016 at 16:20, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":22u" class=3D"" style=3D"ov=
erflow:hidden">3.9.2 -&gt; 3.10.0<br>
<br>
Fixed a parallel build problem.</div></blockquote></div><br>buildhistory-di=
ff reports:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra"><div class=3D"gmail_extra">packages/corei7-64-poky-linux/sqlite3/sqli=
te3-dbg: RRECOMMENDS: removed &quot;readline-dbg&quot;</div><div class=3D"g=
mail_extra">packages/corei7-64-poky-linux/sqlite3/sqlite3: RDEPENDS: remove=
d all items &quot;readline ([&#39;&gt;=3D 6.3&#39;])&quot;</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Which indicates that =
sqlite3 has a non-deterministic and autodetected dependency on readline.=C2=
=A0 Can you add a PACKAGECONFIG or similar for this please?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div=
>

--089e0149be341553a30529277330--
