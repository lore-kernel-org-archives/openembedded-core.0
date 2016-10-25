Return-Path: <tcflorea@yahoo.com>
Received: from nm47-vm9.bullet.mail.gq1.yahoo.com
	(nm47-vm9.bullet.mail.gq1.yahoo.com [67.195.87.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4A16057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 21:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1477431980; bh=fTF1C8qSTgoyPDIQGNSExHv7KBNHGhV/Nx6AnhyI0Rs=;
	h=Date:From:Reply-To:To:Subject:References:From:Subject;
	b=gRY04hArzusEBOsF00sOE/G104yqeCABL9ETAVqr7YRT90YO4ZNvluBbXRo/nzoBJCCm7Eg2skl23kLNWx7vp4Iu9YAtK7S64O3dd4bt4kodAjclAJmg1xaYC0986aJHqrOWIsb8FgWNfokC1bXR7+MD34Dj1+tbk/urIJB8J/iixpTITUv9oQy/dyBDQzC5Rys+2ZW2LHckG+ImymKtSk6c6SFXW4gvOb6fVCtKTN/neyNSwS12oDhmeqfZjum3FWIjX2nxPRs9P0IPk4tziLIcPHMwSanHnedhi/0wIq7LqCt6pVn0nIMdC0sUiooqmyD5tis6td8dPf3NINcPMA==
Received: from [127.0.0.1] by nm47.bullet.mail.gq1.yahoo.com with NNFMP;
	25 Oct 2016 21:46:20 -0000
Received: from [98.137.12.174] by nm47.bullet.mail.gq1.yahoo.com with NNFMP;
	25 Oct 2016 21:43:35 -0000
Received: from [98.139.214.32] by tm13.bullet.mail.gq1.yahoo.com with NNFMP;
	25 Oct 2016 21:43:35 -0000
Received: from [98.139.212.195] by tm15.bullet.mail.bf1.yahoo.com with NNFMP;
	25 Oct 2016 21:43:35 -0000
Received: from [127.0.0.1] by omp1004.mail.bf1.yahoo.com with NNFMP;
	25 Oct 2016 21:43:35 -0000
X-Yahoo-Newman-Property: ymail-4
X-Yahoo-Newman-Id: 104716.61371.bm@omp1004.mail.bf1.yahoo.com
X-YMail-OSG: i51qEWoVM1lyixZxhwZosLjo5qTCXL3NR78Z8MX39HSX.cwnqS03LGVPfRqdhTW
	af_85OdKS5TNn55Wm2dy2GqdCcdhpFS8ZzImbuDh7boNFXI56YKr.ZvxBmQ6.um0QLDQ5s5BiMFw
	OEQhDDpYTCH9v0BUcp_XUSyFnaHhaylNdXAxcRwxHPWfNIif7_pkcWu4MFRBoAK2pqDrT3QBAhIR
	woqEbqff3gFGBelEq.NvT4Ugb36b7.qINNT2Pn0wApj_.BNjAdYzzepyzJeGPiTE92DYltI7PYXr
	wTtZXwC1EJTD07nZeJfJgvopJlQbHKRSQ71TgI1vcqKCZ6qaXM9KZ1q6GJx1rsbyA6.rl_EQr86g
	l4mY_j6Wb7AKvp1jOmHdqNeCZtsbNG1e9IrQ1uBq0hxfOPeJq3XMqoiUCFUe671inCcceLDYyV9t
	wiOIPux3bXkl9LDPyEb.MtjU3D5G9Yv85JHjWoQhEvJJLAYrCfBrnt0gy0j1Wi2MA3JsFFqbXUg4
	zLycTEN4kzt5XbSV5TVzmjXfUkUfUBkQjMnlCB6Rl23aW05Jk
Received: from jws400131.mail.bf2.yahoo.com by
	sendmailws125.mail.bf1.yahoo.com;
	Tue, 25 Oct 2016 21:43:34 +0000; 1477431814.685
Date: Tue, 25 Oct 2016 21:43:08 +0000 (UTC)
From: Tudor Florea <tcflorea@yahoo.com>
Reply-To: Tudor Florea <tcflorea@yahoo.com>
To: "jkrishnanjanappa@mvista.com" <jkrishnanjanappa@mvista.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <709988291.930326.1477431788589@mail.yahoo.com>
MIME-Version: 1.0
References: <709988291.930326.1477431788589.ref@mail.yahoo.com>
Subject: Re: [master][morty][PATCH] libunwind: add ptest support
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
X-List-Received-Date: Tue, 25 Oct 2016 21:46:19 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_930325_1917350690.1477431788587"

------=_Part_930325_1917350690.1477431788587
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jagadeesh,

> The patch include below changes:
...
> 2. Some of the libunwind test cases such as run-check-namespace,
>=C2=A0=C2=A0=C2=A0 run-coredump-unwind require debug symbols to be present=
 in
>=C2=A0=C2=A0=C2=A0 libunwind library. So set INHIBIT_PACKAGE_STRIP to "1".
> --- a/meta/recipes-support/libunwind/libunwind_git.bb
> +++ b/meta/recipes-support/libunwind/libunwind_git.bb
...
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +

The change above have the effect of inhibiting the package strip even if pt=
est=C2=A0 is not enabled at all. I think this have to be something specific=
 to ptest.
You may consider using INSANE_SKIP_${PN}-ptest [1] and add unstripped binar=
ies needed for ptest in {PN}-ptest (along with the original - stripped - on=
es) or simply consider the appropriate tests as XFAIL for openembedded.
Regards,
=C2=A0 Tudor.

[1] http://www.yoctoproject.org/docs/2.1/ref-manual/ref-manual.html#ref-cla=
sses-insane



------=_Part_930325_1917350690.1477431788587
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"color:#000; background-color:#fff; f=
ont-family:garamond, new york, times, serif;font-size:16px"><div id=3D"yui_=
3_16_0_ym19_1_1477346198248_20479" dir=3D"ltr">Hi Jagadeesh,<br id=3D"yui_3=
_16_0_ym19_1_1477346198248_20596"><br id=3D"yui_3_16_0_ym19_1_1477346198248=
_20597">&gt; The patch include below changes:<br id=3D"yui_3_16_0_ym19_1_14=
77346198248_20598">...<br id=3D"yui_3_16_0_ym19_1_1477346198248_20599">&gt;=
 2. Some of the libunwind test cases such as run-check-namespace,<br id=3D"=
yui_3_16_0_ym19_1_1477346198248_20600">&gt;&nbsp;&nbsp;&nbsp; run-coredump-=
unwind require debug symbols to be present in<br id=3D"yui_3_16_0_ym19_1_14=
77346198248_20601">&gt;&nbsp;&nbsp;&nbsp; libunwind library. So set INHIBIT=
_PACKAGE_STRIP to "1".<br id=3D"yui_3_16_0_ym19_1_1477346198248_20602">&gt;=
 --- a/meta/recipes-support/libunwind/libunwind_git.bb<br id=3D"yui_3_16_0_=
ym19_1_1477346198248_20603">&gt; +++ b/meta/recipes-support/libunwind/libun=
wind_git.bb<br id=3D"yui_3_16_0_ym19_1_1477346198248_20604">...<br id=3D"yu=
i_3_16_0_ym19_1_1477346198248_20605">&gt; +INHIBIT_PACKAGE_STRIP =3D "1"<br=
 id=3D"yui_3_16_0_ym19_1_1477346198248_20606">&gt; +<br id=3D"yui_3_16_0_ym=
19_1_1477346198248_20607"><br id=3D"yui_3_16_0_ym19_1_1477346198248_20608">=
The change above have the effect of inhibiting the package strip even if pt=
est&nbsp; is not enabled at all. I think this have to be something specific=
 to ptest.<br id=3D"yui_3_16_0_ym19_1_1477346198248_20611">You may consider=
 using INSANE_SKIP_${PN}-ptest [1] and add unstripped binaries needed for p=
test in {PN}-ptest (along with the original - stripped - ones) or simply co=
nsider the appropriate tests as XFAIL for openembedded.<br id=3D"yui_3_16_0=
_ym19_1_1477346198248_20613">Regards,<br id=3D"yui_3_16_0_ym19_1_1477346198=
248_20614">&nbsp; Tudor.<br id=3D"yui_3_16_0_ym19_1_1477346198248_20615"><b=
r id=3D"yui_3_16_0_ym19_1_1477346198248_20616">[1] <a href=3D"http://www.yo=
ctoproject.org/docs/2.1/ref-manual/ref-manual.html#ref-classes-insane" clas=
s=3D"" id=3D"yui_3_16_0_ym19_1_1477346198248_20626">http://www.yoctoproject=
.org/docs/2.1/ref-manual/ref-manual.html#ref-classes-insane</a><br></div><d=
iv id=3D"yui_3_16_0_ym19_1_1477346198248_20674"><br></div><div id=3D"yui_3_=
16_0_ym19_1_1477346198248_20728"><br></div></div></body></html>

------=_Part_930325_1917350690.1477431788587--
