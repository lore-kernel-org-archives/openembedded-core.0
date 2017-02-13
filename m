Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8F39371DBE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 12:26:58 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id k15so81806515qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 04:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ATOQpCwr54IYGxLuxNIsDr8/jgVdP0h4k9dBqH2raZk=;
	b=uNVkisI3vxCizSNONxF6Rw+xYuderm2Bd9yhzP0s28wacVV19hY4aKXXdomkeSWdO7
	ToLCepOBDD7BfNWhSo9OvmoxrrlFVS0pq/QgEby81X+VPW19MfL5LPAv9htPC1znWeP2
	yBGWlUKQRVmnTAHpeLRh1jzEJf381ADgaXQYNUTq9F2LTE4AGPHpVJO/OzW0GkvyY1xy
	GuvklUgcTi0W5QjUuSN0qG2LHZ4kh4ZCnSitB5OwUydYureVBomEMDgMrY34uSPywzJt
	WHTVrpNCZHD/J8UqlwdrKP3fTtTFwWkU9qHCOJlw80xtwiqhNMeEWE0ZG7jAcMDdRWPh
	+OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ATOQpCwr54IYGxLuxNIsDr8/jgVdP0h4k9dBqH2raZk=;
	b=J8pRbQQ4upuz04mALibSk4cKRfoDPOoVmVCOu7Qr9Hu1lWgOy/eUX1oQWl8WmSmypO
	JZIYR2MdSho14UKpPi7Bh6K78xmbEmhU06lapSivmHMhmvdvx/loyUY5SWltHFDEU9bg
	ijA1mxUda6Ny1aK2JDNTPNYHaLgGVdXgxAmcMP7IWI5GsuuAPp2p14GRd9lNfp+KmG/B
	ir5HVW9qyamvecW57faCULgi/fSd39R6wckF0ztU9lUvULibXQyBJ62TXVQMuXlmYZAy
	GJGEwHMjc86yDpY6hQ6JXfrEdiYf+kJmENf37Oq0NJbPOrKiagYptBwXaHCYlei1hanH
	87PQ==
X-Gm-Message-State: AMke39mCXjf5pIuUho2/P46vad96eDwNdamSZt2oN8/s9JPQ4QQhjIE3AGtp66iCL0aseORRdIu0KSs+NEkL0tNk
X-Received: by 10.200.39.212 with SMTP id x20mr19914847qtx.109.1486988818833; 
	Mon, 13 Feb 2017 04:26:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 13 Feb 2017 04:26:38 -0800 (PST)
In-Reply-To: <CAPybu_1tqVeyDqhQLd0qPOOR=D=4WhC_D-Tv4wkZJ2_todZ0oQ@mail.gmail.com>
References: <1480609418-3264-1-git-send-email-linus.svensson@axis.com>
	<1480609418-3264-2-git-send-email-linus.svensson@axis.com>
	<CAJTo0LZ_ea-cm=ZSNt2zVbasOApPdbGegZCH7VU-+0XH=-noZA@mail.gmail.com>
	<CAPybu_1tqVeyDqhQLd0qPOOR=D=4WhC_D-Tv4wkZJ2_todZ0oQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Feb 2017 12:26:38 +0000
Message-ID: <CAJTo0LaChW9ENPiJcrnBNGbrbUFiVDSM+Ro2uUjY8NgpQXiheg@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] meson: Add recipe for the meson build system
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
X-List-Received-Date: Mon, 13 Feb 2017 12:27:00 -0000
Content-Type: multipart/alternative; boundary=001a1135b54255158805486890fc

--001a1135b54255158805486890fc
Content-Type: text/plain; charset=UTF-8

On 13 February 2017 at 12:18, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> What is the status on this? it just needs to be resend to meta-oe? We are
> considering meson for our next project and we need support in OE.
>

Yes.  If the growth continues then we'll have to move it into oe-core, but
for now meta-oe is the obvious holding place for the Meson class and recipe.

Ross

--001a1135b54255158805486890fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 February 2017 at 12:18, Ricardo Ribalda Delgado <span dir=3D"ltr">&lt=
;<a href=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.rib=
alda@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
>What is the status on this? it just needs to be resend to meta-oe? We are =
considering meson for our next project and we need support in OE.=C2=A0</di=
v><div></div></blockquote></div><br>Yes.=C2=A0 If the growth continues then=
 we&#39;ll have to move it into oe-core, but for now meta-oe is the obvious=
 holding place for the Meson class and recipe.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135b54255158805486890fc--
