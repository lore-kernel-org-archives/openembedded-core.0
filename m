Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6ACCD6E630
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 05:32:10 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id o6so29247055qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 21:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=M11ezSSLRmNC7Hg9eG2l88YGiaq5RNnErhVQN3JCIvU=;
	b=pjOexO6v71ZWR+I+oY0gI9GOHRl2hxCreHwfcYHgidF6lAJfDeq5H37/w9H9S+oguY
	sTFLXyfWHAr2GMzxbYvpLrw4wut8khfcHwkeiYrl50oBX3bRHscNJZOMOzyVX6ttGkRB
	p7Aav9Mad+rst8KvBFXhuCSs+7y4jEgnSoDCgrUIk7K7kTwJWlQBpWxhHkbEHd8mYbDe
	MtumrqiQnqBCiAB3oVkD0q9SkUC/pjWrgixsPcnurrWfvT1jTmPfI38julRpjC8VCUWf
	Vhv52EgREzjZM6UlK9CG5wl5asayenGmg4V3XgYTzjKbxA5xhd0w+cWA3uEi6yuiChct
	P1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=M11ezSSLRmNC7Hg9eG2l88YGiaq5RNnErhVQN3JCIvU=;
	b=fFyZa1QatX3EIDis5LjUMlJcqxBB5eIAC5mAr1tByeDCvM/VixlkmLq3giG+iSQgsC
	T37eCM4/UxoJ2Cq8vn0VviIBToDJiNkwktajKaDTzU1SOJ7j+/5rZZRgF+EN2UYu3hBc
	MxNKRTij7kNpS7vp7TEwdVqoI9tLx1UvwrqHobEKK74b28MU0LXe9K0Y9eHvrjz6+FxX
	h+gCJKRZVS7e2f6WcRKjId/Es8Ce+80m+LOVUFm7SU2gdT7VNyvSsk3mvP6pUeNQBpdJ
	9zvFEfn04PVgk0GNUdSmEE0FA5ZJ4rcZA0KzQ+kbpb2Lid1xOkroTEAwadQvCRTjuhCu
	hxBg==
X-Gm-Message-State: AD7BkJKoWQ03spuNCFfk18U3et+97FtZUwkhcnkfliwkPXUKKwWnJhTZffNeROWWF9mBhuBnxjZY14Kotnrpjw==
MIME-Version: 1.0
X-Received: by 10.55.78.70 with SMTP id c67mr14715380qkb.37.1457155930725;
	Fri, 04 Mar 2016 21:32:10 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Fri, 4 Mar 2016 21:32:09 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Fri, 4 Mar 2016 21:32:09 -0800 (PST)
In-Reply-To: <1457136723-19606-3-git-send-email-ross.burton@intel.com>
References: <1457136723-19606-1-git-send-email-ross.burton@intel.com>
	<1457136723-19606-3-git-send-email-ross.burton@intel.com>
Date: Sat, 5 Mar 2016 13:32:09 +0800
Message-ID: <CAMKF1soqx-CeN17DTUUZQ8mrvrvy4ott9TzzvuzXAx2B_VKHkQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] xmlto: ensure /bin/bash is used as bash
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
X-List-Received-Date: Sat, 05 Mar 2016 05:32:10 -0000
Content-Type: multipart/alternative; boundary=001a114a9bbea222ff052d468d36

--001a114a9bbea222ff052d468d36
Content-Type: text/plain; charset=UTF-8

On Mar 5, 2016 8:12 AM, "Ross Burton" <ross.burton@intel.com> wrote:
>
> The xmlto script uses bashisms and checks at configure time to find a bash
> binary.  If the build host has /bin/sh as bash then this gets detected,
which
> causes problems in native builds if the sstate is then shared to a
machine with
> /bin/sh as dash.

While this patch is totally fine I think it could be fixed in code and
submitted upstream. No ?
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> index 514f527..54438ef 100644
> --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> @@ -27,7 +27,7 @@ RDEPENDS_${PN}_append_class-target = " \
>
>  BBCLASSEXTEND = "native"
>
> -EXTRA_OECONF_append = " XMLLINT=xmllint XSLTPROC=xsltproc"
> +EXTRA_OECONF_append = " BASH=/bin/bash XMLLINT=xmllint XSLTPROC=xsltproc"
>
>  do_install_append() {
>      install -d ${D}${sysconfdir}/xml/
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a114a9bbea222ff052d468d36
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Mar 5, 2016 8:12 AM, &quot;Ross Burton&quot; &lt;<a href=3D"mailto:ross.=
burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The xmlto script uses bashisms and checks at configure time to find a =
bash<br>
&gt; binary.=C2=A0 If the build host has /bin/sh as bash then this gets det=
ected, which<br>
&gt; causes problems in native builds if the sstate is then shared to a mac=
hine with<br>
&gt; /bin/sh as dash.</p>
<p dir=3D"ltr">While this patch is totally fine I think it could be fixed i=
n code and submitted upstream. No ?<br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/xmlto/<a href=3D"http://xmlto_0.0.28.bb">x=
mlto_0.0.28.bb</a> | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/xmlto/<a href=3D"http://xmlto_0.0.2=
8.bb">xmlto_0.0.28.bb</a> b/meta/recipes-devtools/xmlto/<a href=3D"http://x=
mlto_0.0.28.bb">xmlto_0.0.28.bb</a><br>
&gt; index 514f527..54438ef 100644<br>
&gt; --- a/meta/recipes-devtools/xmlto/<a href=3D"http://xmlto_0.0.28.bb">x=
mlto_0.0.28.bb</a><br>
&gt; +++ b/meta/recipes-devtools/xmlto/<a href=3D"http://xmlto_0.0.28.bb">x=
mlto_0.0.28.bb</a><br>
&gt; @@ -27,7 +27,7 @@ RDEPENDS_${PN}_append_class-target =3D &quot; \<br>
&gt;<br>
&gt; =C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;<br>
&gt; -EXTRA_OECONF_append =3D &quot; XMLLINT=3Dxmllint XSLTPROC=3Dxsltproc&=
quot;<br>
&gt; +EXTRA_OECONF_append =3D &quot; BASH=3D/bin/bash XMLLINT=3Dxmllint XSL=
TPROC=3Dxsltproc&quot;<br>
&gt;<br>
&gt; =C2=A0do_install_append() {<br>
&gt; =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/xml/<br>
&gt; --<br>
&gt; 2.7.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a114a9bbea222ff052d468d36--
