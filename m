Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id BF7C572532
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 11:56:24 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id m20so244516qcx.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 03:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HUjVhpajMk0X61fddVh8sBUzspYkT8B9/oBTvlWOIP8=;
	b=MK/zR5SKQuqSfnyGYw+f8QLtxMqgNjlGSH2zw4Qmr340q5/x5/u1tMwlUk3ht/gUiV
	j2HnqRWSTl1IzBO0zBmfwIedFtQ8sy0xBZZteL7mggOPwS84i9XeIgQSNd30BQGmiyXB
	BNkLqEs3QfVF5nG/tOUjy3Jl0Rm5ehNrLJ8L3F0QN7OwV1Tzcn1++KdKO9Z118QbJjaD
	siGDc1X8uv9/DltVCT3POiQyOFnsyPMfj4SfUsDj6gTimSu1WU5oRp0rkybrcMFjg2L5
	/OOwJpC8mHtlXFTbWifxMA8OLpgMf9Cd24Wk8/pd8pJudJJKajSaeIEodvg8NVVYXliA
	BHGQ==
X-Gm-Message-State: ALoCoQlu5EaA1wwW2eYcT7iwiSNR+UJdkw0KXOfqsuk5hZs7Bfs3GSYUoODOSeEI0DriqlSuB7FN
X-Received: by 10.224.25.146 with SMTP id z18mr4570507qab.17.1418126185433;
	Tue, 09 Dec 2014 03:56:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Tue, 9 Dec 2014 03:56:05 -0800 (PST)
In-Reply-To: <548654DF.1010301@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<32c8d18dbaf01579b0804bb19f81eb08ecb01bfa.1415350038.git.kai.kang@windriver.com>
	<CAJTo0LZUZLN5BoMcPGhdE4+bzOmcW5U6HEfJC0iM9i=kq4vUOQ@mail.gmail.com>
	<548654DF.1010301@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Dec 2014 11:56:05 +0000
Message-ID: <CAJTo0LYU0nsiL1dhNYfreEXhAkedL_wCHAH3uaWOMwmtfmpUkw@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/24] packagegroup-core-tools-profile: remove sysprof for aarch64
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
X-List-Received-Date: Tue, 09 Dec 2014 11:56:26 -0000
Content-Type: multipart/alternative; boundary=047d7bdc8ac087c1610509c73b4e

--047d7bdc8ac087c1610509c73b4e
Content-Type: text/plain; charset=UTF-8

On 9 December 2014 at 01:48, Kang Kai <Kai.Kang@windriver.com> wrote:

> In the following var definition, it uses PROFILE_TOOLS_X:
>
> RRECOMMENDS_${PN} = "\
>     perf \
>     trace-cmd \
>     kernel-module-oprofile \
>     blktrace \
>     ${PROFILE_TOOLS_X} \
>     ${PROFILE_TOOLS_SYSTEMD} \
>     "
>
> I suppose that use SYSPROF_aarch64 doesn't work here.
>

But this is exactly what lttng does:

SYSPROF="sysprof"
SYSPROF_aarch64=""
RRECOMMENDS_${PN} = "${SYSPROF}"

Ross

--047d7bdc8ac087c1610509c73b4e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 December 2014 at 01:48, Kang Kai <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1cq" class=3D"=
a3s" style=3D"overflow:hidden">In the following var definition, it uses PRO=
FILE_TOOLS_X:<br>
<br>
RRECOMMENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 perf \<br>
=C2=A0 =C2=A0 trace-cmd \<br>
=C2=A0 =C2=A0 kernel-module-oprofile \<br>
=C2=A0 =C2=A0 blktrace \<br>
=C2=A0 =C2=A0 ${PROFILE_TOOLS_X} \<br>
=C2=A0 =C2=A0 ${PROFILE_TOOLS_SYSTEMD} \<br>
=C2=A0 =C2=A0 &quot;<br>
<br>
I suppose that use SYSPROF_aarch64 doesn&#39;t work here.</div></blockquote=
></div><div class=3D"gmail_extra"><br></div>But this is exactly what lttng =
does:</div><div class=3D"gmail_extra"><br>SYSPROF=3D&quot;sysprof&quot;</di=
v><div class=3D"gmail_extra">SYSPROF_aarch64=3D&quot;&quot;</div><div class=
=3D"gmail_extra">RRECOMMENDS_${PN} =3D &quot;${SYSPROF}&quot;</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc8ac087c1610509c73b4e--
