Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 51065607AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 14:05:34 +0000 (UTC)
Received: by igcmv3 with SMTP id mv3so79015276igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 06:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=I82RsirJNE2koan/L1aGr5AJuT9X66z5GJihX2tmlC4=;
	b=EyzTHko7Lf06zEcw/DWLxIw1cPBwvo3jPG+HVcmiuyJUBYZfH9RHcCeQ3b59/gZTTK
	cMKYtFEV5dl8Yg4qyiem7EEB2pL1maIEaBc7Wncdrsb5zmBJzxu8ya7L0JK0TKi+3cDY
	cWZR9rRrKybhmDEtI3rucJYpeEXh+S/Kkla/6DhXvCaFwbJS2k9n1evhiCTxltYsM75s
	PxIhCd+FdkZTacgFgHeCSl1A8IsJ7KRwNmLnmV4JGAtNygQBTjKwcTBjHnN+Jbip6I4Z
	1AiJdI9xfI59ilb87/u9H2koEHZtC3mxl98GRXLpsSI4Q54JFi/3QjhrsbrBcn91Dj9v
	x6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=I82RsirJNE2koan/L1aGr5AJuT9X66z5GJihX2tmlC4=;
	b=Oz+/CEnmR4NRCsJe11sdCjyZz+dE+/G27EpdkcI/5Lep6vglZIOzEZfShu1ONLNoQw
	pN2LwKPFir3K796QRCeJh8eLgXdpJpHyXLvcI0EPNIgzyv5K6MlGP75uGy55uVQB3UxJ
	brHDmtTCKikcvJTKzAoY1jE3qYVFTP+eP1AVHDtFg8LSoYowaJPUxtHRn8FX8Xksww/J
	41JLvCTVUoBo8oPXfkWwg2Ic3w/wHOuz31slztyUGJlj5XTSvOOsTUjtOm/Ck/jK83s2
	tSfe4jJ4zHxPCqgeLf7VfOkNJ1ibWqXqa5OOmmiueZFxfi4V2gAvpnkAesu/xbGX71Oi
	QDoA==
X-Gm-Message-State: ALoCoQk+u3e7Z9AlHVk8P2BMDTJoHcE52P5RY6e3B5XuBheJxEq6uhsV6oWglZW66245rY96NR4OyvH9eFzF3AVwXxsWrIpB3c/+O3IvwAPEt9OW50RBEKg=
X-Received: by 10.50.60.2 with SMTP id d2mr15709078igr.52.1449497135492; Mon,
	07 Dec 2015 06:05:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 7 Dec 2015 06:05:15 -0800 (PST)
In-Reply-To: <565FA70B.3000804@windriver.com>
References: <cover.1442546459.git.kai.kang@windriver.com>
	<49a75fb1c8a88fbaf77f9b19b054802cc21559d6.1442546459.git.kai.kang@windriver.com>
	<CAJTo0LayLRNJPRe69m8D12qBC0j8+j-DiHAwjZRY_V06T9to+Q@mail.gmail.com>
	<565FA70B.3000804@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Dec 2015 14:05:15 +0000
Message-ID: <CAJTo0LaoYvPizzVg8vopUnACah7c7b001J2_uPEwZTwrs3TV6g@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bind: 9.10.2-P4 -> 9.10.3
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
X-List-Received-Date: Mon, 07 Dec 2015 14:05:35 -0000
Content-Type: multipart/alternative; boundary=047d7b15b117dd496105264f5922

--047d7b15b117dd496105264f5922
Content-Type: text/plain; charset=UTF-8

On 3 December 2015 at 02:20, Kang Kai <Kai.Kang@windriver.com> wrote:

> Could we discuss this patch now? Thanks.
>

Certainly.  Can you rebase it to current master please?

Ross

--047d7b15b117dd496105264f5922
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 December 2015 at 02:20, Kang Kai <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><font size=3D"+1">Could we=
 discuss this patch now? Thanks.<br></font></blockquote></div><br>Certainly=
.=C2=A0 Can you rebase it to current master please?</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b15b117dd496105264f5922--
