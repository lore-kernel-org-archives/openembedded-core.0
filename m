Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 219CB789C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 18:19:59 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id h4-v6so8050055qtj.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V6gwZ3S6XXO9zefqC5D7MgFx0XUTA6ik7kxyl0x0umA=;
	b=ou0wtc0iu3fnIuSwq63ueYoW1a0liM+WPPc6cy99AZn8WUWxIgiK2Q3Ai7UwgTabZs
	TL/U8Z+o9RCEcTP9zu2ypkQyNI0bDd90sAr3I4fnK4p1+8Lq5C955AbPP7HyCHgxd2Cs
	iXKJzP91OALIvoS2UBh4sbQRvan4CTgLRdUGJa2g3xRVtMTNQjtpM6iSpj8GoxT+1yHT
	eP+XO5DihWj8CgW9nvAZLa8hW1bBJ/JBxm04MJUUWjLaZ1JNKdYchNOiyDDhCJ6QpGKP
	ZImNY0umknuJW9ecyhyYdwjRoLu/VuOFoW6e2D9rxpyCTB6Db9CQHJGH2Q8j7dzvW7cW
	B3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V6gwZ3S6XXO9zefqC5D7MgFx0XUTA6ik7kxyl0x0umA=;
	b=EtmtHSIN4sgt5rg/U2+UJ+gl7KCktYQJJCi1GH1uYiK+1/bCkvZuLh56XSdJLM5SSq
	5yFm063d92jo/RNTzK1IeUwe3agi6KbEhMLoet7/0Ykj2z6wK0IqPfZj8eJYkwQv39LX
	k7i+uHkBnfG3vM+e1Q0YTCZ1bWPzdHm/HCsONKN+UgpxwKwfWVaDKiNi2VFJoEDOTQpn
	0n6XvZiuhq+n8j+GIySDHV5u/V4p72K6eSp7q/mOJGfOn+bp3oESAqj7MhEiNaBGJICL
	6cCHd/diy8g1ULO6ccv7OrzFZLFn7smfILPaL5Cv5RsZ6Ny5RaeSYOkoUvNvm5JGqRPj
	NkVQ==
X-Gm-Message-State: AOUpUlFrYd/ikW8x7VgO633QkkfNbhvnK6e0USzhIWIbVPu2TAw0+Uw6
	uWf02lfT914VxaEsy0Gij7ec02SiDIwoCOijIg8=
X-Google-Smtp-Source: AAOMgpd+D0E0tAcjtfOHvWPgew/PbuGgjqO1Kr5zHRWORNnen3O2P8xOkKU8xVzXQKH0vW4I4ylqCzKgtYF02WiqZzY=
X-Received: by 2002:a0c:e0c8:: with SMTP id
	x8-v6mr11792201qvk.74.1532024400750; 
	Thu, 19 Jul 2018 11:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <1532020379-32243-1-git-send-email-alex.kiernan@gmail.com>
	<096e8a04-c49b-88ae-df8e-444cf4c33c94@gmail.com>
	<CAO5Uq5SBCQes7uM9sg=Zy847nKWUzB43zqJ8VRQRxj7qfzS8-Q@mail.gmail.com>
In-Reply-To: <CAO5Uq5SBCQes7uM9sg=Zy847nKWUzB43zqJ8VRQRxj7qfzS8-Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jul 2018 11:19:46 -0700
Message-ID: <CAMKF1spcSe1bvUpK4fw=Fnd6veiyDU6VrPa8_kdQHkhuVwnWKA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Use ${COREBASE}/meta for timestamp, fallback to bitbake.conf
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
X-List-Received-Date: Thu, 19 Jul 2018 18:20:00 -0000
Content-Type: multipart/alternative; boundary="00000000000031b09005715e3aaa"

--00000000000031b09005715e3aaa
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 19, 2018 at 10:26 AM Alex Kiernan <alex.kiernan@gmail.com>
wrote:
>
> On Thu, Jul 19, 2018 at 6:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On 7/19/18 10:12 AM, Alex Kiernan wrote:
> > > To handle the case where ${COREBASE} isn't the git directory, but
> > > ${COREBASE}/meta might be (since that's the layer that sets up the
COREBASE
> > > variable), use the timestamp from there. If that fails use the
timestamp
> > > from conf/bitbake.conf.
> >
> > whats the chance that ${COREBASE}/meta might also not be a directory
> > under git when compared to ${COREBASE} ?
> >
>
> About the same I expect, but if it's not then git will climb up to
> ${COREBASE} so I think we're better off.
>
> And if it doesn't find one then it falls back to the timestamp on
> bitbake.conf - I've just been testing a snapshot of the layers as a
> tarball and building successfully inside that when there's no git
> directories for it to find at all.
>

OK lets stay with adding bitbake.conf as fallback.

> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >
> > >   meta/classes/image.bbclass | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > > index adc50c9..0afebff 100644
> > > --- a/meta/classes/image.bbclass
> > > +++ b/meta/classes/image.bbclass
> > > @@ -651,7 +651,10 @@ POPULATE_SDK_PRE_TARGET_COMMAND +=
"${@bb.utils.contains('DISTRO_FEATURES', 'usr
> > >   reproducible_final_image_task () {
> > >       if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> > >           if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> > > -            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log
-1 --pretty=%ct`
> > > +            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}/meta"
log -1 --pretty=%ct 2>/dev/null` || true
> > > +            if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" = "" ]; then
> > > +                REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y
${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
> > > +            fi
> > >           fi
> > >           # Set mtime of all files to a reproducible value
> > >           bbnote "reproducible_final_image_task: mtime set to
$REPRODUCIBLE_TIMESTAMP_ROOTFS"
> > >
>
>
>
> --
> Alex Kiernan

--00000000000031b09005715e3aaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br>
On Thu, Jul 19, 2018 at 10:26 AM Alex Kiernan &lt;<a href=3D"mailto:alex.ki=
ernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; On Thu, Jul 19, 2018 at 6:21 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On 7/19/18 10:12 AM, Alex Kiernan wrote:<br>
&gt; &gt; &gt; To handle the case where ${COREBASE} isn&#39;t the git direc=
tory, but<br>
&gt; &gt; &gt; ${COREBASE}/meta might be (since that&#39;s the layer that s=
ets up the COREBASE<br>
&gt; &gt; &gt; variable), use the timestamp from there. If that fails use t=
he timestamp<br>
&gt; &gt; &gt; from conf/bitbake.conf.<br>
&gt; &gt;<br>
&gt; &gt; whats the chance that ${COREBASE}/meta might also not be a direct=
ory<br>
&gt; &gt; under git when compared to ${COREBASE} ?<br>
&gt; &gt;<br>
&gt;<br>
&gt; About the same I expect, but if it&#39;s not then git will climb up to=
<br>
&gt; ${COREBASE} so I think we&#39;re better off.<br>
&gt;<br>
&gt; And if it doesn&#39;t find one then it falls back to the timestamp on<=
br>
&gt; bitbake.conf - I&#39;ve just been testing a snapshot of the layers as =
a<br>
&gt; tarball and building successfully inside that when there&#39;s no git<=
br>
&gt; directories for it to find at all.<br>
&gt;<br>
<br></div><div>
OK lets stay with adding bitbake.conf as fallback. <br></div><div>
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiern=
an@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0meta/classes/image.bbclass | 5 ++++-<br>
&gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 1 deletion(-)<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/classes/image.bbclass b/meta/classes/image=
.bbclass<br>
&gt; &gt; &gt; index adc50c9..0afebff 100644<br>
&gt; &gt; &gt; --- a/meta/classes/image.bbclass<br>
&gt; &gt; &gt; +++ b/meta/classes/image.bbclass<br>
&gt; &gt; &gt; @@ -651,7 +651,10 @@ POPULATE_SDK_PRE_TARGET_COMMAND +=3D &q=
uot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;usr<br>
&gt; &gt; &gt;=C2=A0 =C2=A0reproducible_final_image_task () {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${BUILD_REPRODUCIBLE_BI=
NARIES}&quot; =3D &quot;1&quot; ]; then<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$REPRODUC=
IBLE_TIMESTAMP_ROOTFS&quot; =3D &quot;&quot; ]; then<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 REPRODUCIBLE_TIME=
STAMP_ROOTFS=3D`git -C &quot;${COREBASE}&quot; log -1 --pretty=3D%ct`<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 REPRODUCIBLE_TIME=
STAMP_ROOTFS=3D`git -C &quot;${COREBASE}/meta&quot; log -1 --pretty=3D%ct 2=
&gt;/dev/null` || true<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${REPR=
ODUCIBLE_TIMESTAMP_ROOTFS}&quot; =3D &quot;&quot; ]; then<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 REP=
RODUCIBLE_TIMESTAMP_ROOTFS=3D`stat -c%Y ${@bb.utils.which(d.getVar(&quot;BB=
PATH&quot;), &quot;conf/bitbake.conf&quot;)}`<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Set mtime of all f=
iles to a reproducible value<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;reprodu=
cible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS&quot;<b=
r>
&gt; &gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Alex Kiernan<br>
</div>

--00000000000031b09005715e3aaa--
