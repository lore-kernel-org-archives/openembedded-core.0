Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF3A731C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 06:44:38 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id w85so196722089oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 23:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1CY4uVCyIyNbGJb/cjTek0uHHKxDoJJEnPwB7Acbe5s=;
	b=Hi1Dm7gc+DWiD51TZ3sQKoEvCXiWW/63FUiuGMUeV0K999TqOUU8J/NEkBSs8YAXmu
	ckzIJD7xedEgL3gHK5r9CWhJQsVG02dcLdKueOZM11bAVPdGNoEqBrdlzHI56V7lEKgE
	rAwLOKG+okUEgwjOyxytyja5skSiEtdNxF2EH3Bb7HXtLCo34nvlpHxo0fwGYQG0m4yT
	KKu1lX9/CBfvHFAyEcJX2BsgO75c2MJuPQP6P3w79Q0241p2b4nPdXMCdbKmgne+23MA
	K07e8ScLpY94gHwHyayE0yRJF3Ie4m9cYBsf6YycRLSgP3ctsrnjs+qPN3M4SfM39yYp
	7VQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1CY4uVCyIyNbGJb/cjTek0uHHKxDoJJEnPwB7Acbe5s=;
	b=ir9+sU6+GCc/GdBO7HR9kXftNWRt+MZzcQtMRMCv9683LbNXBtw/a5Yqj3hQvRDSTY
	nWMBD3wCK9m7b11uhhtrRqc7bPsbanN9Cdi5gEzO2GtG+qHaIw2c2COHCZK00IEvc5E7
	x7AP0JL8jIX09kNuhbCODAECjS08uH8Ut/WME/fsQZ2uit/uSuxgFoL8hfILLJ7lYgD0
	CU6v2mCPgpfRoaBkX91X9erQcOPG19wWM6guB8XDrRysiW1TAL4PIMoxOCyWhlHKV608
	coyvU5VqaXblbVPa9JiSY5A52F4JS/azXChCST75n9IhU0y9nDWDMQCn24hNIJHAjMRf
	Q3Pg==
X-Gm-Message-State: AOPr4FXmUUzrXx5+bnMtjyROvsmDkeCw1H+Sz3AJjFusMjQtPu5mzYjaNckQhRw/JUK+d0LDvisUcUG0xapodg/1
X-Received: by 10.157.12.72 with SMTP id 66mr116779otr.4.1460357079538; Sun,
	10 Apr 2016 23:44:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.173.77 with HTTP; Sun, 10 Apr 2016 23:44:10 -0700 (PDT)
In-Reply-To: <570B3A38.9000000@mlbassoc.com>
References: <570B3A38.9000000@mlbassoc.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 11 Apr 2016 09:44:10 +0300
Message-ID: <CAHiDW_GtNHhTacnN+ZC3ZzORBkDk2Foa+xrC11O=0K_RqoaDPg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Issues installing GTK based packages
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
X-List-Received-Date: Mon, 11 Apr 2016 06:44:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c11e7caf8b4b005302fe09e

--94eb2c11e7caf8b4b005302fe09e
Content-Type: text/plain; charset=UTF-8

On 11 April 2016 at 08:46, Gary Thomas <gary@mlbassoc.com> wrote:

> When installing epiphany into an existing system, I'm now
> getting these errors:
>   Configuring libgtk-3.0.
>   ///var/lib/opkg/info/libgtk-3.0.postinst: line 3: glib-compile-schemas:
> not found
>   Configuring gsettings-desktop-schemas.
>   ///var/lib/opkg/info/gsettings-desktop-schemas.postinst: line 2:
> glib-compile-schemas: not found
>   Configuring epiphany.
>   ///var/lib/opkg/info/epiphany.postinst: line 2: glib-compile-schemas:
> not found
>
> I believe this is because glib-compile-schemas was moved from
> glib-2.0-utils to glib-2.0-dev by this change (Poky)
>
> commit cc97d5760100415ed22fa329e8962e5f37b8d741
> Author: Jussi Kukkonen <jussi.kukkonen@intel.com>
> Date:   Wed Mar 23 10:59:08 2016 +0200
>
>     glib-2.0: Fix packaging
>
>     * move gdbus-codegen to ${PN}-codegen
>     * move other development tools and data files to ${PN}-dev
>     * remove references to non-existent paths
>
>     (From OE-Core rev: 351064e9c5deb6411c8a0d40ebd4fd4f83299d4e)
>
>     Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Installing glib-2.0-dev just to get this tool doesn't seem reasonable as
> it hauls in a boatload of other packages, including bash and friends, which
> I don't want on my target.
>

That's a valid point, I did not realize schema XML compilation was done on
postinst (instead of build time). I'll fix this.

Thanks,
  Jussi

Filed as bug #9431
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c11e7caf8b4b005302fe09e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 11 April 2016 at 08:46, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D=
"mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">When installing epiphany into a=
n existing system, I&#39;m now<br>
getting these errors:<br>
=C2=A0 Configuring libgtk-3.0.<br>
=C2=A0 ///var/lib/opkg/info/libgtk-3.0.postinst: line 3: glib-compile-schem=
as: not found<br>
=C2=A0 Configuring gsettings-desktop-schemas.<br>
=C2=A0 ///var/lib/opkg/info/gsettings-desktop-schemas.postinst: line 2: gli=
b-compile-schemas: not found<br>
=C2=A0 Configuring epiphany.<br>
=C2=A0 ///var/lib/opkg/info/epiphany.postinst: line 2: glib-compile-schemas=
: not found<br>
<br>
I believe this is because glib-compile-schemas was moved from<br>
glib-2.0-utils to glib-2.0-dev by this change (Poky)<br>
<br>
commit cc97d5760100415ed22fa329e8962e5f37b8d741<br>
Author: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" targ=
et=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Wed Mar 23 10:59:08 2016 +0200<br>
<br>
=C2=A0 =C2=A0 glib-2.0: Fix packaging<br>
<br>
=C2=A0 =C2=A0 * move gdbus-codegen to ${PN}-codegen<br>
=C2=A0 =C2=A0 * move other development tools and data files to ${PN}-dev<br=
>
=C2=A0 =C2=A0 * remove references to non-existent paths<br>
<br>
=C2=A0 =C2=A0 (From OE-Core rev: 351064e9c5deb6411c8a0d40ebd4fd4f83299d4e)<=
br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kuk=
konen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation=
.org</a>&gt;<br>
<br>
Installing glib-2.0-dev just to get this tool doesn&#39;t seem reasonable a=
s<br>
it hauls in a boatload of other packages, including bash and friends, which=
<br>
I don&#39;t want on my target.<br></blockquote><div><br></div><div>That&#39=
;s a valid point, I did not realize schema XML compilation was done on post=
inst (instead of build time). I&#39;ll fix this.</div><div>=C2=A0</div><div=
>Thanks,</div><div>=C2=A0 Jussi</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
Filed as bug #9431<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
------------------------------------------------------------<br>
Gary Thomas=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 Consulting for the<br>
MLB Associates=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 Embedded world<br>
------------------------------------------------------------<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--94eb2c11e7caf8b4b005302fe09e--
