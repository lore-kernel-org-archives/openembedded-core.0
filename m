Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id D6E3D75D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 10:49:31 +0000 (UTC)
Received: by qkcn129 with SMTP id n129so31226670qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 02:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=me7Qc3U2MYDvCeTQvIvjLyt8W0BC+/u1OG7VNrhP8qE=;
	b=x9juSR+XpxSu8WxuFysEqt2CSrWuJcwzNVmP0xD9qrDC7at+jNCotO0WOBMiXjea+i
	I3w/Rcj6ddSkr2mJ0yiEwt4v2DpwZPPeduv4dp0QgHKFPCX5ReEJxmEnRX8+yQC7tijv
	211m9P7ixrZxNuR6VihLurgFZ3UrXtsKQJMsPdQ5tWDAbezu6Tm1682h8iMMukLK2N6w
	OXUDyrP6oGJddMLofJOENjeCdvKqiIySMElj/UMSocbcv06d2cTCJf71s4IL3Vd2Iq2V
	rtDBYbY8VrdDFAnqjMqDZ7Zn4pJuwPmtCPbOhezli3fhAEWQF+yIrd0AM3O/gsFqYoNO
	FD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=me7Qc3U2MYDvCeTQvIvjLyt8W0BC+/u1OG7VNrhP8qE=;
	b=AbyYLj7+/rpH9FmuBLqbayrdAAiQfXvmoSSJxKMI6hAMpAEbPfXZ8ZJSFFbA6HxWJd
	e56DPEOnTKIQP0wtY9lyOrRMqpZODMByamwBNUO5P5yDW2xU24VA5GsS0uecIY+f5z+p
	m/KVARk3NIhMUFl8TluCx0V0pKjLNVlkbUPgXRRpL1eCHsbQZCKbQtnKLCFQ56dscDFS
	xoRVzQCxoOxvmv0thVqChCBneLMN5cpW1yrfOOiBUQOioHtaoaGv6QIALu3BddPwTngb
	mlAfoc0gNDNvwXYIk9bkKU95XVO/ivwjwijkfSepkzOt7kotb08huV5PcsGUitnDpfIE
	BTfA==
X-Gm-Message-State: ALoCoQm6v/3xu+4n9wszgHEMIYVjULDKy9PMBd7XWTJGqZhT2S1qSpFziEK/g6mwreaYcEGv9ZH9
X-Received: by 10.55.72.70 with SMTP id v67mr6457827qka.83.1446720571261; Thu,
	05 Nov 2015 02:49:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 5 Nov 2015 02:49:11 -0800 (PST)
In-Reply-To: <1446719398-14391-1-git-send-email-adrian.freihofer@gmail.com>
References: <1446719398-14391-1-git-send-email-adrian.freihofer@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Nov 2015 10:49:11 +0000
Message-ID: <CAJTo0LZ=_5fwRDRXsY9sHNfq_XMjp6RQ4neGcCT2rs+od0Gz0g@mail.gmail.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libqmi: update to 1.12.6
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
X-List-Received-Date: Thu, 05 Nov 2015 10:49:32 -0000
Content-Type: multipart/alternative; boundary=001a114a97f6bd4aa90523c8e16f

--001a114a97f6bd4aa90523c8e16f
Content-Type: text/plain; charset=UTF-8

On 5 November 2015 at 10:29, Adrian Freihofer <adrian.freihofer@gmail.com>
wrote:

> +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
>

Wrong list, this should go to openembedded-devel@.

Ross

--001a114a97f6bd4aa90523c8e16f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2015 at 10:29, Adrian Freihofer <span dir=3D"ltr">&lt;<a href=
=3D"mailto:adrian.freihofer@gmail.com" target=3D"_blank">adrian.freihofer@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":ni" class=3D"a3s" style=3D"overflow:hidden">+++ b/meta-oe/recipes-conn=
ectivity/libqmi/<a href=3D"http://libqmi_1.12.6.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libqmi_1.12.6.bb</a><br></div></blockquote></div><br>Wrong li=
st, this should go to openembedded-devel@.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a97f6bd4aa90523c8e16f--
