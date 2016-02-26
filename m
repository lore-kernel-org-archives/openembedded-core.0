Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id AF17E7745E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 16:35:41 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id hb3so37953945igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 08:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=73YaqMPI+/mGWfS/mjknyumnFjxs5EbCqfJiRkUpcT0=;
	b=wCZfgbnFOVERG111vFztWtkQtJ+zeGph4s1vsJG0Ro/MHDB5yB9k3+DWZNLF1tbxqu
	2PdNRYfwCrAr3qc+INFNiWNsY+ki7iuS4wM3doTMkVD3MBeorQwcHgavhUM1yfdmsf4n
	UfaHHbUFzaZdSdzpusdfsCgIOM1ksgAnoG+V49T2xaRLCUqCd3OHkTcn2Vb8SXhufvir
	tGcnMfE9D3gq6Rk4vFfRsAAQWf3pgzB95dzooVYiv9BARarSGd2EZ3uob6BGYOrhVXB+
	F8UMpSkrL2u1sXqubWd7uXox0M8gIhgOEnDwVJl6z/5yvrfThjsDqbiLu0hFktC5q7TB
	a+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=73YaqMPI+/mGWfS/mjknyumnFjxs5EbCqfJiRkUpcT0=;
	b=AglS0Aimck/n/1LQ2PQxXjcoD+qvMmUZi/MU8MmZcpbPleL61A8aS9ZW3fOpD9sNXB
	0llhhpZkPpE5L0N6nyCJyXEOGUEzFEQRiTBmewmzxheGvRzs48hKr3dOG1vijICWM41R
	+e+HSfskDRLbwz5+XLb+QhTUoxXlfIFgctcQKUh6tClHEft9dI3ctWvxwRYcooBqpTmN
	KLGVI3zTXW+oA27PWUhaC6weQv1QHZ99m+4e1c7+VABOYNx5urhQ6CedFZhMqv1KCx1w
	8n7Oa2PL3vva8qJKWNoBIGOaFe0Of7zikGnGd+av/DMc48QadtFrMM7S7nqgSPCRZaQj
	B94Q==
X-Gm-Message-State: AD7BkJJswMQ0+fS9fsrM6HEGLtnfG+Fu2MiakZNB89Ci21zGGBYkJctAzT5I7nMpNfW6ydyWR7waEGGbe9LUnlKp
X-Received: by 10.50.160.7 with SMTP id xg7mr3441535igb.64.1456504542117; Fri,
	26 Feb 2016 08:35:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 26 Feb 2016 08:35:22 -0800 (PST)
In-Reply-To: <ee2f85dff95a4baf789aec41cd5407c0df5c836e.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
	<ee2f85dff95a4baf789aec41cd5407c0df5c836e.1448547850.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Feb 2016 16:35:22 +0000
Message-ID: <CAJTo0LZ1ten9Z6uuCDpPd-mCVn76QgxTMO-U5Qirfsr5tQNo_w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/29] gobject-introspection: add the recipe
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
X-List-Received-Date: Fri, 26 Feb 2016 16:35:41 -0000
Content-Type: multipart/alternative; boundary=001a11339de8d8de12052caee3d4

--001a11339de8d8de12052caee3d4
Content-Type: text/plain; charset=UTF-8

On 26 November 2015 at 14:26, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +# No idea why these sources are installed by upstream and how they are
> meant to be used
> +FILES_${PN}-dev_append = " ${datadir}/gobject-introspection-1.0/tests/*.c
> \
> +                   ${datadir}/gobject-introspection-1.0/tests/*.h"
>

Presumably some test suite.  We certainly don't want them in the -dev
package, so until we have ptest for this lets just delete them.

Ross

--001a11339de8d8de12052caee3d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 November 2015 at 14:26, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":jx" class=3D"a3s" style=3D"overflow:hidden">+# No idea wh=
y these sources are installed by upstream and how they are meant to be used=
<br>
+FILES_${PN}-dev_append =3D &quot; ${datadir}/<span class=3D"il">gobject</s=
pan>-introspection-1.0/tests/*.c \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${dat=
adir}/<span class=3D"il">gobject</span>-introspection-1.0/tests/*.h&quot;<b=
r></div></blockquote></div><br>Presumably some test suite.=C2=A0 We certain=
ly don&#39;t want them in the -dev package, so until we have ptest for this=
 lets just delete them.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a11339de8d8de12052caee3d4--
