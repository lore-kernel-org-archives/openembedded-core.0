Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id D917677260
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jun 2016 16:52:45 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id t7so3026376vkf.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jun 2016 09:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=TeLRsDENFJPxXtfKyPgYj/S5swXMt8bVTOUVr+qMDN8=;
	b=PzR/NX0ZYFoQ1jHi0IuvXs6ohNPZ7vY9lYW/9VaVXVmSD+5lWOLPlK5CmpHqtRbFK5
	pCOjQsr69PV7waHeksH2qvyarm3z5imEIloPzoEFos9+OVXg5JuZuqlTtmIxkJxzIj8t
	Z+DcvuH/RK8K0PVv51ssBUWYrbIONZJ2rjDk3GgeAOmM0ajNkx/13a1N+mx+CUyJvLd4
	xXcfVWamodgptGLBQGESyF9CeSn4oc3cWqo416JWSlnjEZtjdYRUPuZOWUrA9SuDb8fA
	C0z+JfNMURQ3L8Be2p1u4TkXpMxla5mOrIgc/LYMCRvJIP3sKEqWjtLLi7d6cLuiXvpp
	5bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=TeLRsDENFJPxXtfKyPgYj/S5swXMt8bVTOUVr+qMDN8=;
	b=kExJbRxvMV6bNrLo9/ZSXJixQgGCDlmEWjrUNHrUe5xskutJh7VYGT55gGhDsG1zj2
	MeIlOs/vuQ7eT/jWldgguDjO+fYBihVbGAmaQlowb0Afqz1wmexP1axoOhyk1OS5dLy1
	G5bP/XF8ta/Nv6NZ5W7jFZ357ISc7AHaaU3fmFf43oILNlk9I/BnDVUCrZgpDHOSVkPX
	t8gvwYfGBu2ctObp+Rv4h2/QLvrcKVUfkajpqJzFFtXV6xaruWOtEcCK3bGEJYd5g4yW
	rVbigckEXRjMD08Hb9GLmien/xr9oKPylb5Gi/8EiThtNOZ+tJXxKvJWxMtAXy3MCCo9
	jQPQ==
X-Gm-Message-State: ALyK8tLcvF2JjldGsPwPuPGT2VUIkW6Jdt8okKQKEfZLnkY6feZlQwsA+62nmXEK5ZSJp0Ybv5CqecqiG2NRJA==
MIME-Version: 1.0
X-Received: by 10.31.94.209 with SMTP id s200mr3893082vkb.148.1465059165821;
	Sat, 04 Jun 2016 09:52:45 -0700 (PDT)
Received: by 10.103.117.204 with HTTP; Sat, 4 Jun 2016 09:52:45 -0700 (PDT)
Received: by 10.103.117.204 with HTTP; Sat, 4 Jun 2016 09:52:45 -0700 (PDT)
In-Reply-To: <CACS+7ZT5B6UGjtjr+vwVrPttknKj0kLbE1n8v_+yV66Pqxzhuw@mail.gmail.com>
References: <1464953991-4125-1-git-send-email-maxin.john@intel.com>
	<cf6e48c8-4fc8-aaec-87d2-940623951477@windriver.com>
	<CACS+7ZT5B6UGjtjr+vwVrPttknKj0kLbE1n8v_+yV66Pqxzhuw@mail.gmail.com>
Date: Sat, 4 Jun 2016 10:52:45 -0600
Message-ID: <CACS+7ZSWFOk3mB_TCWCJZrx07nuv+_5WNDuUW+uyy1mQt45s4g@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] rpm: update patch to support db-6.2.23
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
X-List-Received-Date: Sat, 04 Jun 2016 16:52:47 -0000
Content-Type: multipart/alternative; boundary=001a114e5dd4276327053476abe8

--001a114e5dd4276327053476abe8
Content-Type: text/plain; charset=UTF-8

On 3 Jun 2016 10:44 a.m., "Mark Hatle" <mark.hatle@windriver.com> wrote:
>
> On 6/3/16 6:39 AM, Maxin B. John wrote:
> > Refresh the rpm-db60.patch to support db-6.2.23
>
> NAK NAK NAK
>
> Please do NOT merge this set.
>
> 6.2.23 does NOT work with the version of RPM.
>
> They (BDB) changed something with the locking semantics.  If you do
anything
> more then a trivial test you will end up with a corrupted database.
>
> The RPM5 community is working on a newer version of RPM5, that will
likely adapt
> to the new semantics.  I've not yet seen it released.  When it does,
-and- if it
> works w/ db 6.2.23, we can consider the upgrade at that time.

Are they thinking of incorporating RPM4's new database format, or
continuing to use db?

I seem to recall hearing both options discussed, but that was a while ago
and on the rpm5 mailing list.

>
> --Mark
>
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  meta/recipes-devtools/rpm/rpm/rpm-db60.patch | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
b/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
> > index b4df8b7..403f3cb 100644
> > --- a/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
> > +++ b/meta/recipes-devtools/rpm/rpm/rpm-db60.patch
> > @@ -13,11 +13,11 @@ Index: rpm/configure.ac
> >   [RPM_CHECK_LIB(
> >       [Berkeley-DB], [db],
> >  -    [db-6.1], [db_create], [db.h],
> > -+    [db-6.0], [db_create], [db.h],
> > ++    [db-6.2], [db_create], [db.h],
> >       [yes,external], [db6],
> >       [ DBLIBSRCS="$DBLIBSRCS db3.c"
> >  -      DBXY=db61
> > -+      DBXY=db60
> > ++      DBXY=db62
> >         AM_CONDITIONAL(WITH_DB, [ true ])
> >         AM_CONDITIONAL(WITH_DB_INTERNAL, [ test
".$RPM_CHECK_LIB_LOCATION" = .internal ])
> >         if test ".$RPM_CHECK_LIB_LOCATION" = .internal; then
> > @@ -26,7 +26,7 @@ Index: rpm/configure.ac
> >   ])
> >
> >  -if test ".$ac_cv_lib_db_6_1_db_create" != .yes -a
".$ac_cv_lib_db_5_3_db_create" != .yes; then
> > -+if test ".$ac_cv_lib_db_6_0_db_create" != .yes -a
".$ac_cv_lib_db_5_3_db_create" != .yes; then
> > ++if test ".$ac_cv_lib_db_6_2_db_create" != .yes -a
".$ac_cv_lib_db_5_3_db_create" != .yes; then
> >       CPPFLAGS="${CPPFLAGS_save}"
> >   fi
> >
> > @@ -36,12 +36,12 @@ Index: rpm/configure.ac
> >
> >  -dnl # Sqlite 3.8.3.1 from db-6.1.19
> >  -if test ".$ac_cv_lib_db_6_1_db_create" = .yes; then
> > -+dnl # Sqlite 3.8.3.1 from db-6.0.30
> > -+if test ".$ac_cv_lib_db_6_0_db_create" = .yes; then
> > ++dnl # Sqlite 3.8.3.1 from db-6.2.23
> > ++if test ".$ac_cv_lib_db_6_2_db_create" = .yes; then
> >   RPM_CHECK_LIB(
> >       [Berkeley-DB (+SQLite3)], [dbsql],
> >  -    [db_sql-6.1], [sqlite3_open], [dbsql.h],
> > -+    [db_sql-6.0], [sqlite3_open], [dbsql.h],
> > ++    [db_sql-6.2], [sqlite3_open], [dbsql.h],
> >       [yes,external], [db6/sql],
> >       [
> >         AM_CONDITIONAL(WITH_DBSQL, [ true ])
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a114e5dd4276327053476abe8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 3 Jun 2016 10:44 a.m., &quot;Mark Hatle&quot; &lt;<a href=3D"mailto:mark=
.hatle@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 6/3/16 6:39 AM, Maxin B. John wrote:<br>
&gt; &gt; Refresh the rpm-db60.patch to support db-6.2.23<br>
&gt;<br>
&gt; NAK NAK NAK<br>
&gt;<br>
&gt; Please do NOT merge this set.<br>
&gt;<br>
&gt; 6.2.23 does NOT work with the version of RPM.<br>
&gt;<br>
&gt; They (BDB) changed something with the locking semantics.=C2=A0 If you =
do anything<br>
&gt; more then a trivial test you will end up with a corrupted database.<br=
>
&gt;<br>
&gt; The RPM5 community is working on a newer version of RPM5, that will li=
kely adapt<br>
&gt; to the new semantics.=C2=A0 I&#39;ve not yet seen it released.=C2=A0 W=
hen it does, -and- if it<br>
&gt; works w/ db 6.2.23, we can consider the upgrade at that time.</p>
<p dir=3D"ltr">Are they thinking of incorporating RPM4&#39;s new database f=
ormat, or continuing to use db?</p>
<p dir=3D"ltr">I seem to recall hearing both options discussed, but that wa=
s a while ago and on the rpm5 mailing list.</p>
<p dir=3D"ltr">&gt;<br>
&gt; --Mark<br>
&gt;<br>
&gt; &gt; Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@int=
el.com">maxin.john@intel.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/rpm/rpm/rpm-db60.patch | 12 ++++++---=
---<br>
&gt; &gt;=C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db60.patch b/meta/=
recipes-devtools/rpm/rpm/rpm-db60.patch<br>
&gt; &gt; index b4df8b7..403f3cb 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/rpm/rpm/rpm-db60.patch<br>
&gt; &gt; +++ b/meta/recipes-devtools/rpm/rpm/rpm-db60.patch<br>
&gt; &gt; @@ -13,11 +13,11 @@ Index: rpm/<a href=3D"http://configure.ac">co=
nfigure.ac</a><br>
&gt; &gt;=C2=A0 =C2=A0[RPM_CHECK_LIB(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[Berkeley-DB], [db],<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 [db-6.1], [db_create], [db.h],<br>
&gt; &gt; -+=C2=A0 =C2=A0 [db-6.0], [db_create], [db.h],<br>
&gt; &gt; ++=C2=A0 =C2=A0 [db-6.2], [db_create], [db.h],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[yes,external], [db6],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[ DBLIBSRCS=3D&quot;$DBLIBSRCS db3.c&qu=
ot;<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 DBXY=3Ddb61<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 DBXY=3Ddb60<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 DBXY=3Ddb62<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AM_CONDITIONAL(WITH_DB, [ true ]=
)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AM_CONDITIONAL(WITH_DB_INTERNAL,=
 [ test &quot;.$RPM_CHECK_LIB_LOCATION&quot; =3D .internal ])<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;.$RPM_CHECK_LIB_LO=
CATION&quot; =3D .internal; then<br>
&gt; &gt; @@ -26,7 +26,7 @@ Index: rpm/<a href=3D"http://configure.ac">conf=
igure.ac</a><br>
&gt; &gt;=C2=A0 =C2=A0])<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 -if test &quot;.$ac_cv_lib_db_6_1_db_create&quot; !=3D .yes=
 -a &quot;.$ac_cv_lib_db_5_3_db_create&quot; !=3D .yes; then<br>
&gt; &gt; -+if test &quot;.$ac_cv_lib_db_6_0_db_create&quot; !=3D .yes -a &=
quot;.$ac_cv_lib_db_5_3_db_create&quot; !=3D .yes; then<br>
&gt; &gt; ++if test &quot;.$ac_cv_lib_db_6_2_db_create&quot; !=3D .yes -a &=
quot;.$ac_cv_lib_db_5_3_db_create&quot; !=3D .yes; then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPPFLAGS=3D&quot;${CPPFLAGS_save}&quot;=
<br>
&gt; &gt;=C2=A0 =C2=A0fi<br>
&gt; &gt;<br>
&gt; &gt; @@ -36,12 +36,12 @@ Index: rpm/<a href=3D"http://configure.ac">co=
nfigure.ac</a><br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 -dnl # Sqlite 3.8.3.1 from db-6.1.19<br>
&gt; &gt;=C2=A0 -if test &quot;.$ac_cv_lib_db_6_1_db_create&quot; =3D .yes;=
 then<br>
&gt; &gt; -+dnl # Sqlite 3.8.3.1 from db-6.0.30<br>
&gt; &gt; -+if test &quot;.$ac_cv_lib_db_6_0_db_create&quot; =3D .yes; then=
<br>
&gt; &gt; ++dnl # Sqlite 3.8.3.1 from db-6.2.23<br>
&gt; &gt; ++if test &quot;.$ac_cv_lib_db_6_2_db_create&quot; =3D .yes; then=
<br>
&gt; &gt;=C2=A0 =C2=A0RPM_CHECK_LIB(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[Berkeley-DB (+SQLite3)], [dbsql],<br>
&gt; &gt;=C2=A0 -=C2=A0 =C2=A0 [db_sql-6.1], [sqlite3_open], [dbsql.h],<br>
&gt; &gt; -+=C2=A0 =C2=A0 [db_sql-6.0], [sqlite3_open], [dbsql.h],<br>
&gt; &gt; ++=C2=A0 =C2=A0 [db_sql-6.2], [sqlite3_open], [dbsql.h],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[yes,external], [db6/sql],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AM_CONDITIONAL(WITH_DBSQL, [ tru=
e ])<br>
&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a114e5dd4276327053476abe8--
