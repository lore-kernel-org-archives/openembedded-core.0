Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7620877687
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 12:58:54 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id v125so90138867qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 04:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FhrK9wrjlVzw2h47lznTOQYr1Sf7vvCbzlW5p7+qGNg=;
	b=HG7izOQMilESgOnfZav5SPBBgodQRykNKAWpRr3P62gpT4LX1ACho1gepdilQCF1uo
	fPUlJH/gfXdX0qk/1Rm0UbQFTKuW9RhR+TKInHrvYu+RG0T7RdxoD86d7gEt8hzH748x
	RNWJ7nHn8sBt1fYLrMiFQ8XgoOPUsE4akexJHJGbPUBAE9IU2JzInfC88EmXZHRLjseg
	MBiZhYOaA0jW7NZ+8RXtS0XOEo4z97YwJ+ikO+tOOnx+RUoutV215JDMpw8B7kK0svTl
	E6GtH6JAywdR0LMcwVL8LENMyIJWDZ969JcmJ4N/IOpAumtfY8BroY/zcAUC4Yp8pM1x
	VUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FhrK9wrjlVzw2h47lznTOQYr1Sf7vvCbzlW5p7+qGNg=;
	b=uZPOHhqhpg/1Pgp5sqMrx4cO2kfdah12ZqhfR2EiEzLr41Ts9S1tp7qCScQEnOjUCq
	w5j7sh3ilK4N9Yy9fUtMOnQfbOGKp2jXtOiGPFw2IDm2BVNwGMM/2H+2co5IO5dm0EeF
	FyVkRbhWv32EG2LfPu0EvtqnrzxKLqUihrlkxzFeA9RlNDX0jXbbeFfMWiBdVV6mXGAU
	6mmQGk3BquE6N/FH8/TkHWOuhhI2fSiZAkmoXMCY688qs8vMG5PSGJVTuqeF1qVvt2C6
	+h7GMEhloWd4fjStVorviS/iMQQkUE1coqZfNMpWCCGhXEujXlMQ6A+0+pDCwgVCmvf5
	RWgA==
X-Gm-Message-State: AMke39kmZJfSsCuXTpDAFZLC+GK2bbEQd+dumA3XHa6+nSR0Ea8z2RfeJqVjivssnf/7kRLcZ/GeDiuYZLY/+0sy
X-Received: by 10.55.175.195 with SMTP id y186mr14866532qke.26.1488805135368; 
	Mon, 06 Mar 2017 04:58:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 04:58:34 -0800 (PST)
In-Reply-To: <9a9e3651-e3d3-c8b0-28fb-91c9c9ef1995@cisco.com>
References: <9a9e3651-e3d3-c8b0-28fb-91c9c9ef1995@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 12:58:34 +0000
Message-ID: <CAJTo0La=cCuaP8mvpg3K-J31VcSnxdEJJof+Jc_nWG1rjQimmw@mail.gmail.com>
To: Stefan Strogin <sstrogin@cisco.com>
Cc: xe-linux-external@cisco.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] slang: add ptest
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
X-List-Received-Date: Mon, 06 Mar 2017 12:58:54 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c3be942054a0f75e1

--94eb2c06093c3be942054a0f75e1
Content-Type: text/plain; charset=UTF-8

On 2 March 2017 at 17:29, Stefan Strogin <sstrogin@cisco.com> wrote:

> +       cp -r ${S}/src/test ${D}${PTEST_PATH}/
> +       mkdir ${D}${PTEST_PATH}/objs
> +       cp ${S}/src/objs/libslang.a ${D}${PTEST_PATH}/objs/
>

Why?

If this is because the tests need sltest, that's already been built and is
in the package: just patch the Makefile instead.  It's also huge, so I'd be
tempted to say we should strip sltest as enabling ptest for slang causes
slang-dbg to increase by 2MB.

Ross

--94eb2c06093c3be942054a0f75e1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 March 2017 at 17:29, Stefan Strogin <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:sstrogin@cisco.com" target=3D"_blank">sstrogin@cisco.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":24y" class=3D"a3s a=
XjCH m15a901aed0989ddf">+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/src/test ${D=
}${PTEST_PATH}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir ${D}${PTEST_PATH}/objs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/src/objs/libslang.a ${D}${PTEST_PATH}/o=
bjs/<br></div></blockquote></div><br>Why?</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">If this is because the tests need sltes=
t, that&#39;s already been built and is in the package: just patch the Make=
file instead.=C2=A0 It&#39;s also huge, so I&#39;d be tempted to say we sho=
uld strip sltest as enabling ptest for slang causes slang-dbg to increase b=
y 2MB.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--94eb2c06093c3be942054a0f75e1--
