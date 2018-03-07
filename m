Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 74A037896E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 16:10:18 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id h19so1096485pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 08:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RQjhXF07VSpcrJyt6WUfdV2toz8MeCwUMmcvdI35l/k=;
	b=NY9SmXj7ENSwyN4ROqVdxHGDPjCDPOIGvqfujl6TFbPZLJ8J8VP0qzy/vWWZU8lBA5
	6iBti6H79PaLkscJJ6GnvBia4eYJESqpZqABqNeqUH02Begapzcv7kQGVUYBhWgIldSO
	iA5A5YIiRkVLfVWpqdREREzFme5zWJ76eeQ8DiVpPZCdgav/juxWNDbsGU7JE9uxpl1o
	gjTBe2RYHyVkwnRpUsawoOquYysqNAMr3dXqlroPHhtOqPg3D3r7thv3GdNN+6/oQlFz
	+5kM9J/4oalhNH+KMX7ktSeCENE3rmMKAKV+ujdVKJWrCaP+WFR99LMaoWnfO7asTdZu
	+iMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RQjhXF07VSpcrJyt6WUfdV2toz8MeCwUMmcvdI35l/k=;
	b=ACDAo8O5E6ICKg75ClBZV0hZ7/7VX90kGHo3OOtSmppeabvRM1N5kg5pr6qxkwuv03
	MCyTCVrhPHKn2/t9qn7cV+ysu0ROklEOiqodoOp0IK0ivy/fX1ud0FzSE7wGsqNOixEg
	aHJUENvQV2CidFHzFQQ3kJ4tEZZdKwwuSig7M/cwmZq8XrkC1mqFE5T4sklIINyboe9j
	RT/5xvEcZ4+FT4o8AxoUYjuGksVZqkpggesW15QGxlXgP1BraCTWCWI1RCR3i13S9JeR
	GWCP9YwHpS6InReQtnvrpnKDcIVnYictqW1b1N9GoKqCRam5MMVU/zK46gnUGy0SF9L+
	2nCw==
X-Gm-Message-State: APf1xPBmOuyWdVYllnjqAqCydMdQhkkGf4QpDi+Cdw57XXSEUGDrzIDH
	JzKz5HKutN1oz8IqK5nZYkt6mtjTB4aFjOzGJ+0=
X-Google-Smtp-Source: AG47ELtDkpMjoFBPGxPCHbgrbVcv56ffKstvQe/jc9/1bwDqJdL9QJDMPA2V13dmuuT3mPrkoBbyXxPBhEkidnCXpLA=
X-Received: by 10.99.64.66 with SMTP id n63mr18875068pga.204.1520439020256;
	Wed, 07 Mar 2018 08:10:20 -0800 (PST)
MIME-Version: 1.0
References: <20180302220921.21176-1-jsbronder@cold-front.org>
	<21925259-562a-78b6-8616-9345bcfee525@gmail.com>
	<20180307155947.GN23655@lasswell>
In-Reply-To: <20180307155947.GN23655@lasswell>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 07 Mar 2018 16:10:09 +0000
Message-ID: <CAMKF1soVgWdk=ebv4X1uQ2_awUWzx+BUAXqTroK7D1Qz8smj-w@mail.gmail.com>
To: Justin Bronder <jsbronder@cold-front.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: ccache: update to 3.4.1
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
X-List-Received-Date: Wed, 07 Mar 2018 16:10:19 -0000
Content-Type: multipart/alternative; boundary="94eb2c08ee2eb484130566d4cb14"

--94eb2c08ee2eb484130566d4cb14
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 7, 2018 at 7:59 AM Justin Bronder <jsbronder@cold-front.org>
wrote:

> On 02/03/18 19:14 -0800, Khem Raj wrote:
> > On 3/2/18 2:09 PM, Justin Bronder wrote:
> > > https://ccache.samba.org/releasenotes.html#_ccache_3_4_1
> > >
> > > License-Update: copyright years and file paths updated
> > >
> > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > ---
> > >  meta/recipes-devtools/ccache/ccache_3.3.5.bb | 12 ------------
> > >  meta/recipes-devtools/ccache/ccache_3.4.1.bb | 12 ++++++++++++
> > >  2 files changed, 12 insertions(+), 12 deletions(-)
> > >  delete mode 100644 meta/recipes-devtools/ccache/ccache_3.3.5.bb
> > >  create mode 100644 meta/recipes-devtools/ccache/ccache_3.4.1.bb
> > >
> > > diff --git a/meta/recipes-devtools/ccache/ccache_3.3.5.bb
> b/meta/recipes-devtools/ccache/ccache_3.3.5.bb
> > > deleted file mode 100644
> > > index 929f0f1276..0000000000
> > > --- a/meta/recipes-devtools/ccache/ccache_3.3.5.bb
> > > +++ /dev/null
> > > @@ -1,12 +0,0 @@
> > > -require ccache.inc
> > > -
> > > -LICENSE = "GPLv3+"
> > > -LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=dae379a85bb6e9d594773e0aa64876f6"
> > > -
> > > -SRC_URI[md5sum] = "eee58db7cce892febddb989308dc568f"
> > > -SRC_URI[sha256sum] =
> "190576a6e938760ec8113523e6fd380141117303e90766cc4802e770422b30c6"
> > > -
> > > -SRC_URI += " \
> > > -            file://0002-dev.mk.in-fix-file-name-too-long.patch \
> > > -
> file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
> > > -"
> > > diff --git a/meta/recipes-devtools/ccache/ccache_3.4.1.bb
> b/meta/recipes-devtools/ccache/ccache_3.4.1.bb
> > > new file mode 100644
> > > index 0000000000..e3bf74e9c6
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/ccache/ccache_3.4.1.bb
> > > @@ -0,0 +1,12 @@
> > > +require ccache.inc
> > > +
> > > +LICENSE = "GPLv3+"
> > > +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=4fa0d99234a05c3a32d380379d5d064a"
> >
> >
> > it seems checksum changed. So please add a short description what
> > changed in license terms.
>
> Was the included License-Update tag not enough?  It really is just an
> update to
> the years and dealing with some files moving around in the repo.


It is now when I look hard but I missed it last time another reason to make
it detect renames so we have less to look at

>
>
> >
> > Secondly, please use options to detect renames to git format-patch so we
> > can get better diffs for review
> >
> > you can make this default behaviour by adding
> >
> > [diff]
> >         renames = copies
> >
> > to ~/.gitconfig
>
> Thanks, will do.
>
> --
> Justin Bronder
>

--94eb2c08ee2eb484130566d4cb14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Mar 7, 2018 a=
t 7:59 AM Justin Bronder &lt;<a href=3D"mailto:jsbronder@cold-front.org">js=
bronder@cold-front.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 02/03/18 19:14 -0800, Khem Raj wrote:<br>
&gt; On 3/2/18 2:09 PM, Justin Bronder wrote:<br>
&gt; &gt; <a href=3D"https://ccache.samba.org/releasenotes.html#_ccache_3_4=
_1" rel=3D"noreferrer" target=3D"_blank">https://ccache.samba.org/releaseno=
tes.html#_ccache_3_4_1</a><br>
&gt; &gt;<br>
&gt; &gt; License-Update: copyright years and file paths updated<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Justin Bronder &lt;<a href=3D"mailto:jsbronder@col=
d-front.org" target=3D"_blank">jsbronder@cold-front.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/ccache/<a href=3D"http://ccache_3.3.5=
.bb" rel=3D"noreferrer" target=3D"_blank">ccache_3.3.5.bb</a> | 12 --------=
----<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/ccache/<a href=3D"http://ccache_3.4.1=
.bb" rel=3D"noreferrer" target=3D"_blank">ccache_3.4.1.bb</a> | 12 ++++++++=
++++<br>
&gt; &gt;=C2=A0 2 files changed, 12 insertions(+), 12 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/ccache/<a href=3D"=
http://ccache_3.3.5.bb" rel=3D"noreferrer" target=3D"_blank">ccache_3.3.5.b=
b</a><br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/ccache/<a href=3D"=
http://ccache_3.4.1.bb" rel=3D"noreferrer" target=3D"_blank">ccache_3.4.1.b=
b</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/ccache/<a href=3D"http://ccach=
e_3.3.5.bb" rel=3D"noreferrer" target=3D"_blank">ccache_3.3.5.bb</a> b/meta=
/recipes-devtools/ccache/<a href=3D"http://ccache_3.3.5.bb" rel=3D"noreferr=
er" target=3D"_blank">ccache_3.3.5.bb</a><br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 929f0f1276..0000000000<br>
&gt; &gt; --- a/meta/recipes-devtools/ccache/<a href=3D"http://ccache_3.3.5=
.bb" rel=3D"noreferrer" target=3D"_blank">ccache_3.3.5.bb</a><br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,12 +0,0 @@<br>
&gt; &gt; -require ccache.inc<br>
&gt; &gt; -<br>
&gt; &gt; -LICENSE =3D &quot;GPLv3+&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Ddae379a85bb6=
e9d594773e0aa64876f6&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -SRC_URI[md5sum] =3D &quot;eee58db7cce892febddb989308dc568f&quot;=
<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;190576a6e938760ec8113523e6fd3801411=
17303e90766cc4802e770422b30c6&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -SRC_URI +=3D &quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-dev.mk.in-=
fix-file-name-too-long.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Revert-Create-m=
an-page-in-the-make-install-from-git-.patch \<br>
&gt; &gt; -&quot;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/ccache/<a href=3D"http://ccach=
e_3.4.1.bb" rel=3D"noreferrer" target=3D"_blank">ccache_3.4.1.bb</a> b/meta=
/recipes-devtools/ccache/<a href=3D"http://ccache_3.4.1.bb" rel=3D"noreferr=
er" target=3D"_blank">ccache_3.4.1.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..e3bf74e9c6<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/ccache/<a href=3D"http://ccache_3.4.1=
.bb" rel=3D"noreferrer" target=3D"_blank">ccache_3.4.1.bb</a><br>
&gt; &gt; @@ -0,0 +1,12 @@<br>
&gt; &gt; +require ccache.inc<br>
&gt; &gt; +<br>
&gt; &gt; +LICENSE =3D &quot;GPLv3+&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D4fa0d99234a0=
5c3a32d380379d5d064a&quot;<br>
&gt;<br>
&gt;<br>
&gt; it seems checksum changed. So please add a short description what<br>
&gt; changed in license terms.<br>
<br>
Was the included License-Update tag not enough?=C2=A0 It really is just an =
update to<br>
the years and dealing with some files moving around in the repo.</blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto">It is now when I look hard =
but I missed it last time another reason to make it detect renames so we ha=
ve less to look at</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt;<br>
&gt; Secondly, please use options to detect renames to git format-patch so =
we<br>
&gt; can get better diffs for review<br>
&gt;<br>
&gt; you can make this default behaviour by adding<br>
&gt;<br>
&gt; [diff]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0renames =3D copies<br>
&gt;<br>
&gt; to ~/.gitconfig<br>
<br>
Thanks, will do.<br>
<br>
--<br>
Justin Bronder<br>
</blockquote></div></div>

--94eb2c08ee2eb484130566d4cb14--
