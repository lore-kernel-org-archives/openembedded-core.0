Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id AFF5C605BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:11:27 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id bi2so97691916igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PbsQMrXodGFJcpjruKHAj/yOLEoOdFkBdiS/+0y5qhQ=;
	b=Il8IpzIJyznDfF9AD4JiozO13FVtI5woqYAQWBGryEknD78OpKJ5GOkGicdbuNXjLR
	DYNCtiEApF8HC+3twMtBHo/PcGQv4nQiaObWN2nNlnb7eeGTzfljXT6SQ+gteFgfmCFQ
	nCyNr5GQbxpnrrFNQXeRuiEnMByh0jw2MZQibMsubC04vzPjKKsT2VzYZQnafNthxQ9S
	c6KKQL1JpqqaltVW9Muov2AYEQN7Pq35WrWgBq8Jf2nlW3ifePwZLGYNPhVM1GhcqqL/
	nPyqyzBl5xrb+SbvFcq+ajh9zrNyYyUiPHAAQKxx7/C/MTMWxqi90xWOzRtfhWs0TiQz
	9TQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PbsQMrXodGFJcpjruKHAj/yOLEoOdFkBdiS/+0y5qhQ=;
	b=JVO2xSB9bENCFb8oykCfzZqmzXhCQVE1iIF9cOLHSDuJ2awfPe4kycuMpZsQyMoa5f
	wW9cAZRHyGOL//NY1czAcj72rOPIhTYkH6jqzdcryxGC/WGAnAB2IjKZ9e5gOVCt6PO+
	PYgJXuMsfvJGgwRWMNVF0FxFCKhECSSZ9tVzZ0/AWGRuhDFHPuBzzS0L1AOzNiw8zsKn
	xpo/vULtlprocWd/rMTELwb9W9p/VaYe6lCb7j78627v5Getv2Sl5nXmFqk4fVqBEYuG
	G6FXdxBLwtpCA0bFWn1SHW91oUOtLiniDvQFYoDufR+oqp7j0o3OCDjrRAuqftCT/kmX
	30zA==
X-Gm-Message-State: AOPr4FW8htQeGDzdw1iu8Z7ZrguslpY8ju2I9RTl+tZutbi7mUcbyUcyJiHNL/IfX/UAo3r6NGnlowK+I97Y1THe
X-Received: by 10.50.150.1 with SMTP id ue1mr17899135igb.52.1463587887015;
	Wed, 18 May 2016 09:11:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 18 May 2016 09:11:07 -0700 (PDT)
In-Reply-To: <1463502985-5428-12-git-send-email-otavio@ossystems.com.br>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
	<1463502985-5428-12-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 May 2016 17:11:07 +0100
Message-ID: <CAJTo0LYhzmok-vPEgRPSq+Vxay_hu246_FVY_zva02LS4jUoeQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: prabhu.sundararaj@nxp.com,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: Re: [oe-core PATCH v7 11/13] weston-init: Add module support for the weston-start helper
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
X-List-Received-Date: Wed, 18 May 2016 16:11:27 -0000
Content-Type: multipart/alternative; boundary=001a11c30f0a1a84930533201cf2

--001a11c30f0a1a84930533201cf2
Content-Type: text/plain; charset=UTF-8

On 17 May 2016 at 17:36, Otavio Salvador <otavio@ossystems.com.br> wrote:

> +modules_dir=/usr/share/weston-start
>

Hard-coded paths in here (this, /run) - can these use symbols and get
replaced on do_install?

Ross

--001a11c30f0a1a84930533201cf2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 May 2016 at 17:36, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":aro" clas=
s=3D"a3s aXjCH">+modules_dir=3D/usr/share/weston-start<br></div></blockquot=
e></div><br>Hard-coded paths in here (this, /run) - can these use symbols a=
nd get replaced on do_install?</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a11c30f0a1a84930533201cf2--
