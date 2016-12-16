Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2720A71B29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 08:47:32 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id t184so30061057qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 00:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kyhEVJmHMwlaLEH4jjod32E0p/bkcC82kgTLdggTVn4=;
	b=tUN2X9/KKQrOR7zcX9SuT6Me8jGI3Wzxw+pAWUMFCyUelXl0uPyd1+fy0Y4bKfUvWE
	N2I7pqLDfXzWVNrhZXvZSjFtmsWbDXwkvStxXRh1hM7rhZOjzIPeOcyTakc4mRfSpMvP
	EWMjVFV95rDi5BpC8+/5STeOH8qoG3AWKQqy4fQkOCZTD5av8JcVCBlUwZN73RLOb6aZ
	NpVAup8C8QDrr7krysuLOu2ufLuCkRbaTPg9y2NAC9T29A6q2A4DbeqHCVq/ZZ04nx3t
	u0oPrjzVkNSZ1XciN+lylQ+X8X4Qe1lvnrRT72CT3mOaLqnnGiZoIjjxM+s6uLR9625x
	f1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kyhEVJmHMwlaLEH4jjod32E0p/bkcC82kgTLdggTVn4=;
	b=sgqiTpQngnbaNDU6/h9wSk/DY7Z95NNOgfVllCntt52YrFDURqM23OKlYpmuiJUpn9
	yVk41YzQ7kONuammKtJov4CbZfOTmyQebxWsoWGj7GNwEa2P2qRDYvmPvCguy8zQToSb
	flkl9JFbxFJTn2VoBE3lLPwZlKdhYT9G9ehQGTazG4W/LcnwP/CBNJ7wXixhtt7kDstQ
	jPzkT9hFNJK1oaTwN64a9hmGhI6sOs0W4ibEiFRPfCgx+ewX5JRt/I7XN7XffudbU1tv
	JjsNGx5Gl8a1fx3XknkZs7wA6+mavzl6nPSmAot41A7XFQnYYZw3nD9ftACR7mqA91eQ
	kNjg==
X-Gm-Message-State: AIkVDXLGXyYOQJvFsDUn0n+k0MUjkZW7HJ2xgBterp4GPNXt+Y3C1124wHVPSAlxYtatTBAWx7kMezNwIvw3bdlq
X-Received: by 10.55.177.195 with SMTP id a186mr1815662qkf.89.1481878054036;
	Fri, 16 Dec 2016 00:47:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.34.74 with HTTP; Fri, 16 Dec 2016 00:47:03 -0800 (PST)
In-Reply-To: <1481838928-15213-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
References: <1481838928-15213-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 16 Dec 2016 10:47:03 +0200
Message-ID: <CAHiDW_H_VNYvayL4jTnpSJ28RACar6oP=L7DqX_Uyc+=svafiA@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pcmanfm: upgrading to 1.2.5
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
X-List-Received-Date: Fri, 16 Dec 2016 08:47:33 -0000
Content-Type: multipart/alternative; boundary=94eb2c06137a02fcda0543c29fe4

--94eb2c06137a02fcda0543c29fe4
Content-Type: text/plain; charset=UTF-8

On 15 December 2016 at 23:55, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:

> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>
> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> ---
>  meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb | 43
> ------------------------------
>  meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb | 43
> ++++++++++++++++++++++++++++++
>

Hi Edwin,

Could you configure git to use rename detection in diffs. Something like
this in .gitconfig:
---
[diff]
        renames = copies
---


Thanks,
  Jussi

--94eb2c06137a02fcda0543c29fe4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
5 December 2016 at 23:55, Edwin Plauchu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.plauchu=
.camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">From: Edwin Plauchu &lt;<a href=3D"mailto:edwin.pl=
auchu.camacho@intel.com">edwin.plauchu.camacho@intel.<wbr>com</a>&gt;<br>
<br>
Signed-off-by: Edwin Plauchu &lt;<a href=3D"mailto:edwin.plauchu.camacho@in=
tel.com">edwin.plauchu.camacho@intel.<wbr>com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/pcmanfm/<a href=3D"http://pcmanfm_1.2.4.bb" rel=3D"=
noreferrer" target=3D"_blank">pcma<wbr>nfm_1.2.4.bb</a> | 43 --------------=
----------------<br>
=C2=A0meta/recipes-sato/pcmanfm/<a href=3D"http://pcmanfm_1.2.5.bb" rel=3D"=
noreferrer" target=3D"_blank">pcma<wbr>nfm_1.2.5.bb</a> | 43 ++++++++++++++=
++++++++++++++++<br>
</blockquote><div><br></div><div>Hi Edwin,</div><div><br></div><div>Could y=
ou configure git to use rename detection in diffs. Something like this in .=
gitconfig:</div><div>---</div><div><div>[diff]</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 renames =3D copies</div></div><div>---</div><div><br></div><div>=
<br></div><div>Thanks,</div><div>=C2=A0 Jussi</div></div></div></div>

--94eb2c06137a02fcda0543c29fe4--
