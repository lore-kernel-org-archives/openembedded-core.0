Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id C599865CAF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 20:53:30 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id c9so4106340qcz.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Dec 2014 12:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YMO+7LDkeOGFSTVpX7J9do5lKNGBQWaLbXZGg2eKAy4=;
	b=it1CjvzcenLqD47zFl+nzfrgxYlFmW3UjMQ/RtLawxUNGSeQYtNDE+g4DligHV+6Sj
	yFqxwfglBVGGAMFwkf8qO+otxFr36tSgVpKMX9YkOjJNzR2y1pAdf/Sd0pUXXwhgRLgB
	RGIFt+KfauN2iaEcZmD40MZE0bIdameUFtzEAeLMDjcAzuPzVsJgjOUzJtT4zhQOu72S
	ju70obeuXaKvzGbqG2buNgE8j30FiJ5PyjukrqXhrgPQ9as3CAs73fWYm4PfD7cKfuyI
	y3iJYDxWVKQIY1BUbekDgkSAh74wxWy8yy6V9KKSR6LO6zA/F25YsMyHDP452XMvnT8k
	l+oA==
X-Gm-Message-State: ALoCoQn2y2O3xDm5xxkL4++q7j30B2laSTfZS4zD2/oZiT6p9eJHgeWtPs9i4R0F9aVZQBeN0ezN
X-Received: by 10.140.94.229 with SMTP id g92mr55404158qge.77.1418072011261;
	Mon, 08 Dec 2014 12:53:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 8 Dec 2014 12:53:09 -0800 (PST)
In-Reply-To: <c11bc2b236f552a463398b4732c8b94e552faae7.1415350038.git.kai.kang@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<c11bc2b236f552a463398b4732c8b94e552faae7.1415350038.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Dec 2014 20:53:09 +0000
Message-ID: <CAJTo0LZ4VvpEE_xAMBzyox5bEnVBoquzDEAQr+Bek19uz-Tsrg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/24] qemu: add single step support for aarch64
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
X-List-Received-Date: Mon, 08 Dec 2014 20:53:33 -0000
Content-Type: multipart/alternative; boundary=001a113a0e8e7f5b6f0509ba9e0c

--001a113a0e8e7f5b6f0509ba9e0c
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 at 08:51, Kai Kang <kai.kang@windriver.com> wrote:

> Backport patches to enable signle-step support for aarch64.
>

As these are all related, can they be concatenated into a single patch?

Ross

--001a113a0e8e7f5b6f0509ba9e0c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 7=
 November 2014 at 08:51, Kai Kang <span dir=3D"ltr">&lt;<a href=3D"mailto:k=
ai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":xv" class=3D"a3s" =
style=3D"overflow:hidden">Backport patches to enable signle-<span class=3D"=
il">step</span> support for aarch64.<br></div></blockquote><div><br></div><=
div>As these are all related, can they be concatenated into a single patch?=
</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113a0e8e7f5b6f0509ba9e0c--
