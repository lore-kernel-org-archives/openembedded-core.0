Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1T3kCw-0008Q2-NP
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 10:53:07 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Aug 2012 01:41:00 -0700
Received: by qcmv28 with SMTP id v28so4611218qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 01:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=tp6omHhzoFSStKEXz/YvvjAv8WpQyZvcRg9dO5o5qIw=;
	b=Ujyaf1X81+DB8fQ4mCK+nuU0+09yBjcdUNUv27uvaUpDDIBSU4tglp/nMAxG81vlR2
	iFHSbHYWUbrIri7jv9m6XKO2BfFweBfW1q1dqhzUJ+Aw8Y7fATS2WYFv52fEZBF/i4Sk
	VVPJaNnQcs73u0vVJ7GHhhL2POe82iGd8VL4nxJXdADaoS+7FmSUoX6Uo1sPO2yGMAPo
	Ta4LORwqcPTESVP0ibenrsoNgny83JMo2gEYVCK25XK8tOQ8txC70ie4po9gs6ZYrPeT
	e9fbhK7cRIO9hAtrGfmHoZqUd59pZSQzRs1e0nDiEZ5fVP0f/GJAuPIAMEfYDlJmVNix
	o1AQ==
Received: by 10.224.203.70 with SMTP id fh6mr2837058qab.52.1345538456242; Tue,
	21 Aug 2012 01:40:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.49.74.74 with HTTP; Tue, 21 Aug 2012 01:40:35 -0700 (PDT)
In-Reply-To: <1343834167-2572-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1343834167-2572-1-git-send-email-bogdan.a.marinescu@intel.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 21 Aug 2012 11:40:35 +0300
Message-ID: <CAMZjud2SANYM29NkPB+JO45tO2Bm402SEKGo9410tK7FfnXDNA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQmW8M9KGlAi+B0Mzi1L/KrXUonZ4c3kuyMqqJqRsYAvFGJqjOKOSn6o79fOI0BDbLZ+FYEe
Subject: Re: [PATCH] python-dbus: updated to 1.1.1
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
X-List-Received-Date: Tue, 21 Aug 2012 08:53:07 -0000
Content-Type: multipart/alternative; boundary=20cf300fabfbb749ee04c7c29587

--20cf300fabfbb749ee04c7c29587
Content-Type: text/plain; charset=ISO-8859-1

Resending.

On Wed, Aug 1, 2012 at 6:16 PM, Bogdan Marinescu <
bogdan.a.marinescu@intel.com> wrote:

> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  .../{python-dbus_1.1.0.bb => python-dbus_1.1.1.bb} |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-dbus_1.1.0.bb =>
> python-dbus_1.1.1.bb} (83%)
>
> diff --git a/meta/recipes-devtools/python/python-dbus_1.1.0.bbb/meta/recipes-devtools/python/
> python-dbus_1.1.1.bb
> similarity index 83%
> rename from meta/recipes-devtools/python/python-dbus_1.1.0.bb
> rename to meta/recipes-devtools/python/python-dbus_1.1.1.bb
> index a10fda3..51d5bc2 100644
> --- a/meta/recipes-devtools/python/python-dbus_1.1.0.bb
> +++ b/meta/recipes-devtools/python/python-dbus_1.1.1.bb
> @@ -8,8 +8,8 @@ PR = "r0"
>
>  SRC_URI = "
> http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "41a459bbbb5fd92eeebd632623af0bd7"
> -SRC_URI[sha256sum] =
> "2dc30b53cdb2e20f8d0265af3be878e9da68745cf9ccc72f75de869094c4fc60"
> +SRC_URI[md5sum] = "742c7432ad0f7c3f98291d58fa2e35dc"
> +SRC_URI[sha256sum] =
> "8917ca4fb8f4d693aee18d200cbad166b2c938dfb88c03bb4ab3d90a7c915e88"
>  S = "${WORKDIR}/dbus-python-${PV}"
>
>  inherit distutils-base autotools pkgconfig
> --
> 1.7.9.5
>
>

--20cf300fabfbb749ee04c7c29587
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Resending.<br><br><div class=3D"gmail_quote">On Wed, Aug 1, 2012 at 6:16 PM=
, Bogdan Marinescu <span dir=3D"ltr">&lt;<a href=3D"mailto:bogdan.a.marines=
cu@intel.com" target=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;</span>=
 wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Bogdan Marinescu &lt;<a href=
=3D"mailto:bogdan.a.marinescu@intel.com">bogdan.a.marinescu@intel.com</a>&g=
t;<br>


---<br>
=A0.../{<a href=3D"http://python-dbus_1.1.0.bb" target=3D"_blank">python-db=
us_1.1.0.bb</a> =3D&gt; <a href=3D"http://python-dbus_1.1.1.bb" target=3D"_=
blank">python-dbus_1.1.1.bb</a>} | =A0 =A04 ++--<br>
=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=A0rename meta/recipes-devtools/python/{<a href=3D"http://python-dbus_1.1.0=
.bb" target=3D"_blank">python-dbus_1.1.0.bb</a> =3D&gt; <a href=3D"http://p=
ython-dbus_1.1.1.bb" target=3D"_blank">python-dbus_1.1.1.bb</a>} (83%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.1=
.0.bb" target=3D"_blank">python-dbus_1.1.0.bb</a> b/meta/recipes-devtools/p=
ython/<a href=3D"http://python-dbus_1.1.1.bb" target=3D"_blank">python-dbus=
_1.1.1.bb</a><br>


similarity index 83%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.1.=
0.bb" target=3D"_blank">python-dbus_1.1.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.1.1.=
bb" target=3D"_blank">python-dbus_1.1.1.bb</a><br>
index a10fda3..51d5bc2 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.1.0.bb" =
target=3D"_blank">python-dbus_1.1.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.1.1.bb" =
target=3D"_blank">python-dbus_1.1.1.bb</a><br>
@@ -8,8 +8,8 @@ PR =3D &quot;r0&quot;<br>
<br>
=A0SRC_URI =3D &quot;<a href=3D"http://dbus.freedesktop.org/releases/dbus-p=
ython/dbus-python-${PV}.tar.gz" target=3D"_blank">http://dbus.freedesktop.o=
rg/releases/dbus-python/dbus-python-${PV}.tar.gz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;41a459bbbb5fd92eeebd632623af0bd7&quot;<br>
-SRC_URI[sha256sum] =3D &quot;2dc30b53cdb2e20f8d0265af3be878e9da68745cf9ccc=
72f75de869094c4fc60&quot;<br>
+SRC_URI[md5sum] =3D &quot;742c7432ad0f7c3f98291d58fa2e35dc&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8917ca4fb8f4d693aee18d200cbad166b2c938dfb88c0=
3bb4ab3d90a7c915e88&quot;<br>
=A0S =3D &quot;${WORKDIR}/dbus-python-${PV}&quot;<br>
<br>
=A0inherit distutils-base autotools pkgconfig<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br>

--20cf300fabfbb749ee04c7c29587--
