Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id A10B465DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 18:03:49 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k15so8904778qaq.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 10:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hKA+9afU3FOu3H/5nUz0lS/rfsqxhzbMBch5TtROmrQ=;
	b=Lik99+w8upbue+nFdbdQfVtXt82sv08/CNpV151rHWIEZrvvyk/L6CdnTg8G2UEshe
	p89yz7HPVz77gaGLkWGzYuNLio/BcsC8LN2145cnt4SaQz9msNUBF40lnRhTanwmL6D3
	8/2lWdEsrJUdrIyP0LhVkDwhH8Ai/ZhDIjK1AxUt9JzGw335XR00Kpc79+PmxIQ4vrTk
	2qbCRwSfLcYFSyi8LcVHY6mBDTZPPkFmkmNbFDOHLPHUmEwENyd4E+Nx8quR4UhN2lnK
	06wj1xyY6/BuyKgXABWKOyJRXON3iLqN1heZUrq1CdbdJ3y2td+Fd0x+dJ88F7nNiS05
	LCtw==
X-Gm-Message-State: ALoCoQn3B+ThmV6kygLgQyZsdx1sV5uhtBYe7ZZFcbn0OUHPNSz4QYcRS9gG1CoTs3prE/nLo7UG
X-Received: by 10.229.53.133 with SMTP id m5mr32055802qcg.28.1415815428441;
	Wed, 12 Nov 2014 10:03:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Wed, 12 Nov 2014 10:03:28 -0800 (PST)
In-Reply-To: <1415812735-6272-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1415812735-6272-1-git-send-email-alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Nov 2014 18:03:28 +0000
Message-ID: <CAJTo0LYaWM8NioZinJsDbNVRi=13L7DQDQHoLv5-XHopgrxJDw@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cronie: Upgrade to 1.4.12
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
X-List-Received-Date: Wed, 12 Nov 2014 18:03:52 -0000
Content-Type: multipart/alternative; boundary=001a1133da32ae3efd0507ad37e7

--001a1133da32ae3efd0507ad37e7
Content-Type: text/plain; charset=UTF-8

On 12 November 2014 17:18, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/recipes-extended/cronie/cronie_1.4.11.bb | 85
> ---------------------------
>  meta/recipes-extended/cronie/cronie_1.4.12.bb | 84
> ++++++++++++++++++++++++++
>

Please pass -M to git-send-email if you're sending patches without using
create-pull-request so that the rename is spotted and the diff is much
easier to read. I applied and re-generated the diff:

--- a/meta/recipes-extended/cronie/cronie_1.4.11.bb
> +++ b/meta/recipes-extended/cronie/cronie_1.4.12.bb
> @@ -8,7 +8,7 @@ BUGTRACKER = "mmaslano@redhat.com"
>  # Internet Systems Consortium License
>  LICENSE = "ISC & BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=dd2a592170760e1386c769e1043b3722 \
>
>  file://src/cron.c;endline=20;md5=b425c334265026177128353a142633b4 \


Always say why the license checksum was change in the commit message.
Often it's just copyright dates changing or reformatting, but we need to
know that it's not that the license terms were changed.


>  SRC_URI = "
> https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
> -           file://fix-out-of-tree-build.patch \
>

If a patch is removed explain why (upstream merged it in this case, I
hope), and remember to remove the file in the commit.

Ross

--001a1133da32ae3efd0507ad37e7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
2 November 2014 17:18, Alejandro Hernandez <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandro.he=
rnandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">Signed-of=
f-by: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.hernandez@linux.i=
ntel.com">alejandro.hernandez@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/cronie/<a href=3D"http://cronie_1.4.11.bb" targ=
et=3D"_blank">cronie_1.4.11.bb</a> | 85 ---------------------------<br>
=C2=A0meta/recipes-extended/cronie/<a href=3D"http://cronie_1.4.12.bb" targ=
et=3D"_blank">cronie_1.4.12.bb</a> | 84 ++++++++++++++++++++++++++<br></blo=
ckquote><div><br></div><div>Please pass -M to git-send-email if you&#39;re =
sending patches without using create-pull-request so that the rename is spo=
tted and the diff is much easier to read. I applied and re-generated the di=
ff:</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex">--- a/meta/recipes-extended/cronie=
/<a href=3D"http://cronie_1.4.11.bb">cronie_1.4.11.bb</a><br>+++ b/meta/rec=
ipes-extended/cronie/<a href=3D"http://cronie_1.4.12.bb">cronie_1.4.12.bb</=
a><br>@@ -8,7 +8,7 @@ BUGTRACKER =3D &quot;<a href=3D"mailto:mmaslano@redha=
t.com">mmaslano@redhat.com</a>&quot;<br>=C2=A0# Internet Systems Consortium=
 License<br>=C2=A0LICENSE =3D &quot;ISC &amp; BSD&quot;<br>-LIC_FILES_CHKSU=
M =3D &quot;file://COPYING;md5=3D963ea0772a2adbdcd607a9b2ec320c11 \<br>+LIC=
_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Ddd2a592170760e1386c769e1043b37=
22 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0file://src/cron.c;endline=3D20;md5=3Db425c334265026177128353a1426=
33b4 \</blockquote><div><br></div><div>Always say why the license checksum =
was change in the commit message.=C2=A0 Often it&#39;s just copyright dates=
 changing or reformatting, but we need to know that it&#39;s not that the l=
icense terms were changed.=C2=A0</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=C2=
=A0SRC_URI =3D &quot;<a href=3D"https://fedorahosted.org/releases/c/r/croni=
e/cronie-${PV}.tar.gz">https://fedorahosted.org/releases/c/r/cronie/cronie-=
${PV}.tar.gz</a> \<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-out-o=
f-tree-build.patch \<br></blockquote><div><br></div><div>If a patch is remo=
ved explain why (upstream merged it in this case, I hope), and remember to =
remove the file in the commit.</div><div><br></div><div>Ross=C2=A0</div></d=
iv><br></div></div>

--001a1133da32ae3efd0507ad37e7--
