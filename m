Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QmOqJ-0005o4-4b
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 13:33:31 +0200
Received: by gxk3 with SMTP id 3so1773303gxk.6
	for <openembedded-core@openembedded.org>;
	Thu, 28 Jul 2011 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ptkJwvi1K0av4/RqUUF56nAQmkNlMkfIDLKwLmECDBA=;
	b=Vh6/KdGpLkEb0BUXbzuMBzbV+XbswQdvaDo1wtGY3UOCjF7Uw5q0j2HIg8UahlmesB
	N6bc/HV4QX17RkfskUzwnNROmubqiA9IdoeiXNwbHLw5jtANNcAPmU3C1PO1LtBrKuFk
	St6JjU0Fsr0gEw5h5MnsadsG2HWDpcCkyYVm4=
MIME-Version: 1.0
Received: by 10.91.148.7 with SMTP id a7mr725488ago.41.1311852553821; Thu, 28
	Jul 2011 04:29:13 -0700 (PDT)
Received: by 10.91.94.13 with HTTP; Thu, 28 Jul 2011 04:29:13 -0700 (PDT)
In-Reply-To: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
References: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
Date: Thu, 28 Jul 2011 13:29:13 +0200
Message-ID: <CACW_hTZEgveniP0x3R6Q1mNb9+T0kYP=TsOF4A2SwHKJeAqUjA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] [PATCH] raptor: add recipe
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
X-List-Received-Date: Thu, 28 Jul 2011 11:33:31 -0000
Content-Type: multipart/alternative; boundary=0016e645f8a877e01a04a91f793e

--0016e645f8a877e01a04a91f793e
Content-Type: text/plain; charset=ISO-8859-1

2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>

> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>

Eh, yes and no.

I did write the original recipe and commited it on 14 aug 2010 with a
sign-off message.
As such this got my signoff, but I am not sure the signoff should be
repeated if this moved to oe-core.

My sign-off at that time is definitely not to be used as a suggestion it is
ok for oe-core (actually I feel this is not something for oe-core)

And (in reply to Koen), this recipe was tested by me for openembedded when I
submitted it. Afaik I have never build it with oe-core/meta-oe.
Reason to add it then was because flickcurl needed it (and I needed
flickcurl).

Frans.


> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>
> This recipe is a port of recipes/raptor/raptor_1.4.21.bb from
> git://git.openembedded.org/openembedded, commits
> 01e8e9f325d8d251e852e7a5704b5fe50880e1ad 'raptor: added recipe' and
> f1d24b5a986233f869364eb109476f5184e76d10 'raptor: add libxml2 DEPENDS'
>
> The recipe was modified by adding a LIC_FILES_CHKSUM assignment.
>
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>
> ---
>
> Not tested in the oe-core + meta-openembedded et. al. layers. We are not
> ready yet to migrate from the 2011.03-maintenance branch. This patch is
> proposed for inclusion in oe-core so that we can meet the new policy
> requirements for inclusion in the 2011.03-maintenance branch and submit
> a subsequent pull-request for commit
> f1d24b5a986233f869364eb109476f5184e76d10 raptor: add libxml2 DEPENDS
> ---
>  meta/recipes-support/raptor/raptor_1.4.21.bb |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-support/raptor/raptor_1.4.21.bb
>
> diff --git a/meta/recipes-support/raptor/raptor_1.4.21.bbb/meta/recipes-support/raptor/
> raptor_1.4.21.bb
> new file mode 100644
> index 0000000..84fa69e
> --- /dev/null
> +++ b/meta/recipes-support/raptor/raptor_1.4.21.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "Raptor RDF Parser Library"
> +SECTION = "libs"
> +HOMEPAGE = "http://librdf.org/raptor/"
> +LICENSE = "LGPL 2.1/GPL 2/Apache 2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +PR = "r0"
> +SRC_URI = "http://download.librdf.org/source/raptor-${PV}.tar.gz"
> +DEPENDS = "libxml2"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI[md5sum] = "992061488af7a9e2d933df6b694bb876"
> +SRC_URI[sha256sum] =
> "db3172d6f3c432623ed87d7d609161973d2f7098e3d2233d0702fbcc22cfd8ca"
> --
> 1.7.4.1
>
>

--0016e645f8a877e01a04a91f793e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/28 Ben Gardiner <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:bengardiner@nanometrics.ca">bengardiner@nanometrics.=
ca</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
Signed-off-by: Frans Meulenbroeks &lt;<a href=3D"mailto:fransmeulenbroeks@g=
mail.com">fransmeulenbroeks@gmail.com</a>&gt;<br></blockquote><div><br>Eh, =
yes and no.<br><br>I did write the original recipe and commited it on 14 au=
g 2010 with a sign-off message.<br>
As such this got my signoff, but I am not sure the signoff should be repeat=
ed if this moved to oe-core.<br><br>My sign-off at that time is definitely =
not to be used as a suggestion it is ok for oe-core (actually I feel this i=
s not something for oe-core)<br>
<br>And (in reply to Koen), this recipe was tested by me for openembedded w=
hen I submitted it. Afaik I have never build it with oe-core/meta-oe.<br>Re=
ason to add it then was because flickcurl needed it (and I needed flickcurl=
).<br>
<br>Frans.<br>=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-le=
ft: 1ex;">
Signed-off-by: Ben Gardiner &lt;<a href=3D"mailto:bengardiner@nanometrics.c=
a">bengardiner@nanometrics.ca</a>&gt;<br>
Signed-off-by: Tom Rini &lt;<a href=3D"mailto:tom_rini@mentor.com">tom_rini=
@mentor.com</a>&gt;<br>
<br>
This recipe is a port of recipes/raptor/<a href=3D"http://raptor_1.4.21.bb"=
 target=3D"_blank">raptor_1.4.21.bb</a> from<br>
git://<a href=3D"http://git.openembedded.org/openembedded" target=3D"_blank=
">git.openembedded.org/openembedded</a>, commits<br>
01e8e9f325d8d251e852e7a5704b5fe50880e1ad &#39;raptor: added recipe&#39; and=
<br>
f1d24b5a986233f869364eb109476f5184e76d10 &#39;raptor: add libxml2 DEPENDS&#=
39;<br>
<br>
The recipe was modified by adding a LIC_FILES_CHKSUM assignment.<br>
<br>
Signed-off-by: Ben Gardiner &lt;<a href=3D"mailto:bengardiner@nanometrics.c=
a">bengardiner@nanometrics.ca</a>&gt;<br>
<br>
---<br>
<br>
Not tested in the oe-core + meta-openembedded et. al. layers. We are not<br=
>
ready yet to migrate from the 2011.03-maintenance branch. This patch is<br>
proposed for inclusion in oe-core so that we can meet the new policy<br>
requirements for inclusion in the 2011.03-maintenance branch and submit<br>
a subsequent pull-request for commit<br>
f1d24b5a986233f869364eb109476f5184e76d10 raptor: add libxml2 DEPENDS<br>
---<br>
=A0meta/recipes-support/raptor/<a href=3D"http://raptor_1.4.21.bb" target=
=3D"_blank">raptor_1.4.21.bb</a> | =A0 13 +++++++++++++<br>
=A01 files changed, 13 insertions(+), 0 deletions(-)<br>
=A0create mode 100644 meta/recipes-support/raptor/<a href=3D"http://raptor_=
1.4.21.bb" target=3D"_blank">raptor_1.4.21.bb</a><br>
<br>
diff --git a/meta/recipes-support/raptor/<a href=3D"http://raptor_1.4.21.bb=
" target=3D"_blank">raptor_1.4.21.bb</a> b/meta/recipes-support/raptor/<a h=
ref=3D"http://raptor_1.4.21.bb" target=3D"_blank">raptor_1.4.21.bb</a><br>
new file mode 100644<br>
index 0000000..84fa69e<br>
--- /dev/null<br>
+++ b/meta/recipes-support/raptor/<a href=3D"http://raptor_1.4.21.bb" targe=
t=3D"_blank">raptor_1.4.21.bb</a><br>
@@ -0,0 +1,13 @@<br>
+DESCRIPTION =3D &quot;Raptor RDF Parser Library&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://librdf.org/raptor/" target=3D"_blank"=
>http://librdf.org/raptor/</a>&quot;<br>
+LICENSE =3D &quot;LGPL 2.1/GPL 2/Apache 2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D751419260aa954499f7abaabaa=
882bbe&quot;<br>
+PR =3D &quot;r0&quot;<br>
+SRC_URI =3D &quot;<a href=3D"http://download.librdf.org/source/raptor-$%7B=
PV%7D.tar.gz" target=3D"_blank">http://download.librdf.org/source/raptor-${=
PV}.tar.gz</a>&quot;<br>
+DEPENDS =3D &quot;libxml2&quot;<br>
+<br>
+inherit autotools pkgconfig<br>
+<br>
+SRC_URI[md5sum] =3D &quot;992061488af7a9e2d933df6b694bb876&quot;<br>
+SRC_URI[sha256sum] =3D &quot;db3172d6f3c432623ed87d7d609161973d2f7098e3d22=
33d0702fbcc22cfd8ca&quot;<br>
<font color=3D"#888888">--<br>
1.7.4.1<br>
<br>
</font></blockquote></div><br>

--0016e645f8a877e01a04a91f793e--
