Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 21BA17745D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 16:18:20 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id l127so126653688iof.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 08:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y5Sgv6QQR+dVLDpsZyMMIzSgMET5bGMA9cwTPw4TizM=;
	b=K1brSQ/I9IOwOeKdJEs9Fw3+ZeFNXMbnRjnTWzonw9/fA36fz02kIM4Oi+v7zNdexN
	aN/X9CFwLW3oGubP3Mv2oXkBmv+A4K0MJVoO0HxJFQjtWjt2RGNnksmoWq8yn0+kNjDD
	MZryNlGbksUsbaMe+D1LarEc9b+1h0VVHZlpdBLOQIrnWi+34XEOn/4XYtIeBEg92F9t
	YuUk3PxwvQ5Ywvq7IVP1GLHudQ7aGSQ6JdjflJDNQf6DMOO17AnLFnowaFTliZmYTgIF
	10JkB1uzJniWrpSfy9GkpQrA+d/sxRXspJDo9BUL6oLnlZpZvvnDD+WOcPkz9cuGGAem
	jECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y5Sgv6QQR+dVLDpsZyMMIzSgMET5bGMA9cwTPw4TizM=;
	b=nIdSrxnVKUyhQcxmQSsBG/x5uLTS5za5Ie/lpMqyjDQz83BORgB+fZjI5j8zMsowi2
	UvyIqPKmNASJDJLCk13iX2ITlvDUZhm6OG+E8h9z7orDnq9jowCUtAVGQ2z9/HcT9NEO
	YLVn5zWEychUyru0yKSo0N86W1+BiJseyNkn/MxJsqbnklmwFGV4qxtCmsolhs1gWvbi
	nKbR4wVL2DbRILknmcU39I702vNaKEUytZM1iOhInLtXanBfqyUJAwBV9lhMkEgE92jn
	iSlKBoWM46cGvNMnlpa2ZJD/I/6GpeQa7nZ4XPRaI45QHD7U2P0cYfu1p9imsj0sOmje
	cB/A==
X-Gm-Message-State: AG10YOS/SyzJ4HqwziKowvmJGWvOdfl10183vSft7lGn9aWE7ZjT8Ms39FALaBrHJ2V0wngHfD86qphp7SoNdyW1
X-Received: by 10.107.137.92 with SMTP id l89mr9936555iod.133.1456503501345;
	Fri, 26 Feb 2016 08:18:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 26 Feb 2016 08:18:01 -0800 (PST)
In-Reply-To: <f45b931dcb786d3afbfc6aa9dcacc9a9b74c317e.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
	<f45b931dcb786d3afbfc6aa9dcacc9a9b74c317e.1448547850.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Feb 2016 16:18:01 +0000
Message-ID: <CAJTo0LYw=jLVQhFJuEYxObFPGC_ShEgpRiL+BJVBu6em=MrFKA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/29] qemu.bbclass: add qemu_wrapper_cmdline()
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
X-List-Received-Date: Fri, 26 Feb 2016 16:18:21 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb4d02bae052caea5ba

--001a113ebdb4d02bae052caea5ba
Content-Type: text/plain; charset=UTF-8

On 26 November 2015 at 14:26, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L "
> + rootfs_path\
> +            + " -E LD_LIBRARY_PATH=" + string.join(library_paths, ":") +
> " "
>

It's idiomatic to use ":".join and Python 3 has removed string.join
entirely, so can you use ":".join please.

Ross

--001a113ebdb4d02bae052caea5ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 November 2015 at 14:26, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":lo" class=3D"" style=3D"overflow:hidden">+=C2=A0 =C2=A0 return &quot;P=
SEUDO_UNLOAD=3D1 &quot; + qemu_binary + &quot; &quot; + qemu_options + &quo=
t; -L &quot; + rootfs_path\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + &quot; -E LD_LIBRARY_PATH=3D&q=
uot; + string.join(library_paths, &quot;:&quot;) + &quot; &quot;</div></blo=
ckquote></div><br>It&#39;s idiomatic to use &quot;:&quot;.join and Python 3=
 has removed string.join entirely, so can you use &quot;:&quot;.join please=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a113ebdb4d02bae052caea5ba--
