Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE8A730B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 12:02:16 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id u188so355310qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 04:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1hdzXFluMeoxmvoI09lYLvsrr59qjyRYIy/DJEMFzz8=;
	b=bU1rAcARhyG+4f1texfMA5ElYp2zUxqoF1jcq+/JeFXPQP1atfK1vJkygXyA1nDYNP
	+kgoU8JCZsci72pbHu47exUx2ShomfVKUkmkFFNF+5Nrwjrv4+w8pfTfO5DC0+aq9bw7
	tM4hZg+6GJ0p2IhffI4EttTN+Y++wRmd8YX8PE2irZR1g1+nYO915IVoaR6S00efRktN
	zLl4QI1JA8fcbMopsyy+E+ws5Ntngu7Vw4gKNodfLbg/O6ZeINGFtLKgYhpdSEVmz82e
	TN7Szm8tJgpMgAiXypprxZt15XJvHYkhsltug9Xe73yzI50VA8UXGPVIn6YU1Sc14egA
	xs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1hdzXFluMeoxmvoI09lYLvsrr59qjyRYIy/DJEMFzz8=;
	b=tbeehFkBiJgBtTOmm1QvDtonlYbTxccZ1+4Y+dnDEV91Bug7OAEvuCbh80UAFHlG4C
	T39E5m+zRvK4+F9anyr4/klkm+gOjbu5jNWSf3heo0STGtUcNp/9OvzrnFhEkEqJMfqU
	cPmdrbKds337Z0Kb75YorJzKi7OjwrL+gTNlYqx1FWvQPECaEZeIB7k2dg4fqPL94Bro
	FN1s8VbY6Dbm5ENBcPyhzwqnfYJ2cCK4F3RbSFlrAVNBeOVgsLo3tST35LblFRiVj5Bz
	ghhQy4TdPLlYrMW3gaKXgTGHZe9mpIl0AK84qbsIHy40N9hh6dCD7ffkvs+Psq6xoPvo
	raOg==
X-Gm-Message-State: AMke39kqk+TzpyaKLMxVHpUe4UVsJDXgN5jZpSaSHPJ3HOA3ppn2DomfiEOFY0p6lFORVxO0srItTeZdXl1/4Z9d
X-Received: by 10.55.40.27 with SMTP id o27mr28428371qkh.221.1487764937783;
	Wed, 22 Feb 2017 04:02:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 22 Feb 2017 04:01:57 -0800 (PST)
In-Reply-To: <1487761949-13456-1-git-send-email-ed.bartosh@linux.intel.com>
References: <CA+chaQegXmqfE=3TmnYXvLdCW00QpinkXk=L27OQS5-1DnJYAQ@mail.gmail.com>
	<1487761949-13456-1-git-send-email-ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Feb 2017 12:01:57 +0000
Message-ID: <CAJTo0LY_5Lsx+okmuUzgYRuGYWqtgq_ERLj0GnzuidA__xR_dw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types_wic: fix expansion error
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
X-List-Received-Date: Wed, 22 Feb 2017 12:02:17 -0000
Content-Type: multipart/alternative; boundary=001a11441144a081da05491d44e5

--001a11441144a081da05491d44e5
Content-Type: text/plain; charset=UTF-8

On 22 February 2017 at 11:12, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> -WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(),
> '${WKS_SEARCH_PATH}') or ''}"
> +WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(),
> d.getVar('WKS_SEARCH_PATH')) or ''}"
>

I think it would be safer to always use getVar instead of using the
implicit expansion of WKS_FILES and the later expansion of WKS_SEARCH_PATH.

Ross

--001a11441144a081da05491d44e5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 February 2017 at 11:12, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5ky=
" class=3D"a3s aXjCH m15a658c9475e47bb">-WKS_FULL_PATH =3D &quot;${@wks_sea=
rch(&#39;${WKS_FILES}&#39;.<wbr>split(), &#39;${WKS_SEARCH_PATH}&#39;) or &=
#39;&#39;}&quot;<br>
+WKS_FULL_PATH =3D &quot;${@wks_search(&#39;${WKS_FILES}&#39;.<wbr>split(),=
 d.getVar(&#39;WKS_SEARCH_PATH&#39;)) or &#39;&#39;}&quot;<br></div></block=
quote></div><br>I think it would be safer to always use getVar instead of u=
sing the implicit expansion of WKS_FILES and the later expansion of WKS_SEA=
RCH_PATH.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a11441144a081da05491d44e5--
