Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB8F6E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:11:20 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id xm8so52670911igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yVi7iAPA6/Xy0w1utRujR5lZPCrtf5htqUQ0Zp58pw0=;
	b=mIVHg63mk7korfXQemLFfY5e856nQ0KdUnoQOMMwQb3KzErgNeIqLrrFQeUvtRJTqc
	9Ab5Gm2WPRUpIxHf4StEaTq3xofG6qjbIfXu5QiRa/VTBJ5ahH6Zxtj6t4aeJGJjlJKx
	Kp6lBqm8Q6ApARN7jWuKf8V05kkiXb2xgLFepbyulzJoiJQwFjMvKDqRI9WDJGHZRk0n
	W5MWPd9P054UQbLaf31dPU/viOHNWTPWQWvPjVFuutUBRDmAxookei+6iKbt3y8A8lxf
	+XLA7WpCpUy/tEY2J7BTelZhO8HNVCs4VYOxshtL6JpOUC96r1VJTWgYOE/Bdjuwx1Cq
	+zQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yVi7iAPA6/Xy0w1utRujR5lZPCrtf5htqUQ0Zp58pw0=;
	b=VJOvj/Qp9go6ctSI8+LnLD3Tth6gQ84Uc6Hb/1qwJZZq4tfYjk1wj/c3Qz8NHWOSsi
	jwinaH9Wrhnzdwmy2i8xFxNKtf1EVPGN+J1v3D2Ghx8WVBI8pzZqC8B7Zmwli/D06ZL0
	QfDVxfp0QRKXyqoBt0In2iUMf7L50Kwhum2Ds1YhQSziL8GvVpCx1MjPCMxvf72Rb7PC
	um9G4t9nU60KopU45dmzrg0oEegbPvigruwCPv+cx950weuYzH/c4HBoPld6N98HWyzG
	gkb/PKxqZzNN3ztz8zRZHKYKi9DVrk8PkFQi7O9C9SlGUTLglyk6HFfC9cWN+7UJLrw1
	SpQA==
X-Gm-Message-State: ALoCoQmoeORWkHBmJ871YVOg35OwnA2BKG1RBfLdJZ4AXD4WhH+2ItmDnXNK0w932giaiGGPfB/TcHkLSKyQ2VJ1Xn/ygoaey+Ji6nHd15GocJcR5xqHgoQ=
X-Received: by 10.107.155.209 with SMTP id d200mr8900696ioe.133.1450278668107; 
	Wed, 16 Dec 2015 07:11:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 16 Dec 2015 07:10:48 -0800 (PST)
In-Reply-To: <56717A07.2010100@mlbassoc.com>
References: <56717A07.2010100@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Dec 2015 15:10:48 +0000
Message-ID: <CAJTo0LYaTqK1BOQZLNxK2Sxg6bA_hx=m-XLUQSWwuv9YymgVdw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Error building glib
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
X-List-Received-Date: Wed, 16 Dec 2015 15:11:21 -0000
Content-Type: multipart/alternative; boundary=001a11403402d6973f0527055075

--001a11403402d6973f0527055075
Content-Type: text/plain; charset=UTF-8

On 16 December 2015 at 14:49, Gary Thomas <gary@mlbassoc.com> wrote:

> Using master as of 2015-12-16 (f1f3716776078d68bd9e3734bca881a486dc2ea3)
> I get this error:
>
> ERROR: Command Error: exit status: 1  Output:
> Applying patch allow-deprecated.patch
>

Looks like you have a layer with a bbappend for glib-2.0, as master's
glib-2.0 doesn't have that patch:

SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
           file://configure-libtool.patch \
           file://fix-conflicting-rand.patch \
           file://add-march-i486-into-CFLAGS-automatically.patch \
           file://glib-2.0-configure-readlink.patch \
           file://run-ptest \
           file://ptest-paths.patch \
           file://uclibc.patch \

 file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
           file://allow-run-media-sdX-drive-mount-if-username-root.patch \
  file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
  file://0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch \
           file://Enable-more-tests-while-cross-compiling.patch \
          "

In fact that revision isn't a poky or oe-core commit.

The problem is that allow-deprecated.patch is patching generated files.
Remove all hunks that touch Makefile.in.

Ross

--001a11403402d6973f0527055075
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 December 2015 at 14:49, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"=
mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex"><div id=3D":1pr" class=3D"" style=3D"overflow:=
hidden">Using master as of 2015-12-16 (f1f3716776078d68bd9e3734bca881a486dc=
2ea3)<br>
I get this error:<br>
<br>
ERROR: Command Error: exit status: 1=C2=A0 Output:<br>
Applying patch allow-deprecated.patch<br></div></blockquote></div><br>Looks=
 like you have a layer with a bbappend for glib-2.0, as master&#39;s glib-2=
.0 doesn&#39;t have that patch:</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra"><div class=3D"gmail_extra">SRC_URI =3D &quot;${GN=
OME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \</div><div class=3D"gmail_e=
xtra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure-libtool.pat=
ch \</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://fix-conflicting-rand.patch \</div><div class=3D"gmail_extra">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-march-i486-into-CFLAGS-aut=
omatically.patch \</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0file://glib-2.0-configure-readlink.patch \</div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest =
\</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
file://ptest-paths.patch \</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://uclibc.patch \</div><div class=3D"gmail_e=
xtra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-Do-=
not-use-readlink-when-cross-compilin.patch \</div><div class=3D"gmail_extra=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://allow-run-media-sdX-drive=
-mount-if-username-root.patch \</div><div class=3D"gmail_extra"><span class=
=3D"" style=3D"white-space:pre">	</span> =C2=A0 file://0001-Remove-the-warn=
ing-about-deprecated-paths-in-schemas.patch \</div><div class=3D"gmail_extr=
a"><span class=3D"" style=3D"white-space:pre">	</span> =C2=A0 file://0001-g=
io-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch \</div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Enable-mor=
e-tests-while-cross-compiling.patch \</div><div class=3D"gmail_extra">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">In fact that revision isn&#39;t a poky or =
oe-core commit.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">The problem is that allow-deprecated.patch is patching generated =
files.=C2=A0 Remove all hunks that touch Makefile.in.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a11403402d6973f0527055075--
