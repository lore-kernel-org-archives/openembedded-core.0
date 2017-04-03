Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4BEE671A35
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 14:12:16 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id i34so113018880qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 07:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UYLGSfr/lP9/cfiwX2iZsTOE1sCuu139RhQ4ScdCDno=;
	b=BSJtLN02QKZzf0IZA09Ys7uTTvCC5bA9Ev6J4h2WBu3/NRczHuLbpS3IW9SQ8anFT6
	Ng7o41K6TQD8xjGMLRGuiw3BeFYtCmpnXTCQa44QRtNV08CD65/yh5348b3qLLvn9eTe
	8N2ADeQNhacfKfknQGgca+Q2D03oDtl7Lcanp1DIb7rg6ucvuzFUVQnOpK3FiTpyrEoU
	pRGK+BxDaIICdFaLw6KV3H55TC3SrecwPt3pI7JMq2sRGM4ct19jox3Wj1NG2QZgfbCL
	t5+MdhLHtm/BGarjszf21wRK3zxc7EYzlvkPJ2IbaTchQ/sNhWDC6etkP1WYxpFhK2vk
	E1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UYLGSfr/lP9/cfiwX2iZsTOE1sCuu139RhQ4ScdCDno=;
	b=I3E6LtDJG9S9UUJ1u140dz1/VjHSD9Z7gLzURi1XVRtvUSpogw9KBWcm3D4O5ztoib
	PSRCTtakjDUxToP8s7iksgt0qVFIILCH0+Mo9CC6TcDF3TSLl7Fc7tskrSMfsp/SdfOj
	cVqgbJO3ScBN5pyIJl6iS5BMwqe4oZ/2FeqndStGwgUNCe6mHZcPXN8EeAAPuYXreakM
	wGngNh6ie4xPoheXPvxaD+RfCRTz8Fh1hpV0pHOvTan2u56JHI2nrha1+KTaOE89PxSi
	ysxxFyv227Civ1CW06V73YIzGrnnSUT8O3AgL7bAY76yF7GTonQxiKwxd2eM68cib9sZ
	po0w==
X-Gm-Message-State: AFeK/H27ua6J3zvxIIkIUIhdaIVq3Jr6dmzVkR4J7577WJuiEYaWJl6ezrotZ6AQab2IIS/DvWHc19NDhnaYVEyD
X-Received: by 10.200.33.182 with SMTP id 51mr17754575qty.65.1491228738142;
	Mon, 03 Apr 2017 07:12:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 3 Apr 2017 07:11:57 -0700 (PDT)
In-Reply-To: <1491077204-30363-1-git-send-email-akuster808@gmail.com>
References: <1491077204-30363-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Apr 2017 15:11:57 +0100
Message-ID: <CAJTo0LZ-_j6h8NWo2We+jd+dYzG4-ZeYb7N=69-7tq-r_PONqQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: update to lastest 1.7.4
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
X-List-Received-Date: Mon, 03 Apr 2017 14:12:17 -0000
Content-Type: multipart/alternative; boundary=001a113c6418376a7b054c43bfc0

--001a113c6418376a7b054c43bfc0
Content-Type: text/plain; charset=UTF-8

On 1 April 2017 at 21:06, Armin Kuster <akuster808@gmail.com> wrote:

> update SRC_URI: as of 1.7.3, repo changed. same owner
> Renamed recipe to reflect PV and added Epoch
> Added ptest, tests added v1.7.3
> updated LICENSE to be more accurate.
>

Are you happy for this to wait for master to re-open or do you want this
considered for 2.3?

Ross

--001a113c6418376a7b054c43bfc0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 April 2017 at 21:06, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":21f" class=3D"a3s=
 aXjCH m15b2b2152ac4f75e">update SRC_URI: as of 1.7.3, repo changed. same o=
wner<br>
Renamed recipe to reflect PV and added Epoch<br>
Added ptest, tests added v1.7.3<br>
updated LICENSE to be more accurate.</div></blockquote></div><br>Are you ha=
ppy for this to wait for master to re-open or do you want this considered f=
or 2.3?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a113c6418376a7b054c43bfc0--
