Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id A170E6E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:09:12 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so58868019igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=o8o2BSQhBeWuxEDZNOSwXz0TpCp6aIqe7Q/+bVzX5q0=;
	b=w2dnDqR3GXJnalaCjptiGSL5Lz7Bk9tpPL6dV/YVpKfqbLU0nyQWFBHDc9xD0uFAiy
	mxCq3c8CUV51B1QJDYqQH3IDJzAewepT2ICuXzL1eecIMx4Aw8lVEA9ccBY1t24ysf/g
	KkSRtd7JTZUkkyPGmP7u4k/HhdAuJYXJ1bOORCgAPT20RL5/V1mU14YhqPsXtXEkf9yP
	uwuE4PudRCtbFBE1BqRgNA+m81LDncS4bLZGJZyHduu4k+Jv9ySAp4MkLiSc3tU0GHd4
	yBW7pI4FWS5rEbBQIQLb3fq2eGqYWwk1wZFVsLrrVGu+d7tmnIm/z3UiGiERsqB3PBTu
	UlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=o8o2BSQhBeWuxEDZNOSwXz0TpCp6aIqe7Q/+bVzX5q0=;
	b=eR1isZ4c0OihLBnZ9l7ds1C+5sTkFbXc4FaG2KhThth358imXrKgIP8LMOfvO44Y26
	nkkpwIQRafNQD/9bp46Mf725TdmJuRun6Y7Z+rAOxpJa3jHwcmWroSaU2jBRxJvxy23K
	HP1tkrWgXvGb30W5Nvmo5xovSjpxSnJjsIf7lWGpSn7EHn2Z1qyARQ+WTC5A03Q/NRRF
	0sIpijodQVbh7Psq1UV7YNlSNXLKhzuFaGSPJ65w8uzzmcLT8ZD6WfsWWGELjnqUzihT
	EoNF7R0TVRaWkX9+ZpTx+uwY9hg7p9x35pBPdce/lpuWrioFgZCNS1J7SRwFa1xi3njI
	zASg==
X-Gm-Message-State: ALoCoQm9Pfq6RcY9EoG6VHOIrjhRs4qIwWRW/03WNGg7Iql2Dv+Iqewb4ESNtbITGIVBqdMzFS5t
X-Received: by 10.50.155.33 with SMTP id vt1mr5589863igb.64.1447686552337;
	Mon, 16 Nov 2015 07:09:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 07:08:52 -0800 (PST)
In-Reply-To: <1447652032-31142-1-git-send-email-jian.liu@windriver.com>
References: <1447652032-31142-1-git-send-email-jian.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 15:08:52 +0000
Message-ID: <CAJTo0LZcvVSoNnndi1qU5Pv3K5UfmpkcfRhzdQwFot6BeHrbvA@mail.gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver.bbclass: fix an exception of the mode configured
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
X-List-Received-Date: Mon, 16 Nov 2015 15:09:13 -0000
Content-Type: multipart/alternative; boundary=001a11343daab2e1c30524a9cae9

--001a11343daab2e1c30524a9cae9
Content-Type: text/plain; charset=UTF-8

On 16 November 2015 at 05:33, Jian Liu <jian.liu@windriver.com> wrote:

> +        if d.getVarFlag('do_configure', 'noexec') == '1' or
> 'do_configure' not in d.getVar('__BBTASKS', False):
>

__BBTASKS is internal so shouldn't beused unless you have an awesome
reason.  Richard tells me that d.getVarFlag('do_configure', 'task') is
probably what you want.

Ross

--001a11343daab2e1c30524a9cae9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 November 2015 at 05:33, Jian Liu <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:jian.liu@windriver.com" target=3D"_blank">jian.liu@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":3d3" class=3D"" style=3D"ov=
erflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVarFlag(&#39;do_configu=
re&#39;, &#39;noexec&#39;) =3D=3D &#39;1&#39; or &#39;do_configure&#39; not=
 in d.getVar(&#39;__BBTASKS&#39;, False):<br></div></blockquote></div><br>_=
_BBTASKS is internal so shouldn&#39;t beused unless you have an awesome rea=
son.=C2=A0 Richard tells me that d.getVarFlag(&#39;do_configure&#39;, &#39;=
task&#39;) is probably what you want.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a11343daab2e1c30524a9cae9--
