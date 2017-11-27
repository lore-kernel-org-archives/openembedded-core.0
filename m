Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id DFF7577F76
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:05:34 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id n134so20514644itg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 03:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e9WQyF5GconLf7EsjqwkWY7zNgS7n/pEXh3A9HeALrU=;
	b=kvVeiCLrw+faOkZSd274x5nXRllbqwYTwvNCQ+9Qg4/Hvzb93q6BrPoLknlMsk33Ik
	C+94aMGxwHcGU+F7DHiIFZtVsShRM6Ix22Mx7MsqW6njY4dvYmWfTJArgiYwMdYlKkDy
	tAYKStfS+EvwD7864ZYBlqVrgIjP/aZnArPXIVPgK+oj+Nlu6inoIlvxRTn2GDJlLu1g
	UvkI98Zo05wkFunWAnawnsNMorR7uFlRWLa17TZMVvQJhY86A2gFVeJfDd5KmIftvlAo
	xTwuT4Wydn/9wF+eRxXbR26vd+yyJz3W39F7Gk441h3amFh83oUlE1+S+GreiXit4tzV
	ADjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e9WQyF5GconLf7EsjqwkWY7zNgS7n/pEXh3A9HeALrU=;
	b=Bj94DvCAC2VAp2hNH1Xu7r9kAVfM8V4I7NdoDPzuV2nuyopfNy43QF5d+YRHWsgkIp
	Vs4Zlap+lZKn2LvKp+L3MiJDJD6ipiLd5LxfkuMsQjQdvqvVyQ0QupGA4ztc6sp4IgGz
	VNAd1ELXqWnqLzB7J7AzqFWSnehLYjicC/RX1gtqG6074TUA5Ip3+PWBwWxKuCR0voRj
	DTnowDBTEvFv8d2mgSr7yZkzUxXKwpEhfXLvTBnRMps9fwixxhbI1yksFg+U2MCjHpLg
	4AjqRJgYLOJTs4liMz74RxUex8siFwonH3i+JMOVB12i7Z2jlGoBZaRncVl8nA/RhBIS
	TlwA==
X-Gm-Message-State: AJaThX4D+ZoTkFA7qplkLlRdx76cXaiSS+dIxTfLrBm7TczVksa08xbK
	6vezRlyBh7XqPS2QRGwb7gJZJIJnapJFz1EBMODhjQ==
X-Google-Smtp-Source: AGs4zMb53oB68rdQbSPmpBWm7rsbQWS9/H4MQFCllIdWsKwyNOTaRympN2f49cDmW3WnQ4y3xjR1ECMcdm6Qj3aXcjk=
X-Received: by 10.36.71.74 with SMTP id t71mr28134341itb.53.1511780735477;
	Mon, 27 Nov 2017 03:05:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Mon, 27 Nov 2017 03:05:14 -0800 (PST)
In-Reply-To: <20171127103517.6845-1-psaavedra@igalia.com>
References: <20171127103517.6845-1-psaavedra@igalia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Nov 2017 11:05:14 +0000
Message-ID: <CAJTo0Lb-2jOsQA79Xh2EePAqt3DgzWA7HW=P-9h8Dn41dQG4PQ@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] puppet: add recipe for puppet 4.10.9
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
X-List-Received-Date: Mon, 27 Nov 2017 11:05:35 -0000
Content-Type: multipart/alternative; boundary="001a113f6a20b780a0055ef4e18b"

--001a113f6a20b780a0055ef4e18b
Content-Type: text/plain; charset="UTF-8"

A puppet recipe is great, but it doesn't belong in oe-core.  Maybe one of
the layers in meta-openembedded would be better.

Ross

On 27 November 2017 at 10:35, Pablo Saavedra <psaavedra@igalia.com> wrote:

> Added Yocto recipe for Puppet 4.10.9
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  recipes-support/puppet/puppet_4.10.9.bb | 41
> +++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 recipes-support/puppet/puppet_4.10.9.bb
>
> diff --git a/recipes-support/puppet/puppet_4.10.9.bb
> b/recipes-support/puppet/puppet_4.10.9.bb
> new file mode 100644
> index 0000000..a335546
> --- /dev/null
> +++ b/recipes-support/puppet/puppet_4.10.9.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "Open source Puppet is a configuration management system"
> +HOMEPAGE = "https://puppetlabs.com/puppet/puppet-open-source"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7c9045ec00cc0d6b6e0e09ee811da4a0"
> +
> +SRC_URI = " \
> +    https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
> +    file://add_puppet_gemspec.patch \
> +    file://puppet.conf \
> +"
> +SRC_URI[md5sum] = "8af3c2fec5dc4683d80aab4efc1614c6"
> +SRC_URI[sha256sum] = "e667bd825e54bbc38c30534c25adc4
> 41ed638fc484fe0abe278f0335770cd161"
> +
> +inherit ruby
> +
> +DEPENDS += " \
> +        ruby \
> +        facter \
> +        hiera \
> +"
> +
> +RDEPENDS_${PN} += " \
> +        ruby \
> +        facter \
> +        hiera \
> +        ruby-shadow \
> +        bash \
> +"
> +
> +RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
> +
> +do_install_append() {
> +    install -d ${D}${sysconfdir}/puppet
> +    install -d ${D}${sysconfdir}/puppet/manifests
> +    install -d ${D}${sysconfdir}/puppet/modules
> +
> +    install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${S}/conf/environment.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${WORKDIR}/puppet.conf ${D}${sysconfdir}/puppet/
> +}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113f6a20b780a0055ef4e18b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">A puppet recipe is great, but it doesn&#39;t belong in oe-=
core.=C2=A0 Maybe one of the layers in meta-openembedded would be better.<d=
iv><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 27 November 2017 at 10:35, Pablo Saavedra <span dir=3D"=
ltr">&lt;<a href=3D"mailto:psaavedra@igalia.com" target=3D"_blank">psaavedr=
a@igalia.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Added =
Yocto recipe for Puppet 4.10.9<br>
<br>
Signed-off-by: Pablo Saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com">p=
saavedra@igalia.com</a>&gt;<br>
---<br>
=C2=A0recipes-support/puppet/<a href=3D"http://puppet_4.10.9.bb" rel=3D"nor=
eferrer" target=3D"_blank">puppet_<wbr>4.10.9.bb</a> | 41 +++++++++++++++++=
+++++++++++++<wbr>+++<br>
=C2=A01 file changed, 41 insertions(+)<br>
=C2=A0create mode 100644 recipes-support/puppet/<a href=3D"http://puppet_4.=
10.9.bb" rel=3D"noreferrer" target=3D"_blank">puppet_<wbr>4.10.9.bb</a><br>
<br>
diff --git a/recipes-support/puppet/<a href=3D"http://puppet_4.10.9.bb" rel=
=3D"noreferrer" target=3D"_blank">puppe<wbr>t_4.10.9.bb</a> b/recipes-suppo=
rt/puppet/<a href=3D"http://puppet_4.10.9.bb" rel=3D"noreferrer" target=3D"=
_blank">puppe<wbr>t_4.10.9.bb</a><br>
new file mode 100644<br>
index 0000000..a335546<br>
--- /dev/null<br>
+++ b/recipes-support/puppet/<a href=3D"http://puppet_4.10.9.bb" rel=3D"nor=
eferrer" target=3D"_blank">puppe<wbr>t_4.10.9.bb</a><br>
@@ -0,0 +1,41 @@<br>
+SUMMARY =3D &quot;Open source Puppet is a configuration management system&=
quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://puppetlabs.com/puppet/puppet-open-so=
urce" rel=3D"noreferrer" target=3D"_blank">https://puppetlabs.com/<wbr>pupp=
et/puppet-open-source</a>&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>7c9045ec00cc0d6b6e0e0=
9ee811da4<wbr>a0&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 <a href=3D"https://downloads.puppetlabs.com/puppet/puppet-${=
PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://downloads.puppetla=
bs.<wbr>com/puppet/puppet-${PV}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 file://add_puppet_gemspec.<wbr>patch \<br>
+=C2=A0 =C2=A0 file://puppet.conf \<br>
+&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>8af3c2fec5dc4683d80aab4efc1614<wbr>c6&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>e667bd825e54bbc38c30534c25adc4<wbr>41ed6=
38fc484fe0abe278f0335770c<wbr>d161&quot;<br>
+<br>
+inherit ruby<br>
+<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ruby \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 facter \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hiera \<br>
+&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ruby \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 facter \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hiera \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ruby-shadow \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bash \<br>
+&quot;<br>
+<br>
+RUBY_INSTALL_GEMS =3D &quot;puppet-${PV}.gem&quot;<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 install -d ${D}${sysconfdir}/puppet<br>
+=C2=A0 =C2=A0 install -d ${D}${sysconfdir}/puppet/<wbr>manifests<br>
+=C2=A0 =C2=A0 install -d ${D}${sysconfdir}/puppet/<wbr>modules<br>
+<br>
+=C2=A0 =C2=A0 install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/=
<br>
+=C2=A0 =C2=A0 install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/p=
uppet/<br>
+=C2=A0 =C2=A0 install -m 655 ${S}/conf/environment.conf ${D}${sysconfdir}/=
puppet/<br>
+=C2=A0 =C2=A0 install -m 655 ${WORKDIR}/puppet.conf ${D}${sysconfdir}/pupp=
et/<br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113f6a20b780a0055ef4e18b--
