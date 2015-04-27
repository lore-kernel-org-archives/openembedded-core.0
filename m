Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2EAB373DB1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 14:58:30 +0000 (UTC)
Received: by qcyk17 with SMTP id k17so56180718qcy.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 07:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tDwXWT3m3aszQg8I/lYOYWsYikuF+l2YDeZj7D06Cb0=;
	b=as5er06tKbO+rBRWEMrsfIdGtmYwlgg09OBE7LQRw9f8yeMFa8c76dpgPmF5c4h150
	yuUBTPoQBL94KzLF71qNfTRx1zgb0B49g7BtsoxVFZU6NkWHXFJ9xzwobxnTTr/ro1yE
	TW+//9TGGL9IxaQEIsi7Ien3vmbZy7PIxaSXDYlM6CcfFrcL047seX3E5DNbjDpJRgTt
	InmInYiYc0/J+HltxluINA0gVfIH9g/o6l8PhPtsFTQgWbVWHBkFkIMYM3GzuPfKL3VW
	8wxevcE+/379FeCU+4ICgPurUxc4Jx6Nt04oTzYJa/htEHL79GYGykifN4GWFuJMLhbE
	XUuQ==
X-Gm-Message-State: ALoCoQkXpZKUKfsWKQn6f3Ct6GlgyHaKdinnkvAfWl9Vpa5EhlDPkcfDaU3HHro37N3ux/Of9rRZ
X-Received: by 10.229.89.68 with SMTP id d4mr8010940qcm.5.1430146712000; Mon,
	27 Apr 2015 07:58:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 27 Apr 2015 07:58:11 -0700 (PDT)
In-Reply-To: <77a5f2f42f3ca50a912306b1771e08286b4e8648.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
	<77a5f2f42f3ca50a912306b1771e08286b4e8648.1429846255.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Apr 2015 15:58:11 +0100
Message-ID: <CAJTo0LbC+Jt5N1VANt71jpuJU7KHE5YC1hkd2amLe02Zm1p+YQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/14] xserver-xorg: Fix build with gcc-5
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
X-List-Received-Date: Mon, 27 Apr 2015 14:58:31 -0000
Content-Type: multipart/alternative; boundary=001a1133bfb4bef0a00514b5fa8b

--001a1133bfb4bef0a00514b5fa8b
Content-Type: text/plain; charset=UTF-8

On 24 April 2015 at 04:35, Khem Raj <raj.khem@gmail.com> wrote:

> +Upstream-Status: Pending
>

Patches should also have *your* signed-off-by in, so we know who originally
proposed the patch.

Ross

--001a1133bfb4bef0a00514b5fa8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2015 at 04:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":1zz" class=3D"a3s" style=
=3D"overflow:hidden">+Upstream-Status: Pending<br></div></blockquote></div>=
<br>Patches should also have *your* signed-off-by in, so we know who origin=
ally proposed the patch.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a1133bfb4bef0a00514b5fa8b--
