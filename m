Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 696077825C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 11:01:11 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id w1so120553102qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p1jkqigFjgwIdPvlmLoYHrn3Mn/8WJOfdGIXq4b99E4=;
	b=flcl6+1XkqRKMewcOCxF8gfNDIYqKojwk5HiGkLJhKnbIX+7po6ztUN5ItChyzCMaU
	xFP2J/85L8qUYaodNts75OsxgDmjSrGCi4kNHwGc8GY2rcXY+lpn/pkwXiTDg8oBuDTG
	RkFt8mHubi5YmbecRHDwAQ4+kfy0sGdJTeVoQI9RUwoIkg6fsAs9OnvubSEeOdQj8LZA
	MRglFFlBdWZ+J8Hbiclxv8+ncWOM3QNwm1PfckbFqFj+kdQ6uu+lcVxpW+m3lyluUACn
	CxeNPAVTnfPpKM+Nn25epUvLYcXA2i7Kt3lbBQ2UNoanifezxUHiiCN67WzKY/bAv9pi
	2X2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p1jkqigFjgwIdPvlmLoYHrn3Mn/8WJOfdGIXq4b99E4=;
	b=JfJsraJaKam5fQ+gA20ohgwieipbGIRPqwbFh6AymBKe9LbZ4qsENrxo0kUJPOAWd+
	7en+VOJBXYCoxcR+WuyP91vWiMDyNeCap6HDmwuly0bvYi5i3IxK3JEhuLzqRFFHRq8T
	FaOnHVU8MVsx/CI/8LPTPVx+F556uG5YCpxtnzY99UXGekbdjhTME10bL9d9iEk1LxZ5
	onh02/2t43dFY6F4x+FeU+aBsmrVTg19mDEhwKGpOg2YXq4Ec+KYay49fTASWWrSnj10
	YG8Q2pyW320wyuKriX8XJblVf97jVebFayO36T+80V9wVdGCP1IBu0+d3XimY1HCvb6/
	tEFw==
X-Gm-Message-State: AODbwcB/eLCqxtmuj6YbDfxeCMsUJPRVDdKI1VOjai5SajsS5yNx2/Dx
	JZ8Cfeff7KH/ulCCLvWI4+9AJWhlkIKU
X-Received: by 10.55.24.201 with SMTP id 70mr60593309qky.171.1497265272502;
	Mon, 12 Jun 2017 04:01:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Mon, 12 Jun 2017 04:00:52 -0700 (PDT)
In-Reply-To: <1497069672-2012-1-git-send-email-changhyeok.bae@gmail.com>
References: <1497069672-2012-1-git-send-email-changhyeok.bae@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Jun 2017 12:00:52 +0100
Message-ID: <CAJTo0LbyKHf=FR8vPta5QhpvYC9dYvtgg26y5L3m02a=4fU4+Q@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Mon, 12 Jun 2017 11:01:11 -0000
Content-Type: multipart/alternative; boundary="001a114418acb3dd610551c13c3b"

--001a114418acb3dd610551c13c3b
Content-Type: text/plain; charset="UTF-8"

Of course openssl would be shipping pre-compiled binaries...  :/

On 10 June 2017 at 05:41, Changhyeok Bae <changhyeok.bae@gmail.com> wrote:

> -LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
>

Still not explaining why this change is needed.

Ross

--001a114418acb3dd610551c13c3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Of course openssl would be ship=
ping pre-compiled binaries... =C2=A0:/</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 10 June 2017=
 at 05:41, Changhyeok Bae <span dir=3D"ltr">&lt;<a href=3D"mailto:changhyeo=
k.bae@gmail.com" target=3D"_blank">changhyeok.bae@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><span class=3D"">-LIC_FILES_CHKSUM=
 =3D &quot;file://LICENSE;md5=3D<wbr>27ffa5d74bb5a337056c14b2ef93fb<wbr>f6&=
quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>057d9218c6180e1d9ee40=
7572b2dd2<wbr>25&quot;<br></span></blockquote></div><div class=3D"gmail_ext=
ra"><br></div>Still not explaining why this change is needed.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114418acb3dd610551c13c3b--
