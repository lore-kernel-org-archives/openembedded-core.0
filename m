Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3434760797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 16:29:27 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 38so164503130iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tW4BjtadaX8yDGLGekEQH45hS/s/Tqu9yFdat/5OrMM=;
	b=v6zTNCOCehnH0wYDfOp0QM3Ub9YnNzIj3obhkVKZTDn2GY1cli5OqQg2JfYK4ToW2I
	95S36xhqPBmxDoHQYTokqYLWqOK75/VCTdAqUlg9Gc2k9/iyDD2ukhOdIIcT2X0f/7RP
	1NRBsp7EBzViv8bJtSRMu4hgFnrkdFr8WK3e/R2rXhesLyHpQ/5qMIQCvxqyVyi7TN/l
	nHFoa/1lf8cfNDh3tq8YU9xuE1OC6PA8fvEgyA2vAIkECo0ivrSfTcO2gc6JzbBNL3fC
	PBAxVXhxfmdiAzyusnJ8C6iGBthzlUrhJ7YCtxu8eFD4vZNF87LH8hjIDaOfpXFsmAOH
	OYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tW4BjtadaX8yDGLGekEQH45hS/s/Tqu9yFdat/5OrMM=;
	b=Ub+vim4iFz1goQ19bYMdyyOMknKRBACZfROgI8VDQfcLh2ukDZI0Tns8DHJwwa8X1z
	4wLpusiXotb6VHZieVylJrPFA1au0lTxbNk1H9z7Xf4XiBrdcitwN9RCkIH6RkEJaZnh
	ijdEgzo/pU1I4b2dDioUHnQYKnjXUoJHP1RzfeSoTXKT60nsNqux//2p5uAFkANGN1e/
	STTvU2NxEY83anSgexBpHUleGc4fXctXLtYxeDolpZP9jKD2E1BZqlqEqhXfktSQB0Hi
	m/EGGD8NXNFTRiAHPr+ROaF6t4E3gQwrXUlDpW4SPkFnKbCfWWD085HBO7HfOeBWbyCm
	OIkA==
X-Gm-Message-State: ALyK8tIxtztm0h1wNNS2YmF2Z/uabbEdAkdYLTX6iz6oabOFzxW0VApqnFR6Hul1ZN+jrNfvM2tt1tMGZfhyq+QO
X-Received: by 10.107.138.212 with SMTP id c81mr33217038ioj.148.1468859367901; 
	Mon, 18 Jul 2016 09:29:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 18 Jul 2016 09:29:08 -0700 (PDT)
In-Reply-To: <CAP9ODKp++LrcTb0wpKCiC3oPY4iLJzCdEmWd-xastZRqZu48dw@mail.gmail.com>
References: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
	<1468852986-2487-3-git-send-email-tom.hochstein@nxp.com>
	<CAP9ODKp++LrcTb0wpKCiC3oPY4iLJzCdEmWd-xastZRqZu48dw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jul 2016 17:29:08 +0100
Message-ID: <CAJTo0LZd_8RmNnvnS0gW=pVmj3QQO8FbZmBjN-jARfBL_NqmgA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] weston-init: Fix weston-start to allow weston args without openvt args
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
X-List-Received-Date: Mon, 18 Jul 2016 16:29:29 -0000
Content-Type: multipart/alternative; boundary=001a113ed932d9619a0537eb78fa

--001a113ed932d9619a0537eb78fa
Content-Type: text/plain; charset=UTF-8

I can only see 1/3 and 3/3, but no 2/3.

On 18 July 2016 at 16:13, Otavio Salvador <otavio.salvador@ossystems.com.br>
wrote:

> On Mon, Jul 18, 2016 at 11:43 AM, Tom Hochstein <tom.hochstein@nxp.com>
> wrote:
> > The parser didn't properly handle commands of the form
> > weston-start -- <weston-options>.
> >
> > Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>
>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ed932d9619a0537eb78fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can only see 1/3 and 3/3, but no 2/3.</div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On 18 July 2016 at 16:13, Otav=
io Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossyste=
ms.com.br" target=3D"_blank">otavio.salvador@ossystems.com.br</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Jul 18,=
 2016 at 11:43 AM, Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.co=
m">tom.hochstein@nxp.com</a>&gt; wrote:<br>
&gt; The parser didn&#39;t properly handle commands of the form<br>
&gt; weston-start -- &lt;weston-options&gt;.<br>
&gt;<br>
&gt; Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.c=
om">tom.hochstein@nxp.com</a>&gt;<br>
<br>
<br>
<br>
</span>Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com=
.br">otavio@ossystems.com.br</a>&gt;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--001a113ed932d9619a0537eb78fa--
