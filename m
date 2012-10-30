Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TTAnj-0007Hg-Dl
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 13:20:11 +0100
Received: by mail-vb0-f47.google.com with SMTP id ez10so167973vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 05:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=UDaZG+gTt52bf3semGGPXNzzTw6KB1zOKNVJ9FDZOLE=;
	b=n/bmZFoBjjp5fEqPooDDkyrlBAlh2282v6RfmPACSw9JXFIfklQsCeeN0N+JwJfWWK
	RBm2SJWQMejPgUDAJ2RMa3C9k+XcogL0B8muUAW1nILnZiz2pNwA0eGEsfbTrQ3HLJn3
	wKLpxHEIjMg8/e+zK0N9dw7sv4KFU4NQ+Ma5V+oOpn3suWdnVqe7J6OWtXyiHBStUqIV
	HkPK2beepKyiv5ZRVLnErOFdM7i8D0JQNd1aoD6OO9AVQ0o+UaXzm+S+6qaczqB/jC2v
	l6N/5NJdX9KeIg3juXpP9vgrNzvrKuoTar/hF2uutOrS9g3nPLp8XSS6UCH2W1weNM5T
	jhCg==
Received: by 10.52.29.141 with SMTP id k13mr42735679vdh.131.1351598795431;
	Tue, 30 Oct 2012 05:06:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.59.0.10 with HTTP; Tue, 30 Oct 2012 05:06:15 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1351598565-7424-1-git-send-email-ross.burton@intel.com>
References: <1351598565-7424-1-git-send-email-ross.burton@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 30 Oct 2012 14:06:15 +0200
Message-ID: <CAK18fxGrYaj-GQ7pCCR84vWO1JujPL_ySrZ2wPQfJJ5vp5y6hA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmlweUgfp+eHEF7d6EwFqAQR3w6IsZHPCx3loOVMubEUdcMMC/Nx97WYbAzpNMC0p7crOHZ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnome-common: Fix license
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
X-List-Received-Date: Tue, 30 Oct 2012 12:20:11 -0000
Content-Type: multipart/alternative; boundary=20cf307c9b0c149ed204cd459ef4

--20cf307c9b0c149ed204cd459ef4
Content-Type: text/plain; charset=ISO-8859-1

Ack


On Tue, Oct 30, 2012 at 2:02 PM, Ross Burton <ross.burton@intel.com> wrote:

> gnome-common 2.28 is GPLv2+.  From Christian Persch, upstream:
>
>   The licence is presumed GPL2+, although it's not there explicitly.  GPL2+
>   because as far as I could figure out when I tried to, gnome-autogen
> started in
>   gnome-core which had a GPL2 COPYING file.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-gnome/gnome/gnome-common_2.28.0.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bbb/meta/recipes-gnome/gnome/
> gnome-common_2.28.0.bb
> index 8936dbd..e094ccf 100644
> --- a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
> +++ b/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
> @@ -2,11 +2,11 @@ DESCRIPTION = "Common macros for building GNOME
> applications"
>  HOMEPAGE = "http://www.gnome.org/"
>  BUGTRACKER = "https://bugzilla.gnome.org/"
>
> -LICENSE = "GPLv3"
> +LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>  SECTION = "x11/gnome"
> -PR = "r1"
> +PR = "r3"
>  inherit gnome allarch
>
>  # The omf.make file failed if scrollkeeper doesn't happen to be
> --
> 1.7.10
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--20cf307c9b0c149ed204cd459ef4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ack<br>
<br><br><div class=3D"gmail_quote">On Tue, Oct 30, 2012 at 2:02 PM, Ross Bu=
rton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">

gnome-common 2.28 is GPLv2+. =A0From Christian Persch, upstream:<br>
<br>
=A0 The licence is presumed GPL2+, although it&#39;s not there explicitly. =
=A0GPL2+<br>
=A0 because as far as I could figure out when I tried to, gnome-autogen sta=
rted in<br>
=A0 gnome-core which had a GPL2 COPYING file.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=A0meta/recipes-gnome/gnome/<a href=3D"http://gnome-common_2.28.0.bb" targe=
t=3D"_blank">gnome-common_2.28.0.bb</a> | =A0 =A04 ++--<br>
=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-gnome/gnome/<a href=3D"http://gnome-common_2.28.0=
.bb" target=3D"_blank">gnome-common_2.28.0.bb</a> b/meta/recipes-gnome/gnom=
e/<a href=3D"http://gnome-common_2.28.0.bb" target=3D"_blank">gnome-common_=
2.28.0.bb</a><br>


index 8936dbd..e094ccf 100644<br>
--- a/meta/recipes-gnome/gnome/<a href=3D"http://gnome-common_2.28.0.bb" ta=
rget=3D"_blank">gnome-common_2.28.0.bb</a><br>
+++ b/meta/recipes-gnome/gnome/<a href=3D"http://gnome-common_2.28.0.bb" ta=
rget=3D"_blank">gnome-common_2.28.0.bb</a><br>
@@ -2,11 +2,11 @@ DESCRIPTION =3D &quot;Common macros for building GNOME ap=
plications&quot;<br>
=A0HOMEPAGE =3D &quot;<a href=3D"http://www.gnome.org/" target=3D"_blank">h=
ttp://www.gnome.org/</a>&quot;<br>
=A0BUGTRACKER =3D &quot;<a href=3D"https://bugzilla.gnome.org/" target=3D"_=
blank">https://bugzilla.gnome.org/</a>&quot;<br>
<br>
-LICENSE =3D &quot;GPLv3&quot;<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e80d=
47fae504&quot;<br>
<br>
=A0SECTION =3D &quot;x11/gnome&quot;<br>
-PR =3D &quot;r1&quot;<br>
+PR =3D &quot;r3&quot;<br>
=A0inherit gnome allarch<br>
<br>
=A0# The omf.make file failed if scrollkeeper doesn&#39;t happen to be<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br>

--20cf307c9b0c149ed204cd459ef4--
