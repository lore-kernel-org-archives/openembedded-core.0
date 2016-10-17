Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id A5A8B6006E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 11:43:30 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id f5so1968078ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 04:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=69PSIatigtEKnV4VfXOMvjHG2AWgsgjHjccdJTi9wPI=;
	b=ypufAQKAlHF+k8jNKybINzya8XU/rsfZltWmYF8SDPS7LLvXj6IqNwUXdVAjAFMsfw
	Tu4Qvl/3Zwih8ZreZ5Rg1GXay9em0KAh4C7qR37YBxseTu2Pv+VO0MltxPVu9mA7slxy
	pKaGAPvFLptAVaFLVdJy3f51KLk7l83KWILE6yrqMCH5m3CiCcnu+ySsNEG1bZV5cSOp
	dnmOG6Tn2Cd6B0RBDl/4u9d96DOHTzVgkdDKqvxbRQSKn99iLawF60iIkZ49TnIPzjlN
	tiNgK9KD2ly/Tg1OHHGXHY936Fp5S7fHTyT1mW1S5sbJxN1JN9c2ps6GmxxEcDCL43bD
	8MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=69PSIatigtEKnV4VfXOMvjHG2AWgsgjHjccdJTi9wPI=;
	b=ZCw0uf6jQpxS/vTs4VVUiv4ltyX8L6Zs+NAKxRxENJAegCFE9LRWME4X7eL/u7c0wH
	NqHAOlsREkD4zV7LuDGD5jMM3I16vzg1jn5wdyg/TaS8PcRIOX3QjAP20w+OD3fe8XRa
	p//Yjz7V8tF6OyhD4bnV51MNK6MwkEC0kTZU+kJPp4X76rPeIChFwc5XhR2E2rsaJAcW
	MvNIZN6IFBpunOxs5g3h/jYoXo1nFHuvmNrNmRcWQJi6AJmB14UsoVUKFxeVgOlMOmnI
	bDtAUhXFSOM7sTRXjawPPfZdA60GBTNtmyRt5yrGHDVPgeQOk+1m8tnjNjAyVB7MJOkL
	H3DQ==
X-Gm-Message-State: AA6/9RlY5yvVcVH8Vn9ynkmDAkUoZs6RnIbHyCn3aD3VrX9am+9/4RMp6bxAff6CR10q3rrU268h2F82YA3XLtXM
X-Received: by 10.107.138.15 with SMTP id m15mr22790173iod.127.1476704611914; 
	Mon, 17 Oct 2016 04:43:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.168.146 with HTTP; Mon, 17 Oct 2016 04:43:11 -0700 (PDT)
In-Reply-To: <eda6033af281eb32bc8f7e3da98043d03d35b9cd.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<eda6033af281eb32bc8f7e3da98043d03d35b9cd.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Oct 2016 12:43:11 +0100
Message-ID: <CAJTo0LbqjMG1w+cVQMq6C1yNWRz0mtCt9QvVPAOnV-Gic5M9Sg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/9] selftest: skip test_recipetool_create_git on poky-tiny distro
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
X-List-Received-Date: Mon, 17 Oct 2016 11:43:30 -0000
Content-Type: multipart/alternative; boundary=001a113feb3cd4fc84053f0e1519

--001a113feb3cd4fc84053f0e1519
Content-Type: text/plain; charset=UTF-8

On 14 October 2016 at 17:40, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> +        if self.distro == 'poky-tiny':
> +            self.skipTest('Test not possible with poky-tiny because it
> requires a libx11 provider')
>

Same as the other one - change the test to use a recipe that doesn't need a
DISTRO_FEATURE that is often disabled.

Ross

--001a113feb3cd4fc84053f0e1519
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 October 2016 at 17:40,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leona=
rdo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.=
gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":1e1" class=3D"a3s aXjCH m157c4110ca0b041a">+=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if self.distro =3D=3D &#39;poky-tiny&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;Test not poss=
ible with poky-tiny because it requires a libx11 provider&#39;)<br></div></=
blockquote></div><br>Same as the other one - change the test to use a recip=
e that doesn&#39;t need a DISTRO_FEATURE that is often disabled.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113feb3cd4fc84053f0e1519--
