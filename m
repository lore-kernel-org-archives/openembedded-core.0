Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpJqb-0006Lx-Pc
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 15:54:26 +0200
Received: by ggnp4 with SMTP id p4so2240499ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 06:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=0sTIuHtDq78d9Dz8Z3V9UERHbc5INct+rEco3sYdDAg=;
	b=YXJmbOG9lE7Eis0wN4dMm1WGrgUN3PfISZgDbUCv1WSNtcDpd++ttGgSpO9Yh8RErP
	7CTCLWzh60e6LeLN8Q+pABKADd9IRML1nsG/xfM3XVSmba4c2ICBDY5snNxmEfR20icm
	gndPZw3XRGxNTaP8X8cebN57fOW978Y0/PW7qzMJCKAi67CgqPTU6wJgdAfw3Df6+1G4
	3o56TtKSguGQZgdIeIb7Q3JbJduLz6e6P95S1FfwJyRcPotqZASAKBA00eoYgsCZ+r8V
	DDGD4LGJjrc/W9zJqp123QTCe1SwlZSkbvZ6USYul5BQvR4zNjEMoDbvTvwO2P+nPADl
	0NXQ==
Received: by 10.50.202.68 with SMTP id kg4mr11881003igc.43.1342100591447; Thu,
	12 Jul 2012 06:43:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Thu, 12 Jul 2012 06:42:51 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <927F0993-6573-459B-820D-0ECFA37787C8@dominion.thruhere.net>
References: <1342015854-30040-1-git-send-email-koen@dominion.thruhere.net>
	<4FFDE7B3.8050804@linux.intel.com>
	<CAK18fxGaTeNPMeVq_JUSTmJggPHjmDLta6hun4p3kqoZbF167A@mail.gmail.com>
	<927F0993-6573-459B-820D-0ECFA37787C8@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 12 Jul 2012 16:42:51 +0300
Message-ID: <CAK18fxEZ3x8i=42riFOVBqvG+i2Fv4VuRcB35KCcuGP1SKXj0A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQncglBPew8VMwlmxWelZ5onkCgiihSFZ1B9SinQ++hWXjoEx8/w1gOv5Fq7Yz3XX0NJwCd/
Subject: Re: [PATCH] xz: update to 5.1.2alpha
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
X-List-Received-Date: Thu, 12 Jul 2012 13:54:26 -0000
Content-Type: multipart/alternative; boundary=f46d0447950b01901904c4a22547

--f46d0447950b01901904c4a22547
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 12, 2012 at 3:56 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

>
> Op 12 jul. 2012, om 14:26 heeft Andrei Gherzan het volgende geschreven:
>
> > On Wed, Jul 11, 2012 at 11:53 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 07/11/2012 07:10 AM, Koen Kooi wrote:
> > This contains bugfixes from the 5.0.3 and 5.0.4 releases
> >
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> >   meta/recipes-extended/xz/{xz_5.1.1alpha.bb => xz_5.1.2alpha.bb} |
>  7 ++-----
> >   1 file changed, 2 insertions(+), 5 deletions(-)
> >   rename meta/recipes-extended/xz/{xz_5.1.1alpha.bb => xz_5.1.2alpha.bb}
> (86%)
> >
> > diff --git a/meta/recipes-extended/xz/xz_5.1.1alpha.bbb/meta/recipes-extended/xz/
> xz_5.1.2alpha.bb
> > similarity index 86%
> > rename from meta/recipes-extended/xz/xz_5.1.1alpha.bb
> > rename to meta/recipes-extended/xz/xz_5.1.2alpha.bb
> > index 7fa7177..9d68720 100644
> > --- a/meta/recipes-extended/xz/xz_5.1.1alpha.bb
> > +++ b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
> > @@ -10,11 +10,8 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
> >
> file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
> >
> >   SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "bb24436fa12780808e1c142980484104"
> > -SRC_URI[sha256sum] =
> "54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
> > -
> > -PR = "r0"
> > +SRC_URI[md5sum] = "9bad1e249537ce69b206815cf28ca87b"
> > +SRC_URI[sha256sum] =
> "70e792d2a67cfbb8f2dffd0feab6ca6e5a4a618d65070fb44a367629d1ba94e5"
> >
> >   inherit autotools gettext
> >
> >
> >
> > How stable is this alpha release?  We don't generally take up
> re-releases, correct?
> >
> >
> > We already have an alpha release... so another alpha shouldn't be a
> problem, right? .1a it's a good deal as it implements multithreaded
> compression and decompression.
>
> After Andrei's patch for image_types.bbclass goes in I have a follow up
> patch to enable xz threads (and disable the -e -9) to give a nice speedup
> for xz images. On my aging core2quad compressing a 4gb image goes from ~22
> minutes to ~6.5 minutes with -T4. On my 4c/8t i7 I can get up to a 6x
> speedup with -T6 or -T8, hyperthreading does a better job than I expected.
>
>
I can confirm this. But still, we can hold -e -9 and just add -T4. I think
people have 700mb ram to spare while compressing.

@g

--f46d0447950b01901904c4a22547
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Jul 12, 2012 at 3:56 PM, Koen Kooi <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_b=
lank">koen@dominion.thruhere.net</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<br>
Op 12 jul. 2012, om 14:26 heeft Andrei Gherzan het volgende geschreven:<br>
<br>
&gt; On Wed, Jul 11, 2012 at 11:53 PM, Saul Wold &lt;<a href=3D"mailto:sgw@=
linux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>
&gt; On 07/11/2012 07:10 AM, Koen Kooi wrote:<br>
&gt; This contains bugfixes from the 5.0.3 and 5.0.4 releases<br>
&gt;<br>
&gt; Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.=
net">koen@dominion.thruhere.net</a>&gt;<br>
&gt; ---<br>
&gt; =A0 meta/recipes-extended/xz/{<a href=3D"http://xz_5.1.1alpha.bb" targ=
et=3D"_blank">xz_5.1.1alpha.bb</a> =3D&gt; <a href=3D"http://xz_5.1.2alpha.=
bb" target=3D"_blank">xz_5.1.2alpha.bb</a>} | =A0 =A07 ++-----<br>
&gt; =A0 1 file changed, 2 insertions(+), 5 deletions(-)<br>
&gt; =A0 rename meta/recipes-extended/xz/{<a href=3D"http://xz_5.1.1alpha.b=
b" target=3D"_blank">xz_5.1.1alpha.bb</a> =3D&gt; <a href=3D"http://xz_5.1.=
2alpha.bb" target=3D"_blank">xz_5.1.2alpha.bb</a>} (86%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/xz/<a href=3D"http://xz_5.1.1alpha.=
bb" target=3D"_blank">xz_5.1.1alpha.bb</a> b/meta/recipes-extended/xz/<a hr=
ef=3D"http://xz_5.1.2alpha.bb" target=3D"_blank">xz_5.1.2alpha.bb</a><br>
&gt; similarity index 86%<br>
&gt; rename from meta/recipes-extended/xz/<a href=3D"http://xz_5.1.1alpha.b=
b" target=3D"_blank">xz_5.1.1alpha.bb</a><br>
&gt; rename to meta/recipes-extended/xz/<a href=3D"http://xz_5.1.2alpha.bb"=
 target=3D"_blank">xz_5.1.2alpha.bb</a><br>
&gt; index 7fa7177..9d68720 100644<br>
&gt; --- a/meta/recipes-extended/xz/<a href=3D"http://xz_5.1.1alpha.bb" tar=
get=3D"_blank">xz_5.1.1alpha.bb</a><br>
&gt; +++ b/meta/recipes-extended/xz/<a href=3D"http://xz_5.1.2alpha.bb" tar=
get=3D"_blank">xz_5.1.2alpha.bb</a><br>
&gt; @@ -10,11 +10,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc47=
5b6c7dca236740ace4bba553e8e1c \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://lib/getopt.c;endlin=
e=3D23;md5=3D2069b0ee710572c03bb3114e4532cd84 &quot;<br>
&gt;<br>
&gt; =A0 SRC_URI =3D &quot;<a href=3D"http://tukaani.org/xz/xz-${PV}.tar.gz=
" target=3D"_blank">http://tukaani.org/xz/xz-${PV}.tar.gz</a>&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;bb24436fa12780808e1c142980484104&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;54e59a83690a4a0ec88a7d7c3bdef90c6b196c89=
2a93463863c71c24fe87951a&quot;<br>
&gt; -<br>
&gt; -PR =3D &quot;r0&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;9bad1e249537ce69b206815cf28ca87b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;70e792d2a67cfbb8f2dffd0feab6ca6e5a4a618d=
65070fb44a367629d1ba94e5&quot;<br>
&gt;<br>
&gt; =A0 inherit autotools gettext<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; How stable is this alpha release? =A0We don&#39;t generally take up re=
-releases, correct?<br>
&gt;<br>
&gt;<br>
&gt; We already have an alpha release... so another alpha shouldn&#39;t be =
a problem, right? .1a it&#39;s a good deal as it implements multithreaded c=
ompression and decompression.<br>
<br>
After Andrei&#39;s patch for image_types.bbclass goes in I have a follow up=
 patch to enable xz threads (and disable the -e -9) to give a nice speedup =
for xz images. On my aging core2quad compressing a 4gb image goes from ~22 =
minutes to ~6.5 minutes with -T4. On my 4c/8t i7 I can get up to a 6x speed=
up with -T6 or -T8, hyperthreading does a better job than I expected.<br>

<br></blockquote><div>=A0</div><div>I can confirm this. But still, we can h=
old -e -9 and just add -T4. I think people have 700mb ram to spare while co=
mpressing.=A0</div><div><br></div><div>@g</div></div>

--f46d0447950b01901904c4a22547--
