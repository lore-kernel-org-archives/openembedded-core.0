Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id D2372784A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:24:26 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id c10so62941864qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 06:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uLdD9w0m24PtgMXVW7VSnlzWcROx+4UNE8UY1T1boGI=;
	b=Prxktckh1h5uAYco1uMKRClpxZRhtg8+TEzxXr+aMI2BaZaJ+kY5sdvzogPwrw7Dj5
	LR+MiBZtqcHHeBCJSJ/DScjjDsK2r5N+8r3jwGqhAhOwkkA0Bq3UwxvjKQQgEly90JNu
	zxQHxuyaxyBBp/9Wcr3LIAafCuqZQe7HrRGm0Appv9E6wJ7Vq4ffzOWkLK79Ojbwc79T
	VwEVJsvFS1Q93/j9rMMydLrzB7pdXci/Fr7qYEs47TJvb8cXH099nXqAwdLPfOTGJqDg
	axxR+ml/DJStihEKyeT8v7SkdiFogMeOT3oaXESQxJ9N2STG1h70b4aIFg+zDhobyE0Q
	9NdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uLdD9w0m24PtgMXVW7VSnlzWcROx+4UNE8UY1T1boGI=;
	b=BrEPLyyCczN3P9/BpKqXqHz1u4JSYW8AiiRm/9mTQfeUsTsmJqB6Ih0cdCVvHx0w/M
	dKIIy0WM7yLXYmpxO7s2bDMBLte3AxvfOUQIWi7caTlgBAE4meqPS9VRyxGqp7LMeUy1
	2RQKN4I1qM3ObFTK//F+xnbd20n/cAazyEqJ7gTbTZK/3qIILm9VTZfn98GefRKe783I
	95o1dFYYZrprlzwJ/VU4BPFPrHowDQycQnTYBFxmwZ2h6NWGLus7mE8lfbpEAGjpRox6
	fpDE0jyWTChAkI/f/p0UCEwMwRLHJoqs2uo5vXmVJtjgdMZwnRMk05pGRzE+mmDDHQ6G
	UB6w==
X-Gm-Message-State: AKS2vOydLvmuZgfWV+VGlaOvKjt/57Y/KTFNyDE+tq+djWNd4sJE5NNj
	p+AXq3HTGuM32r6XhmsO9uOFR4igE+0B
X-Received: by 10.55.102.214 with SMTP id a205mr12451603qkc.154.1497619467568; 
	Fri, 16 Jun 2017 06:24:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 16 Jun 2017 06:24:07 -0700 (PDT)
In-Reply-To: <1497270450-8104-1-git-send-email-changhyeok.bae@gmail.com>
References: <1497270450-8104-1-git-send-email-changhyeok.bae@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Jun 2017 14:24:07 +0100
Message-ID: <CAJTo0LbJ2PN9Ky0GVPW0SMup3UjSh=5UD5PfwOYh0m9i8gvypA@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Fri, 16 Jun 2017 13:24:27 -0000
Content-Type: multipart/alternative; boundary="94eb2c0580a85f9d16055213b433"

--94eb2c0580a85f9d16055213b433
Content-Type: text/plain; charset="UTF-8"

On 12 June 2017 at 13:27, Changhyeok Bae <changhyeok.bae@gmail.com> wrote:
> +do_install_ptest_append() {
> +    # exclude binary files or the package won't install
> +    for d in ssltest_old v3ext x509aux; do
> +        rm -rf ${D}${libdir}/${PN}/ptest/test/$d
> +    done

PN needs to be BPN, as PN is eg lib32-openssl in multilib builds.

Also there's a do_install_ptest in openssl.inc, just edit that directly.

Ross

--94eb2c0580a85f9d16055213b433
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 12 June 2017 at 13:27, Changhyeok Bae &lt;<a href=
=3D"mailto:changhyeok.bae@gmail.com">changhyeok.bae@gmail.com</a>&gt; wrote=
:<br>&gt; +do_install_ptest_append() {<br>&gt; + =C2=A0 =C2=A0# exclude bin=
ary files or the package won&#39;t install<br>&gt; + =C2=A0 =C2=A0for d in =
ssltest_old v3ext x509aux; do<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf $=
{D}${libdir}/${PN}/ptest/test/$d<br>&gt; + =C2=A0 =C2=A0done<br><br><div>PN=
 needs to be BPN, as PN is eg lib32-openssl in multilib builds.</div><div><=
br></div><div>Also there&#39;s a do_install_ptest in openssl.inc, just edit=
 that directly.</div><div><br></div><div>Ross</div></div>

--94eb2c0580a85f9d16055213b433--
