Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4C55270101
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 09:04:49 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id n190so137842656iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 01:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pXA5ttDlBiFYJRDu28vtOe32vfiGNKfuHezIzZ+PVEA=;
	b=Ek4MCMFO5K4pLUN/ycaf+acrrFSBGhgf/nivpbWWM2v4+HXbh+hfVAN945fjOruGr+
	GTLvU568hbeftLIbf2umIqu35uQc7DzfF66IBzDbkEmAaL18jkQoU10gvfEgQuoikuu1
	JRcY4nhWZzCc/vw6azG86nBw415YZoIeNZgarzE9DLDnQ7wLuhC939My3fMwWKfk4bqh
	dko/Uc1WFDa8XiFzK89/HLL0WXfonkr9d9O+ZIkqinJKyXK/JNFfs5lMLBZfw8wzAUjM
	T9zQQIMS7sAFX4ZAv0DyN8waLGkdvZWT7W1qOd0kRK+BGucZ07pdU+Z8UO7PWoOk7Mro
	SZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pXA5ttDlBiFYJRDu28vtOe32vfiGNKfuHezIzZ+PVEA=;
	b=EjSasG34SeCmwP+loArDZn5267yWT8ULht+V5VnU24ETPiDlX5//Pm47AztKAfxF3J
	7hUw8yuxPEJW4ChxV7ukk/eiZa4btoqOye5xr7g1TbunJ+rkxbBBkGmkJNlZ+uocEah1
	v/ihyqx4mYFVdX0diYNQUIu5ffPASr7OQjai542xgESlqVGY6OJx912dS0WNLHF4hP1D
	qCFyxkw23Wt4xMKMb+ZnvU4NnLelL3x3nGwdAOzHk0yNsNS0SU4Puztxi1rV8Vn+k0s7
	hni3FhoJEC71E1YVPMVNNJtv57dQRpoblDGpu6Boaf/qFzfLsWYMohdq+Ab/edmDrJ/J
	tw/g==
X-Gm-Message-State: AD7BkJJR4so9R1SluBmEA9iUoFPyaiAktMbn8BFGb2et8gVSj38MSvtruN4icBTHXDVqVwsFd2Yodq4aTy/j2zQA
X-Received: by 10.107.16.19 with SMTP id y19mr7871515ioi.148.1457687090462;
	Fri, 11 Mar 2016 01:04:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 11 Mar 2016 01:04:31 -0800 (PST)
In-Reply-To: <26a6e7fd40f8c0be2464f802c41eecb06bc818c0.1457681854.git.hongxu.jia@windriver.com>
References: <cover.1457681854.git.hongxu.jia@windriver.com>
	<26a6e7fd40f8c0be2464f802c41eecb06bc818c0.1457681854.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 09:04:31 +0000
Message-ID: <CAJTo0LZGEEq3LQV-83A1vJE7hfVwsPWOmXk1nX1E7G0JiskSPA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python3: fix do_configure check platform triplet error
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
X-List-Received-Date: Fri, 11 Mar 2016 09:04:50 -0000
Content-Type: multipart/alternative; boundary=001a113fd1ea3897fe052dc23932

--001a113fd1ea3897fe052dc23932
Content-Type: text/plain; charset=UTF-8

On 11 March 2016 at 07:40, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> For p1022ds bsp, the MULTIARCH is powerpc-linux-gnuspev1 and
> python3 did not recognize the extra 'v1' which caused python3
> configure error for the platform triplet.
>

Forgive me for dry-by commenting without a lot of clue about this, but
doesn't that suggest instead that the C function to emit the triplets is in
fact wrong?

Ross

--001a113fd1ea3897fe052dc23932
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 March 2016 at 07:40, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mail=
to:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":9gi" class=
=3D"a3s" style=3D"overflow:hidden">For p1022ds bsp, the MULTIARCH is powerp=
c-linux-gnuspev1 and<br>
python3 did not recognize the extra &#39;v1&#39; which caused python3<br>
configure error for the platform triplet.</div></blockquote></div><br>Forgi=
ve me for dry-by commenting without a lot of clue about this, but doesn&#39=
;t that suggest instead that the C function to emit the triplets is in fact=
 wrong?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a113fd1ea3897fe052dc23932--
