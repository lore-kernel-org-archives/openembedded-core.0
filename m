Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id E1785719A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 08:50:12 +0000 (UTC)
Received: by mail-yb0-f174.google.com with SMTP id j82so95441129ybg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 00:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P8z1gqmzz2jGGjQnKLGjBSxc3gSOG+5qEg+tiBzvYEQ=;
	b=tnjFn09PdBWM1f7chfoOkPkhDIZEDX/FDdoblqGYDzOI1aWXcR4inMSDK93e+g4a+Y
	/CjcM17af4nRmJ5JAlhOlPunzH3V4/P9bBb010RDI+usFg/UkJxOBJH0E9f9YtgGbn8f
	dn87VXxdgJq/dA0O3mS7CjASYlfsIKEk+qvPKg6em95PYlyHRBO6XMM+TI3CKLAkez7g
	LwmQfJZnkx34pLRuyxGX3aDcTEyk73v8frNJNbuiNbFe9DBR1RD7+zDF8dMO+fqILrBn
	ULVkaDgn+mj6/kI2UULGZkLnulOo2PFlVa3TW8Xhx72GZsngPzPKlMxb5xBvR+6M2ACc
	MQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P8z1gqmzz2jGGjQnKLGjBSxc3gSOG+5qEg+tiBzvYEQ=;
	b=Bp2n2DdNKcJpFrXqeIRejdJ4wAfLKuaIBTXux6mqWCTkJ0YDtCpCla3xGySPPDdui+
	vyNIXTSawYnMhOV0ZEEDhdZXoC1gOmmuDDzKeablD1f2DytSAr7E7nhUNh+AWNgQ8C9v
	TalGLhsz73KzIjloXii+RRkvsrXfNT9y9P21J9AViuyt/aVvKUHZoM1yLCsqj3g5Bvj7
	WBNm8itZnyUoSgucgWCopPaD/FEsh2WUHwhy10z3gQ4vrZTOsVZfnP6Zj0qYVnrGraL8
	zOEIUantMRwQEA5zKcRrSea183EEH+LSZaVk9FVn93h4Wlwun0MZmoY7ni5rJZU930+c
	dLYw==
X-Gm-Message-State: AIkVDXLwTxbNRvXyNlOFWPPmRMuOJ+/5LefMpJk8zopw9I+aDIAtMzrGncLU18kI8yAhw2ZKsdHhm+u1MeTTaYVf
X-Received: by 10.37.211.210 with SMTP id e201mr6403641ybf.99.1485247812984;
	Tue, 24 Jan 2017 00:50:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Tue, 24 Jan 2017 00:49:42 -0800 (PST)
In-Reply-To: <1485241990-67089-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1485241990-67089-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 24 Jan 2017 10:49:42 +0200
Message-ID: <CAHiDW_Hfmw51JuCq6m+ACR0vd-GYz28r8pVDQr77OXNbdAZMCw@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] elfutils: 0.166->0.168
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
X-List-Received-Date: Tue, 24 Jan 2017 08:50:13 -0000
Content-Type: multipart/alternative; boundary=94eb2c1475724c15d60546d334ac

--94eb2c1475724c15d60546d334ac
Content-Type: text/plain; charset=UTF-8

On 24 January 2017 at 09:13, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> 1) Upgrade elfutils from 0.166 to 0.168
> 2) Delete 1 patch below to make it compatible with new version
>     elfcmp-fix-self-comparision.patch
> 3) Modify 4 patches below to make it compatible with new version
>     elfutils-0.166/hppa_backend.diff -> elfutils-0.168/hppa_backend.diff
>     elfutils-0.166/mips_backend.diff -> elfutils-0.168/mips_backend.diff
>     elfutils-0.166/m68k_backend.diff -> elfutils-0.168/m68k_backend.diff
>     elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
> -> elfutils-0.168/0001-build-Provide-alternatives-for-
> glibc-assumptions-hel.patch
>

The last one is now showing as one removed and one added patch. Please use
git rename detection to make it more readable:

$ git config diff.renames copies

Thanks,
  Jussi

--94eb2c1475724c15d60546d334ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 24 January 2017 at 09:13, Zheng Ruoqin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.f=
ujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">1) Upgrade elfutils from 0.166 to 0.168<br>
2) Delete 1 patch below to make it compatible with new version<br>
=C2=A0 =C2=A0 elfcmp-fix-self-comparision.<wbr>patch<br>
3) Modify 4 patches below to make it compatible with new version<br>
=C2=A0 =C2=A0 elfutils-0.166/hppa_backend.<wbr>diff -&gt; elfutils-0.168/hp=
pa_backend.<wbr>diff<br>
=C2=A0 =C2=A0 elfutils-0.166/mips_backend.<wbr>diff -&gt; elfutils-0.168/mi=
ps_backend.<wbr>diff<br>
=C2=A0 =C2=A0 elfutils-0.166/m68k_backend.<wbr>diff -&gt; elfutils-0.168/m6=
8k_backend.<wbr>diff<br>
=C2=A0 =C2=A0 elfutils-0.166/0001-build-<wbr>Provide-alternatives-for-<wbr>=
glibc-assumptions-hel.patch -&gt; elfutils-0.168/0001-build-<wbr>Provide-al=
ternatives-for-<wbr>glibc-assumptions-hel.patch<br></blockquote><div><br></=
div><div>The last one is now showing as one removed and one added patch. Pl=
ease use git rename detection to make it more readable:</div><div><br></div=
><div>$ git config diff.renames copies<br></div><div>=C2=A0</div><div>Thank=
s,=C2=A0</div><div>=C2=A0 Jussi</div></div></div></div>

--94eb2c1475724c15d60546d334ac--
