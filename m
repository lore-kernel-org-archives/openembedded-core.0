Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4402E74B6F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 18:36:36 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id p18-v6so29787560wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 11:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=08pO5WQp5UzZQyg7k1LoT/sibgs4BfkAu6bmQw1oCFU=;
	b=B/bxguwMUlOAW50M6lE/POjwIApXxAJVnHpHlfGPihaV2erQwOZ6L2fFESOzra2diK
	lfPSGk9+J4elebE6mnTqcQbLC+nUD3uSDofPhSwmqdZFOPnrGOLs+g4MwIema3u0Vm8F
	U4CezRQblMibZenAXgOoh+n8UbEmWIxRpz4B+1OmPm7QHpVD1t/Afo12usyFIFeze7YN
	H5XdIYCZRQHHz1FgDYnkmUL/WmKM4OUPll+b5Xjrhz4Ef0SWZM3JtJVAhWEZYxjDNSJ9
	bVVnWCzpboyjxeTkd7r9wS5UbInIieji+eZ1PmRnBSNJyHbZcEFSamoOMKFGVoRPUbNV
	bsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=08pO5WQp5UzZQyg7k1LoT/sibgs4BfkAu6bmQw1oCFU=;
	b=f9Ho9zq3kbUPdOw1JjaPk78Ub7amqStaNn5zIZNUmRwFySkjNFpPCCQF5xTxnSLF29
	kGZmqxFPEaaEWW94EMYwSOlYJtmbVrphAzAo03SKSx/aUt+d7zF4Km5CnI1AwxMsev14
	p0neDjZPOrYIvEVFsHLFknV1rogwP45GcpB6qEEERu9bSSbjg5bj6OMc4bF0FOsWzyEQ
	KDyXl2U7D4SteJBUgNDguyMzWjBlgeP/D0kncJ2odwBleMxTkf2onEGPCsNmDZbhBkjq
	DC+E/qsuQbTAuXnRrKKAo/PI1U6v37cuTcsuQMNOnmZSTY0RydCt/6o/NaRS/jtEu/yn
	RY6w==
X-Gm-Message-State: ALQs6tABDR381r6QlfbjCK42Ej1TnAYPSjicBcT74lSIVAy4XLlr37Ob
	soj6N0rAEqScCeAXhPaLEIqL+aXeJQHww/TDuMs=
X-Google-Smtp-Source: AB8JxZq02BAgwOB0CpYHQ2+GdQKStp8r7T1P4Fjc0cbuAvCGBD1OBjaqWrL/tFw6n3JwVoCNUWNRF1ZezIrdbFSIBYU=
X-Received: by 2002:adf:ea8a:: with SMTP id
	s10-v6mr29197411wrm.223.1525718197743; 
	Mon, 07 May 2018 11:36:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Mon, 7 May 2018 11:36:37 -0700 (PDT)
In-Reply-To: <20180507154845.GA17081@linux-uys3>
References: <20180507152701.12046-1-twoerner@gmail.com>
	<CA+chaQfbViBTpaV3rOXd1Q9NBnViSLAjb-obywEi7y1rpJAz5w@mail.gmail.com>
	<20180507154845.GA17081@linux-uys3>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 7 May 2018 20:36:37 +0200
Message-ID: <CA+chaQcND8r7N9KsYTv+JW4VMSBuAPyp3UgTGG0r4aqv5Kis8g@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace: switch source URI
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
X-List-Received-Date: Mon, 07 May 2018 18:36:37 -0000
Content-Type: multipart/alternative; boundary="0000000000003436c1056ba1f367"

--0000000000003436c1056ba1f367
Content-Type: text/plain; charset="UTF-8"

Checksums don't need any special treatment with downloadfilename parameter.

On Mon, May 7, 2018 at 5:48 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> Hi Martin,
>
> On Mon 2018-05-07 @ 05:33:26 PM, Martin Jansa wrote:
> > There is already a fix for this, see:
> > http://lists.openembedded.org/pipermail/openembedded-core/
> 2018-May/150423.html
>
> Oops, I should have checked, sorry!
>
> > Using github archives is even worse as they are regenerated from time to
> > time.
>
> Crazy! But good to know.
>
> > Also when you really want to use v${PV}.tar.gz archive, then
> > use downloadfilename parameter to fetch it with some more meaningful
> > filename and to prevent possible conflicts with other badly named
> tarballs.
>
> Oh, I see, in one's own DL_DIR. So (not that this patch is relevant
> anymore)
> instead of:
>
>         -SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${
> PV}.tar.bz2 \
>         -"
>         +SRC_URI = "https://github.com/efficios/
> babeltrace/archive/v${PV}.tar.gz"
>
> better:
>
>         -SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${
> PV}.tar.bz2 \
>         -"
>         +SRC_URI = "https://github.com/efficios/
> babeltrace/archive/v${PV}.tar.gz;downloadfilename=babeltrace-v${PV}.tar.gz
> "
>
> In this case, would the checksums need a tweak too, or do they know to look
> for the downloadfilename file name?
>

--0000000000003436c1056ba1f367
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Checksums don&#39;t need any special treatment with downlo=
adfilename parameter.</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Mon, May 7, 2018 at 5:48 PM, Trevor Woerner <span dir=3D"ltr">=
&lt;<a href=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Martin,<br>
<span class=3D""><br>
On Mon 2018-05-07 @ 05:33:26 PM, Martin Jansa wrote:<br>
&gt; There is already a fix for this, see:<br>
&gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2=
018-May/150423.html" rel=3D"noreferrer" target=3D"_blank">http://lists.open=
embedded.org/<wbr>pipermail/openembedded-core/<wbr>2018-May/150423.html</a>=
<br>
<br>
</span>Oops, I should have checked, sorry!<br>
<span class=3D""><br>
&gt; Using github archives is even worse as they are regenerated from time =
to<br>
&gt; time.<br>
<br>
</span>Crazy! But good to know.<br>
<span class=3D""><br>
&gt; Also when you really want to use v${PV}.tar.gz archive, then<br>
&gt; use downloadfilename parameter to fetch it with some more meaningful<b=
r>
&gt; filename and to prevent possible conflicts with other badly named tarb=
alls.<br>
<br>
</span>Oh, I see, in one&#39;s own DL_DIR. So (not that this patch is relev=
ant anymore)<br>
instead of:<br>
<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -SRC_URI =3D &quot;<a href=3D"http://www.effici=
os.com/files/babeltrace/babeltrace-${PV}.tar.bz2" rel=3D"noreferrer" target=
=3D"_blank">http://www.efficios.com/<wbr>files/babeltrace/babeltrace-${<wbr=
>PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +SRC_URI =3D &quot;<a href=3D"https://github.co=
m/efficios/babeltrace/archive/v${PV}.tar.gz" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/efficios/<wbr>babeltrace/archive/v${PV}.tar.<wbr>=
gz</a>&quot;<br>
<br>
</span>better:<br>
<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -SRC_URI =3D &quot;<a href=3D"http://www.effici=
os.com/files/babeltrace/babeltrace-${PV}.tar.bz2" rel=3D"noreferrer" target=
=3D"_blank">http://www.efficios.com/<wbr>files/babeltrace/babeltrace-${<wbr=
>PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -&quot;<br>
</span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 +SRC_URI =3D &quot;<a href=3D"https://gi=
thub.com/efficios/babeltrace/archive/v${PV}.tar.gz;downloadfilename=3Dbabel=
trace-v${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/efficios/<wbr>babeltrace/archive/v${PV}.tar.<wbr>gz;downloadfilename=3D<w=
br>babeltrace-v${PV}.tar.gz</a>&quot;<br>
<br>
In this case, would the checksums need a tweak too, or do they know to look=
<br>
for the downloadfilename file name?<br>
</blockquote></div><br></div>

--0000000000003436c1056ba1f367--
