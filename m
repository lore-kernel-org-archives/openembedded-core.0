Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id D356772425
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 17:46:00 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id et14so976080pad.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 09:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Po8PiD0IhoHF+6PZ9TOLKkbpJiz2EwwEVud5Q8iDRcc=;
	b=xXq1Jo+L24rXUp3sx1jQMho1iK14WAB4CYmHubsuMA7VlTmA8aW2BRorBgE1MSo/mR
	ghVhv6zlhPLLkLJ03187U7t8ixGX/1Fgr60+1xFd33uVVHcTYFQ6Wkz1zbD0GwTHvhiv
	HjW05cQ28Y8leNSww3VplJ7q5InYjtDFaki6BkV+zyVzCvksXJm6NaBDpUrDr2YohGmN
	QsU5dpVD1+VacGNRBHzVcolFzRn5OIxEZ/XgJD0kvmyq/IQkXR0gF4Qel4DGDSlU3hJL
	2NHS1gH1cKANKUCnacq23oms4rlQAwwSa4Pr8b9pqpvt9LRZA5oQKCPJTpRufsOcA0zZ
	3K1g==
X-Received: by 10.68.227.104 with SMTP id rz8mr7787200pbc.4.1418147160360;
	Tue, 09 Dec 2014 09:46:00 -0800 (PST)
Received: from [192.168.0.27] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id y7sm2071150pdm.12.2014.12.09.09.45.59
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Dec 2014 09:45:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYU0nsiL1dhNYfreEXhAkedL_wCHAH3uaWOMwmtfmpUkw@mail.gmail.com>
Date: Tue, 9 Dec 2014 09:45:58 -0800
Message-Id: <DCCDBEA5-76C4-4E70-883B-A55AACD43ADA@gmail.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<32c8d18dbaf01579b0804bb19f81eb08ecb01bfa.1415350038.git.kai.kang@windriver.com>
	<CAJTo0LZUZLN5BoMcPGhdE4+bzOmcW5U6HEfJC0iM9i=kq4vUOQ@mail.gmail.com>
	<548654DF.1010301@windriver.com>
	<CAJTo0LYU0nsiL1dhNYfreEXhAkedL_wCHAH3uaWOMwmtfmpUkw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1993)
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
X-List-Received-Date: Tue, 09 Dec 2014 17:46:07 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A028C9FC-BD24-4113-80CE-D328DCBE5834"

--Apple-Mail=_A028C9FC-BD24-4113-80CE-D328DCBE5834
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Dec 9, 2014, at 3:56 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 9 December 2014 at 01:48, Kang Kai <Kai.Kang@windriver.com =
<mailto:Kai.Kang@windriver.com>> wrote:
> In the following var definition, it uses PROFILE_TOOLS_X:
>=20
> RRECOMMENDS_${PN} =3D "\
>     perf \
>     trace-cmd \
>     kernel-module-oprofile \
>     blktrace \
>     ${PROFILE_TOOLS_X} \
>     ${PROFILE_TOOLS_SYSTEMD} \
>     "
>=20
> I suppose that use SYSPROF_aarch64 doesn't work here.
>=20
> But this is exactly what lttng does:
>=20
> SYSPROF=3D=E2=80=9Csysprof"

shouldn=E2=80=99t this be ?=3D for better understasnding

> SYSPROF_aarch64=3D=E2=80=9C"
> RRECOMMENDS_${PN} =3D "${SYSPROF}"
>=20
> Ross
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A028C9FC-BD24-4113-80CE-D328DCBE5834
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Dec 9, 2014, at 3:56 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 9 December 2014 at 01:48, Kang Kai <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:Kai.Kang@windriver.com" =
target=3D"_blank" class=3D"">Kai.Kang@windriver.com</a>&gt;</span> =
wrote:<br class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1cq" =
class=3D"a3s" style=3D"overflow:hidden">In the following var definition, =
it uses PROFILE_TOOLS_X:<br class=3D"">
<br class=3D"">
RRECOMMENDS_${PN} =3D "\<br class=3D"">
&nbsp; &nbsp; perf \<br class=3D"">
&nbsp; &nbsp; trace-cmd \<br class=3D"">
&nbsp; &nbsp; kernel-module-oprofile \<br class=3D"">
&nbsp; &nbsp; blktrace \<br class=3D"">
&nbsp; &nbsp; ${PROFILE_TOOLS_X} \<br class=3D"">
&nbsp; &nbsp; ${PROFILE_TOOLS_SYSTEMD} \<br class=3D"">
&nbsp; &nbsp; "<br class=3D"">
<br class=3D"">
I suppose that use SYSPROF_aarch64 doesn't work =
here.</div></blockquote></div><div class=3D"gmail_extra"><br =
class=3D""></div>But this is exactly what lttng does:</div><div =
class=3D"gmail_extra"><br =
class=3D"">SYSPROF=3D=E2=80=9Csysprof"</div></div></div></blockquote><div>=
<br class=3D""></div><div>shouldn=E2=80=99t this be ?=3D for better =
understasnding</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra">SYSPROF_aarch64=3D=E2=80=9C"</div></div></div></bloc=
kquote><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra">RRECOMMENDS_${PN} =3D =
"${SYSPROF}"</div><div class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">Ross</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_A028C9FC-BD24-4113-80CE-D328DCBE5834--
