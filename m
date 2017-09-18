Return-Path: <matt@madison.systems>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6B82C781F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 22:50:31 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id e1so989454pfk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 15:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=+ToCF/5WrHJa0v82N+ghpW3a35RUhYRMCEZh7QM010M=;
	b=BOK28qkcjviiPYbdicaBNY+5AMu+78J+wU4vMzPYokQDgphejY7T1sgWrULKFxfb/O
	YZMmixIJxopTZklZU/XxUo5w58wsDohaQV6pQYsYlFNcw16rhYBjwDX8fbyRtaXuQmpM
	6kwtCdwe9pv7LyLumOEz/LpHPCEhKYHoqnsWremkoNAV9lOWRaGZE6r/zcEhVcBzXN/D
	hjZi5Yk0Bu+VggDZ3aEvmdIRELBtyRueUcm/mPhdBTEJQif6HX0LRB6FRzaTXt6SfMrF
	dxExuPRO76cXUPodz6B59TDfv3y1JkoXd57Pe3GMvemYIkAeT5QoO/HKPL7TXalYmnWg
	oiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=+ToCF/5WrHJa0v82N+ghpW3a35RUhYRMCEZh7QM010M=;
	b=UPuOjUhXc2/1usNZzhyrb1oy2ruC9DYcp2AnE+03sjDJ9hcZt7iDf3B4RZ4WpvkWOl
	sVUW7IsKcwPoVpJ7f0F90FVWa76EvRH0e8LFh39IB4vJtnYlnvd17EfoW5mqFaDbf19j
	8VAYQtXq2LVmYP0QzeD/+WHw6JYA1OUitgwwd/V6CcZJAaCid02rgE93C0Mv3ap2J5Yt
	Y7qbqGl+wZHsS/kJV/kIVZp9dZW4A9wHKeZIgyXMnC1wk3ZjfxOO5vUDgmIrOKnNpSIS
	nly+DsXXsYNmpQXEzhpOayw5V4MXo+9K845CaPsPxpL9xS+OvuiU1olqEWpf5fIMqkY+
	/z8Q==
X-Gm-Message-State: AHPjjUh48Ir3eSw8XbHEF8GbXjpbIvhYJI+V/kBLmsoRHk3hvaQXY9VC
	Pdkr+xcxyKsI2qmu
X-Google-Smtp-Source: AOwi7QACYIn41jD14SXHGtmP+Kmd3Bv4XfZVVKIhrlzbfO4CtIV4h4fgkMVY4J1Mo8TFfWF1Jk1yTQ==
X-Received: by 10.99.95.147 with SMTP id t141mr138627pgb.340.1505775032598;
	Mon, 18 Sep 2017 15:50:32 -0700 (PDT)
Received: from [172.16.1.17] (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185])
	by smtp.gmail.com with ESMTPSA id s62sm484344pfe.91.2017.09.18.15.50.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 15:50:31 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
Message-Id: <20878500-1BB2-43F0-A6A5-087775FC0FAB@madison.systems>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Mon, 18 Sep 2017 15:50:29 -0700
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF41E3E8@ALA-MBC.corp.ad.wrs.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
References: <007BD92917A2324FA403BCF9A464CF84CF41E3E8@ALA-MBC.corp.ad.wrs.com>
X-Mailer: Apple Mail (2.3273)
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: go-runtime does not build for mips32r2 tune
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
X-List-Received-Date: Mon, 18 Sep 2017 22:50:31 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_732F226C-2AEB-443B-9C9D-EBAF73C2A44A"

--Apple-Mail=_732F226C-2AEB-443B-9C9D-EBAF73C2A44A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 18 Sep 2017, at 2:11 PM, Slater, Joseph <joe.slater@windriver.com> =
wrote:
>=20
> This is the default tune for qemumips.  It appears that the problem =
does not occur for an oe-core checkout just before the split creating =
go-runtime.
>=20
> Before the split, go-helloworld will build, but after the split it =
will not because it needs go-runtime.

There=E2=80=99s a TUNE_CCARGS_remove in go_1.9.bb to remove the =
=E2=80=98-march=3Dmips32r2=E2=80=99 flag that probably either needs to =
be moved to a .inc file or copied to go-runtime_1.9.bb.  Missed that =
when splitting out the runtime recipe.

-Matt
>=20
> Joe


--Apple-Mail=_732F226C-2AEB-443B-9C9D-EBAF73C2A44A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 18 Sep 2017, at 2:11 PM, Slater, Joseph &lt;<a =
href=3D"mailto:joe.slater@windriver.com" =
class=3D"">joe.slater@windriver.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
style=3D"font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; direction: ltr; font-family: Tahoma; =
font-size: 10pt;" class=3D"">This is the default tune for qemumips. =
&nbsp;It appears that the problem does not occur for an oe-core checkout =
just before the split creating go-runtime.<div class=3D""><br =
class=3D""></div><div class=3D"">Before the split, go-helloworld will =
build, but after the split it will not because it needs =
go-runtime.</div></div></div></blockquote><div><br =
class=3D""></div>There=E2=80=99s a TUNE_CCARGS_remove in go_1.9.bb to =
remove the =E2=80=98-march=3Dmips32r2=E2=80=99 flag that probably either =
needs to be moved to a .inc file or copied to go-runtime_1.9.bb. =
&nbsp;Missed that when splitting out the runtime recipe.</div><div><br =
class=3D""></div><div>-Matt<br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div style=3D"font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; direction: =
ltr; font-family: Tahoma; font-size: 10pt;" class=3D""><div class=3D""><br=
 class=3D""></div><div =
class=3D"">Joe</div></div></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_732F226C-2AEB-443B-9C9D-EBAF73C2A44A--
