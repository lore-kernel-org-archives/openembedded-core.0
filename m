Return-Path: <ross.burton@intel.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1F460721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 16:28:19 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id m7so120535903obh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yRmGHvzxMEuuOGg3NcUFRwek+Aub85huDTrhGtIPMbE=;
	b=dLrRfqlqUvgqRRsRLQGcprAb8VxacZ8O82K5zZNIt3+jI+SOdqhybtjaqRBW5hmZ9S
	N28PrIEzi48ol4oq9ILwZFkOoZ0c747rdpjGfvnuxSvVIkTus1ngPolBp5TAzcExx2tT
	Bsp/gmLhu9pY0DyQL5tg7UwqQz54RMGQUiGtM42mt53P6oKz3zkRJXvQ9sm02tNPsKwA
	kMSsuO5k7AujA0F4WLXbnXuA0012A+489c9nsKj1FNUQhrQXJmn1JaGL9FbYZYuf0Vay
	8vsM7VsRNwKBaIEChn9rUwmjPleQvIPkP8nZ0w2dqn0ykIG1nVL7F1trMq27/lJ9IRlF
	87rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yRmGHvzxMEuuOGg3NcUFRwek+Aub85huDTrhGtIPMbE=;
	b=fvavt1qeeAMuxzeez6FIYQG8FWgL4IU8QVr1PboSn47lI7/NX15anTyqaRMqLMuiiZ
	V1Z53njsPLSTZjLEozNKFthvGZRr6oRI6fZU51yLI9LU34fqQlgYomyRy0xKErO2odfa
	L5faK0MVIVAGBCgQ0mGl5c0Fv190FIJWJB014EKQBRaAnL+LETvz3eI2xsIXF0iuE6rH
	/9tIIMo9MHvz6wZgJubNYahLVybzmkSvqRvsS1Y5SDrl0aXQaJTJMogOr4epS9QxK/8e
	c+25GZ5skPDKQBDDmtTgJC9ks2WY4hiSHf0FyKZn8C5PH+T6D67hyT10Y39+TDsBGWg2
	SSDg==
X-Gm-Message-State: AD7BkJL42gN1Egy8vX4aVuGz95lPUWBXbh3iGBT29j67AinzlwpYm+eEwXzkIMY1rf3mNKRUWKzur4HioNTuBJLT
X-Received: by 10.60.156.103 with SMTP id wd7mr10095507oeb.47.1458318499617;
	Fri, 18 Mar 2016 09:28:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.90.134 with HTTP; Fri, 18 Mar 2016 09:28:00 -0700 (PDT)
In-Reply-To: <ced58b296b886bfe1db833e823eb2b80d43e324f.1458282563.git.hongxu.jia@windriver.com>
References: <cover.1458282563.git.hongxu.jia@windriver.com>
	<ced58b296b886bfe1db833e823eb2b80d43e324f.1458282563.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Mar 2016 16:28:00 +0000
Message-ID: <CAJTo0LZOnFNpsyDe3NRZjY6Tygb_uHSK=+hdGTJFEnOHN-DJyQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/18] gconf: fix buildpaths QA issue
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
X-List-Received-Date: Fri, 18 Mar 2016 16:28:19 -0000
Content-Type: multipart/alternative; boundary=047d7bd6b3fc23eace052e553c9b

--047d7bd6b3fc23eace052e553c9b
Content-Type: text/plain; charset=UTF-8

On 18 March 2016 at 09:01, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> In ${S}/gconf/gconfd.c, we have:
> ...
>   /* -- Debug only */
>
>   if (addresses == NULL)
>     {
>       gconf_log(GCL_DEBUG, _("gconfd compiled with debugging; trying to
> load gconf.path from the source directory"));
>       conffile = g_strconcat(GCONF_SRCDIR, "/gconf/gconf.path", NULL);
>       addresses = gconf_load_source_path(conffile, NULL);
>       g_free(conffile);
>     }
>
>   /* -- End of Debug Only */
>

This seems like a lot of effort to remove a build path from the binaries.
Can we just disable the debugging support instead?  GConf is effectively
unmaintained these days anyway.

Ross

--047d7bd6b3fc23eace052e553c9b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 March 2016 at 09:01, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mail=
to:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":93e" class=
=3D"a3s" style=3D"overflow:hidden">In ${S}/gconf/gconfd.c, we have:<br>
...<br>
=C2=A0 /* -- Debug only */<br>
<br>
=C2=A0 if (addresses =3D=3D NULL)<br>
=C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 gconf_log(GCL_DEBUG, _(&quot;gconfd compiled with debu=
gging; trying to load gconf.path from the source directory&quot;));<br>
=C2=A0 =C2=A0 =C2=A0 conffile =3D g_strconcat(GCONF_SRCDIR, &quot;/gconf/gc=
onf.path&quot;, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 addresses =3D gconf_load_source_path(conffile, NULL);<=
br>
=C2=A0 =C2=A0 =C2=A0 g_free(conffile);<br>
=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 /* -- End of Debug Only */</div></blockquote></div><br>This seems li=
ke a lot of effort to remove a build path from the binaries.=C2=A0 Can we j=
ust disable the debugging support instead?=C2=A0 GConf is effectively unmai=
ntained these days anyway.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--047d7bd6b3fc23eace052e553c9b--
