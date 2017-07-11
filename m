Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4846378044
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 12:45:29 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id 16so102606717qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 05:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4d9oWk4WXvWWekuVW8v44L4dQNcyqkaV9F/HB3UiLos=;
	b=iWLEgfiD4X8Z7kiw9csy7CsBfrLSowNNtSDvbpLonTFxIqKcCBGBrdU6KRDbLjmVpE
	fMJDclVX2Wsvk9CAx8rJqDBS5DPGYnYf8c9HvTp0VeCrOV6+GwybU+wiqaEYrfUvHdNh
	ZwstsBZ5t8wkrT8cR1cTgLd6iuAOcSqbYD1rbJo+Ud//LChlAeZgzAZTD0R/ieME9izy
	DrDzGzhQuGauN2b6TOS0S4Odj4dd8wpSvH0M0BDlQqo1VS3y8pxRTlIboZJob76lrXNt
	IpyaNo5uUahHrj2tpp7THFxx+kHazx4hHgvHjwuSr4UxcZ4WIgJFIE5cHzkA5Nl4VR/I
	coEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4d9oWk4WXvWWekuVW8v44L4dQNcyqkaV9F/HB3UiLos=;
	b=lSms3SVw95zlsgtF5S1/ZFZ9/qMTG6ZXww4zsgGwF5MrquO2sRaAoahxX46OkCp+iH
	lQtPwxfAZKymwgCvrEQ9v2B5v/Uw8hN385Y+3WaCRx8tVD0NzOTk/1ojktsf2FI1vJBi
	ZQs0wp3G95HM+q1KKE6Zt1kbp9n0lNy/bDQAR2uOcamBZZpaUIBQaOX/xFpbmNsA2sHt
	JInBlaPmcs692Aw/v/ENpPs2tLmAx4vpA8o9ReGBOWry4OhJAVqOvuWunL8IwtScwAoC
	10rn4JhHvPREoqrXffy2Oo0xszttZLqqizcVhYQfXcwM1LW8GqtmdViqZKQGENsNE84Z
	0+KA==
X-Gm-Message-State: AIVw111RUetbm1ZP475mK8A8BVmx7eBFF3RmCM5NgreeZCBEWvqq2XfT
	Op4GtCiT54H6MKokJU0GbUeFZuoaFrXR
X-Received: by 10.200.56.40 with SMTP id q37mr10154260qtb.36.1499777131095;
	Tue, 11 Jul 2017 05:45:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 11 Jul 2017 05:45:10 -0700 (PDT)
In-Reply-To: <CA+chaQfym0xhN6NVHMEob_K94XbzY2PGEeoUzuCLsxoxKaijCw@mail.gmail.com>
References: <20170709073537.16106-1-soren.brinkmann@xilinx.com>
	<CAJTo0Lb6wS0cYqDmg87_sXh3+SV4mR+kmMA26XUKtscZ4B36GQ@mail.gmail.com>
	<20170711101241.GB3263@jama>
	<CAJTo0LYqWR3BVaT3bhKxv--rdocGW0MN9Pk6zQw-2sKEAQiVXQ@mail.gmail.com>
	<CA+chaQfym0xhN6NVHMEob_K94XbzY2PGEeoUzuCLsxoxKaijCw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jul 2017 13:45:10 +0100
Message-ID: <CAJTo0LYdpnpQ7PrcjSRT2-KgmHiF5SXGEzxJUd0y3etb+MO3Yw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] valgrind: Update 3.12.0 -> 3.13.0
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
X-List-Received-Date: Tue, 11 Jul 2017 12:45:30 -0000
Content-Type: multipart/alternative; boundary="001a113f4e142510c105540a132d"

--001a113f4e142510c105540a132d
Content-Type: text/plain; charset="UTF-8"

On 11 July 2017 at 12:42, Martin Jansa <martin.jansa@gmail.com> wrote:

> I guess it's gold again, https://gcc.gnu.org/ml/
> gcc-patches/2014-05/msg01860.html
>

I just replicated this and yes your failure is gold specific.

The upgrade failure is unrelated.

Ross

--001a113f4e142510c105540a132d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 July 2017 at 12:42, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I guess =
it&#39;s gold again,=C2=A0<a href=3D"https://gcc.gnu.org/ml/gcc-patches/201=
4-05/msg01860.html" target=3D"_blank">https://gcc.gnu.org/ml/<wbr>gcc-patch=
es/2014-05/msg01860.<wbr>html</a></div><div class=3D"yj6qo ajU"><div id=3D"=
:3ma" class=3D"ajR" tabindex=3D"0"></div></div></blockquote></div><br>I jus=
t replicated this and yes your failure is gold specific.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">The upgrade failure is u=
nrelated.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a113f4e142510c105540a132d--
