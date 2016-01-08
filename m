Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 83A7B731D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:39:39 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id mw1so71522589igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mTIwBgcTunU+X/ub7niEd9PH/FyOemB48dgDNDTFq9s=;
	b=ZnvBVW76sWe2GKQ8E9EQV9QE+Dv549LPNq9naqfpUQHnE5121NtTtILzjJK4j509bE
	5+tF5ZKCWo3RWzhDklMpxmi2FZhdehnfuMHKLFkT9+qijohQttRswJQZz2lpc0QlVqEj
	XLtUjnCcv4jYbPFHM+uZ+S5/M22DKucI58i33HnUwsCS6ziSFfqZ8GVIbSjkbcAlIN3S
	ZWXqFNvNq0xU4Kt+DGBcu2gu19nAmSkqD3VmniREy0P0LdaEeIcEdwdYineezzVU9sKH
	diMETHmHj+E1Gxt8JSEY7TP6nIenG5Nt4qTO4HQxwOZU38npdH1VJCBvOLWKq1F/5JX7
	pnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mTIwBgcTunU+X/ub7niEd9PH/FyOemB48dgDNDTFq9s=;
	b=GenveEqxRtpLLQoNWKb0bS7ksiUo9ALYfF1p++jx5oGy6kOsXQIlbg0K129b6RJTnG
	bfFHMz98H4yDcpCvr6RKZmke08EdS11ZqXL+pyro2Vd8qcyXdwMz+SxhCJ7yzORRAW6M
	CU6eI7mneZV/CHySGIPYPZkLJdpDMW9YfeN9ko/NgrZ/5EnJY9RzS83tgXraZo1jTpHB
	ZhAYonDXbopxxJOeOEn+ddHrcLCjq0qBQLTrQpTxfIejeGyGb5VxuBQgd0nfkMiTt26I
	kKsVum7QsZIoJ6hvsBZxKEJcCAF+CQZGDHg2QClvMXZvVg9hyPXM+kkiXm1s6qP+YTnw
	xxYg==
X-Gm-Message-State: ALoCoQnBVnUNpv4XYrn8TJX3mJ445aTMv+bNnqZy+7E5z7pFwKqQbMH8jObZPsLZI4yrjf6X3HXicE91GpFo8e15XwZOL3FW9WObROs/NWcUIsrySzM8ZO0=
X-Received: by 10.50.30.69 with SMTP id q5mr21541431igh.78.1452249579839; Fri,
	08 Jan 2016 02:39:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 02:39:20 -0800 (PST)
In-Reply-To: <aa131735726856532f21d5f3264251679ca7d030.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<aa131735726856532f21d5f3264251679ca7d030.1452248145.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 10:39:20 +0000
Message-ID: <CAJTo0LYzUihyMRQAnvuudC+SaPDU1yXdZ9zch=eESV4ZXbEZqw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 30/53] Revert "glib-2.0: build dependency cleanup"
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
X-List-Received-Date: Fri, 08 Jan 2016 10:39:39 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0c54fc710528d03481

--047d7bdc1c0c54fc710528d03481
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 10:18, Khem Raj <raj.khem@gmail.com> wrote:

> -DEPENDS = "virtual/libiconv libffi zlib"
> -DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', '
> glib-2.0-native dbus', '', d)}"
> +DEPENDS = "glib-2.0-native virtual/libiconv libffi zlib"
> +DEPENDS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES',
> 'ptest', ' dbus', '', d)}"
>  DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native
> zlib-native"
> -DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext
> nativesdk-libffi nativesdk-zlib"
> +DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext
> nativesdk-libffi nativesdk-zlib ${BPN}-native"
>

Don't actually revert the original commit, just add the missing
dependencies back.  The ptest changes were good and you're reverting those
too.

Ross

--047d7bdc1c0c54fc710528d03481
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 10:18, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":53z" class=3D"a3s" styl=
e=3D"overflow:hidden">-DEPENDS =3D &quot;virtual/libiconv libffi zlib&quot;=
<br>
-DEPENDS_append =3D &quot; ${@bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#=
39;1&#39;, &#39; glib-2.0-native dbus&#39;, &#39;&#39;, d)}&quot;<br>
+DEPENDS =3D &quot;glib-2.0-native virtual/libiconv libffi zlib&quot;<br>
+DEPENDS_append_class-target =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;ptest&#39;, &#39; dbus&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0DEPENDS_class-native =3D &quot;pkgconfig-native gettext-native libffi=
-native zlib-native&quot;<br>
-DEPENDS_class-nativesdk =3D &quot;nativesdk-libtool nativesdk-gettext nati=
vesdk-libffi nativesdk-zlib&quot;<br>
+DEPENDS_class-nativesdk =3D &quot;nativesdk-libtool nativesdk-gettext nati=
vesdk-libffi nativesdk-zlib ${BPN}-native&quot;</div></blockquote></div><br=
>Don&#39;t actually revert the original commit, just add the missing depend=
encies back.=C2=A0 The ptest changes were good and you&#39;re reverting tho=
se too.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--047d7bdc1c0c54fc710528d03481--
