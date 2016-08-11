Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D0107771A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 09:21:22 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id q83so820356iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6TPCUPoDlcQRR2XHua0sTavuvH8JMBAJK0rexUTBeEc=;
	b=cOScgG+zQicFDKWSdNbWgBq+Zm4C0vSlQxVHlmrzavo2EeSOOX5cRqBrMl2Jvr38yB
	+OQUGNfqJ9kg9InFpJZJCrfFHZvehSvPjnkYdQk703iT5VLQfo1omSAHR3X07r5glTra
	rTrGN5OE5z2Abo90XkvI2AojWOoHbMzcK4jQQc8T+1XMo/w85Dw1jIWZigH5hFff9TSr
	sMMBeFp+OeEy38op81SLtfSlZE+nZ4+WUncGTj6out8I4YRnTAQ8YNbYZqTXkT7PCC8d
	DdU6ih1FzHVrwl+bnMu5P9dMV+ikItDmsYUyQaeEaJEqmoK7RINZ1RFD/n1yZ3SSA+EZ
	Pirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6TPCUPoDlcQRR2XHua0sTavuvH8JMBAJK0rexUTBeEc=;
	b=PkxDQ2Q2RQoZ+QHxhcMyzVoEz4ieqc2hTNVsBhz9pK5xC4DvqJ9HfkwLskGEipTscy
	KOqhAT7PrFzsop9Sik4BhhxsUfxjtgN02ADBSz6jMEnyqv56ItIDazzsY3Q6zXM/ILyL
	Urej7dcudQGu2fYKi/2zP2sP1vuQ9jhkaXi50CJUtUG2W7WrESZLLux7h7QwZviAgQby
	hvu/UGR5nl8O5NrNkU61zWuPLnPx9EZmzful6abtYVHRnaCGhGIEQz80zFtyM7WLb8Kb
	d3oJhQe17PkJURDJiwcuPVQnzD+QzYzPRNQOozzgiFbJtD8ulPTTJ3NwxtJF9MWBk7vR
	hw/w==
X-Gm-Message-State: AEkoouvfEMj9PNgZuOMtJudYwBBB1iSk75x9pL9Xs0JeyAV6cgNXG62SkcMIXPNbNkrBT5VG1k36KtiDeLwTg60Z
X-Received: by 10.107.138.212 with SMTP id c81mr10013638ioj.148.1470907283147; 
	Thu, 11 Aug 2016 02:21:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 11 Aug 2016 02:21:02 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1608110330520.25986@localhost.localdomain>
References: <alpine.LFD.2.20.1608110330520.25986@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Aug 2016 10:21:02 +0100
Message-ID: <CAJTo0LZ9k1rFe=hk80RNvKVqFO2GK75u0Mwh40zhyx0F+rm+mA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what's with meta-yocto-bsp directory in openembedded-core?
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
X-List-Received-Date: Thu, 11 Aug 2016 09:21:25 -0000
Content-Type: multipart/alternative; boundary=001a113ed9321c21950539c84ab7

--001a113ed9321c21950539c84ab7
Content-Type: text/plain; charset=UTF-8

On 11 August 2016 at 07:34, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

> just curious as to why it had to go in a directory whose name normally
> implies a layer.
>

Thanks to the s-o-b that appears to be my fault.  I'm guessing that I
picked a patch into my poky clone that was actually intended for
meta-yocto, Richard didn't notice that it was for meta-yocto-bsp when he
merged as usually patches for different layers don't apply.  I'll ensure
that this goes away and appears in the right place, thanks for noticing!

Ross

--001a113ed9321c21950539c84ab7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2016 at 07:34, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2mf" cla=
ss=3D"a3s aXjCH m156785048b46f274">just curious as to why it had to go in a=
 directory whose name normally<br>
implies a layer.<br></div></blockquote></div><br>Thanks to the s-o-b that a=
ppears to be my fault.=C2=A0 I&#39;m guessing that I picked a patch into my=
 poky clone that was actually intended for meta-yocto, Richard didn&#39;t n=
otice that it was for meta-yocto-bsp when he merged as usually patches for =
different layers don&#39;t apply.=C2=A0 I&#39;ll ensure that this goes away=
 and appears in the right place, thanks for noticing!</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed9321c21950539c84ab7--
