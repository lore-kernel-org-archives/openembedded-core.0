Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1E443776EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 14:25:50 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id r45so32598767qte.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 07:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Gz00fRpOnuwVEZWafhTNr9aI2GiuFBnfSgkPTYufqOg=;
	b=sYabujD4RDmSPRVAt9shKY8aaaaaasHymf+q2OA7M55koO3u6dSZK0uOh3CE+unGHE
	qgJUFnk+vnyrQrrXXOEG3LlVWNKq6dXoV8hR/ATNaU+hiXhDyG7b9sIHXVYlGo3494/J
	cPN7ZJGg05EjBmkhg90OdfNENGHN0rK1Mci1Z4JQI3C4uyJgs2mkIxoMaKnF5RMzBq6K
	zWGEpISxRfnF3kaAeeSSvujtFlEsZ5TBG91b0cBEo35pzFcmqnaKcESd4/TgHMKLqHS0
	cxaBremgIDfl7T9vefbIPAG/7RkXSg4xW0VDOU4mflGpNqWyjrXrM1u19y3f6tRGj3/q
	qMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Gz00fRpOnuwVEZWafhTNr9aI2GiuFBnfSgkPTYufqOg=;
	b=p73EX7QB8Xa1YMtOBl0jaExcjFxMPyUe01oW+ayBl9LgP1m/mazR8H0clTzP6C25Ss
	anNDaxwzhtqKlnI4RwXSNO/XlTxpSCT0vjhleO2IkO2QzIX6Fh4xVJX/1L4qdC+jICNS
	VSsS686t/sekEVIeDyZg5ch4r1Pkdl0hhz6OmN7oWelWgaOi3ZHPKrAT1NvUSn0DKNS2
	FPeaR24mGs1OCLPFnuic23KSDa0lsq3IHA+FVmA+MCVFAjLmqk77osc5TfUN1PohQ7ae
	hfMVAYN8XLQ0RgMv5obHRWkhtAy0CI1hztVib/NFOBer7YhFrrJECxljuaqHEwhYEr+N
	H55Q==
X-Gm-Message-State: AMke39mPhpVFMzFyiSd7YG6FEfbp3yKWC4vT9yN+aGEOeq3X20V5GT91j1gnWcIrreE+Pifx/bH7iOeRJnAN4vts
X-Received: by 10.237.42.164 with SMTP id t33mr35217135qtd.105.1489415151913; 
	Mon, 13 Mar 2017 07:25:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 13 Mar 2017 07:25:31 -0700 (PDT)
In-Reply-To: <1f37f25a651a235703fc7b51d799ee2d329ac94b.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<1f37f25a651a235703fc7b51d799ee2d329ac94b.1489144807.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Mar 2017 14:25:31 +0000
Message-ID: <CAJTo0LYj=MbWW-VdQk5y7PmOy4wuwYspfLvXZai=-t3nAzc5vQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 21/44] rootfs_rpm.bbclass: migrate image creation to dnf
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
X-List-Received-Date: Mon, 13 Mar 2017 14:25:51 -0000
Content-Type: multipart/alternative; boundary=94eb2c0cfe220dcdc8054a9d7d15

--94eb2c0cfe220dcdc8054a9d7d15
Content-Type: text/plain; charset=UTF-8

On 10 March 2017 at 11:24, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +        raise NotImplementedError("Adding remote dnf feeds not yet
> supported.")
>

I think this is a 2.4M4 blocker if the series merges into M3.

Ross

--94eb2c0cfe220dcdc8054a9d7d15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 March 2017 at 11:24, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":3vz" class=3D"a3s aXjCH m15ab7fa53ffca248">+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 raise NotImplementedError(&quot;Adding remote <span class=3D"=
il">dnf</span> feeds not yet supported.&quot;)<br></div></blockquote></div>=
<br>I think this is a 2.4M4 blocker if the series merges into M3.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--94eb2c0cfe220dcdc8054a9d7d15--
