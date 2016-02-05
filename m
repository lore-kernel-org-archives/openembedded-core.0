Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 51E53770E3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:31:58 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id f81so129759871iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 06:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Xg8aR786nG69Xri8D8ch+jn1crYFATArC1h3DpTOFu8=;
	b=HJPnNNhFa/5evGaeK1rXPy9hxUvSutIvrEwkyCvHnA1LSZvW3h30cjCplzmJVjL8v2
	bE64EC2k2ZOIdfXzoRfFJluINNFuGx9oepXJg6onVp4F8Uo5QJ0ke452uTt08aA1w5XF
	bTi3Z92k+l4uyrvHGPBiPD0OODvHw7Len/9Mq3onwXr09+AvqiWUptyyCX5UozUb6BJQ
	cQJ8uqtFgQRQT+PwxFAcNoZ1iKoVmhJ1RLu0QVjHqsVNz0viazsgmtW4RfbQxxst4fzK
	//yvs8q5ax6GZ6AeonR4+FACsodOqh2JISKd5B0MZ7UF2uT/32ko7DJKL0aX5WK9Wugc
	bNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Xg8aR786nG69Xri8D8ch+jn1crYFATArC1h3DpTOFu8=;
	b=GezIGV8upMbgRhFDifN6kEuM9XQee6tqEjJAWg02aQIOyIPJubS9TCJy5shRP/WMbM
	DPki94OiB2hkKQXKp2O21M2iYDQIFwE3LGbJSW/9eB8WjVwvc6US8lYLE8ATs6EmXKdv
	TdWo1FnzfTEa+P4jZBmAYVfCJZ7tKkTmbflTWl1suJVbXXnrMugPvKnjlAIn/Mtlujtr
	Jiv/VhKhytKqWaQn3Xrr2LDlDQcQf8Qj01dOn/q8g2BHqkNXzsrfRpYUOroYmzXV3L9O
	gQboropFEShboCHNsxPMY+qdc5MsXsE9WaOLROfkmeF58i8bynZwBf/Z8y1TRFjxeLcb
	JW7w==
X-Gm-Message-State: AG10YORWkm4VdUlrf39m3BE2a7Zz6C5VVPgrxB8La7/UJib6KThr3kGZ2ObgQCpLJRjnNMVm7igh0NaZVnaM3KO+
X-Received: by 10.107.137.92 with SMTP id l89mr1916489iod.133.1454682719771;
	Fri, 05 Feb 2016 06:31:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 5 Feb 2016 06:31:40 -0800 (PST)
In-Reply-To: <1454680824-26075-3-git-send-email-markus.lehtonen@linux.intel.com>
References: <1454680824-26075-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1454680824-26075-3-git-send-email-markus.lehtonen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Feb 2016 14:31:40 +0000
Message-ID: <CAJTo0LaHHNGPTTLDnDai4ArYBkSZDQb+1tmQ18vPDpzH4ef_EQ@mail.gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] oe/gpg_sign: check for python-pexpect when using local signing
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
X-List-Received-Date: Fri, 05 Feb 2016 14:31:59 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb4c5f257052b06b61b

--001a113ebdb4c5f257052b06b61b
Content-Type: text/plain; charset=UTF-8

On 5 February 2016 at 14:00, Markus Lehtonen <
markus.lehtonen@linux.intel.com> wrote:

> +            msgs.append("Please install python-pexpect that is needed by
> lcocal gpg signing.")
>

Isn't this only needed if signing RPMs?  Hopefully in the future this class
will be used for more than RPM signing and detached signing doesn't need
pexpect.

Also, typo in "local".

Ross

--001a113ebdb4c5f257052b06b61b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 February 2016 at 14:00, Markus Lehtonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:markus.lehtonen@linux.intel.com" target=3D"_blank">markus.lehton=
en@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":f5s" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 msgs.append(&quot;Please install python-pexpect th=
at is needed by lcocal gpg signing.&quot;)<br></div></blockquote></div><br>=
Isn&#39;t this only needed if signing RPMs?=C2=A0 Hopefully in the future t=
his class will be used for more than RPM signing and detached signing doesn=
&#39;t need pexpect.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Also, typo in &quot;local&quot;.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ebdb4c5f257052b06b61b--
