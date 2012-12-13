Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TjBhK-0005sU-I5
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 17:31:48 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so1917009lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 08:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=Upu3DJR49UbUx0OKc4EentN1MLLxW+L9JOUhiNxxVDM=;
	b=tlCou0tFi/95s7rMPnVG5op4K2K31BYmqFy3R/oeyF5G46SB0uhQ0rrU1RP0svNTLK
	Kf4Eswuqku6cI7WTk3vkPjAj1MRBAyHoLxQdRVf3R2cDTVIHJJesgV0n4Ik7IHO19mFN
	x/8qtECxjoRTMvz5GO05VnK5/XjrNu+U3GMIKERR4mBjHY4DXITkriHf3Y/0VwC+CRe9
	/srwhl3JHnvkpMUa+CIi7hB21okvB2PDQXdK2DiOLAwRAMp3VAhyUrqlD3gJz0qMONwg
	7jL4hVIkQHcNm9r+ohnIVFQkbV+oFRkc/399qc58ptnIsi6mkSYkPTQTxkED8P5491Ua
	PIaQ==
Received: by 10.152.103.99 with SMTP id fv3mr7248lab.16.1355415431324; Thu, 13
	Dec 2012 08:17:11 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Thu, 13 Dec 2012 08:16:51 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1212131040220.7313@oneiric>
References: <alpine.DEB.2.02.1212131040220.7313@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 13 Dec 2012 09:16:51 -0700
X-Google-Sender-Auth: mxC16JSTfj-qBSVUN6x6SshZuYo
Message-ID: <CABcZAN=M_Oz_kGt=9UnifOmXqQjJxOKm_2+MOzeUtqYf-LTTxA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: in SRC_URI, is "name=" necessary for a single tarball?
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
X-List-Received-Date: Thu, 13 Dec 2012 16:31:48 -0000
Content-Type: multipart/alternative; boundary=f46d040716554ea56b04d0be3f61

--f46d040716554ea56b04d0be3f61
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 13, 2012 at 8:40 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> just noticed this in busybox_1.20.2.bb:
>
> SRC_URI = "
> http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>            file://B921600.patch \
>            file://get_header_tar.patch \
>            ... snip ...
>
> SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
> SRC_URI[tarball.sha256sum] =
> "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
>
>   in the above, does "name=tarball" actually serve any purpose?  i was
> under the impression that if you had just the single tarball, you
> could:
>
> SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
>            file://debian-libjpeg7_7-1.diff \
>            file://fix_for_automake_1.12.1.patch"
>
> SRC_URI[md5sum] = "52654eb3b2e60c35731ea8fc87f1bd29"
> SRC_URI[sha256sum] =
> "00029b1473f0f0ea72fbca3230e8cb25797fbb27e58ae2e46bb8bf5a806fe0b3"
>
>   obviously in the case of busybox, it won't *hurt*, it just looks
> unnecessary.
>


That's correct, if there's only one downloaded file, there's no need to use
the name.
-- 
Christopher Larson

--f46d040716554ea56b04d0be3f61
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, Dec 1=
3, 2012 at 8:40 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":vo">just noticed this in <a href=
=3D"http://busybox_1.20.2.bb" target=3D"_blank">busybox_1.20.2.bb</a>:<br>
<br>
SRC_URI =3D &quot;<a href=3D"http://www.busybox.net/downloads/busybox-${PV}=
.tar.bz2;name=3Dtarball" target=3D"_blank">http://www.busybox.net/downloads=
/busybox-${PV}.tar.bz2;name=3Dtarball</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://B921600.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://get_header_tar.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0... snip ...<br>
<br>
SRC_URI[tarball.md5sum] =3D &quot;e025414bc6cd79579cc7a32a45d3ae1c&quot;<br=
>
SRC_URI[tarball.sha256sum] =3D &quot;eb13ff01dae5618ead2ef6f92ba879e9e0390f=
9583bd545d8789d27cf39b6882&quot;<br>
<br>
=C2=A0 in the above, does &quot;name=3Dtarball&quot; actually serve any pur=
pose? =C2=A0i was<br>
under the impression that if you had just the single tarball, you<br>
could:<br>
<br>
SRC_URI =3D &quot;<a href=3D"http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz=
" target=3D"_blank">http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz</a> \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://debian-libjpeg7_7-1.diff \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix_for_automake_1.12.1.pat=
ch&quot;<br>
<br>
SRC_URI[md5sum] =3D &quot;52654eb3b2e60c35731ea8fc87f1bd29&quot;<br>
SRC_URI[sha256sum] =3D &quot;00029b1473f0f0ea72fbca3230e8cb25797fbb27e58ae2=
e46bb8bf5a806fe0b3&quot;<br>
<br>
=C2=A0 obviously in the case of busybox, it won&#39;t *hurt*, it just looks=
<br>
unnecessary.</div></blockquote></div><br><br clear=3D"all"><div>That&#39;s =
correct, if there&#39;s only one downloaded file, there&#39;s no need to us=
e the name.</div>-- <br>Christopher Larson<br>
</div>

--f46d040716554ea56b04d0be3f61--
