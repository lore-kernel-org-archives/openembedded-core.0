Return-Path: <raj.khem@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id A2E0B6B3B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:42:59 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id i18so1676010oag.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2013 08:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=y3YsFP+INfH4CkfeA9YjV4EW7aMisKzo3G54mvzk0mA=;
	b=hoKdOFqi5DNGixyKu7cx75Mcqs+OEG2UgF0x+mQUdH+6M21A/w3c3lmniVUALSijli
	7xao//WMhlKmVoxTz13aK0S21d7nOddDUvTqhb+jdy9MzX4ShK6pQSyPTyZErIZBTpf8
	/OdqAXTWAZCeEfwf3EWwezcHpwgLn/ftD19+mApy45+zr7Jy5qw90bY8oMcn7WUXhdQl
	ZPdbgJYnsP8kqp3tazvDGXx9aoWodqQ+1BF2244Dgn9U6qdi2Fgeev7y4SFSC0X1RUsx
	ahqSEn1X9ZUsd1Im2kvUAutcFxPm+cxw0SNcC121Nk+EF+9sUevhhTuUL5WlzRbkLueD
	poPw==
MIME-Version: 1.0
X-Received: by 10.43.77.137 with SMTP id zi9mr650987icb.106.1375458179292;
	Fri, 02 Aug 2013 08:42:59 -0700 (PDT)
Received: by 10.50.216.137 with HTTP; Fri, 2 Aug 2013 08:42:59 -0700 (PDT)
In-Reply-To: <CAP9ODKqkn3WH=qohEVySc02rS12xJ3-N84drrApmJc7HYSRqOw@mail.gmail.com>
References: <1375394875-23238-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKqkn3WH=qohEVySc02rS12xJ3-N84drrApmJc7HYSRqOw@mail.gmail.com>
Date: Fri, 2 Aug 2013 08:42:59 -0700
Message-ID: <CAMKF1spDbJ9QNfBcF8J=c4O8k0jhWYbSiAB9x-3kBtVc0=-vxg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.8: Fix meta-fsl-arm iperf build issue
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
X-List-Received-Date: Fri, 02 Aug 2013 15:43:00 -0000
Content-Type: multipart/alternative; boundary=e89a8ff2496f2e52e904e2f8d0e0

--e89a8ff2496f2e52e904e2f8d0e0
Content-Type: text/plain; charset=UTF-8

On Friday, August 2, 2013, Otavio Salvador wrote:

> On Thu, Aug 1, 2013 at 7:07 PM, Khem Raj <raj.khem@gmail.com<javascript:;>>
> wrote:
> > This should fix the problem seen where gcc ICE
> > was happening when compiling iperf with older 2.6.x
> > kernel
>
> In fact it is 'perf', not iperf ;-)



Blame vim


>
> > Test this patch by reverting below commit in meta-fsl-arm
> >
> > commit daf582c93a7283fb0af3b25fe2ada48f4c9985c4
> > Author: Otavio Salvador <otavio@ossystems.com.br <javascript:;>>
> > Date:   Tue Jul 2 11:52:51 2013 -0300
> >
> >     perf: Disable FPU tune for i.MX5 SoCs to workaround GCC ICE
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com <javascript:;>>
> > CC: Otavio Salvador <otavio@ossystems.com.br <javascript:;>>
>
> Tested-by: Otavio Salvador <otavio@ossystems.com.br <javascript:;>>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br <javascript:;>>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

--e89a8ff2496f2e52e904e2f8d0e0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, August 2, 2013, Otavio Salvador  wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Thu, Aug 1, 2013 at 7:07 PM, Khem Raj &lt;<a href=3D"j=
avascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#=
39;)">raj.khem@gmail.com</a>&gt; wrote:<br>

&gt; This should fix the problem seen where gcc ICE<br>
&gt; was happening when compiling iperf with older 2.6.x<br>
&gt; kernel<br>
<br>
In fact it is &#39;perf&#39;, not iperf ;-)</blockquote><div><br></div><div=
><br></div><div>Blame vim</div><div><span></span>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">

<br>
&gt; Test this patch by reverting below commit in meta-fsl-arm<br>
&gt;<br>
&gt; commit daf582c93a7283fb0af3b25fe2ada48f4c9985c4<br>
&gt; Author: Otavio Salvador &lt;<a href=3D"javascript:;" onclick=3D"_e(eve=
nt, &#39;cvml&#39;, &#39;otavio@ossystems.com.br&#39;)">otavio@ossystems.co=
m.br</a>&gt;<br>
&gt; Date: =C2=A0 Tue Jul 2 11:52:51 2013 -0300<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 perf: Disable FPU tune for i.MX5 SoCs to workaround GCC =
ICE<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"javascript:;" onclick=3D"_e(eve=
nt, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.khem@gmail.com</a>&g=
t;<br>
&gt; CC: Otavio Salvador &lt;<a href=3D"javascript:;" onclick=3D"_e(event, =
&#39;cvml&#39;, &#39;otavio@ossystems.com.br&#39;)">otavio@ossystems.com.br=
</a>&gt;<br>
<br>
Tested-by: Otavio Salvador &lt;<a href=3D"javascript:;" onclick=3D"_e(event=
, &#39;cvml&#39;, &#39;otavio@ossystems.com.br&#39;)">otavio@ossystems.com.=
br</a>&gt;<br>
Acked-by: Otavio Salvador &lt;<a href=3D"javascript:;" onclick=3D"_e(event,=
 &#39;cvml&#39;, &#39;otavio@ossystems.com.br&#39;)">otavio@ossystems.com.b=
r</a>&gt;<br>
<br>
--<br>
Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://projetos.ossyst=
ems.com.br" target=3D"_blank">http://projetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile:=
 +1 (347) 903-9750<br>
</blockquote>

--e89a8ff2496f2e52e904e2f8d0e0--
