Return-Path: <ross.burton@intel.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 94F8871B14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 20:51:10 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id l23so101838930ybj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 12:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OGZOw4xzBtjTAbDBTKPlTpYdLJf3/vQ22805Gedpdsw=;
	b=tgbSIZ2J6G7PuYqVjQ75RWyYj5T0DptpZ+p6JvXQdBjqXbDx8XDINAzmcuax4n30iJ
	Ne29fATCsSGEZEChhdCuq1KYxv2g4fFHFhYm4ZcwsT+D4ilu4DrzkQaK7sYC2yeTYJQa
	J5LfgC28gPmlST865kocWd+6aQfDlLHdU3YuaOarQ8l+vKLcbOt6y0ESPYfl4AUknuT8
	zUN3hxGzMFQlOEi4D1nJGnAa8s3RR2xYmFTRCFzLGj9/v4hZP8ZRs5fKQAsp2nEcRsAy
	bCW1px5sVfo3IboPjTz/wlIiEjFZt32IaAfs2OTZstHO8l2gWPZLKz8gcYYNO/S3wb3o
	WLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OGZOw4xzBtjTAbDBTKPlTpYdLJf3/vQ22805Gedpdsw=;
	b=GtmLeqWzV11EeY94rc+xMS0xh4gVwvDRJr4P7vUA1k07GaWP9PygNXhVLyIoJwVEI4
	bJc6/6JY4Gf2ibsr9Q99LWMmijOsw8V4dpG8hn3ehb7XyaCVXIkig21iKMVjWWI593yt
	A6VDM3m7GwPBAO9mnoyivDnmgXAPszmj6OuTbBBwnQSmZFP7aqJ0R9L95Zls9pAv8QSl
	j/pVcQV6u1pAJoOSMVEFy+sw9P9MbUN5jU+A3Qle8kOHXFxGtNO8p+IMfW/N8KKQtYxb
	EwOnDjP1YmcIjRjqyD5pYYAiYiArrryBlxNKTxFPshzO+q3A7ab3LNZ8kNbz8WP/AMuZ
	nkvw==
X-Gm-Message-State: AIkVDXLUOH+yyD+XbL4xpMuOITNZp9VRfYQ/eMoCRrm3UkldDSJZ5DiArmnK6k1ni6gnj4UYMCdGtHt0P+fJWcVx
X-Received: by 10.55.141.5 with SMTP id p5mr4332325qkd.36.1485291069250; Tue,
	24 Jan 2017 12:51:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 24 Jan 2017 12:50:48 -0800 (PST)
In-Reply-To: <20170124065506.9508-1-alejandro.hernandez@linux.intel.com>
References: <20170124065506.9508-1-alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Jan 2017 20:50:48 +0000
Message-ID: <CAJTo0LanZt8_AM7kEt5tCCRzU8wgpWDbc5wE=S51TDbiG2M51w@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python: Upgrade both python and python-native to 2.7.13
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
X-List-Received-Date: Tue, 24 Jan 2017 20:51:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c08587292432b0546dd466e

--94eb2c08587292432b0546dd466e
Content-Type: text/plain; charset=UTF-8

On 24 January 2017 at 06:55, Alejandro Hernandez <alejandro.hernandez@linux.
intel.com> wrote:

> Rebased:
> - python-native/multilib.patch
> - python/multilib.patch
> - python/01-use-proper-tools-for-cross-build.patch
>
> Upstream:
> - CVE-2016-1000110
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>


Let's see if the mail to patchworks bridge is working...

[Patchwork-Status: Under Review]

Ross

--94eb2c08587292432b0546dd466e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 24 January 2017 at 06:55, Al=
ejandro Hernandez <span dir=3D"ltr">&lt;<a href=3D"mailto:alejandro.hernand=
ez@linux.intel.com" target=3D"_blank">alejandro.hernandez@linux.<wbr>intel.=
com</a>&gt;</span> wrote:<br><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D"m_-5478047288506841521:rd" class=3D"m_-54780472885=
06841521a3s m_-5478047288506841521aXjCH m_-5478047288506841521m159cf420fb03=
606c">Rebased:<br>
- python-native/multilib.patch<br>
- python/multilib.patch<br>
- python/01-use-proper-tools-for<wbr>-cross-build.patch<br>
<br>
Upstream:<br>
- CVE-2016-1000110<br>
<br>
Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.hernande=
z@linux.intel.com" target=3D"_blank">alejandro.hernandez@linux.int<wbr>el.c=
om</a>&gt;</div></blockquote></div><br><br></div><div class=3D"gmail_extra"=
>Let&#39;s see if the mail to patchworks bridge is working...</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">[Patchwork-Status: =
Under Review]</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--94eb2c08587292432b0546dd466e--
