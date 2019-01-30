Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 342F26D563
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:58:10 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id h193so9795583ita.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EeV1WzDDDUKhQRB3Jy5yOR86klmspoQfIziEgSmijks=;
	b=bcWPv+lf58/HjmsTb/GRX0qFp4gN03loLwT0nBovf88C8NrECtvLnRCA3vYlPZVRGD
	m4w3eNRxFGEaBHwCh4cu6UK+09JpaHhyo6vDq5TlwE4QDSKkr0OVg576+04hMagsSCZ5
	WDUOjbzTdQshcWArQPCviM5/yfePK3C+XeY3R8gGLO+jzPkEAI+6v6npjeOaS7zz/sM+
	c9Fi5w6yd6pL2Su9k5emdwSjyf4fyuHYmebIqM0A2HtO5rwszRW/VMrt6Fd0fMRwkVBc
	E8KuDcihvU4f8aL6eQn6LcDYFgTz1+82SY66y2MbSzHENDsErybrE2MZYRJaibyIOZMB
	J12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EeV1WzDDDUKhQRB3Jy5yOR86klmspoQfIziEgSmijks=;
	b=YDO9fK7JY7y4XT7ImkJJoJ94HpgiP4j+QqH/p+mG2r4gxhpeOtUU+F+PUDLCKbwxmr
	uzjHLc0FLA08OJ75vW8duwlTFCR5nw92g0PcZSLlcq03uF2qxt6NFdWDMPcU1Npox8ZU
	YddIeq+3ItFVlInxWsJJSR5xcnEwzs2MRaYmnnt9GiPo5klBhu1QJ7HacECaSpUH1NOH
	k4V7gfle/FM2AOW3qQHqYpH5aGkh4AtfO/z9u3OkEnWlWLkOV0cTIi1tlx0r0j5TXL+F
	RLRueo7DnGqmK5mJdDaSF3nIAaLda97A0wQXZLLcLgFudcCMSr6dHQvnh55TAodPKksc
	Qozg==
X-Gm-Message-State: AJcUukcNHxSl2Kn4PEy4WKRZv+1jm8QHQD7JNswJlarhBmdrGRkvITGv
	LeKAY/VroYZqBiIIyrV5+mcsAXoxyerpW0KvJ3gPMLMZ
X-Google-Smtp-Source: ALg8bN5VjFBDruqZccXVkpR3pWM18ibtPy1iYgFhFhWT9OgcoZhS5+TkYQCmbD8TrHkb1UHrN/lpjWbSnke2Rf/pqSE=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr8047904itj.62.1548845891235;
	Wed, 30 Jan 2019 02:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20190130093638.10612-1-bunk@stusta.de>
	<20190130093638.10612-2-bunk@stusta.de>
In-Reply-To: <20190130093638.10612-2-bunk@stusta.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Jan 2019 10:58:00 +0000
Message-ID: <CAJTo0Lb5FiDvA6pqZB5Q-f8sPOU6qafrfLofTdhi8Lxo59g79A@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ref-system-requirements.xml: Sync list of supported distributions from poky.conf
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
X-List-Received-Date: Wed, 30 Jan 2019 10:58:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Documentation patches should go to yocto@lists.yoctoproject.org, and
ideally CC Scott.

Ross

On Wed, 30 Jan 2019 at 09:37, Adrian Bunk <bunk@stusta.de> wrote:
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  documentation/ref-manual/ref-system-requirements.xml | 15 +++++++++-----=
-
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/ref-manual/ref-system-requirements.xml b/docum=
entation/ref-manual/ref-system-requirements.xml
> index 500b2f8f39..f2450ab58a 100644
> --- a/documentation/ref-manual/ref-system-requirements.xml
> +++ b/documentation/ref-manual/ref-system-requirements.xml
> @@ -97,16 +97,18 @@
>                  <listitem><para>Ubuntu 15.04</para></listitem>
>                  <listitem><para>Ubuntu 15.10</para></listitem> -->
>                  <listitem><para>Ubuntu 16.04 (LTS)</para></listitem>
> -                <listitem><para>Ubuntu 16.10</para></listitem>
> -                <listitem><para>Ubuntu 17.04</para></listitem>
> +<!--            <listitem><para>Ubuntu 16.10</para></listitem>
> +                <listitem><para>Ubuntu 17.04</para></listitem> -->
> +                <listitem><para>Ubuntu 18.04 (LTS)</para></listitem>
>  <!--            <listitem><para>Fedora 16 (Verne)</para></listitem>
>                  <listitem><para>Fedora 17 (Spherical)</para></listitem>
>                  <listitem><para>Fedora 19 (Schr=C3=B6dinger's Cat)</para=
></listitem>
>                  <listitem><para>Fedora release 20 (Heisenbug)</para></li=
stitem>
>                  <listitem><para>Fedora release 22</para></listitem>
>                  <listitem><para>Fedora release 23</para></listitem>
> -                <listitem><para>Fedora release 24</para></listitem> -->
> -                <listitem><para>Fedora release 26</para></listitem>
> +                <listitem><para>Fedora release 24</para></listitem>
> +                <listitem><para>Fedora release 26</para></listitem> -->
> +                <listitem><para>Fedora release 28</para></listitem>
>  <!--            <listitem><para>CentOS release 5.6 (Final)</para></listi=
tem>
>                  <listitem><para>CentOS release 5.7 (Final)</para></listi=
tem>
>                  <listitem><para>CentOS release 5.8 (Final)</para></listi=
tem>
> @@ -128,9 +130,10 @@
>                  <listitem><para>openSUSE 12.2</para></listitem>
>                  <listitem><para>openSUSE 12.3</para></listitem>
>                  <listitem><para>openSUSE 13.1</para></listitem>
> -                <listitem><para>openSUSE 13.2</para></listitem> -->
> +                <listitem><para>openSUSE 13.2</para></listitem>
>                  <listitem><para>openSUSE 42.1</para></listitem>
> -                <listitem><para>openSUSE 42.2</para></listitem>
> +                <listitem><para>openSUSE 42.2</para></listitem> -->
> +                <listitem><para>openSUSE 42.3</para></listitem>
>              </itemizedlist>
>          </para>
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

