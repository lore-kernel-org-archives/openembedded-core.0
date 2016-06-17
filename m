Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDAA765DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 18:36:34 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id t74so76859549ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 11:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w9++yW+hWyRzY2GeEwIM9saJ7DGAeLT+MSTKgo51UFo=;
	b=iubDxhxIjWS/N3rBPKTMR8baS+EafDo9sP0OJiPoITZvIJ7ZtWgvMZ/JcJso/j93zG
	/+PSis5IPXzXIs/2EVD76DUgTsnJMMS4XI7d7YBRM+W8KWssmBEYy1hp87AxmjcfGAcG
	Z5L61fkVgX0ixFaMHM63f4+GAElfpLKA2ITCzl6ZMCFoZF0qgtj313DMEcvVJKBeICFu
	pbyv+wC4v/KBPKAGK0tHdhKpGKYlaL0CQwN/IO5F8yO32XNM1HfMLzd7Iu4Hlg56CgzN
	ww1LlskLHRNQRQp/TrvP2sL6VxFjKRxsHlaUrrF1l+6DUfOSCeSnvBYZ2l3MOmZxgRlu
	eB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w9++yW+hWyRzY2GeEwIM9saJ7DGAeLT+MSTKgo51UFo=;
	b=AoOdOwlxE6bXz7ficIUUT1FjI14JFsz/GWxJl/WtCPPAPaoxVa62B+wt0BnfuSsXrc
	NWIufA9FAJ+OF2qdNdlua4Djaj5FlfHAvnV8YqPWcPZdadL/3LOArJYD+UI+th/4+qAX
	RCN7tmDjBxU9iaZea6zXXmPmhY8Tq5KPgGkAbLXjLf4tVIVfqhsJSBDE9jacIjkXARtX
	9sjiSR9g/BXLUjQJUiheQLAvBmAq27EWguQN28KrDCDpnxYYuR9ZJkP0YpZllUQvr7ys
	oVUjVlclzzrZTR0Tfuduq7K6WUk729DVXM2lGSsUX6za+YYoRAXrBflVijrSJI6aHa7F
	/vHQ==
X-Gm-Message-State: ALyK8tL/zqy+rR44CwMC58S2dhGDyGraxQUxvTpdnUKjxzr4QAVpYkXHsRTBV+/jXhglXhqJkgTgRcXyRwYyNIFo
X-Received: by 10.107.138.201 with SMTP id c70mr5491796ioj.148.1466188595592; 
	Fri, 17 Jun 2016 11:36:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 17 Jun 2016 11:36:16 -0700 (PDT)
In-Reply-To: <9cc3d71a9624333bd6c3c676ee2b855be1903568.1466134498.git.Qi.Chen@windriver.com>
References: <cover.1466134497.git.Qi.Chen@windriver.com>
	<9cc3d71a9624333bd6c3c676ee2b855be1903568.1466134498.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jun 2016 19:36:16 +0100
Message-ID: <CAJTo0LY+hui18g90d4NZbD0JQjh0miqkn2uPTbRTxtUqFTPbuA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd-bootchart: add recipe
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
X-List-Received-Date: Fri, 17 Jun 2016 18:36:35 -0000
Content-Type: multipart/alternative; boundary=001a113e8e6a6a1a9405357da239

--001a113e8e6a6a1a9405357da239
Content-Type: text/plain; charset=UTF-8

On 17 June 2016 at 04:36, Chen Qi <Qi.Chen@windriver.com> wrote:

> +DEPENDS = "libxslt-native libxslt-native xmlto-native
> docbook-xml-dtd4-native docbook-xsl-stylesheets-native intltool"
>

Can we not disable documentation?


> +SYSTEMD_SERVICE_${PN} = "systemd-bootchart.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>

Enable by default, I'd suggest.


> +do_configure_prepend() {
> +    # intltool.m4 is a soft link to /usr/share/aclocal/m4, delete it and
> use the one in our sysroot
> +    rm ${S}/m4/intltool.m4
> +    cp ${STAGING_DIR_TARGET}${datadir}/aclocal/intltool.m4
> ${S}/m4/intltool.m4
> +}
>

IIRC just deleting the file should be sufficient, as we'll pull it in from
the sysroot automatically.

Ross

--001a113e8e6a6a1a9405357da239
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 June 2016 at 04:36, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Q=
i.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":2v7" class=3D"a3s aX=
jCH m1555c6f7c14e78e2">+DEPENDS =3D &quot;libxslt-native libxslt-native xml=
to-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native intltool&q=
uot;<br></div></blockquote><div><br></div><div>Can we not disable documenta=
tion?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2v7"=
 class=3D"a3s aXjCH m1555c6f7c14e78e2">
+SYSTEMD_SERVICE_${PN} =3D &quot;systemd-bootchart.service&quot;<br>
+SYSTEMD_AUTO_ENABLE_${PN} =3D &quot;disable&quot;<br></div></blockquote><d=
iv><br></div><div>Enable by default, I&#39;d suggest.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div id=3D":2v7" class=3D"a3s aXjCH m1555c6=
f7c14e78e2">+do_configure_prepend() {<br>
+=C2=A0 =C2=A0 # intltool.m4 is a soft link to /usr/share/aclocal/m4, delet=
e it and use the one in our sysroot<br>
+=C2=A0 =C2=A0 rm ${S}/m4/intltool.m4<br>
+=C2=A0 =C2=A0 cp ${STAGING_DIR_TARGET}${datadir}/aclocal/intltool.m4 ${S}/=
m4/intltool.m4<br>
+}</div></blockquote></div><br>IIRC just deleting the file should be suffic=
ient, as we&#39;ll pull it in from the sysroot automatically.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113e8e6a6a1a9405357da239--
