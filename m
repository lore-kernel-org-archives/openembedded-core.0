Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 62B2B606CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 10:23:57 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id w1so79705265qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 03:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HQocfcze+xY6BR8Hm9LPLnfs+WSPpZ6vPB/Dpv6hRfU=;
	b=uXILMZGJY0ND1zBkzx0x4XVOsRSvKFXEKgHh21ECr8M4tSteFDXLnGLaPlWBRuKXyD
	VfCgeqwT/bNLTAve/mKw9LGXqPqCiYFfsLzickt4PagNVvtAafAFIarqTlVHu7XUxinR
	xC6PCIDO9QLfPr8kCn7vlunJv58y3rSRMSj3LnbwotUuQC5flg/Wr7w4MrV+yUhfOmi9
	BkM7z6PntNSaNe8RpAQQyB8Kr8kX49Fbkz01o+rAq0hxy8fNxhHOattqtkjZA9LqHmmw
	uXmEnwVumquFHo1g1vqct1gcCDDwYdMfqWNgRwypTysDLVovWtjz7NhQpFrRvNZUpCsL
	vu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HQocfcze+xY6BR8Hm9LPLnfs+WSPpZ6vPB/Dpv6hRfU=;
	b=gtlr0P/0oKb7gFtQLld09bYfEWKtULs9oBnovLjoYW/gIDsK3siOgjkbVSThe43buE
	3pqKY3EGMEGE07CFHZnNa7kagNC/+U3NXa5VCnVxM3/5saRGn6r1xFCuvg9/Rl1B+qp9
	UcTPSycqca/YWPrrYMOOsZkvzzD/DUTFRemcmsFVl5AIwfxf6O08D+gffQRVeXKzto0p
	Yuyt7QFeTX9BhINbXWfoqZeBnAsFKFruR33aRFhzh7TILR3ZazD+hbCSyPb6zhl+YeRF
	ZCyVvMybKzkB0zRLRGxIRXrkjIoPIvKEqNmXchK9uNfpYw5aGoIrSaOrYLQf3oKAAG9f
	gAtQ==
X-Gm-Message-State: AODbwcDdX3JNsszvoO/NDmMany11wlj6SFv9aNVCN4PGZGkE7ck1Oaca
	6OtXl0TB+JgrBRNm+ZFJKFoZUw5wQTdt
X-Received: by 10.55.24.201 with SMTP id 70mr21338246qky.171.1496658238960;
	Mon, 05 Jun 2017 03:23:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Mon, 5 Jun 2017 03:23:38 -0700 (PDT)
In-Reply-To: <CAJdd5Gani8CqS-7G4nA0qx1cAU1fuj5=TUNJdkxjyw=sA1p-vg@mail.gmail.com>
References: <20170601013319.25260-1-JPEWhacker@gmail.com>
	<CAJdd5Gani8CqS-7G4nA0qx1cAU1fuj5=TUNJdkxjyw=sA1p-vg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Jun 2017 11:23:38 +0100
Message-ID: <CAJTo0Laac4Vj_z1+93sQ0jXY88O+WYk2DqN+TuJBm4yhovZBkg@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] archiver: Escape recipe name in regex
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
X-List-Received-Date: Mon, 05 Jun 2017 10:23:58 -0000
Content-Type: multipart/alternative; boundary="001a114418acaf0ef5055133e6fd"

--001a114418acaf0ef5055133e6fd
Content-Type: text/plain; charset="UTF-8"

On 4 June 2017 at 22:37, Joshua Watt <jpewhacker@gmail.com> wrote:

> Would it be possible to get this backported to pyro and morty? If
> there is something else I need to move that along, please let me know.
>

The patch is now in master, so if you backport it to those branches and
then post the patches to the list with [pyro] and [morty] in the subject
then the release maintainers can pick the patches up.

Ross

--001a114418acaf0ef5055133e6fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 June 2017 at 22:37, Joshua Watt <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":22q" class=3D"a3s a=
XjCH m15c750b21bfe50cf">Would it be possible to get this backported to pyro=
 and morty? If<br>
there is something else I need to move that along, please let me know.<br><=
/div></blockquote></div><br>The patch is now in master, so if you backport =
it to those branches and then post the patches to the list with [pyro] and =
[morty] in the subject then the release maintainers can pick the patches up=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a114418acaf0ef5055133e6fd--
