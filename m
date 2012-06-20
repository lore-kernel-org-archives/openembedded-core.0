Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sh9yO-00036N-KO
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 03:44:44 +0200
Received: by eekd49 with SMTP id d49so2262614eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0t8ElHEPePk25+CFehGPDzzml8cW1oH+LR0B0nU2yVY=;
	b=t3CH9k2nCft2XQ/LMUaGIv1A6yrJhqdoqR5fJNQualerO+VXSYGOnAAMhlRB+FJ+UJ
	1ZArmZtHVxgQhAMAhc7FtequIyR1vlM5bez6fAe4ZmwZc4cP2JVfy1epBO+QljbJc2Vw
	boQqVNE63z+LTFFbpLFJ0LmFWf0p9rdtZemyA+pbNc5FE5kxY/LvagvQUpyGTosrG+b1
	2X6Rn2X6szQt9R4fcXvHx9CBtxxIFHaghsS++BFsIoaW9BrWPXuRFWv9GQZUyQGb9C3F
	EAKsUd37c3JrOkmBIgThV+FTjQ6VcSb5Ye0r0gPQyX8xLqYtcXuybRrFb7Onej0OA/gS
	/UdA==
MIME-Version: 1.0
Received: by 10.14.37.132 with SMTP id y4mr4458865eea.142.1340156040448; Tue,
	19 Jun 2012 18:34:00 -0700 (PDT)
Received: by 10.14.219.71 with HTTP; Tue, 19 Jun 2012 18:34:00 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1206192107460.6294@oneiric>
References: <alpine.DEB.2.02.1206191652560.3440@oneiric>
	<CAMKF1sqtH_Va4w8ayxm+Qi0pH_2xmeFnMcHLHUB57uQAZp=5bw@mail.gmail.com>
	<alpine.DEB.2.02.1206192107460.6294@oneiric>
Date: Tue, 19 Jun 2012 18:34:00 -0700
Message-ID: <CAMKF1sowJu1evX_ZrwxFYqykFfaPwyn=+Fr=p_FzOOnJnKXftw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Simplify "SRC_URI_append +=" to "SRC_URI_append ="
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
X-List-Received-Date: Wed, 20 Jun 2012 01:44:44 -0000
Content-Type: multipart/alternative; boundary=90e6ba6150a6bc0afc04c2dd6407

--90e6ba6150a6bc0afc04c2dd6407
Content-Type: text/plain; charset=UTF-8

On Tuesday, June 19, 2012, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Tue, 19 Jun 2012, Khem Raj wrote:
>
>> Thanks for doing this
>>
>> On Tue, Jun 19, 2012 at 1:54 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:
>> >
>> > +SRC_URI_append_poky = " file://owl-menu.patch;apply=yes "
>>
>> while you are at it can you remove apply=yes from there ?
>> since thats the default anyway for files ending in .patch
>
>  i can do that as a separate patch since they're logically two
> different cleanups, and there's enough of the latter to justify
> another patch.
>

Fine by me



> $ grep -r "patch;apply=yes" *
> meta/recipes-connectivity/portmap/portmap.inc:
 file://make.patch;apply=yes"
> meta/recipes-support/icu/icu-3.6.inc:
file://gccfix.patch;apply=yes \
> meta/recipes-support/icu/icu-3.6.inc:
file://use-g++-for-linking.patch;apply=yes"
> meta/recipes-support/icu/icu-3.6.inc:
file://noldlibpath.patch;apply=yes"
> meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append = "
file://croco.patch;apply=yes \
> meta/recipes-core/eggdbus/eggdbus_0.6.bb:
 file://gtk-doc.patch;apply=yes \
> meta/recipes-core/eggdbus/eggdbus_0.6.bb:
file://marshal.patch;apply=yes \
> meta/recipes-graphics/xorg-proto/calibrateproto_git.bb:
file://fix.patch;apply=yes"
> meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb:
     file://link-x11.patch;apply=yes \
> meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky += "
file://owl-menu.patch;apply=yes "
> meta/recipes-sato/pimlico/contacts.inc:SRC_URI_append_poky = "
file://contacts-owl-window-menu.patch;apply=yes "
> meta/recipes-sato/pimlico/dates.inc:SRC_URI_append_poky = "
file://dates-owl-window-menu.patch;apply=yes "
> meta/recipes-sato/settings-daemon/settings-daemon_git.bb:
file://addsoundkeys.patch;apply=yes \
> $
>
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                        http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--90e6ba6150a6bc0afc04c2dd6407
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, June 19, 2012, Robert P. J. Day &lt;<a href=3D"mailto:r=
pjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>&gt; On Tue, =
19 Jun 2012, Khem Raj wrote:<br>&gt;<br>&gt;&gt; Thanks for doing this<br>
&gt;&gt;<br>&gt;&gt; On Tue, Jun 19, 2012 at 1:54 PM, Robert P. J. Day &lt;=
<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrot=
e:<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; +SRC_URI_append_poky =3D &quot; file:/=
/owl-menu.patch;apply=3Dyes &quot;<br>
&gt;&gt;<br>&gt;&gt; while you are at it can you remove apply=3Dyes from th=
ere ?<br>&gt;&gt; since thats the default anyway for files ending in .patch=
<br>&gt;<br>&gt; =C2=A0i can do that as a separate patch since they&#39;re =
logically two<br>
&gt; different cleanups, and there&#39;s enough of the latter to justify<br=
>&gt; another patch.<br>&gt;<br><br>Fine by me<br><br><br><br>&gt; $ grep -=
r &quot;patch;apply=3Dyes&quot; *<br>&gt; meta/recipes-connectivity/portmap=
/portmap.inc: =C2=A0file://make.patch;apply=3Dyes&quot;<br>
&gt; meta/recipes-support/icu/icu-3.6.inc: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://gccfix.patch;apply=3Dyes \<br>&gt; meta/recipes-support/icu/icu-=
3.6.inc: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://use-g++-for-linking.patc=
h;apply=3Dyes&quot;<br>&gt; meta/recipes-support/icu/icu-3.6.inc: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://noldlibpath.patch;apply=3Dyes&quot;<br>
&gt; meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append =3D &qu=
ot; file://croco.patch;apply=3Dyes \<br>&gt; meta/recipes-core/eggdbus/<a h=
ref=3D"http://eggdbus_0.6.bb">eggdbus_0.6.bb</a>: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0file://gtk-doc.patch;apply=3Dyes \<br>
&gt; meta/recipes-core/eggdbus/<a href=3D"http://eggdbus_0.6.bb">eggdbus_0.=
6.bb</a>: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://marshal.patch;apply=3Dy=
es \<br>&gt; meta/recipes-graphics/xorg-proto/<a href=3D"http://calibratepr=
oto_git.bb">calibrateproto_git.bb</a>: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
ile://fix.patch;apply=3Dyes&quot;<br>
&gt; meta/recipes-graphics/libxsettings-client/<a href=3D"http://libxsettin=
gs-client_0.10.bb">libxsettings-client_0.10.bb</a>: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://link-x11.patch;apply=3Dyes \<br>&gt; meta/recipes-sato/leafpad=
/leafpad_0.8.18.1.bb:SRC_URI_append_poky +=3D &quot; file://owl-menu.patch;=
apply=3Dyes &quot;<br>
&gt; meta/recipes-sato/pimlico/contacts.inc:SRC_URI_append_poky =3D &quot; =
file://contacts-owl-window-menu.patch;apply=3Dyes &quot;<br>&gt; meta/recip=
es-sato/pimlico/dates.inc:SRC_URI_append_poky =3D &quot; file://dates-owl-w=
indow-menu.patch;apply=3Dyes &quot;<br>
&gt; meta/recipes-sato/settings-daemon/<a href=3D"http://settings-daemon_gi=
t.bb">settings-daemon_git.bb</a>: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file:/=
/addsoundkeys.patch;apply=3Dyes \<br>&gt; $<br>&gt;<br>&gt;<br>&gt; rday<br=
>&gt;<br>&gt; --<br>&gt;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>&gt; Robert P. J. Day =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ottawa, Ontario=
, CANADA<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://crashcourse.ca">http://crashco=
urse.ca</a><br>
&gt;<br>&gt; Twitter: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <a href=3D"http://twitter.com/rpjday">http://twitter.com/rpjday</a><=
br>&gt; LinkedIn: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://ca.linke=
din.com/in/rpjday">http://ca.linkedin.com/in/rpjday</a><br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>&gt;<br>&gt; _______________________________________________<br>&gt; Opene=
mbedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists=
.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--90e6ba6150a6bc0afc04c2dd6407--
