Return-Path: <kergoth@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 57448606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 15:27:46 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id q200so11608113ykb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Feb 2015 07:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=mONlmyMxyUv9hxrDpbZJKwq4g2A9c6/wPgEb3xPec5A=;
	b=WxH3fd40QFPUQcfr45GoMnLZboRq2Hlan7+9tzRKfzCNSWo4SfZSkInGWK+dCdDOGz
	68WJtK+3mgCdKaq1/snO1UMv9A5I2hk9pxtgJGSbzKZwCk3wm1vTT6O2vavwZMaK6V+S
	0ijmyuBv4oV1jmn/n4HeSo1DESzvyq/86TSWI/jNUqdV37dLfhp3EmNyh/KjZSFbIHkU
	+PAsZ93bsoZgttqvMoBo7eJAenBoSbCfWulaEfkAc+FroepnDvt+N/njH+1MDTkOnoQC
	6UJ9hbZpkW9lBVtC3gOGq2zgaWHsIDDtPN+gT0yRV9g/QJ83swArB9w9TztkruKzVkTU
	qtPw==
X-Received: by 10.170.121.17 with SMTP id n17mr7254212ykb.17.1423495667957;
	Mon, 09 Feb 2015 07:27:47 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.205.88 with HTTP; Mon, 9 Feb 2015 07:27:27 -0800 (PST)
In-Reply-To: <1423066153-24933-2-git-send-email-danismostlikely@gmail.com>
References: <1423066153-24933-1-git-send-email-danismostlikely@gmail.com>
	<1423066153-24933-2-git-send-email-danismostlikely@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 9 Feb 2015 08:27:27 -0700
X-Google-Sender-Auth: Q6x-xgSMijphj6HZyt8N8P4juq0
Message-ID: <CABcZANnGoH8paGOMivNRJ4swvJ2jMWRJU53=E15oa68X4Yczpw@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] openssh: Fix non-deterministic build behaviour
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
X-List-Received-Date: Mon, 09 Feb 2015 15:27:51 -0000
Content-Type: multipart/alternative; boundary=001a1137c1caa0c8fc050ea96925

--001a1137c1caa0c8fc050ea96925
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 4, 2015 at 9:09 AM, Dan McGregor <danismostlikely@gmail.com>
wrote:

> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> If maillock.h is found, a dependency on liblockfile will be created.
> liblockfile is in meta-oe, so we don't want that in an oe-core recipe.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-connectivity/openssh/openssh_6.7p1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> index dcbc181..a272629 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
> @@ -62,6 +62,9 @@ CACHED_CONFIGUREVARS += "ac_cv_header_bsd_libutil_h=no
> ac_cv_header_libutil_h=no
>  # passwd path is hardcoded in sshd
>  CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
>
> +# We don't want to depend on libblockfile
> +CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
> +
>

I wonder if this should be a PACKAGECONFIG. Most optional dependencies tend
to be.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1137c1caa0c8fc050ea96925
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Feb 4, 2015 at 9:09 AM, Dan McGregor <span dir=3D"ltr">&lt;<a href=
=3D"mailto:danismostlikely@gmail.com" target=3D"_blank">danismostlikely@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
ou" class=3D"a3s" style=3D"overflow:hidden">From: Dan McGregor &lt;<a href=
=3D"mailto:dan.mcgregor@usask.ca">dan.mcgregor@usask.ca</a>&gt;<br>
<br>
If maillock.h is found, a dependency on liblockfile will be created.<br>
liblockfile is in meta-oe, so we don&#39;t want that in an oe-core recipe.<=
br>
<br>
Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca">da=
n.mcgregor@usask.ca</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/openssh/<a href=3D"http://openssh_6.7p1.bb"=
 target=3D"_blank">openssh_6.7p1.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_6.=
7p1.bb" target=3D"_blank">openssh_6.7p1.bb</a> b/meta/recipes-connectivity/=
openssh/<a href=3D"http://openssh_6.7p1.bb" target=3D"_blank">openssh_6.7p1=
.bb</a><br>
index dcbc181..a272629 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_6.7p1.bb"=
 target=3D"_blank">openssh_6.7p1.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_6.7p1.bb"=
 target=3D"_blank">openssh_6.7p1.bb</a><br>
@@ -62,6 +62,9 @@ CACHED_CONFIGUREVARS +=3D &quot;ac_cv_header_bsd_libutil_=
h=3Dno ac_cv_header_libutil_h=3Dno<br>
=C2=A0# passwd path is hardcoded in sshd<br>
=C2=A0CACHED_CONFIGUREVARS +=3D &quot;ac_cv_path_PATH_PASSWD_PROG=3D${bindi=
r}/passwd&quot;<br>
<br>
+# We don&#39;t want to depend on libblockfile<br>
+CACHED_CONFIGUREVARS +=3D &quot;ac_cv_header_maillock_h=3Dno&quot;<br>
+</div></blockquote></div><br>I wonder if this should be a PACKAGECONFIG. M=
ost optional dependencies tend to be.<br>-- <br><div class=3D"gmail_signatu=
re">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, =
OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer,=
 Mentor Graphics</div>
</div></div>

--001a1137c1caa0c8fc050ea96925--
