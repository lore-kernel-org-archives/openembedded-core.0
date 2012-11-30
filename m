Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TePke-0007Hn-6z
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 13:31:28 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 30 Nov 2012 04:17:09 -0800
Received: by mail-ee0-f69.google.com with SMTP id d41so394699eek.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 04:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:x-gm-message-state;
	bh=oIQLtYrV3alR89Mqze7DuDgo3ztGVHgHSoDaqQdCXlA=;
	b=Jfr69wHLeEBOj3HLCApE+yr5VlaPjOseSsw0YB0/l3A+vizdLveWvlFnvmtRVrpIuD
	G2kwLOuHbGrY0geanimtfVzjyj6fWjQayD5hgP/V2y1NV+IPkdFZ+IwY3Nor8wzeXe+4
	x41fPbgE0AK5vbV++9Jo/rBlDzxTpmgUB9RAK9derfo5//NwQtXzwUjayJ9GLUXxhHSk
	XprKO0HA9kFGoMaX7O8aBi778HK8Xw9LhJQ9Bg31ssdoyh1IW58BCj93N7me6VRBro4q
	tMQxz6NbnyiEmqkXZEhuRYvu0IfIsSXhRoBv8IUGNgvFmwBi1HbDUrTi5E7WBWMibfh6
	2n/A==
Received: by 10.204.12.203 with SMTP id y11mr305506bky.27.1354277827704;
	Fri, 30 Nov 2012 04:17:07 -0800 (PST)
Received: by 10.204.12.203 with SMTP id y11mr305500bky.27.1354277827346;
	Fri, 30 Nov 2012 04:17:07 -0800 (PST)
Received: from [10.135.217.182] (92.40.254.14.threembb.co.uk. [92.40.254.14])
	by mx.google.com with ESMTPS id 18sm3137918bkv.0.2012.11.30.04.17.04
	(version=SSLv3 cipher=OTHER); Fri, 30 Nov 2012 04:17:06 -0800 (PST)
Date: Fri, 30 Nov 2012 12:17:01 +0000
From: Ross Burton <ross.burton@intel.com>
To: =?utf-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Message-ID: <CA5B1CF3A42349508888627E057E3DFD@intel.com>
In-Reply-To: <1354240376-3009-1-git-send-email-schnitzeltony@googlemail.com>
References: <1354240376-3009-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: sparrow 1.3.3 (build 507.32)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlnIb+yJod0ffe1zXy5z2MG8fphXghG3AiomNmkYzg1t1YZfpWn1x+BQeiF3QrBuJj+dWGrMR7FkWY6RKH+15thk8yIjlXpcw6bMNFf9mgtSd0up1XqpMGhBPixEyP4z+35VGNSFl6cuDL1kQti5MC2IsqJfIyidiEBAKvoHN+f1pDmNr/E65pBmIO+Wrwa1EVpah6H
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [V2] gtk+: do not prelight GtkButton in touchscreen mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 12:31:28 -0000
Content-Type: multipart/alternative; boundary="50b8a3bd_66334873_858"

--50b8a3bd_66334873_858
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

You mean upstream-status: submitted, not pending. =20

Ross-- =20
Ross Burton
Sent with Sparrow (http://www.sparrowmailapp.com/=3Fsig)


On =46riday, 30 November 2012 at 01:52, Andreas M=C3=BCller wrote:

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony=40googlemail.com>
> ---
> ...utton-do-not-prelight-in-touchscreen-mode.patch =7C 48 +++++++++++++=
+++++++
> meta/recipes-gnome/gtk+/gtk+=5F2.24.13.bb =7C 3 +-
> 2 files changed, 50 insertions(+), 1 deletions(-)
> create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-=
do-not-prelight-in-touchscreen-mode.patch
> =20
> diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not=
-prelight-in-touchscreen-mode.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.1=
3/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
> new file mode 100644
> index 0000000..19245a8
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelig=
ht-in-touchscreen-mode.patch
> =40=40 -0,0 +1,48 =40=40
> +=46rom d1f7a894674dfdd6769f1bbae31eb1a69e451a5c Mon Sep 17 00:00:00 20=
01
> +=46rom: =3D=3FUT=46-8=3Fq=3FAndreas=3D20M=3DC3=3DBCller=3F=3D <schnitz=
eltony=40googlemail.com>
> +Date: =46ri, 16 Nov 2012 22:07:28 +0100
> +Subject: =5BPATCH=5D GtkButton: do not prelight in touchscreen mode
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUT=46-8
> +Content-Transfer-Encoding: 8bit
> +
> +Code was copied from GtkToggleButton.
> +
> +Upstream-Status: pending =5B1=5D
> +
> +https://bugzilla.gnome.org/show=5Fbug.cgi=3Fid=3D689138
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony=40googlemail.com>
> +---
> + gtk/gtkbutton.c =7C 8 ++++++--
> + 1 files changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/gtk/gtkbutton.c b/gtk/gtkbutton.c
> +index f472007..1beb1b6 100644
> +--- a/gtk/gtkbutton.c
> ++++ b/gtk/gtkbutton.c
> +=40=40 -2079,15 +2079,19 =40=40 =5Fgtk=5Fbutton=5Fset=5Fdepressed (Gtk=
Button *button,
> + static void
> + gtk=5Fbutton=5Fupdate=5Fstate (GtkButton *button)
> + =7B
> +- gboolean depressed;
> ++ gboolean depressed, touchscreen;
> + GtkStateType new=5Fstate;
> + =20
> ++ g=5Fobject=5Fget (gtk=5Fwidget=5Fget=5Fsettings (GTK=5FWIDGET (butto=
n)),
> ++ =22gtk-touchscreen-mode=22, &touchscreen,
> ++ NULL);
> ++
> + if (button->activate=5Ftimeout)
> + depressed =3D button->depress=5Fon=5Factivate;
> + else
> + depressed =3D button->in=5Fbutton && button->button=5Fdown;
> + =20
> +- if (button->in=5Fbutton && (=21button->button=5Fdown =7C=7C =21depre=
ssed))
> ++ if (=21touchscreen && button->in=5Fbutton && (=21button->button=5Fdo=
wn =7C=7C =21depressed))
> + new=5Fstate =3D GTK=5FSTATE=5FPRELIGHT;
> + else
> + new=5Fstate =3D depressed =3F GTK=5FSTATE=5FACTIVE : GTK=5FSTATE=5FNO=
RMAL;
> +-- =20
> +1.7.6.5
> +
> diff --git a/meta/recipes-gnome/gtk+/gtk+=5F2.24.13.bb b/meta/recipes-g=
nome/gtk+/gtk+=5F2.24.13.bb
> index b358b7f..bc88284 100644
> --- a/meta/recipes-gnome/gtk+/gtk+=5F2.24.13.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+=5F2.24.13.bb
> =40=40 -13,6 +13,7 =40=40 SRC=5FURI =3D =22http://download.gnome.org/so=
urces/gtk+/2.24/gtk+-=24=7BPV=7D.tar.xz =5C
> file://toggle-font.diff;striplevel=3D0 =5C
> file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch =
=5C
> file://doc-fixes.patch =5C
> + file://0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch =5C
> =22
> =23 TO MERGE
> =40=40 -27,7 +28,7 =40=40 SRC=5FURI =3D =22http://download.gnome.org/so=
urces/gtk+/2.24/gtk+-=24=7BPV=7D.tar.xz =5C
> =23 file://combo-arrow-size.patch;striplevel=3D0
> =23 file://configurefix.patch
> -PR =3D =22r1=22
> +PR =3D =22r2=22
> SRC=5FURI=5Bmd5sum=5D =3D =22e949406751df51e1e40e85628005a069=22
> SRC=5FURI=5Bsha256sum=5D =3D =2235e1a01e46b02970b02ee9f299390d0aa57c121=
5ad2667bcd584b72f4ea6513d=22
> -- =20
> 1.7.4.4
> =20
> =20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Openembedded-core mailing list
> Openembedded-core=40lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> =20
> =20



--50b8a3bd_66334873_858
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


    <div id=3D=22reply-content=22>
        You mean upstream-status: submitted, not pending.
    </div><div id=3D=22reply-content=22><br></div>
    <div id=3D=225A30287E62E44A4BB77E=46C3=46609C8590=22><div>Ross</div>-=
-&nbsp;<br>Ross Burton<br><div>Sent with <a href=3D=22http://www.sparrowm=
ailapp.com/=3Fsig=22>Sparrow</a></div><div><br></div></div>
    =20
    <p style=3D=22color: =23A0A0A8;=22>On =46riday, 30 November 2012 at 0=
1:52, Andreas M=C3=BCller wrote:</p>
    <blockquote type=3D=22cite=22 style=3D=22border-left-style:solid;bord=
er-width:1px;margin-left:0px;padding-left:10px;=22>
        <div id=3D=22quoted-message-content=22><div><div>Signed-off-by: A=
ndreas M=C3=BCller &lt;schnitzeltony=40googlemail.com&gt;</div><div>---</=
div><div> ...utton-do-not-prelight-in-touchscreen-mode.patch =7C   48 +++=
+++++++++++++++++</div><div> meta/recipes-gnome/gtk+/gtk+=5F2.24.13.bb   =
         =7C    3 +-</div><div> 2 files changed, 50 insertions(+), 1 dele=
tions(-)</div><div> create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.=
13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch</div><div><br=
></div><div>diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkBut=
ton-do-not-prelight-in-touchscreen-mode.patch b/meta/recipes-gnome/gtk+/g=
tk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch</div=
><div>new file mode 100644</div><div>index 0000000..19245a8</div><div>---=
 /dev/null</div><div>+++ b/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkB=
utton-do-not-prelight-in-touchscreen-mode.patch</div><div>=40=40 -0,0 +1,=
48 =40=40</div><div>+=46rom d1f7a894674dfdd6769f1bbae31eb1a69e451a5c Mon =
Sep 17 00:00:00 2001</div><div>+=46rom: =3D=3FUT=46-8=3Fq=3FAndreas=3D20M=
=3DC3=3DBCller=3F=3D &lt;schnitzeltony=40googlemail.com&gt;</div><div>+Da=
te: =46ri, 16 Nov 2012 22:07:28 +0100</div><div>+Subject: =5BPATCH=5D Gtk=
Button: do not prelight in touchscreen mode</div><div>+MIME-Version: 1.0<=
/div><div>+Content-Type: text/plain; charset=3DUT=46-8</div><div>+Content=
-Transfer-Encoding: 8bit</div><div>+</div><div>+Code was copied from GtkT=
oggleButton.</div><div>+</div><div>+Upstream-Status: pending =5B1=5D</div=
><div>+</div><div>+https://bugzilla.gnome.org/show=5Fbug.cgi=3Fid=3D68913=
8</div><div>+</div><div>+Signed-off-by: Andreas M=C3=BCller &lt;schnitzel=
tony=40googlemail.com&gt;</div><div>+---</div><div>+ gtk/gtkbutton.c =7C =
   8 ++++++--</div><div>+ 1 files changed, 6 insertions(+), 2 deletions(-=
)</div><div>+</div><div>+diff --git a/gtk/gtkbutton.c b/gtk/gtkbutton.c</=
div><div>+index f472007..1beb1b6 100644</div><div>+--- a/gtk/gtkbutton.c<=
/div><div>++++ b/gtk/gtkbutton.c</div><div>+=40=40 -2079,15 +2079,19 =40=40=
 =5Fgtk=5Fbutton=5Fset=5Fdepressed (GtkButton *button,</div><div>+ static=
 void</div><div>+ gtk=5Fbutton=5Fupdate=5Fstate (GtkButton *button)</div>=
<div>+ =7B</div><div>+-  gboolean depressed;</div><div>++  gboolean depre=
ssed, touchscreen;</div><div>+   GtkStateType new=5Fstate;</div><div>+ </=
div><div>++  g=5Fobject=5Fget (gtk=5Fwidget=5Fget=5Fsettings (GTK=5FWIDGE=
T (button)),</div><div>++                =22gtk-touchscreen-mode=22, &amp=
;touchscreen,</div><div>++                NULL);</div><div>++</div><div>+=
   if (button-&gt;activate=5Ftimeout)</div><div>+     depressed =3D butto=
n-&gt;depress=5Fon=5Factivate;</div><div>+   else</div><div>+     depress=
ed =3D button-&gt;in=5Fbutton &amp;&amp; button-&gt;button=5Fdown;</div><=
div>+ </div><div>+-  if (button-&gt;in=5Fbutton &amp;&amp; (=21button-&gt=
;button=5Fdown =7C=7C =21depressed))</div><div>++  if (=21touchscreen &am=
p;&amp; button-&gt;in=5Fbutton &amp;&amp; (=21button-&gt;button=5Fdown =7C=
=7C =21depressed))</div><div>+     new=5Fstate =3D GTK=5FSTATE=5FPRELIGHT=
;</div><div>+   else</div><div>+     new=5Fstate =3D depressed =3F GTK=5F=
STATE=5FACTIVE : GTK=5FSTATE=5FNORMAL;</div><div>+-- </div><div>+1.7.6.5<=
/div><div>+</div><div>diff --git a/meta/recipes-gnome/gtk+/gtk+=5F2.24.13=
.bb b/meta/recipes-gnome/gtk+/gtk+=5F2.24.13.bb</div><div>index b358b7f..=
bc88284 100644</div><div>--- a/meta/recipes-gnome/gtk+/gtk+=5F2.24.13.bb<=
/div><div>+++ b/meta/recipes-gnome/gtk+/gtk+=5F2.24.13.bb</div><div>=40=40=
 -13,6 +13,7 =40=40 SRC=5FURI =3D =22http://download.gnome.org/sources/gt=
k+/2.24/gtk+-=24=7BPV=7D.tar.xz =5C</div><div>            file://toggle-f=
ont.diff;striplevel=3D0 =5C</div><div>            file://0001-bgo-584832-=
Duplicate-the-exec-string-returned-by-gtk.patch =5C</div><div>           =
 file://doc-fixes.patch =5C</div><div>+           file://0001-GtkButton-d=
o-not-prelight-in-touchscreen-mode.patch =5C</div><div> 	  =22</div><div>=
 =23 TO MERGE</div><div>=40=40 -27,7 +28,7 =40=40 SRC=5FURI =3D =22http:/=
/download.gnome.org/sources/gtk+/2.24/gtk+-=24=7BPV=7D.tar.xz =5C</div><d=
iv> =23        file://combo-arrow-size.patch;striplevel=3D0</div><div> =23=
            file://configurefix.patch</div><div>-PR =3D =22r1=22</div><di=
v>+PR =3D =22r2=22</div><div> SRC=5FURI=5Bmd5sum=5D =3D =22e949406751df51=
e1e40e85628005a069=22</div><div> SRC=5FURI=5Bsha256sum=5D =3D =2235e1a01e=
46b02970b02ee9f299390d0aa57c1215ad2667bcd584b72f4ea6513d=22</div><div>-- =
</div><div>1.7.4.4</div><div><br></div><div><br></div><div>=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F</div><div>Openembedde=
d-core mailing list</div><div>Openembedded-core=40lists.openembedded.org<=
/div><div>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</div></div></div>
        =20
        =20
        =20
        =20
    </blockquote>
    =20
    <div>
        <br>
    </div>

--50b8a3bd_66334873_858--
