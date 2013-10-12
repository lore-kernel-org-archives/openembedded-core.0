Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id E3D1F6CC37
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2013 14:46:21 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id ep20so4349999lab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2013 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=7pIVNgxcccneEJN0FqPS5ixAW/3SM/qKewdN2vhnL3o=;
	b=DVuh+8C3nMY8n+VUW/cx+xL9/tD9ywY3xyJOiTGwnROBlBanMCNCSOsieYVt4IjNuL
	fWuEeUP857Y6/zmmpRmBVy62N64GKtRqAugItegVs4YLnkyeY5tULREQ3nXy0qpxWLFA
	pU/XO/gqsFUU+RCRB+UGEOhplynTNEXOy3NX6WZjo9bePYFJ9lUVXCdRk5+Kpi+PQsQg
	dmuU84Q6uOzbW0mF1S+ypNB26/MKIdd3n1deAfBedDQHjvlaVlyBVBt1jxxY2cM0D/0U
	Loox+28HhkXC2bj7izI/AT0IEF78JqJRgw1fckSj5bA+9WWX1jxem+hmRiKcnnDiURof
	xO7w==
X-Received: by 10.152.170.166 with SMTP id an6mr21362843lac.20.1381589182759; 
	Sat, 12 Oct 2013 07:46:22 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Sat, 12 Oct 2013 07:46:02 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1310120720030.21659@oneiric>
References: <alpine.DEB.2.02.1310120713010.21588@oneiric>
	<alpine.DEB.2.02.1310120720030.21659@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 12 Oct 2013 07:46:02 -0700
X-Google-Sender-Auth: NGqEPxCRPcWnr6d-QTd2tydh4F4
Message-ID: <CABcZANmgG2Pv-XH+7t=Sd_KRRi=Qp=FXb7pnJLz4tp5aNGxRDA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can one add a "packagegroup" simply by adding the recipe file for it?
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
X-List-Received-Date: Sat, 12 Oct 2013 14:46:22 -0000
Content-Type: multipart/alternative; boundary=089e0117747576c93b04e88c4cd3

--089e0117747576c93b04e88c4cd3
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 12, 2013 at 4:24 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>   wait, i think i might have just answered my own question ... see
> below ...
>
> On Sat, 12 Oct 2013, Robert P. J. Day wrote:
>
> >   just to make sure i'm not missing anything subtle, i know you can
> > add a "packagegroup" to your build using IMAGE_FEATURES, but given
> > that there are *lots* more packagegroup recipe files in oe-core than
> > have corresponding PACKAGE_GROUP_* definitions in core-image.bbclass:
> >
> > $ find . -name "packagegroup*bb"
> > ./recipes-gnome/packagegroups/
> packagegroup-core-standalone-gmae-sdk-target.bb
> > ./recipes-gnome/packagegroups/packagegroup-toolset-native.bb
> > ./recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
> > ./recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
> > ./recipes-core/packagegroups/packagegroup-cross-canadian.bb
> > ./recipes-core/packagegroups/packagegroup-core-sdk.bb
> > ./recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
> > ./recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> > ./recipes-core/packagegroups/packagegroup-core-boot.bb
> > ./recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> > ./recipes-core/packagegroups/packagegroup-self-hosted.bb
> > ./recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> > ./recipes-core/packagegroups/packagegroup-core-tools-debug.bb
> > ./recipes-core/packagegroups/packagegroup-core-buildessential.bb
> > ./recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> > ./recipes-core/packagegroups/packagegroup-base.bb
> > ./recipes-core/packagegroups/packagegroup-core-nfs.bb
> > ./recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
> > ./recipes-graphics/packagegroups/packagegroup-core-x11.bb
> > ./recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> > ./recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> > ./recipes-graphics/packagegroups/packagegroup-core-clutter.bb
> > ./recipes-graphics/packagegroups/packagegroup-core-directfb.bb
> > ./recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
> > ./recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> > ./recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
> > ./recipes-qt/packagegroups/packagegroup-core-qt.bb
> > ./recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> > ./recipes-extended/packagegroups/packagegroup-core-lsb.bb
> > ./recipes-extended/packagegroups/packagegroup-core-basic.bb
> > $
> >
> > is it accurate to say that you can just as equivalently add the recipe
> > file directly using, say, CORE_IMAGE_EXTRA_INSTALL? is there any
> > functional difference between those two approaches?
>
>   feeling a bit sheepish if this is the answer ... i notice that
> core-image.bbclass defines:
>
>   PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"
>
> however, while there is no recipe file named
> "packagegroup-core-nfs-server.bb", there is one named
> "packagegroup-core-nfs.bb", which contains:
>
>   inherit packagegroup
>
>   PACKAGES = "${PN}-server"
>
> so does defining a PACKAGE_GROUP_* entry in core-image.bbclass allow
> the packagegroup definition search to examine the internals of a
> recipe file to check the definition of "PACKAGES" to find a match? as
> opposed to referring to a recipe file directly
>

PACKAGE_GROUP_<some group that can be listed in IMAGE_FEATURES> = "<a list
of binary packages, just as you'd add to IMAGE_INSTALL or
CORE_IMAGE_EXTRA_INSTALL yourself>"

That's all there is to it. packagegroup-core-nfs-server is a binary
package. PACKAGE_GROUP_nfs-server accepts lists of binary packages, not
lists of recipes.

Things got a bit more confusing once tasks got renamed to packagegroups, as
the pure data driven package grouping mechanism (PACKAGE_GROUP) already
existed at that time.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0117747576c93b04e88c4cd3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sat, Oct 12, 2013 at 4:24 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":em" style=3D"overflow:hidden">=
=C2=A0 wait, i think i might have just answered my own question ... see<br>
below ...<br>
<div><div class=3D"h5"><br>
On Sat, 12 Oct 2013, Robert P. J. Day wrote:<br>
<br>
&gt; =C2=A0 just to make sure i&#39;m not missing anything subtle, i know y=
ou can<br>
&gt; add a &quot;packagegroup&quot; to your build using IMAGE_FEATURES, but=
 given<br>
&gt; that there are *lots* more packagegroup recipe files in oe-core than<b=
r>
&gt; have corresponding PACKAGE_GROUP_* definitions in core-image.bbclass:<=
br>
&gt;<br>
&gt; $ find . -name &quot;packagegroup*bb&quot;<br>
&gt; ./recipes-gnome/packagegroups/<a href=3D"http://packagegroup-core-stan=
dalone-gmae-sdk-target.bb" target=3D"_blank">packagegroup-core-standalone-g=
mae-sdk-target.bb</a><br>
&gt; ./recipes-gnome/packagegroups/<a href=3D"http://packagegroup-toolset-n=
ative.bb" target=3D"_blank">packagegroup-toolset-native.bb</a><br>
&gt; ./recipes-gnome/packagegroups/<a href=3D"http://packagegroup-core-sdk-=
gmae.bb" target=3D"_blank">packagegroup-core-sdk-gmae.bb</a><br>
&gt; ./recipes-devtools/packagegroups/<a href=3D"http://packagegroup-core-d=
evice-devel.bb" target=3D"_blank">packagegroup-core-device-devel.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-cross-cana=
dian.bb" target=3D"_blank">packagegroup-cross-canadian.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-core-sdk.b=
b" target=3D"_blank">packagegroup-core-sdk.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-core-ssh-o=
penssh.bb" target=3D"_blank">packagegroup-core-ssh-openssh.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-core-stand=
alone-sdk-target.bb" target=3D"_blank">packagegroup-core-standalone-sdk-tar=
get.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-core-boot.=
bb" target=3D"_blank">packagegroup-core-boot.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-core-tools=
-profile.bb" target=3D"_blank">packagegroup-core-tools-profile.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-self-hoste=
d.bb" target=3D"_blank">packagegroup-self-hosted.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-core-ssh-d=
ropbear.bb" target=3D"_blank">packagegroup-core-ssh-dropbear.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-core-tools=
-debug.bb" target=3D"_blank">packagegroup-core-tools-debug.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-core-build=
essential.bb" target=3D"_blank">packagegroup-core-buildessential.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-core-tools=
-testapps.bb" target=3D"_blank">packagegroup-core-tools-testapps.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-base.bb" t=
arget=3D"_blank">packagegroup-base.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-core-nfs.b=
b" target=3D"_blank">packagegroup-core-nfs.bb</a><br>
&gt; ./recipes-core/packagegroups/<a href=3D"http://packagegroup-core-eclip=
se-debug.bb" target=3D"_blank">packagegroup-core-eclipse-debug.bb</a><br>
&gt; ./recipes-graphics/packagegroups/<a href=3D"http://packagegroup-core-x=
11.bb" target=3D"_blank">packagegroup-core-x11.bb</a><br>
&gt; ./recipes-graphics/packagegroups/<a href=3D"http://packagegroup-core-x=
11-base.bb" target=3D"_blank">packagegroup-core-x11-base.bb</a><br>
&gt; ./recipes-graphics/packagegroups/<a href=3D"http://packagegroup-core-x=
11-xserver.bb" target=3D"_blank">packagegroup-core-x11-xserver.bb</a><br>
&gt; ./recipes-graphics/packagegroups/<a href=3D"http://packagegroup-core-c=
lutter.bb" target=3D"_blank">packagegroup-core-clutter.bb</a><br>
&gt; ./recipes-graphics/packagegroups/<a href=3D"http://packagegroup-core-d=
irectfb.bb" target=3D"_blank">packagegroup-core-directfb.bb</a><br>
&gt; ./recipes-qt/packagegroups/<a href=3D"http://packagegroup-qte-toolchai=
n-target.bb" target=3D"_blank">packagegroup-qte-toolchain-target.bb</a><br>
&gt; ./recipes-qt/packagegroups/<a href=3D"http://packagegroup-core-qt4e.bb=
" target=3D"_blank">packagegroup-core-qt4e.bb</a><br>
&gt; ./recipes-qt/packagegroups/<a href=3D"http://packagegroup-qt-toolchain=
-target.bb" target=3D"_blank">packagegroup-qt-toolchain-target.bb</a><br>
&gt; ./recipes-qt/packagegroups/<a href=3D"http://packagegroup-core-qt.bb" =
target=3D"_blank">packagegroup-core-qt.bb</a><br>
&gt; ./recipes-sato/packagegroups/<a href=3D"http://packagegroup-core-x11-s=
ato.bb" target=3D"_blank">packagegroup-core-x11-sato.bb</a><br>
&gt; ./recipes-extended/packagegroups/<a href=3D"http://packagegroup-core-l=
sb.bb" target=3D"_blank">packagegroup-core-lsb.bb</a><br>
&gt; ./recipes-extended/packagegroups/<a href=3D"http://packagegroup-core-b=
asic.bb" target=3D"_blank">packagegroup-core-basic.bb</a><br>
&gt; $<br>
&gt;<br>
&gt; is it accurate to say that you can just as equivalently add the recipe=
<br>
&gt; file directly using, say, CORE_IMAGE_EXTRA_INSTALL? is there any<br>
&gt; functional difference between those two approaches?<br>
<br>
</div></div>=C2=A0 feeling a bit sheepish if this is the answer ... i notic=
e that<br>
core-image.bbclass defines:<br>
<br>
=C2=A0 PACKAGE_GROUP_nfs-server =3D &quot;packagegroup-core-nfs-server&quot=
;<br>
<br>
however, while there is no recipe file named<br>
&quot;<a href=3D"http://packagegroup-core-nfs-server.bb" target=3D"_blank">=
packagegroup-core-nfs-server.bb</a>&quot;, there is one named<br>
&quot;<a href=3D"http://packagegroup-core-nfs.bb" target=3D"_blank">package=
group-core-nfs.bb</a>&quot;, which contains:<br>
<br>
=C2=A0 inherit packagegroup<br>
<br>
=C2=A0 PACKAGES =3D &quot;${PN}-server&quot;<br>
<br>
so does defining a PACKAGE_GROUP_* entry in core-image.bbclass allow<br>
the packagegroup definition search to examine the internals of a<br>
recipe file to check the definition of &quot;PACKAGES&quot; to find a match=
? as<br>
opposed to referring to a recipe file directly</div></blockquote></div><br>=
PACKAGE_GROUP_&lt;some group that can be listed in IMAGE_FEATURES&gt; =3D &=
quot;&lt;a list of binary packages, just as you&#39;d add to IMAGE_INSTALL =
or CORE_IMAGE_EXTRA_INSTALL yourself&gt;&quot;</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">That&#39;s =
all there is to it. packagegroup-core-nfs-server is a binary package. PACKA=
GE_GROUP_nfs-server accepts lists of binary packages, not lists of recipes.=
</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Things got =
a bit more confusing once tasks got renamed to packagegroups, as the pure d=
ata driven package grouping mechanism (PACKAGE_GROUP) already existed at th=
at time.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e0117747576c93b04e88c4cd3--
