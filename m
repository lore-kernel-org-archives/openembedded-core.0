Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id B473F76E70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 07:31:48 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so218221376wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 00:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=muLJ2Ux63QG7B9wNEa/TkkV3afjXRptQ3gyduh4YDoQ=;
	b=g44Xzdl+eQ4Jq1JXiFcDSGoDafhKNeackH+BpJ9T/SWW4yylcJ8MZ9U/RMGqiYbeqP
	ZT7VPppNraS4xBsCxasyglChAaqgGpvh6Nz4POKyBglvTDXulVbM4J+Yi5f+Ot2VqrU1
	a37NX35IOs1RHDtVinqrAhFeFYvvV2C+rP2VeGY4IF/+Su70rI8HzVN8yKxYewXrfYrr
	LHwxOqqjb138c9uGJAwZ6SRwN4CPAczE35Xr3e/S7g8WZpX15up1eINap6eo/WnwIQdI
	+EG415Yhnp5zIIf3sg0UO61HCtifl0rOoOa3yT9Ic80LnhQdCsDBrRkOTrNDBY2Jqwjm
	rJfg==
X-Gm-Message-State: ALoCoQlBCL+FjZ3ABUy9WKDEWbLCoHV+nwahzX/fhGAoS/qg7X9Ebt/IuBhJaIPPpG3LZ49sPPpx
X-Received: by 10.180.105.135 with SMTP id gm7mr24585218wib.18.1444807908281; 
	Wed, 14 Oct 2015 00:31:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Wed, 14 Oct 2015 00:31:18 -0700 (PDT)
In-Reply-To: <CAJTo0LbR=Fryhe-Jfgw9AW=ZjBTWE5gZQ2id3si55LpRZtmH-A@mail.gmail.com>
References: <CAP9ODKpN0kbRtm7pvrky5pwFZ_1YPoZ-fy=kt+4CPB+NUoyBKA@mail.gmail.com>
	<CAJTo0LbR=Fryhe-Jfgw9AW=ZjBTWE5gZQ2id3si55LpRZtmH-A@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 14 Oct 2015 10:31:18 +0300
Message-ID: <CAHiDW_G10f50vzvQGWvnCc=2ztB0QLLTNrxDMLB-K9p6Wd=KUw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error due GTK+3 new rdepends on libgl
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
X-List-Received-Date: Wed, 14 Oct 2015 07:31:49 -0000
Content-Type: multipart/alternative; boundary=14dae9cc9c9224674f05220b8ed1

--14dae9cc9c9224674f05220b8ed1
Content-Type: text/plain; charset=UTF-8

On 14 October 2015 at 00:42, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 13 October 2015 at 22:32, Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
>
>> This includes a forced rdepends on libgl and I see no reason for this.
>>
>
> Mainly because gtk3-demo will link to libGL.so on startup.
>
> It would be interesting to see what happens on platforms where libgl.so
> isn't available if you remove the dependency.  If GTK+ handles that
> gracefully then we can make the rdepends conditional on DISTRO_FEATURES.
>

If dlopening libGL.so.1 fails, gtk3-demo will not run. I'm sure it's
possible to patch it to fail gracefully (after all GL is only needed for
one demo out of many) and I would guess upstream would take that as well,
but for now I just did the minimum required to get the current dependencies
correct in the recipe.

Jussi

--14dae9cc9c9224674f05220b8ed1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
4 October 2015 at 00:42, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">On 13 Octo=
ber 2015 at 22:32, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:=
otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@ossyste=
ms.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div sty=
le=3D"overflow:hidden">This includes a forced rdepends on libgl and I see n=
o reason for this.</div></blockquote><div><br></div></span><div>Mainly beca=
use gtk3-demo will link to libGL.so on startup.</div><div><br></div><div>It=
 would be interesting to see what happens on platforms where libgl.so isn&#=
39;t available if you remove the dependency.=C2=A0 If GTK+ handles that gra=
cefully then we can make the rdepends conditional on DISTRO_FEATURES.</div>=
</div></div></div></blockquote><div><br></div><div>If dlopening libGL.so.1 =
fails, gtk3-demo will not run. I&#39;m sure it&#39;s possible to patch it t=
o fail gracefully (after all GL is only needed for one demo out of many) an=
d I would guess upstream would take that as well, but for now I just did th=
e minimum required to get the current dependencies correct in the recipe.=
=C2=A0</div><div>=C2=A0</div><div>Jussi</div><div><br></div></div></div></d=
iv>

--14dae9cc9c9224674f05220b8ed1--
