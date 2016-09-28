Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6F960079
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 15:26:38 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id 192so47280575vkl.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UYE+pjMTcpCqIzuSkhrPSJSWcYw9Aw05WvS/KqP7n6k=;
	b=JSYVpGH6bjS4K2tlaASM5fpgKMu7gffvNaHJSLGZW+kmZwdVOTy/peaf90F++IuJ++
	6URtQ5ccmG11VcyjJt+oJ1IH5rF4/8O4QqgN6l6t/EoffafuW3l6KyMk+PCA6yQbrZxI
	BKIWPmiweSgyjVxjFQbXOl/8itt7FeETrKIWvB9KFc6Bb89OLuEiiQayO0eAlVOFuyqX
	O0nC32Vzltmf5M4+Uup7/H2IYBfZqrGhfqk4RasbrmBcVog/sNVSeTQl3FwOKISqPI+q
	PGNjaPPD1cUESoHQ6HcsedjgOqMU+sV96Cu2b+I0Fa/xM+2WUWcux5XPC3pkz/7Aw9oT
	AEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UYE+pjMTcpCqIzuSkhrPSJSWcYw9Aw05WvS/KqP7n6k=;
	b=SSHGk0JDMkF9DAZtbDLaICupq6kc5FriJUoeVPo6v4EG2S109HuhzIW8N+AIhqsuGB
	dqSV9hCQYHijHZjt4F3UscfYOhabbG6p+slTYitTqbTHWKoww10hpxLUHOyzO0Fr5Kg1
	VHliTRNCgd4RsZpnfIvpnhrZPOrqXIyUQ73uz6gKCjJnpERSTCbZHp0Q5snUHkwLa+Sm
	zVrSL4dm5kXnHGPKcOvwOX733VKAfNcx8C0K7fGe+b3b+H3Wd6xQfhQneGqeVUQ5oz48
	exlqBgiNEwFuzRb2JG0K8HnMOv4q3jqJGCcwRsM2Nb5gAxc+7NGBb6RjRE34VgBdJ+KP
	d4cg==
X-Gm-Message-State: AA6/9RkqOxveXXR/CgXvPNtRyLw4X7PAfCTnuwoIiHt64c4OIJj1q48tQeyN6xlE1qEnHeKxXloyauRcAmUNpA==
X-Received: by 10.31.183.78 with SMTP id h75mr17008038vkf.148.1475076399241;
	Wed, 28 Sep 2016 08:26:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Wed, 28 Sep 2016 08:26:38 -0700 (PDT)
Received: by 10.176.86.206 with HTTP; Wed, 28 Sep 2016 08:26:38 -0700 (PDT)
In-Reply-To: <57EBDC0E.9030108@linux.intel.com>
References: <1475019786-20996-1-git-send-email-anibal.limon@linux.intel.com>
	<57EB044C.3070505@linux.intel.com>
	<CAMKF1so-JOz85vVL0+OPXH2NUmvUkCWkPf+uCn-GUCtfLZjiog@mail.gmail.com>
	<57EBDC0E.9030108@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Sep 2016 08:26:38 -0700
Message-ID: <CAMKF1sp=M1ZQE7_bv==qkqaG3RKX7QOt0LDeDUmbaQNC0pKwyA@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Alexandru Moise <00moses.alexander00@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] db: Upgrade to 6.0.35
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
X-List-Received-Date: Wed, 28 Sep 2016 15:26:40 -0000
Content-Type: multipart/alternative; boundary=001a1143a4c2cb21b0053d92fcfb

--001a1143a4c2cb21b0053d92fcfb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

We need to understand that disclaimer may be its requiring every one who is
distributing it to accept it.

On Sep 28, 2016 8:04 AM, "An=C3=ADbal Lim=C3=B3n" <anibal.limon@linux.intel=
.com>
wrote:

>
>
> On 09/27/2016 08:24 PM, Khem Raj wrote:
> > On Tue, Sep 27, 2016 at 4:44 PM, An=C3=ADbal Lim=C3=B3n
> > <anibal.limon@linux.intel.com> wrote:
> >> For apply this patch we need to host the db-6.0.35 tarball into yp
> >> sources mirror because oracle page ask for login in order to download
> >> the source.
> >
> > why do they ask for login ? is there some disclaimer that needs to be
> > accepted before download ?
>
> That's right, for be able to build i need to put into my own source
> mirror for download.
>
> >
> >>
> >>         alimon
> >>
> >> On 09/27/2016 06:43 PM, An=C3=ADbal Lim=C3=B3n wrote:
> >>> This is a minor upgrade that fix an issue related to multiple
> >>> rpm instances querying the database [1].
> >>>
> >>> The bugfixes related are,
> >>>
> >>> - Fixed a bug that may lead to a crash when opening multiple
> environments
> >>> in a multi-threaded program.
> >>> - Fixed a bug where closing a panic environment raised access violati=
on
> >>>   and crashed the program.
> >>>
> >>> For see the complete list of changes mainly bugfixes between
> >>> 6.0.30 and 6.0.35 [2].
> >>>
> >>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10157#c0
> >>> [2] http://download.oracle.com/otndocs/products/berkeleydb/
> html/changelog_6_0.html#idp503384
> >>>
> >>> [YOCTO #10157]
> >>>
> >>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> >>> ---
> >>>  meta/recipes-support/db/{db_6.0.30.bb =3D> db_6.0.35.bb} | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>  rename meta/recipes-support/db/{db_6.0.30.bb =3D> db_6.0.35.bb} (96%=
)
> >>>
> >>> diff --git a/meta/recipes-support/db/db_6.0.30.bb
> b/meta/recipes-support/db/db_6.0.35.bb
> >>> similarity index 96%
> >>> rename from meta/recipes-support/db/db_6.0.30.bb
> >>> rename to meta/recipes-support/db/db_6.0.35.bb
> >>> index 072cbdf..4a3b72f 100644
> >>> --- a/meta/recipes-support/db/db_6.0.30.bb
> >>> +++ b/meta/recipes-support/db/db_6.0.35.bb
> >>> @@ -26,8 +26,8 @@ SRC_URI =3D "http://download.oracle.com/
> berkeley-db/db-${PV}.tar.gz \
> >>>             file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch \
> >>>             "
> >>>
> >>> -SRC_URI[md5sum] =3D "ad28eb86ad3203b5422844db179c585b"
> >>> -SRC_URI[sha256sum] =3D "608e4b1cf390e9bf54c0ef00c5bd9c
> a76d36e2261b9f4d33d54516f3f6a20fd2"
> >>> +SRC_URI[md5sum] =3D "c65a4d3e930a116abaaf69edfc697f25"
> >>> +SRC_URI[sha256sum] =3D "24421affa8ae436fe427ae4f5f2d16
> 34da83d3d55a5ad6354a98eeedb825de55"
> >>>
> >>>  # Exclude NC versions which lack AES encryption
> >>>  UPSTREAM_CHECK_REGEX =3D "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
> >>>
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
>
>

--001a1143a4c2cb21b0053d92fcfb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">We need to understand that disclaimer may be its requiring e=
very one who is distributing it to accept it.</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sep 28, 2016 8=
:04 AM, &quot;An=C3=ADbal Lim=C3=B3n&quot; &lt;<a href=3D"mailto:anibal.lim=
on@linux.intel.com">anibal.limon@linux.intel.com</a>&gt; wrote:<br type=3D"=
attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 09/27/2016 08:24 PM, Khem Raj wrote:<br>
&gt; On Tue, Sep 27, 2016 at 4:44 PM, An=C3=ADbal Lim=C3=B3n<br>
&gt; &lt;<a href=3D"mailto:anibal.limon@linux.intel.com">anibal.limon@linux=
.intel.com</a>&gt; wrote:<br>
&gt;&gt; For apply this patch we need to host the db-6.0.35 tarball into yp=
<br>
&gt;&gt; sources mirror because oracle page ask for login in order to downl=
oad<br>
&gt;&gt; the source.<br>
&gt;<br>
&gt; why do they ask for login ? is there some disclaimer that needs to be<=
br>
&gt; accepted before download ?<br>
<br>
That&#39;s right, for be able to build i need to put into my own source<br>
mirror for download.<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alimon<br>
&gt;&gt;<br>
&gt;&gt; On 09/27/2016 06:43 PM, An=C3=ADbal Lim=C3=B3n wrote:<br>
&gt;&gt;&gt; This is a minor upgrade that fix an issue related to multiple<=
br>
&gt;&gt;&gt; rpm instances querying the database [1].<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The bugfixes related are,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - Fixed a bug that may lead to a crash when opening multiple e=
nvironments<br>
&gt;&gt;&gt; in a multi-threaded program.<br>
&gt;&gt;&gt; - Fixed a bug where closing a panic environment raised access =
violation<br>
&gt;&gt;&gt;=C2=A0 =C2=A0and crashed the program.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; For see the complete list of changes mainly bugfixes between<b=
r>
&gt;&gt;&gt; 6.0.30 and 6.0.35 [2].<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [1] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D10157#c0" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctop=
roject.<wbr>org/show_bug.cgi?id=3D10157#c0</a><br>
&gt;&gt;&gt; [2] <a href=3D"http://download.oracle.com/otndocs/products/ber=
keleydb/html/changelog_6_0.html#idp503384" rel=3D"noreferrer" target=3D"_bl=
ank">http://download.oracle.com/<wbr>otndocs/products/berkeleydb/<wbr>html/=
changelog_6_0.html#<wbr>idp503384</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [YOCTO #10157]<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:an=
ibal.limon@linux.intel.com">anibal.limon@linux.intel.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-support/db/{<a href=3D"http://db_6.0.30.bb"=
 rel=3D"noreferrer" target=3D"_blank">db_6.<wbr>0.30.bb</a> =3D&gt; <a href=
=3D"http://db_6.0.35.bb" rel=3D"noreferrer" target=3D"_blank">db_6.0.35.bb<=
/a>} | 4 ++--<br>
&gt;&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;&gt;=C2=A0 rename meta/recipes-support/db/{<a href=3D"http://db_6.0=
.30.bb" rel=3D"noreferrer" target=3D"_blank">db_6.<wbr>0.30.bb</a> =3D&gt; =
<a href=3D"http://db_6.0.35.bb" rel=3D"noreferrer" target=3D"_blank">db_6.0=
.35.bb</a>} (96%)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/recipes-support/db/<a href=3D"http://db_6.0.=
30.bb" rel=3D"noreferrer" target=3D"_blank">db_<wbr>6.0.30.bb</a> b/meta/re=
cipes-support/db/<a href=3D"http://db_6.0.35.bb" rel=3D"noreferrer" target=
=3D"_blank">db_<wbr>6.0.35.bb</a><br>
&gt;&gt;&gt; similarity index 96%<br>
&gt;&gt;&gt; rename from meta/recipes-support/db/<a href=3D"http://db_6.0.3=
0.bb" rel=3D"noreferrer" target=3D"_blank">db_6.<wbr>0.30.bb</a><br>
&gt;&gt;&gt; rename to meta/recipes-support/db/<a href=3D"http://db_6.0.35.=
bb" rel=3D"noreferrer" target=3D"_blank">db_6.<wbr>0.35.bb</a><br>
&gt;&gt;&gt; index 072cbdf..4a3b72f 100644<br>
&gt;&gt;&gt; --- a/meta/recipes-support/db/<a href=3D"http://db_6.0.30.bb" =
rel=3D"noreferrer" target=3D"_blank">db_<wbr>6.0.30.bb</a><br>
&gt;&gt;&gt; +++ b/meta/recipes-support/db/<a href=3D"http://db_6.0.35.bb" =
rel=3D"noreferrer" target=3D"_blank">db_<wbr>6.0.35.bb</a><br>
&gt;&gt;&gt; @@ -26,8 +26,8 @@ SRC_URI =3D &quot;<a href=3D"http://download=
.oracle.com/berkeley-db/db-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blan=
k">http://download.oracle.com/<wbr>berkeley-db/db-${PV}.tar.gz</a> \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefile=
-let-libdb-6.0.<wbr>la-depend-os_map.l.patch \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -SRC_URI[md5sum] =3D &quot;<wbr>ad28eb86ad3203b5422844db179c58=
<wbr>5b&quot;<br>
&gt;&gt;&gt; -SRC_URI[sha256sum] =3D &quot;<wbr>608e4b1cf390e9bf54c0ef00c5b=
d9c<wbr>a76d36e2261b9f4d33d54516f3f6a2<wbr>0fd2&quot;<br>
&gt;&gt;&gt; +SRC_URI[md5sum] =3D &quot;<wbr>c65a4d3e930a116abaaf69edfc697f=
<wbr>25&quot;<br>
&gt;&gt;&gt; +SRC_URI[sha256sum] =3D &quot;<wbr>24421affa8ae436fe427ae4f5f2=
d16<wbr>34da83d3d55a5ad6354a98eeedb825<wbr>de55&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 # Exclude NC versions which lack AES encryption<br>
&gt;&gt;&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;db-(?P&lt;pver&gt;\d+\.\d=
+(\.\d+)?)<wbr>.tar&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt;<br>
<br>
</blockquote></div></div>

--001a1143a4c2cb21b0053d92fcfb--
