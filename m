Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id BA8E973216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 16:49:09 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id f6so72846088ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PBbCNQtQWBKhLgxw9tlJhg7TIdv9DRxCUHp2eFhHpFo=;
	b=HQR9ZcPsT6o3570RTBb1PJmDY+RL1C/svIVf4ZjlHyD03MCnCwb2IvDdea+NuY9yD+
	xexaK6G2g7h5MHRl5IkurwcohIfA9MQvkFF9rFl/j72ezdEH+Dj/Phbsm79TIWgJXTOD
	ym1iXJgEZZCvDGS/8SG0ws1m0t5IGENya9H3h4t9y8VRtwRmAdpXOSJJaPhapWViFZkh
	BR6tt1eUDvzRxaO7OPreBHOHgtcbmKthsjmxuYOM0R/qO/Nvk3RqWW4OzdqQn4BUdpIh
	0mmpCHhcVKIrv6ejhqwANW/ptIRjI9nFDougYO2wgvVHatlwqTrtslMxnVmLqeb5HxBe
	Quyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PBbCNQtQWBKhLgxw9tlJhg7TIdv9DRxCUHp2eFhHpFo=;
	b=FF/zxuE9m/jj5j3omKrfC9LUF1HCxCvSd7Sk70+4XiAEmWAbczQTbOL5UFhXZinddo
	kbLuNNdutqlbDEURGug+WcMSatJAjpHJYWo/kQ2HAvB22X5cclDYvVlVSpAAG02mhjNg
	mq44LHr5V/QKCJx2J4HIr1TfVNT1itRtYTxlabsyZ+KffUQd/YdnTpv2kOLMWrfYPKBd
	lqAKUx0FiKDclv8lxwaVH7kgOb4dwHT1pEJlroodGC1SDfN9M2tFsFwHStAZFM9MBxJF
	/j4AaK5AClZpksIlQJz1Arz8ZKyQ8l+jR2ayRrpXPtNsUDlh8m8ziwo0Ne+34WRhBD53
	27Jg==
X-Gm-Message-State: AEkooutmP0B+2YrpJJHMR32n9tZo9IvdE9hqDHXVHb+o9+kh7A216RveVQpZpNN9GV1DfgwxdM6F30kO/kgtHWOO
X-Received: by 10.36.20.75 with SMTP id 72mr21962877itg.83.1471366149742; Tue,
	16 Aug 2016 09:49:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 09:48:49 -0700 (PDT)
In-Reply-To: <CABDc_zW0Mi9a5G+neZMSAC5mRVo8LC-62ew_X9PiKM8uVxhAUA@mail.gmail.com>
References: <CABDc_zW0Mi9a5G+neZMSAC5mRVo8LC-62ew_X9PiKM8uVxhAUA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 17:48:49 +0100
Message-ID: <CAJTo0LYw1yyeQ16rbQyjLRyyarr4kSzvzAXyUt_8kssV5Jer+A@mail.gmail.com>
To: Christopher Lord <clord@mozilla.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: npm.bbclass
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
X-List-Received-Date: Tue, 16 Aug 2016 16:49:11 -0000
Content-Type: multipart/alternative; boundary=001a11446942b0d848053a3320de

--001a11446942b0d848053a3320de
Content-Type: text/plain; charset=UTF-8

On 16 August 2016 at 17:41, Christopher Lord <clord@mozilla.com> wrote:

> - Any patches end up getting packaged because they get put in the srcdir.
> I'm guessing this isn't intentional (or maybe it is?)
>

This isn't intentional - I've love to move the patches out of ${S} but
that's non-trivial - so npm.bbclass should be skipping that directory.

Ross

--001a11446942b0d848053a3320de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 August 2016 at 17:41, Christopher Lord <span dir=3D"ltr">&lt;<a href=
=3D"mailto:clord@mozilla.com" target=3D"_blank">clord@mozilla.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div>- Any patches end up ge=
tting packaged because they get put in the srcdir. I&#39;m guessing this is=
n&#39;t intentional (or maybe it is?)<br></div></blockquote></div><br>This =
isn&#39;t intentional - I&#39;ve love to move the patches out of ${S} but t=
hat&#39;s non-trivial - so npm.bbclass should be skipping that directory.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a11446942b0d848053a3320de--
