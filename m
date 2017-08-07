Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 408326FFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 13:00:01 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id 76so2014804ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Aug 2017 06:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1sqlbbABgrAoBEsgGqGsvWcy/7VfJMPub0xE/TxGRjw=;
	b=zQuqhoA4trIpvk/uEXKrLmn9WDm5zEEpOX5Rk1GTbHPOSic3dHYRL5A2gQzlMGFQEW
	uhTlE9cN4To/ELa3F/UTg2pBl6H21IsI0FmTk24T50+rJrjC6ahXRtIcsvyKzxRXhexh
	psHTprKtRPImjLe5e7PKrOjD7e0tNCF6pHm32pIqHgQW63HwlaCs8DIIyh2hSnIcqVkd
	J7H2mKlSGPDYOPE3bu5lyWHCnhDuJIeKxQogAWogdYP+OmrLzV8TdejH/Pey1mv8GXBh
	GB4JTE4eS0ibtYpQZfy9Icvm5V6SyqL+k9QX56484k4MhTRXoFlzrdgwx6sSdre8XTuJ
	b/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1sqlbbABgrAoBEsgGqGsvWcy/7VfJMPub0xE/TxGRjw=;
	b=epiUwsHsn7qPm1Y/YElRbKAWE/MbkWjG8L79DVAe6zIvHs/VLitSL6qiTSO6FAEqj6
	lJFbhNIZDkb8RXLA32x7qFuMI17+76mreYfqOLcr9j+iEGhH5ggH/0syxT/DkUTf4sU2
	4N0sklLagLeL4Ri2TcxgVNiTi2mxrywOFQ9qWnd5CwpjH2RRoiKpM+IKxLSoKf5qM86j
	hcMYaUNLQ26xaQIgxZ6L8i58B1eyJYMzshljx/HFDiCJVd2zxSMmRGByBs3baNRsmx83
	chyUjpiaQJSh7kNzZUt1RhDTx0Rj4JLQeFMVpUlxTt1COIwSEwte5I8pMVAjEY1cp7k9
	2d1A==
X-Gm-Message-State: AIVw110JkSzVdrIVQq7+xzbt4Vv5pzFAKF3TzZYTK/F+VPRmA5c23Psc
	LAxTdaAZkJuf+aiFup/m3O1W86GCgnrR
X-Received: by 10.36.48.193 with SMTP id q184mr830964itq.112.1502110802430;
	Mon, 07 Aug 2017 06:00:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 7 Aug 2017 05:59:41 -0700 (PDT)
In-Reply-To: <20170807114504.28410-3-alexander.kanavin@linux.intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
	<20170807114504.28410-3-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Aug 2017 13:59:41 +0100
Message-ID: <CAJTo0LZPE-vj-+4ud=L8n5JiEKYdhFHod6dsox90ULghcvOaWA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] btrfs-tools: update to 4.12
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
X-List-Received-Date: Mon, 07 Aug 2017 13:00:01 -0000
Content-Type: multipart/alternative; boundary="001a11c01030caf1a30556296c7f"

--001a11c01030caf1a30556296c7f
Content-Type: text/plain; charset="UTF-8"

On 7 August 2017 at 12:45, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +-      $(Q)$(CC) $(CFLAGS) $< -o $@
> ++      $(Q)$(BUILD_CC) $(CFLAGS) $< -o $@
>

This won't work when CFLAGS contains arguments that the host compiler
doesn't recognise, or are inappropriate.

Ross

--001a11c01030caf1a30556296c7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 August 2017 at 12:45, Alexander Kanavin <span dir=3D"=
ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_bl=
ank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
+-=C2=A0 =C2=A0 =C2=A0 $(Q)$(CC) $(CFLAGS) $&lt; -o $@<br>
++=C2=A0 =C2=A0 =C2=A0 $(Q)$(BUILD_CC) $(CFLAGS) $&lt; -o $@<br></blockquot=
e><div><br></div><div>This won&#39;t work when CFLAGS contains arguments th=
at the host compiler doesn&#39;t recognise, or are inappropriate.</div><div=
><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11c01030caf1a30556296c7f--
