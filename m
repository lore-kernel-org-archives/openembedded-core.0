Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id EDA0377BD4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 16:40:07 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id c45so73862261qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6eAsjejArKs+vRopGpkPTajuxoQWRthNxkx/d/PbLHA=;
	b=H8COT+9GYFjVkrGeeet6H7UF7AmVvH60yzAETB9XqkVkvCq+BpJrrY0g4iiqLcXFtz
	CApvEhD4lElmdhmhaSoZl7IsuzJxTna95i37Kc6fUyB0ksrSoOhX49CxLJwYySge0mn1
	g6m+TWyOUS+czxedrOJ8DDBnwGz4vVq3q/3Kfl/M6j5S9xRABp11yCMnnF3/l5xzJxZl
	Dd3AwtkQrdR2Fe6UckFt1B1TFooRu3oXXG9vI9IG0ORkUELuGnXJ9Bax1JY1vPQWNUaN
	77ceq4PJ++ff/6JYI6RqsUYLbHxsrpQkFCoJsB0FZQ7sVeA+yLdt1ndBpJ0/vU9+YUln
	aPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6eAsjejArKs+vRopGpkPTajuxoQWRthNxkx/d/PbLHA=;
	b=FK4I+//KyhhTz0clrL45669pystJK56hcsMEv/NnUSX1V7UVfOukqBSSRT8E+O9ZuW
	Q5UJF+XH0a1CY9pTD0Td9mU1f6OTlbfi1lGZNtEIFoqqZwLjbT/bpibPc9TjwgKc3gu8
	+ze7k1f4JeNmgSMcO/53hR+TwW03uFgnSteMjEpNNPhm47wY375O/Kuwq9t7FC+qKSjc
	K/WVFAT2FHcfx1hJ7KZ/Q2nZMebTIpIjuGEpDXoDfsXFEYZordoRVVs9DlL3GrY4ywBA
	7DkGm/X2kj6Nnr2UI1esR9buPYScMATgEgKWmn9mzsAlxvMvDppsfO0HtZ1xXDpzMFMH
	9+Vw==
X-Gm-Message-State: AN3rC/5M14LUBH8Mmaub/aOeCo05hYqcJeXIsvCvpSnJa4Y4BLADrwte
	y4xJSVyzyOy+qGnm25M/Pwn0R40CD+e0
X-Received: by 10.200.46.26 with SMTP id r26mr15449058qta.197.1492792808877;
	Fri, 21 Apr 2017 09:40:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 21 Apr 2017 09:39:48 -0700 (PDT)
In-Reply-To: <20170420190815.15000-3-gernot.hillier@siemens.com>
References: <20170420190815.15000-1-gernot.hillier@siemens.com>
	<20170420190815.15000-3-gernot.hillier@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Apr 2017 17:39:48 +0100
Message-ID: <CAJTo0LYSrvNfA290aqFP1Wv2CUbxgf9JBAx-wpFkYduqYGNxyg@mail.gmail.com>
To: Gernot Hillier <gernot.hillier@siemens.com>
Cc: Tim Offermann <tim.offermann@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] tcf-agent: enable default target debugging features
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
X-List-Received-Date: Fri, 21 Apr 2017 16:40:08 -0000
Content-Type: multipart/alternative; boundary=001a114708cc18c232054dafe940

--001a114708cc18c232054dafe940
Content-Type: text/plain; charset=UTF-8

On 20 April 2017 at 20:08, Gernot Hillier <gernot.hillier@siemens.com>
wrote:

> A number of features were disabled in OE due to historic problems
> on ARM. In tcf-agent 1.4, they compile cleanly on all architectures
> besides mips. These features are required for target debugging with
> Eclipse Neon, CDT and TCF plugins - for example used by Xilinx Vivado
> SDK 2016.4.
>

Would this be responsible for this failure under musl on the autobuilder:

system/GNU/Linux/tcf/context-linux.c:490:10: error: variable 'cmd' has
initializer but incomplete type
     enum __ptrace_request cmd = PTRACE_SINGLESTEP;
          ^~~~~~~~~~~~~~~~

Ross

--001a114708cc18c232054dafe940
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 April 2017 at 20:08, Gernot Hillier <span dir=3D"ltr">&lt;<a href=3D"=
mailto:gernot.hillier@siemens.com" target=3D"_blank">gernot.hillier@siemens=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border=
-left-color:rgb(204,204,204);padding-left:1ex"><div class=3D"gmail-">A numb=
er of features were disabled in OE due to historic problems<br>
on ARM. In <span class=3D"gmail-il">tcf</span>-<span class=3D"gmail-il">age=
nt</span> 1.4, they compile cleanly on all architectures<br>
besides mips. These features are required for target debugging with<br>
Eclipse Neon, CDT and <span class=3D"gmail-il">TCF</span> plugins - for exa=
mple used by Xilinx Vivado<br>
SDK 2016.4.</div></blockquote></div><br>Would this be responsible for this =
failure under musl on the autobuilder:</div><br>system/GNU/Linux/tcf/contex=
t-linux.c:490:10: error: variable &#39;cmd&#39; has initializer but incompl=
ete type<br>=C2=A0 =C2=A0 =C2=A0enum __ptrace_request cmd =3D PTRACE_SINGLE=
STEP;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~<div><br></div>=
<div>Ross</div></div>

--001a114708cc18c232054dafe940--
