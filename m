Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Seiik-0005DG-PC
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 10:14:31 +0200
Received: by ghbz2 with SMTP id z2so139934ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 01:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QqudlkFB6Gc2w8ZNurugYYb0Ccpso7KRNcwLfi2Bf5o=;
	b=ihtClayyqfVei4Bn4vEfV2x+ToYRSVoiyJ8dEeGhnPWa0MtP6s/76HGjfMmjwJ2yls
	xMSueO5WpJvFpvDkzDd6ekNsQ25bORGymZpJtZ40XuKlh+JczUpCvnLOVounPGxUCgCb
	eU9xkoS52BMU0GPIrWBqR2uX9xHc3F/OUUk/kKjC6SIb+SdHIYLIuSDEgFqopwWRSFwJ
	KWE4YTwfeLSRqf3K7BLVApZwelHjmZh9m8sp/HmItZU7dtZhFURZbOuBynv9W1CZLd9G
	g/oRrz0EpCDwlf9ECwwaefQK/qf//RJNpsWYrLZJHNxhvMxIuUr/8u5lPvd0yV7u3STZ
	6KSQ==
MIME-Version: 1.0
Received: by 10.50.207.36 with SMTP id lt4mr10169061igc.5.1339574634600; Wed,
	13 Jun 2012 01:03:54 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Wed, 13 Jun 2012 01:03:54 -0700 (PDT)
In-Reply-To: <4FD78E7A.2040006@windriver.com>
References: <cover.1339438568.git.mark.hatle@windriver.com>
	<d756c12e2cdbfabf01dc0c80c0d17d221a332822.1339438568.git.mark.hatle@windriver.com>
	<CAOHjBZueyfYKnrq19a5J697ohfxriHRSarZBvbqfTFQYzoF48g@mail.gmail.com>
	<4FD78E7A.2040006@windriver.com>
Date: Wed, 13 Jun 2012 10:03:54 +0200
Message-ID: <CAOHjBZuoUfOQpsABzeHXKhkNzuOfwWi1FDdfmSrpwCS85Q03CA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] package_rpm: Add capability to directly query packageorigin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2012 08:14:31 -0000
Content-Type: multipart/alternative; boundary=14dae9340a993eda0304c25606ad

--14dae9340a993eda0304c25606ad
Content-Type: text/plain; charset=ISO-8859-1

Hi Mark,

many thanks for the explanation.

Cheers,
Giuseppe

2012/6/12 Mark Hatle <mark.hatle@windriver.com>

> On 6/12/12 2:21 AM, Giuseppe Condorelli wrote:
>
>> Hi Mark,
>> this can be interesting for me. Please can you explain with an example
>> what
>> really this patch does?
>>
>
> The resolver database is seeded with all of the items from the
> packagefeed. When you seed (install) a database, each entry gets a record
> of where the package file exists on the disk.  This is stored in the
> packageorigin field.  It is designed to be used by resolver systems.
>
> Before you could only query the packageorigin field if you were using raw
> RPM calls or using the --yaml export features.  We wanted to be able to
> query the file path from the resolver via the shell.  This patch added that
> ability.
>
> The packageorigin is likely not useful to anyone, unless you are using it
> in conjunction w/ an associated package feed/resolver database.
>
> --Mark
>
>  Many thanks,
>> Giuseppe
>>
>> 2012/6/11 Mark Hatle <mark.hatle@windriver.com <mailto:
>> mark.hatle@windriver.**com <mark.hatle@windriver.com>>>
>>
>>
>>    Add functionality to RPM to directly query the packageorigin (path)
>> from
>>    the resolver database, instead of having to do this via an indirect
>> method.
>>
>>    This results in a minor performance improvement.
>>
>>    Signed-off-by: Mark Hatle <mark.hatle@windriver.com
>>    <mailto:mark.hatle@windriver.**com <mark.hatle@windriver.com>>>
>>
>>    ---
>>    meta/classes/package_rpm.**bbclass | 18 +++++++-------
>>    .../rpm/rpm/rpm-packageorigin.**patch | 23 ++++++++++++++++++++
>>    meta/recipes-devtools/rpm/rpm_**5.4.9.bb <http://rpm_5.4.9.bb> <
>> http://rpm_5.4.9.bb> | 3 +-
>>
>>    3 files changed, 34 insertions(+), 10 deletions(-)
>>    create mode 100644 meta/recipes-devtools/rpm/rpm/**
>> rpm-packageorigin.patch
>>
>>    diff --git a/meta/classes/package_rpm.**bbclass
>> b/meta/classes/package_rpm.**bbclass
>>    index 35928ab..097fa12 100644
>>    --- a/meta/classes/package_rpm.**bbclass
>>    +++ b/meta/classes/package_rpm.**bbclass
>>    @@ -130,12 +130,12 @@ resolve_package_rpm () {
>>    shift
>>    local pkg_name=""
>>    for solve in `cat ${conffile}`; do
>>    - pkg_name=$(${RPM} -D "_dbpath $solve" -D "__dbi_txn create nofsync"
>> -q
>>    --yaml $@ | grep -i 'Packageorigin' | cut -d : -f 2)
>>    - if [ -n "$pkg_name" ]; then
>>    + pkg_name=$(${RPM} -D "_dbpath $solve" -D "__dbi_txn create nofsync"
>> -q
>>    --qf "%{packageorigin}\n" "$@" | grep -v "is not installed" || true)
>>    + if [ -n "$pkg_name" -a "$pkg_name" != "(none)" ]; then
>>    + echo $pkg_name
>>    break;
>>    fi
>>    done
>>    - echo $pkg_name
>>    }
>>
>>    # rpm common command and options
>>    @@ -401,9 +401,9 @@ package_install_internal_rpm () {
>>
>>    # Now that we have a solution, pull out a list of what to install...
>>    echo "Manifest: ${target_rootfs}/install/**install.manifest"
>>    - ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
>>    + ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf
>> "%{packageorigin}\n" \
>>    -D "__dbi_txn create nofsync private" \
>>    - | grep -i 'Packageorigin' | cut -d : -f 2 >
>>    ${target_rootfs}/install/**install_solution.manifest
>>    + > ${target_rootfs}/install/**install_solution.manifest
>>
>>    touch ${target_rootfs}/install/**install_multilib_solution.**manifest
>>
>>    @@ -421,9 +421,9 @@ package_install_internal_rpm () {
>>
>>    # Now that we have a solution, pull out a list of what to install...
>>    echo "Manifest: ${target_rootfs}/install/**install_multilib.manifest"
>>    - ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
>>    + ${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf
>> "%{packageorigin}\n" \
>>    -D "__dbi_txn create nofsync private" \
>>    - | grep -i 'Packageorigin' | cut -d : -f 2 >
>>    ${target_rootfs}/install/**install_multilib_solution.**manifest
>>    + > ${target_rootfs}/install/**install_multilib_solution.**manifest
>>
>>    fi
>>
>>    @@ -478,9 +478,9 @@ EOF
>>    -U --justdb --noscripts --notriggers --noparentdirs --nolinktos
>> --ignoresize \
>>    ${target_rootfs}/install/**initial_install.manifest
>>
>>    - ${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --yaml \
>>    + ${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf
>> "%{packageorigin}\n" \
>>    -D "__dbi_txn create nofsync private" \
>>    - | grep -i 'Packageorigin' | cut -d : -f 2 >
>>    ${target_rootfs}/install/**initial_solution.manifest
>>    + > ${target_rootfs}/install/**initial_solution.manifest
>>
>>    rpm_update_pkg ${target_rootfs}/install/**initial_solution.manifest
>>
>>    diff --git a/meta/recipes-devtools/rpm/**rpm/rpm-packageorigin.patch
>>    b/meta/recipes-devtools/rpm/**rpm/rpm-packageorigin.patch
>>    new file mode 100644
>>    index 0000000..3c6dad4
>>    --- /dev/null
>>    +++ b/meta/recipes-devtools/rpm/**rpm/rpm-packageorigin.patch
>>    @@ -0,0 +1,23 @@
>>    +Add the ability to query the packageorigin
>>    +
>>    +Written by jbj at rpm5.org <http://rpm5.org>
>>
>>    +
>>    +Signed-off-by: Mark Hatle <mark.hatle@windriver.com
>>    <mailto:mark.hatle@windriver.**com <mark.hatle@windriver.com>>>
>>
>>    +
>>    +Index: rpm-5.4.8/rpmdb/hdrfmt.c
>>    +=============================**==============================**
>> ========
>>    +--- rpm-5.4.8.orig/rpmdb/hdrfmt.c
>>    ++++ rpm-5.4.8/rpmdb/hdrfmt.c
>>    +@@ -2403,8 +2403,10 @@ static int pkgoriginTag(Header h, HE_t
>>    + int rc = 1;
>>    +
>>    + he->tag = RPMTAG_PACKAGEORIGIN;
>>    +- if (!headerGet(h, he, HEADERGET_NOEXTENSION)
>>    +- && (origin = headerGetOrigin(h)) != NULL)
>>    ++ /* XXX two sources for tag data: what search precedence? */
>>    ++ if (headerGet(h, he, HEADERGET_NOEXTENSION))
>>    ++ rc = 0;
>>    ++ else if ((origin = headerGetOrigin(h)) != NULL)
>>    + {
>>    + he->t = RPM_STRING_TYPE;
>>    + he->p.str = xstrdup(origin);
>>    diff --git a/meta/recipes-devtools/rpm/rp**m_5.4.9.bb<http://rpm_5.4.9.bb><
>> http://rpm_5.4.9.bb>
>>    b/meta/recipes-devtools/rpm/rp**m_5.4.9.bb <http://rpm_5.4.9.bb> <
>> http://rpm_5.4.9.bb>
>>    index 2ca0f58..a38a684 100644
>>    --- a/meta/recipes-devtools/rpm/rp**m_5.4.9.bb <http://rpm_5.4.9.bb> <
>> http://rpm_5.4.9.bb>
>>    +++ b/meta/recipes-devtools/rpm/rp**m_5.4.9.bb <http://rpm_5.4.9.bb> <
>> http://rpm_5.4.9.bb>
>>
>>    @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>>    LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=**
>> 2d5025d4aa3495befef8f17206a5b0**a1"
>>
>>    DEPENDS = "libpcre attr acl popt ossp-uuid file"
>>    -PR = "r41"
>>    +PR = "r42"
>>
>>    # rpm2cpio is a shell script, which is part of the rpm src.rpm. It is
>> needed
>>    # in order to extract the distribution SRPM into a format we can
>> extract...
>>    @@ -70,6 +70,7 @@ SRC_URI =
>>    "http://www.rpm5.org/files/**rpm/rpm-5.4/rpm-5.4.9-0.**
>> 20120508.src.rpm;ex<http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex>
>>    file://rpm-macros.patch \
>>    file://rpm-lua.patch \
>>    file://rpm-ossp-uuid.patch \
>>    + file://rpm-packageorigin.patch \
>>    "
>>
>>    SRC_URI[md5sum] = "**60d56ace884340c1b3fcac6a1d58e7**68"
>>    --
>>    1.7.3.4
>>
>>
>>    ______________________________**_________________
>>    Openembedded-core mailing list
>>    Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
>>    <mailto:Openembedded-core@**lists.openembedded.org<Openembedded-core@lists.openembedded.org>
>> >
>>    http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>> openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>
>>
>>
>>
>>
>> ______________________________**_________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>
>
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--14dae9340a993eda0304c25606ad
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Mark,</div><div>=A0</div><div>many thanks for the explanation.</div=
><div>=A0</div><div>Cheers,</div><div>Giuseppe<br><br></div><div class=3D"g=
mail_quote">2012/6/12 Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:ma=
rk.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;<=
/span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im">On 6/12/12 2:21 AM, Giuseppe Condorelli =
wrote:<br>

<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
Hi Mark,<br>
this can be interesting for me. Please can you explain with an example what=
<br>
really this patch does?<br>
</blockquote>
<br></div>
The resolver database is seeded with all of the items from the packagefeed.=
 When you seed (install) a database, each entry gets a record of where the =
package file exists on the disk. =A0This is stored in the packageorigin fie=
ld. =A0It is designed to be used by resolver systems.<br>

<br>
Before you could only query the packageorigin field if you were using raw R=
PM calls or using the --yaml export features. =A0We wanted to be able to qu=
ery the file path from the resolver via the shell. =A0This patch added that=
 ability.<br>

<br>
The packageorigin is likely not useful to anyone, unless you are using it i=
n conjunction w/ an associated package feed/resolver database.<br>
<br>
--Mark<br>
<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
Many thanks,<br>
Giuseppe<br>
<br>
2012/6/11 Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com" target=
=3D"_blank">mark.hatle@windriver.com</a> &lt;mailto:<a href=3D"mailto:mark.=
hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.<u></u>com</a>&=
gt;&gt;<div class=3D"im">
<br>
<br>
 =A0 =A0Add functionality to RPM to directly query the packageorigin (path)=
 from<br>
 =A0 =A0the resolver database, instead of having to do this via an indirect=
 method.<br>
<br>
 =A0 =A0This results in a minor performance improvement.<br>
<br>
 =A0 =A0Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windrive=
r.com" target=3D"_blank">mark.hatle@windriver.com</a><br></div>
 =A0 =A0&lt;mailto:<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_b=
lank">mark.hatle@windriver.<u></u>com</a>&gt;&gt;<div class=3D"im"><br>
 =A0 =A0---<br>
 =A0 =A0meta/classes/package_rpm.<u></u>bbclass | 18 +++++++-------<br>
 =A0 =A0.../rpm/rpm/rpm-packageorigin.<u></u>patch | 23 +++++++++++++++++++=
+<br></div>
 =A0 =A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" target=3D=
"_blank">rpm_<u></u>5.4.9.bb</a> &lt;<a href=3D"http://rpm_5.4.9.bb" target=
=3D"_blank">http://rpm_5.4.9.bb</a>&gt; | 3 +-<div><div class=3D"h5"><br>
 =A0 =A03 files changed, 34 insertions(+), 10 deletions(-)<br>
 =A0 =A0create mode 100644 meta/recipes-devtools/rpm/rpm/<u></u>rpm-package=
origin.patch<br>
<br>
 =A0 =A0diff --git a/meta/classes/package_rpm.<u></u>bbclass b/meta/classes=
/package_rpm.<u></u>bbclass<br>
 =A0 =A0index 35928ab..097fa12 100644<br>
 =A0 =A0--- a/meta/classes/package_rpm.<u></u>bbclass<br>
 =A0 =A0+++ b/meta/classes/package_rpm.<u></u>bbclass<br>
 =A0 =A0@@ -130,12 +130,12 @@ resolve_package_rpm () {<br>
 =A0 =A0shift<br>
 =A0 =A0local pkg_name=3D&quot;&quot;<br>
 =A0 =A0for solve in `cat ${conffile}`; do<br>
 =A0 =A0- pkg_name=3D$(${RPM} -D &quot;_dbpath $solve&quot; -D &quot;__dbi_=
txn create nofsync&quot; -q<br>
 =A0 =A0--yaml $@ | grep -i &#39;Packageorigin&#39; | cut -d : -f 2)<br>
 =A0 =A0- if [ -n &quot;$pkg_name&quot; ]; then<br>
 =A0 =A0+ pkg_name=3D$(${RPM} -D &quot;_dbpath $solve&quot; -D &quot;__dbi_=
txn create nofsync&quot; -q<br>
 =A0 =A0--qf &quot;%{packageorigin}\n&quot; &quot;$@&quot; | grep -v &quot;=
is not installed&quot; || true)<br>
 =A0 =A0+ if [ -n &quot;$pkg_name&quot; -a &quot;$pkg_name&quot; !=3D &quot=
;(none)&quot; ]; then<br>
 =A0 =A0+ echo $pkg_name<br>
 =A0 =A0break;<br>
 =A0 =A0fi<br>
 =A0 =A0done<br>
 =A0 =A0- echo $pkg_name<br>
 =A0 =A0}<br>
<br>
 =A0 =A0# rpm common command and options<br>
 =A0 =A0@@ -401,9 +401,9 @@ package_install_internal_rpm () {<br>
<br>
 =A0 =A0# Now that we have a solution, pull out a list of what to install..=
.<br>
 =A0 =A0echo &quot;Manifest: ${target_rootfs}/install/<u></u>install.manife=
st&quot;<br>
 =A0 =A0- ${RPM} -D &quot;_dbpath ${target_rootfs}/install&quot; -qa --yaml=
 \<br>
 =A0 =A0+ ${RPM} -D &quot;_dbpath ${target_rootfs}/install&quot; -qa --qf &=
quot;%{packageorigin}\n&quot; \<br>
 =A0 =A0-D &quot;__dbi_txn create nofsync private&quot; \<br>
 =A0 =A0- | grep -i &#39;Packageorigin&#39; | cut -d : -f 2 &gt;<br>
 =A0 =A0${target_rootfs}/install/<u></u>install_solution.manifest<br>
 =A0 =A0+ &gt; ${target_rootfs}/install/<u></u>install_solution.manifest<br=
>
<br>
 =A0 =A0touch ${target_rootfs}/install/<u></u>install_multilib_solution.<u>=
</u>manifest<br>
<br>
 =A0 =A0@@ -421,9 +421,9 @@ package_install_internal_rpm () {<br>
<br>
 =A0 =A0# Now that we have a solution, pull out a list of what to install..=
.<br>
 =A0 =A0echo &quot;Manifest: ${target_rootfs}/install/<u></u>install_multil=
ib.manifest&quot;<br>
 =A0 =A0- ${RPM} -D &quot;_dbpath ${target_rootfs}/install&quot; -qa --yaml=
 \<br>
 =A0 =A0+ ${RPM} -D &quot;_dbpath ${target_rootfs}/install&quot; -qa --qf &=
quot;%{packageorigin}\n&quot; \<br>
 =A0 =A0-D &quot;__dbi_txn create nofsync private&quot; \<br>
 =A0 =A0- | grep -i &#39;Packageorigin&#39; | cut -d : -f 2 &gt;<br>
 =A0 =A0${target_rootfs}/install/<u></u>install_multilib_solution.<u></u>ma=
nifest<br>
 =A0 =A0+ &gt; ${target_rootfs}/install/<u></u>install_multilib_solution.<u=
></u>manifest<br>
<br>
 =A0 =A0fi<br>
<br>
 =A0 =A0@@ -478,9 +478,9 @@ EOF<br>
 =A0 =A0-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --i=
gnoresize \<br>
 =A0 =A0${target_rootfs}/install/<u></u>initial_install.manifest<br>
<br>
 =A0 =A0- ${RPM} -D &quot;_dbpath ${target_rootfs}/initial&quot; -qa --yaml=
 \<br>
 =A0 =A0+ ${RPM} -D &quot;_dbpath ${target_rootfs}/initial&quot; -qa --qf &=
quot;%{packageorigin}\n&quot; \<br>
 =A0 =A0-D &quot;__dbi_txn create nofsync private&quot; \<br>
 =A0 =A0- | grep -i &#39;Packageorigin&#39; | cut -d : -f 2 &gt;<br>
 =A0 =A0${target_rootfs}/install/<u></u>initial_solution.manifest<br>
 =A0 =A0+ &gt; ${target_rootfs}/install/<u></u>initial_solution.manifest<br=
>
<br>
 =A0 =A0rpm_update_pkg ${target_rootfs}/install/<u></u>initial_solution.man=
ifest<br>
<br>
 =A0 =A0diff --git a/meta/recipes-devtools/rpm/<u></u>rpm/rpm-packageorigin=
.patch<br>
 =A0 =A0b/meta/recipes-devtools/rpm/<u></u>rpm/rpm-packageorigin.patch<br>
 =A0 =A0new file mode 100644<br>
 =A0 =A0index 0000000..3c6dad4<br>
 =A0 =A0--- /dev/null<br>
 =A0 =A0+++ b/meta/recipes-devtools/rpm/<u></u>rpm/rpm-packageorigin.patch<=
br>
 =A0 =A0@@ -0,0 +1,23 @@<br>
 =A0 =A0+Add the ability to query the packageorigin<br>
 =A0 =A0+<br></div></div>
 =A0 =A0+Written by jbj at <a href=3D"http://rpm5.org" target=3D"_blank">rp=
m5.org</a> &lt;<a href=3D"http://rpm5.org" target=3D"_blank">http://rpm5.or=
g</a>&gt;<div class=3D"im"><br>
 =A0 =A0+<br>
 =A0 =A0+Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriv=
er.com" target=3D"_blank">mark.hatle@windriver.com</a><br></div>
 =A0 =A0&lt;mailto:<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_b=
lank">mark.hatle@windriver.<u></u>com</a>&gt;&gt;<div class=3D"im"><br>
 =A0 =A0+<br>
 =A0 =A0+Index: rpm-5.4.8/rpmdb/hdrfmt.c<br>
 =A0 =A0+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
 =A0 =A0+--- rpm-5.4.8.orig/rpmdb/hdrfmt.c<br>
 =A0 =A0++++ rpm-5.4.8/rpmdb/hdrfmt.c<br>
 =A0 =A0+@@ -2403,8 +2403,10 @@ static int pkgoriginTag(Header h, HE_t<br>
 =A0 =A0+ int rc =3D 1;<br>
 =A0 =A0+<br>
 =A0 =A0+ he-&gt;tag =3D RPMTAG_PACKAGEORIGIN;<br>
 =A0 =A0+- if (!headerGet(h, he, HEADERGET_NOEXTENSION)<br>
 =A0 =A0+- &amp;&amp; (origin =3D headerGetOrigin(h)) !=3D NULL)<br>
 =A0 =A0++ /* XXX two sources for tag data: what search precedence? */<br>
 =A0 =A0++ if (headerGet(h, he, HEADERGET_NOEXTENSION))<br>
 =A0 =A0++ rc =3D 0;<br>
 =A0 =A0++ else if ((origin =3D headerGetOrigin(h)) !=3D NULL)<br>
 =A0 =A0+ {<br>
 =A0 =A0+ he-&gt;t =3D RPM_STRING_TYPE;<br>
 =A0 =A0+ he-&gt;p.str =3D xstrdup(origin);<br></div>
 =A0 =A0diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.=
bb" target=3D"_blank">rp<u></u>m_5.4.9.bb</a> &lt;<a href=3D"http://rpm_5.4=
.9.bb" target=3D"_blank">http://rpm_5.4.9.bb</a>&gt;<br>
 =A0 =A0b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" target=
=3D"_blank">rp<u></u>m_5.4.9.bb</a> &lt;<a href=3D"http://rpm_5.4.9.bb" tar=
get=3D"_blank">http://rpm_5.4.9.bb</a>&gt;<br>
 =A0 =A0index 2ca0f58..a38a684 100644<br>
 =A0 =A0--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" tar=
get=3D"_blank">rp<u></u>m_5.4.9.bb</a> &lt;<a href=3D"http://rpm_5.4.9.bb" =
target=3D"_blank">http://rpm_5.4.9.bb</a>&gt;<br>
 =A0 =A0+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb" tar=
get=3D"_blank">rp<u></u>m_5.4.9.bb</a> &lt;<a href=3D"http://rpm_5.4.9.bb" =
target=3D"_blank">http://rpm_5.4.9.bb</a>&gt;<div class=3D"im"><br>
 =A0 =A0@@ -43,7 +43,7 @@ LICENSE =3D &quot;LGPLv2.1&quot;<br>
 =A0 =A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.LIB;md5=3D<u></u>2d5025d4=
aa3495befef8f17206a5b0<u></u>a1&quot;<br>
<br>
 =A0 =A0DEPENDS =3D &quot;libpcre attr acl popt ossp-uuid file&quot;<br>
 =A0 =A0-PR =3D &quot;r41&quot;<br>
 =A0 =A0+PR =3D &quot;r42&quot;<br>
<br>
 =A0 =A0# rpm2cpio is a shell script, which is part of the rpm src.rpm. It =
is needed<br>
 =A0 =A0# in order to extract the distribution SRPM into a format we can ex=
tract...<br>
 =A0 =A0@@ -70,6 +70,7 @@ SRC_URI =3D<br>
 =A0 =A0&quot;<a href=3D"http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.=
20120508.src.rpm;ex" target=3D"_blank">http://www.rpm5.org/files/<u></u>rpm=
/rpm-5.4/rpm-5.4.9-0.<u></u>20120508.src.rpm;ex</a><br>
 =A0 =A0file://rpm-macros.patch \<br>
 =A0 =A0file://rpm-lua.patch \<br>
 =A0 =A0file://rpm-ossp-uuid.patch \<br>
 =A0 =A0+ file://rpm-packageorigin.patch \<br>
 =A0 =A0&quot;<br>
<br>
 =A0 =A0SRC_URI[md5sum] =3D &quot;<u></u>60d56ace884340c1b3fcac6a1d58e7<u><=
/u>68&quot;<br>
 =A0 =A0--<br>
 =A0 =A01.7.3.4<br>
<br>
<br>
 =A0 =A0______________________________<u></u>_________________<br>
 =A0 =A0Openembedded-core mailing list<br>
 =A0 =A0<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.<u></u>openembedded.org</a><br></div>
 =A0 =A0&lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">Openembedded-core@<u></u>lists.openembedded.org</a>&g=
t;<br>
 =A0 =A0<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/open=
embedded-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/=
mailman/listinfo/<u></u>openembedded-core</a><div class=3D"im"><br>
<br>
<br>
<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</div></blockquote><div class=3D"HOEnZb"><div class=3D"h5">
<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</div></div></blockquote></div><br>

--14dae9340a993eda0304c25606ad--
