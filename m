Return-Path: <joshuagloe@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0A519731EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 11:06:36 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id g73so50397347ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 03:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4a7oJC1FAcgT0HfvvQ/Z1VpUc6kmP1ChIJxmFhTtnVk=;
	b=LF3867Hu62jubPo8+JjTjvnJ9zdl3pIRCWeFHViSmYg0+rgrczNYzzA0SNUc0cgUpG
	MihxbnhwrJeSwMS+53CdQ/HXzFiziAjcLdMK+4ICQENtSbuPmzzDoyq65IZmqIexLJqD
	pl99wDTxLvMsnLW9E1S28wE8PJ1gfq6KrZMnyPuJSeQ/x2oEpnHn4iKQQn/SNh784AWq
	sIdJbdmOP3o2IjESaqpQzXeMhJwpBmW/nGP2A7gsa6e+VkzhGOPBY41RuIePwy1Hh0R3
	4N2sYTrj+k1AZuk/a+Mbl/e83bXnXAgc6R67wuyuUBaXVMCTW9P5Q7nTBgM+L8A4DG0E
	OvWw==
MIME-Version: 1.0
X-Received: by 10.107.166.85 with SMTP id p82mr3317543ioe.146.1452164797032;
	Thu, 07 Jan 2016 03:06:37 -0800 (PST)
Received: by 10.64.114.164 with HTTP; Thu, 7 Jan 2016 03:06:36 -0800 (PST)
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28011FB6F20A@EU-MBX-02.mgc.mentorg.com>
References: <1450869629-27805-1-git-send-email-awais_belal@mentor.com>
	<1450877091.3760.4.camel@collabora.co.uk>
	<2021B186DC632746BD5A3CE32F12BD28011FB6F20A@EU-MBX-02.mgc.mentorg.com>
Date: Thu, 7 Jan 2016 11:06:36 +0000
Message-ID: <CAK-Jx1NhbEV8astFe4BF0aSnfWQtqXSnjCwUzxUJZ_PUCQmVOA@mail.gmail.com>
From: Joshua Lock <joshuagloe@gmail.com>
To: "Belal, Awais" <Awais_Belal@mentor.com>
Cc: Joshua Lock <joshua.lock@collabora.co.uk>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dizzy][PATCH] grub2: Fix CVE-2015-8370
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
X-List-Received-Date: Thu, 07 Jan 2016 11:06:37 -0000
Content-Type: multipart/alternative; boundary=001a1141d062e1ec500528bc7662

--001a1141d062e1ec500528bc7662
Content-Type: text/plain; charset=UTF-8

Hi Awais,

On 28 December 2015 at 10:40, Belal, Awais <Awais_Belal@mentor.com> wrote:

> Hi Joshua,
>
> http://patchwork.openembedded.org/patch/110999/
>
>
Unfortunately this doesn't apply on my fido branch:

ERROR: Command Error: exit status: 1  Output:
Applying patch 0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
patching file grub-core/lib/crypto.c
Hunk #1 FAILED at 470.
1 out of 1 hunk FAILED -- rejects in file grub-core/lib/crypto.c
patching file grub-core/normal/auth.c
Hunk #1 FAILED at 174.
1 out of 1 hunk FAILED -- rejects in file grub-core/normal/auth.c
Patch 0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch does not
apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/home/joshuagl/Projects/poky-fido/build/tmp/work/i586-poky-linux/grub/2.00-r1/temp/log.do_patch.23384
ERROR: Task 1 (/home/joshuagl/Projects/poky-fido/meta/recipes-bsp/grub/
grub_2.00.bb, do_patch) failed with exit code '1'

Regards,

Joshua


> BR,
> Awais
>
> ________________________________________
> From: Joshua Lock [joshua.lock@collabora.co.uk]
> Sent: Wednesday, December 23, 2015 6:24 PM
> To: Belal, Awais; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370
>
> Hi Awais,
>
> Will you be submitting a similar patch for Fido too?
> (neither the dizzy nor jethro versions you've already sent apply
> cleanly).
>
> Regards,
>
> Joshua
>
> On Wed, 2015-12-23 at 16:20 +0500, Awais Belal wrote:
> > http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432
> > e109771bb8febafca7a5f1f2
> >
> > Signed-off-by: Awais Belal <awais_belal@mentor.com>
> > ---
> >  ...E-2015-8370-Grub2-user-pass-vulnerability.patch | 52
> > ++++++++++++++++++++++
> >  meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
> >  meta/recipes-bsp/grub/grub_2.00.bb                 |  1 +
> >  3 files changed, 54 insertions(+)
> >  create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-
> > 8370-Grub2-user-pass-vulnerability.patch
> >
> > diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-
> > Grub2-user-pass-vulnerability.patch b/meta/recipes-
> > bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-
> > vulnerability.patch
> > new file mode 100644
> > index 0000000..f9252e9
> > --- /dev/null
> > +++ b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-
> > pass-vulnerability.patch
> > @@ -0,0 +1,52 @@
> > +Upstream-Status: Accepted
> > +Signed-off-by: Awais Belal <awais_belal@mentor.com>
> > +
> > +From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00
> > 2001
> > +From: Hector Marco-Gisbert <hecmargi@upv.es>
> > +Date: Wed, 16 Dec 2015 04:57:18 +0000
> > +Subject: Fix security issue when reading username and password
> > +
> > +This patch fixes two integer underflows at:
> > +  * grub-core/lib/crypto.c
> > +  * grub-core/normal/auth.c
> > +
> > +CVE-2015-8370
> > +
> > +Signed-off-by: Hector Marco-Gisbert <hecmargi@upv.es>
> > +Signed-off-by: Ismael Ripoll-Ripoll <iripoll@disca.upv.es>
> > +Also-By: Andrey Borzenkov <arvidjaar@gmail.com>
> > +---
> > +diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
> > +index 010e550..683a8aa 100644
> > +--- a/grub-core/lib/crypto.c
> > ++++ b/grub-core/lib/crypto.c
> > +@@ -470,7 +470,8 @@ grub_password_get (char buf[], unsigned
> > buf_size)
> > +
> > +       if (key == '\b')
> > +     {
> > +-      cur_len--;
> > ++      if (cur_len)
> > ++        cur_len--;
> > +       continue;
> > +     }
> > +
> > +diff --git a/grub-core/normal/auth.c b/grub-core/normal/auth.c
> > +index c6bd96e..8615c48 100644
> > +--- a/grub-core/normal/auth.c
> > ++++ b/grub-core/normal/auth.c
> > +@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned
> > buf_size)
> > +
> > +       if (key == '\b')
> > +     {
> > +-      cur_len--;
> > +-      grub_printf ("\b");
> > ++      if (cur_len)
> > ++        {
> > ++          cur_len--;
> > ++          grub_printf ("\b");
> > ++        }
> > +       continue;
> > +     }
> > +
> > +--
> > +cgit v0.9.0.2
> > diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-
> > bsp/grub/grub-efi_2.00.bb
> > index 7674255..6822e7a 100644
> > --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
> > +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> > @@ -30,6 +30,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.ta
> > r.gz \
> >             file://grub-2.00-add-oe-kernel.patch \
> >             file://grub-efi-fix-with-glibc-2.20.patch \
> >             file://0001-parse_dhcp_vendor-Add-missing-const-
> > qualifiers.patch \
> > +           file://0001-Fix-CVE-2015-8370-Grub2-user-pass-
> > vulnerability.patch \
> >            "
> >  SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
> >  SRC_URI[sha256sum] =
> > "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
> > diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-
> > bsp/grub/grub_2.00.bb
> > index d4df676..94b6da9 100644
> > --- a/meta/recipes-bsp/grub/grub_2.00.bb
> > +++ b/meta/recipes-bsp/grub/grub_2.00.bb
> > @@ -25,6 +25,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.ta
> > r.gz \
> >            file://fix-endianness-problem.patch \
> >            file://grub2-remove-sparc64-setup-from-x86-builds.patch \
> >            file://0001-parse_dhcp_vendor-Add-missing-const-
> > qualifiers.patch \
> > +          file://0001-Fix-CVE-2015-8370-Grub2-user-pass-
> > vulnerability.patch \
> >            "
> >
> >  SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
> > --
> > 1.9.1
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141d062e1ec500528bc7662
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Awais,<br><div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On 28 December 2015 at 10:40, Belal, Awais <span dir=3D"l=
tr">&lt;<a href=3D"mailto:Awais_Belal@mentor.com" target=3D"_blank">Awais_B=
elal@mentor.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi Joshua,<br>
<br>
<a href=3D"http://patchwork.openembedded.org/patch/110999/" rel=3D"noreferr=
er" target=3D"_blank">http://patchwork.openembedded.org/patch/110999/</a><b=
r>
<br></blockquote><div><br></div><div>Unfortunately this doesn&#39;t apply o=
n my fido branch:<br><br>ERROR: Command Error: exit status: 1=C2=A0 Output:=
<br>Applying patch 0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.pat=
ch<br>patching file grub-core/lib/crypto.c<br>Hunk #1 FAILED at 470.<br>1 o=
ut of 1 hunk FAILED -- rejects in file grub-core/lib/crypto.c<br>patching f=
ile grub-core/normal/auth.c<br>Hunk #1 FAILED at 174.<br>1 out of 1 hunk FA=
ILED -- rejects in file grub-core/normal/auth.c<br>Patch 0001-Fix-CVE-2015-=
8370-Grub2-user-pass-vulnerability.patch does not apply (enforce with -f)<b=
r>ERROR: Function failed: patch_do_patch<br>ERROR: Logfile of failure store=
d in: /home/joshuagl/Projects/poky-fido/build/tmp/work/i586-poky-linux/grub=
/2.00-r1/temp/log.do_patch.23384<br>ERROR: Task 1 (/home/joshuagl/Projects/=
poky-fido/meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb">grub_2.00.b=
b</a>, do_patch) failed with exit code &#39;1&#39;<br><br></div><div>Regard=
s,<br><br></div><div>Joshua<br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
BR,<br>
Awais<br>
<br>
________________________________________<br>
From: Joshua Lock [<a href=3D"mailto:joshua.lock@collabora.co.uk">joshua.lo=
ck@collabora.co.uk</a>]<br>
Sent: Wednesday, December 23, 2015 6:24 PM<br>
To: Belal, Awais; <a href=3D"mailto:openembedded-core@lists.openembedded.or=
g">openembedded-core@lists.openembedded.org</a><br>
Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370<br>
<br>
Hi Awais,<br>
<br>
Will you be submitting a similar patch for Fido too?<br>
(neither the dizzy nor jethro versions you&#39;ve already sent apply<br>
cleanly).<br>
<br>
Regards,<br>
<br>
Joshua<br>
<br>
On Wed, 2015-12-23 at 16:20 +0500, Awais Belal wrote:<br>
&gt; <a href=3D"http://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D451d=
80e52d851432" rel=3D"noreferrer" target=3D"_blank">http://git.savannah.gnu.=
org/cgit/grub.git/commit/?id=3D451d80e52d851432</a><br>
<span class=3D"">&gt; e109771bb8febafca7a5f1f2<br>
&gt;<br>
&gt; Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.co=
m">awais_belal@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...E-2015-8370-Grub2-user-pass-vulnerability.patch | 52<br>
&gt; ++++++++++++++++++++++<br>
</span>&gt;=C2=A0 meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.00.bb"=
 rel=3D"noreferrer" target=3D"_blank">grub-efi_2.00.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=C2=A01 +<br>
&gt;=C2=A0 meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb" rel=3D"nor=
eferrer" target=3D"_blank">grub_2.00.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=C2=A01 +<br>
&gt;=C2=A0 3 files changed, 54 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015=
-<br>
&gt; 8370-Grub2-user-pass-vulnerability.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-<br>
&gt; Grub2-user-pass-vulnerability.patch b/meta/recipes-<br>
&gt; bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-<br>
<span class=3D"">&gt; vulnerability.patch<br>
&gt; new file mode 100644<br>
</span>&gt; index 0000000..f9252e9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-<b=
r>
<div><div class=3D"h5">&gt; pass-vulnerability.patch<br>
&gt; @@ -0,0 +1,52 @@<br>
&gt; +Upstream-Status: Accepted<br>
&gt; +Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.c=
om">awais_belal@mentor.com</a>&gt;<br>
&gt; +<br>
&gt; +From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Hector Marco-Gisbert &lt;<a href=3D"mailto:hecmargi@upv.es">hec=
margi@upv.es</a>&gt;<br>
&gt; +Date: Wed, 16 Dec 2015 04:57:18 +0000<br>
&gt; +Subject: Fix security issue when reading username and password<br>
&gt; +<br>
&gt; +This patch fixes two integer underflows at:<br>
&gt; +=C2=A0 * grub-core/lib/crypto.c<br>
&gt; +=C2=A0 * grub-core/normal/auth.c<br>
&gt; +<br>
&gt; +CVE-2015-8370<br>
&gt; +<br>
&gt; +Signed-off-by: Hector Marco-Gisbert &lt;<a href=3D"mailto:hecmargi@up=
v.es">hecmargi@upv.es</a>&gt;<br>
&gt; +Signed-off-by: Ismael Ripoll-Ripoll &lt;<a href=3D"mailto:iripoll@dis=
ca.upv.es">iripoll@disca.upv.es</a>&gt;<br>
&gt; +Also-By: Andrey Borzenkov &lt;<a href=3D"mailto:arvidjaar@gmail.com">=
arvidjaar@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; +diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c<br>
&gt; +index 010e550..683a8aa 100644<br>
&gt; +--- a/grub-core/lib/crypto.c<br>
&gt; ++++ b/grub-core/lib/crypto.c<br>
&gt; +@@ -470,7 +470,8 @@ grub_password_get (char buf[], unsigned<br>
&gt; buf_size)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (key =3D=3D &#39;\b&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 cur_len--;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (cur_len)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_len--;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +diff --git a/grub-core/normal/auth.c b/grub-core/normal/auth.c<br>
&gt; +index c6bd96e..8615c48 100644<br>
&gt; +--- a/grub-core/normal/auth.c<br>
&gt; ++++ b/grub-core/normal/auth.c<br>
&gt; +@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned<br>
&gt; buf_size)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (key =3D=3D &#39;\b&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 cur_len--;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 grub_printf (&quot;\b&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (cur_len)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cur_len--;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grub_printf (&quot;\b&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +--<br>
&gt; +cgit v0.9.0.2<br>
</div></div>&gt; diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub-=
efi_2.00.bb" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.00.bb</a> b/me=
ta/recipes-<br>
&gt; bsp/grub/<a href=3D"http://grub-efi_2.00.bb" rel=3D"noreferrer" target=
=3D"_blank">grub-efi_2.00.bb</a><br>
&gt; index 7674255..6822e7a 100644<br>
&gt; --- a/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.00.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.00.bb</a><br>
&gt; +++ b/meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.00.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-efi_2.00.bb</a><br>
&gt; @@ -30,6 +30,7 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.gnu.org/gnu/g=
rub/grub-${PV}.ta" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.gnu.org/g=
nu/grub/grub-${PV}.ta</a><br>
&gt; r.gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://grub-2.00-add-oe=
-kernel.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://grub-efi-fix-wit=
h-glibc-2.20.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-parse_dhcp_=
vendor-Add-missing-const-<br>
&gt; qualifiers.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-CVE-2015-837=
0-Grub2-user-pass-<br>
&gt; vulnerability.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;e927540b6eda8b024fb0391eeaa4091c&quot;=
<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D<br>
&gt; &quot;65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3=
&quot;<br>
&gt; diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb" rel=
=3D"noreferrer" target=3D"_blank">grub_2.00.bb</a> b/meta/recipes-<br>
&gt; bsp/grub/<a href=3D"http://grub_2.00.bb" rel=3D"noreferrer" target=3D"=
_blank">grub_2.00.bb</a><br>
&gt; index d4df676..94b6da9 100644<br>
&gt; --- a/meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb" rel=3D"nor=
eferrer" target=3D"_blank">grub_2.00.bb</a><br>
&gt; +++ b/meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb" rel=3D"nor=
eferrer" target=3D"_blank">grub_2.00.bb</a><br>
<span class=3D"">&gt; @@ -25,6 +25,7 @@ SRC_URI =3D &quot;<a href=3D"ftp://=
ftp.gnu.org/gnu/grub/grub-${PV}.ta" rel=3D"noreferrer" target=3D"_blank">ft=
p://ftp.gnu.org/gnu/grub/grub-${PV}.ta</a><br>
&gt; r.gz \<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-endianness-=
problem.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://grub2-remove-sparc64-s=
etup-from-x86-builds.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-parse_dhcp_vendor=
-Add-missing-const-<br>
&gt; qualifiers.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-CVE-2015-8370-Grub=
2-user-pass-<br>
&gt; vulnerability.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;e927540b6eda8b024fb0391eeaa4091c&quot;=
<br>
<div class=3D""><div class=3D"h5">&gt; --<br>
&gt; 1.9.1<br>
&gt;<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div></div></div>

--001a1141d062e1ec500528bc7662--
