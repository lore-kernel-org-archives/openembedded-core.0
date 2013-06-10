Return-Path: <ap.john.stirling@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id DDD85621CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:57 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w59so4744061wes.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 06:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wVK9FYybOA7EcPQVsM6tNzkq47n45oQS5Lv3cIdr6GE=;
	b=kxEolrjAv0wy2+wxoDDXaIKgeP7x0IQk2+bZzCEV9KhvItxjflJZ8lWQ7EBE0viJG4
	qbA/TXax76hI6GJU4cftj5fpZJbgbVSNzoLJBDMYPtyseViybYPG3jFov/hGcF/KfSIK
	895KfEfm45WH5A6W1xcWwVa1Dt95Ui+XEKWNoUaPybOiuZkvEvzuuszF6a04vbfYphzp
	jn4iyEosbyVreSGmYT+SIQ2KpsKabzdspSlyZhWIhrhcZKJ+i8EC+9nSxmJOxtjUqcYp
	3oCH75qAngFDDN97QKRINVvXqOgIdhqjM6GKreyJ3aTGoYBH6por8L6XYZbnsIBA06qT
	M+Fg==
MIME-Version: 1.0
X-Received: by 10.180.11.194 with SMTP id s2mr3096437wib.7.1370872017746; Mon,
	10 Jun 2013 06:46:57 -0700 (PDT)
Received: by 10.194.121.229 with HTTP; Mon, 10 Jun 2013 06:46:57 -0700 (PDT)
In-Reply-To: <1442698.2y5IVPznBc@helios>
References: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
	<2326207.iuBVrRrsbt@helios>
	<CABuzA3N_Bk0_AnC3sF4TDqk08F2h2LHcv3ChkWJi4iX=dCKT_g@mail.gmail.com>
	<1442698.2y5IVPznBc@helios>
Date: Mon, 10 Jun 2013 14:46:57 +0100
Message-ID: <CABuzA3OXwzQBeYJ4D5kGYANTNykOPnOR4BDrj3=y9TauD1Z5hg@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt4-embedded - image size
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
X-List-Received-Date: Mon, 10 Jun 2013 13:46:58 -0000
Content-Type: multipart/alternative; boundary=001a11c355a2a6811104decd031b

--001a11c355a2a6811104decd031b
Content-Type: text/plain; charset=ISO-8859-1

Looking fairly promising so far. Image size down from 280Mb to 90Mb and
only Qt related stuff now seems to be in /usr/lib/

The font's seem to be missing though -
QFontDatabase: Cannot find font directory /usr/lib/fonts - is Qt installed
correctly?

We won't need all the fonts in any case but would you expect them to have
been pulled in automatically ?

Here's what I now have in /usr/lib/libQt*

-rwxr-xr-x root       root          3157228 ./usr/lib/libQtCoreE.so.4.8.0
-rwxr-xr-x root       root           481476 ./usr/lib/libQtDBusE.so.4.8.0
-rwxr-xr-x root       root          3571644
./usr/lib/libQtDeclarativeE.so.4.8.0
-rwxr-xr-x root       root          9643544 ./usr/lib/libQtGuiE.so.4.8.0
-rwxr-xr-x root       root          1231712
./usr/lib/libQtNetworkE.so.4.8.0
-rwxr-xr-x root       root          2507000 ./usr/lib/libQtScriptE.so.4.8.0

-rwxr-xr-x root       root           217564 ./usr/lib/libQtSqlE.so.4.8.0
-rwxr-xr-x root       root           247056 ./usr/lib/libQtXmlE.so.4.8.0
-rwxr-xr-x root       root          4412572
./usr/lib/libQtXmlPatternsE.so.4.8.0

Total approx 25Mb there.

Pretty sure I need the first 3, but not sure about the rest. Does that look
about right to you size wise ? We're just trying to tie down flash sizes at
the moment and want to get a fairly accurate estimate for Qt.

I guess also at some point we might want to switch to Qt5. Is that
comparable in size ?



On 10 June 2013 13:17, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:

> On Monday 10 June 2013 12:19:48 John Stirling wrote:
> > The Qt application (qtui) is compiled and has some C++, some QML and
> needs
> > to use dbus. I am kicking it off via './qtui -qws'.
> >
> > So basically if I had this -
> >
> > IMAGE_INSTALL += " \
> > qt4-embedded \
> > qtui \
> > "
> >
> > You suggest just cutting it down to
> >
> > IMAGE_INSTALL += " \
> > qtui \
> > "
> > and it should work itself out ?
>
> Apart from plugins and anything else that your application doesn't get
> directly linked to, yes.
>
> > I am not entirely sure on the 'inherit qt4e' line.
>
> You do want this here, yes.
>
> > SRC_URI = "git://${SOURCE_REPO}/git/${PN}.git;protocol=ssh;tag=${PV}"
>
> I think you probably should specify SRCREV here, even if it's SRCREV =
> "${AUTOREV}" to build the latest version on the specified branch. For tags
> that
> won't change, typically we recommend that you specify the full sha1 hash in
> SRCREV and then the system knows it doesn't need to query the git server to
> get the current hash corresponding to the tag.
>
> > PROVIDES = "${PN}_${PV}"
>
> This should not be necessary.
>
> > DEPENDS = "qt4-embedded"
>
> This is already done for you by inheriting qt4e.
>
> > RPROVIDES = "qtui_${PV}"
>
> This should not be necessary either.
>
> > PACKAGES="${PN}"
>
> Unless you have a good reason to do this I would recommend not doing so;
> the
> standard package splitting should work for most situations and for those
> where
> it needs to be tweaked slightly that can be done fairly easily.
>
> > FILES_${PN} += "/root/qtui /usr/share/reciva/qml/qtui
> > ${sysconfdir}/dbus-1/system.d/"
>
> Typically you would install binaries such as this to ${bindir} rather than
> /root.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--001a11c355a2a6811104decd031b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Looking fairly promising so far. Image size down from 280Mb to 90Mb an=
d only Qt related stuff now seems to be in /usr/lib/</div><div><br></div><d=
iv>The font&#39;s seem to be missing though -</div><div>QFontDatabase: Cann=
ot find font directory /usr/lib/fonts - is Qt installed correctly?</div>
<div><br></div><div>We won&#39;t need all the fonts in any case but would y=
ou expect them to have been pulled in automatically ?</div><div><br></div><=
div>Here&#39;s what I now have in /usr/lib/libQt*</div><div><br></div><div>
<div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =A0 =A0 =A03157228 ./usr/lib/=
libQtCoreE.so.4.8.0 =A0</div><div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =
=A0 =A0 =A0 481476 ./usr/lib/libQtDBusE.so.4.8.0 =A0</div><div>-rwxr-xr-x r=
oot =A0 =A0 =A0 root =A0 =A0 =A0 =A0 =A03571644 ./usr/lib/libQtDeclarativeE=
.so.4.8.0 =A0</div>
<div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =A0 =A0 =A09643544 ./usr/lib/=
libQtGuiE.so.4.8.0 =A0</div><div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =
=A0 =A0 =A01231712 ./usr/lib/libQtNetworkE.so.4.8.0 =A0</div><div>-rwxr-xr-=
x root =A0 =A0 =A0 root =A0 =A0 =A0 =A0 =A02507000 ./usr/lib/libQtScriptE.s=
o.4.8.0 =A0</div>
<div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =A0 =A0 =A0 217564 ./usr/lib/=
libQtSqlE.so.4.8.0 =A0</div><div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =
=A0 =A0 =A0 247056 ./usr/lib/libQtXmlE.so.4.8.0 =A0</div><div>-rwxr-xr-x ro=
ot =A0 =A0 =A0 root =A0 =A0 =A0 =A0 =A04412572 ./usr/lib/libQtXmlPatternsE.=
so.4.8.0 =A0</div>
</div><div><br></div><div>Total approx 25Mb there.</div><div><br></div><div=
>Pretty sure I need the first 3, but not sure about the rest. Does that loo=
k about right to you size wise ? We&#39;re just trying to tie down flash si=
zes at the moment and want to get a fairly accurate estimate for Qt.</div>
<div><br></div><div>I guess also at some point we might want to switch to Q=
t5. Is that comparable in size ?</div><div><br></div><br><br><div class=3D"=
gmail_quote">On 10 June 2013 13:17, Paul Eggleton <span dir=3D"ltr">&lt;<a =
href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.egglet=
on@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Monday 10 June 2013 12:=
19:48 John Stirling wrote:<br>
&gt; The Qt application (qtui) is compiled and has some C++, some QML and n=
eeds<br>
&gt; to use dbus. I am kicking it off via &#39;./qtui -qws&#39;.<br>
&gt;<br>
&gt; So basically if I had this -<br>
&gt;<br>
&gt; IMAGE_INSTALL +=3D &quot; \<br>
&gt; qt4-embedded \<br>
&gt; qtui \<br>
&gt; &quot;<br>
&gt;<br>
&gt; You suggest just cutting it down to<br>
&gt;<br>
&gt; IMAGE_INSTALL +=3D &quot; \<br>
&gt; qtui \<br>
&gt; &quot;<br>
&gt; and it should work itself out ?<br>
<br>
</div>Apart from plugins and anything else that your application doesn&#39;=
t get<br>
directly linked to, yes.<br>
<div class=3D"im"><br>
&gt; I am not entirely sure on the &#39;inherit qt4e&#39; line.<br>
<br>
</div>You do want this here, yes.<br>
<div class=3D"im"><br>
&gt; SRC_URI =3D &quot;git://${SOURCE_REPO}/git/${PN}.git;protocol=3Dssh;ta=
g=3D${PV}&quot;<br>
<br>
</div>I think you probably should specify SRCREV here, even if it&#39;s SRC=
REV =3D<br>
&quot;${AUTOREV}&quot; to build the latest version on the specified branch.=
 For tags that<br>
won&#39;t change, typically we recommend that you specify the full sha1 has=
h in<br>
SRCREV and then the system knows it doesn&#39;t need to query the git serve=
r to<br>
get the current hash corresponding to the tag.<br>
<div class=3D"im"><br>
&gt; PROVIDES =3D &quot;${PN}_${PV}&quot;<br>
<br>
</div>This should not be necessary.<br>
<br>
&gt; DEPENDS =3D &quot;qt4-embedded&quot;<br>
<br>
This is already done for you by inheriting qt4e.<br>
<br>
&gt; RPROVIDES =3D &quot;qtui_${PV}&quot;<br>
<br>
This should not be necessary either.<br>
<br>
&gt; PACKAGES=3D&quot;${PN}&quot;<br>
<br>
Unless you have a good reason to do this I would recommend not doing so; th=
e<br>
standard package splitting should work for most situations and for those wh=
ere<br>
it needs to be tweaked slightly that can be done fairly easily.<br>
<div class=3D"im"><br>
&gt; FILES_${PN} +=3D &quot;/root/qtui /usr/share/reciva/qml/qtui<br>
&gt; ${sysconfdir}/dbus-1/system.d/&quot;<br>
<br>
</div>Typically you would install binaries such as this to ${bindir} rather=
 than<br>
/root.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Cheers,<br>
Paul<br>
<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</div></div></blockquote></div><br>

--001a11c355a2a6811104decd031b--
