Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id CD2B471AD1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 16:09:23 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id 68so10275565ite.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 08:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e5cmsTawogWPeaGodRoh6gmAkVJaWY/JQMkwNLKFMv8=;
	b=g1IDDwX8uzihmInvLLzDHPgajjxNazCR4Spjm0TsilO2E1UodfUFWDQz8tnxF9Ia8R
	P1vdkHoSZd908ypAoD2QBszPc12KSirUjzhqG68COmvZgC1/C7joKvN++ID6Qy9AAQnJ
	ziYQ3501Kv2W9FfRZLbWANZ2xIfLlWv39rogYglaTR6V7z9cyA5Sm6KcdYbSLZjoxCzQ
	KtH2JjoifYSEL46dJFa1f6JiBoGwjN4bSOIG89v3P2FPNbReI1O3LoX/U0bpJpBqhijq
	OzMVnVtDooegfRJojOR22CPMxvrbbNyZPHRLdj1lwr6kpfRwUzHgL7IO2e4wmuOCWsMh
	vJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e5cmsTawogWPeaGodRoh6gmAkVJaWY/JQMkwNLKFMv8=;
	b=FzGjatWRq7Oydjyb11rOErbKO7YxGQS/SO9GkM6E94KVQeWY3HlKXYpbWGjvIjvm7u
	vOGE6wOPuK9k7AQfobVkb/W5iZAuEQl/xTAjM11Fw0eqopUwOxkB+DmxUHfl13tLaqph
	usetNWXljalwqTPSuBkT18R++hKC+t9OJEsGDFCPgWUsnttIosD15q87DTItsYEA7KN+
	ezbwG4PQMv4LOa6w9bYp02jWfHlZmpB1Iqm0HBQlZsMj4d0HqghfhmqMzRUZVuF0QnlQ
	FOTqtRXVEzzBaadQ1ugAIEe8COTqJC/54hBZNouFgVIZboIbDQ28OSBA3Xzj5kgvL19G
	+JVg==
X-Gm-Message-State: AKwxyteGATudp7re45HWQzO6UFY+MHtZIMqzIXdv1kuq5ytvqq76i158
	jm1KZV+Z8hDMMa8jl4x4o+Ouq8VNyiyH9l+vKik7bw==
X-Google-Smtp-Source: AH8x227lQaZHSI4JDFGnomQ6O66Pb2n9Om6dRcxjhdQyU5f4P1CPQsUPxlnAbvBwqX+rlWLTxCHSsCNg9qZM3DsM8ZQ=
X-Received: by 10.36.86.20 with SMTP id o20mr8879360itb.53.1516637364975; Mon,
	22 Jan 2018 08:09:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 22 Jan 2018 08:09:04 -0800 (PST)
In-Reply-To: <CAP9ODKqi_TL9_LVCxiiW2iXfc+=jF7OYdm-rA2puudZojYtvTA@mail.gmail.com>
References: <20180117160330.30173-1-otavio@ossystems.com.br>
	<CAP9ODKqi_TL9_LVCxiiW2iXfc+=jF7OYdm-rA2puudZojYtvTA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jan 2018 16:09:04 +0000
Message-ID: <CAJTo0LZrzh4-=Bi5F2q0N_Bk3utxihFZn51J09kM9qZngm7dXw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] cmake: upgrade 3.9.5 -> 3.10.1
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
X-List-Received-Date: Mon, 22 Jan 2018 16:09:23 -0000
Content-Type: multipart/alternative; boundary="001a1144d5ea64bfc905635fa710"

--001a1144d5ea64bfc905635fa710
Content-Type: text/plain; charset="UTF-8"

Look again :)

On 22 January 2018 at 16:04, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Wed, Jan 17, 2018 at 2:03 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > The 3.10.1 version has been in Dec 13, 2017, and has a great set of
> > features and improvements since the last upgrade.
> >
> > The release notes of 3.10 release is available at:
> >
> > https://cmake.org/cmake/help/v3.10/release/3.10.html
> >
> > Patches updates:
> >
> >  - cmake-Prevent-the-detection-of-Qt5.patch: so it replaces the sed
> >    command calls inside the cmake.inc
> >
> >  - 0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch:
> >    merged upstream, so it has been removed.
> >
> >  - support-oe-qt4-tools-names.patch: rebased.
> >
> > License-checksum-change: added new contributors
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Is there any reason why it didn't make master yet?
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

--001a1144d5ea64bfc905635fa710
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Look again :)</div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On 22 January 2018 at 16:04, Otavio Salvador <span dir=
=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"=
_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><span class=3D"">On Wed, Jan 17, 2018 at 2:03 PM, Ota=
vio Salvador<br>
&lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&=
gt; wrote:<br>
&gt; The 3.10.1 version has been in Dec 13, 2017, and has a great set of<br=
>
&gt; features and improvements since the last upgrade.<br>
&gt;<br>
&gt; The release notes of 3.10 release is available at:<br>
&gt;<br>
&gt; <a href=3D"https://cmake.org/cmake/help/v3.10/release/3.10.html" rel=
=3D"noreferrer" target=3D"_blank">https://cmake.org/cmake/help/<wbr>v3.10/r=
elease/3.10.html</a><br>
&gt;<br>
&gt; Patches updates:<br>
&gt;<br>
&gt;=C2=A0 - cmake-Prevent-the-detection-<wbr>of-Qt5.patch: so it replaces =
the sed<br>
&gt;=C2=A0 =C2=A0 command calls inside the cmake.inc<br>
&gt;<br>
&gt;=C2=A0 - 0001-FindCUDA-Use-find_<wbr>program-if-find_host_program-<wbr>=
is-no.patch:<br>
&gt;=C2=A0 =C2=A0 merged upstream, so it has been removed.<br>
&gt;<br>
&gt;=C2=A0 - support-oe-qt4-tools-names.<wbr>patch: rebased.<br>
&gt;<br>
&gt; License-checksum-change: added new contributors<br>
&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.=
com.br">otavio@ossystems.com.br</a>&gt;<br>
<br>
</span>Is there any reason why it didn&#39;t make master yet?<br>
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
</font></span></blockquote></div><br></div>

--001a1144d5ea64bfc905635fa710--
