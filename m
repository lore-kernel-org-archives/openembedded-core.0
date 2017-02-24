Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 81F8371971
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 04:55:50 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 40so877423uau.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 20:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=EpEAF/Bq+57kLotVE+lu/71jeezkhnKsgNm19GLlpQw=;
	b=LMUlfhfQW50ZKrclTWZX1tuil2EuLkSR74vgEKL1misA7X6k3P72iLF+gJ8Fo6MO+0
	7eSwNn2J1KRTZKVo9uX3MEN08tRpKMfvu2LS4591InNqlK99f0F3PAZ32L+bOFtzebaT
	tR2WPNRLdIY+iRxqMREQkOV98a6xuXORzyhXfGvCXhF5rygzJWIMJLgNcqIwJepfphlL
	WI07cnoVihHHLMDjTFHHxN5joBsGHk2PRlbyD5Y232lHbBC2TeNCRfU1STxOoewRa4Zw
	ezL9CYwuDH3Z6o1u9VFbUnwvu/wv2qdABI/LWFpz0xc4y0qHrvrDKWMmI5/TJtR1z6T9
	kiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=EpEAF/Bq+57kLotVE+lu/71jeezkhnKsgNm19GLlpQw=;
	b=pFXV0Bc9TBb38Blqx0U7cArpiYMeUyAGmQMD9gAc62LCHqvuF+otup4HYyghDOvuUq
	0sdRXyym2XMrtMkb4YGeTnyVlIZILC6o4v3LL30qq9R9ZZDH+W36wsjusq0YgjBYAFNU
	7G8Iz5XbZsL9Z8rcSMk/C+s/k6I+mYqdGA9Iw6MtdSB7gntSpw3YIFDzjKJ2Aur5K8ZL
	aH9Bl5oVJ3Rd5Cks/iInXP/vua7+HQAJZuv+wdPKOW6tIScnqSQSVhQ1P82smOLIQzQE
	7827S+Zay/2a5dKxtOVkuOOWQiKLj88WLE7DlqBhpgfVzGKVzfDdtLbbniZmZBFhO9XT
	GXBA==
X-Gm-Message-State: AMke39kAVi0hUNWchtkm1CxygnIh5U365Ps546n8gJdj4Cp6cf+iOZdw2+wzysa+5xL09011qABw/1dyCTMSsw==
X-Received: by 10.176.64.138 with SMTP id i10mr373657uad.60.1487912151626;
	Thu, 23 Feb 2017 20:55:51 -0800 (PST)
MIME-Version: 1.0
References: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
In-Reply-To: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Feb 2017 04:55:40 +0000
Message-ID: <CAMKF1sr0OxcRYC9OZsJBieR-MVFnw5XbfuKr+go8xnhgYDHstA@mail.gmail.com>
To: Joe MacDonald <joe_macdonald@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] deprecated.bbclass: Add a PNDEPRECATED variable for recipes
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
X-List-Received-Date: Fri, 24 Feb 2017 04:55:53 -0000
Content-Type: multipart/alternative; boundary=94eb2c122e2c413a4b05493f8b95

--94eb2c122e2c413a4b05493f8b95
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 23, 2017 at 8:00 PM Joe MacDonald <joe_macdonald@mentor.com>
wrote:

> Based on the blacklist behaviour, recipes can be tagged as deprecated.
> Such recipes will produce a warning message when included in a build but
> unlike blacklisted recipes, the build will continue.


Perhaps this should also be documented in manuals

>
>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>
> I threw this together a long time ago and never got around to sending it
> out for
> consideration, but after the excitement last week and this, I got thinking
> about
> it again and thought it might be useful.  My specific use-case for this is
> recipes I see in meta-networking that I know are largely abandonware but
> that I
> don't want to completely throw out without giving some kind of heads up.
> Obviously this is purely informational, there's no mechanism set up for
> purging
> deprecated recipes, that's intended to be a maintainer activity, but the
> idea
> would be that the maintainer would flag a recipe as deprecated (probably
> when
> it's become more trouble than it seems to be worth) and thereafter users
> would
> have fair warning that this thing is on notice.  If nobody speaks up
> within some
> amount of time the maintainer considers reasonable (I'm thinking a Yocto
> release
> cycle) then it's fair game to remove the recipe in question.
>
>  meta/classes/deprecated.bbclass    | 16 ++++++++++++++++
>  meta/conf/distro/defaultsetup.conf |  3 ++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 meta/classes/deprecated.bbclass
>
> diff --git a/meta/classes/deprecated.bbclass
> b/meta/classes/deprecated.bbclass
> new file mode 100644
> index 0000000..3dcdadb
> --- /dev/null
> +++ b/meta/classes/deprecated.bbclass
> @@ -0,0 +1,16 @@
> +# To use the deprecated recipe check, a distribution should
> +# include this class in the INHERIT_DISTRO
> +#
> +# Features:
> +#
> +# * To add a package to the deprecated list, set:
> +#   PNDEPRECATED[pn] = "message"
> +#
> +
> +addtask check_deprecated before do_fetch
> +python do_check_deprecated () {
> +    deprecated = d.getVarFlag('PNDEPRECATED', d.getVar('PN', True), False)
> +
> +    if deprecated:
> +        bb.warn("Recipe is deprecated: ", (deprecated))
> +}
> diff --git a/meta/conf/distro/defaultsetup.conf
> b/meta/conf/distro/defaultsetup.conf
> index ca2f917..16ece3a 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -20,5 +20,6 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/'
> + str(d.getVar('MACHINE'
>  USER_CLASSES ?= ""
>  PACKAGE_CLASSES ?= "package_ipk"
>  INHERIT_BLACKLIST = "blacklist"
> +INHERIT_DEPRECATED = "deprecated"
>  INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
> -INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}
> ${INHERIT_BLACKLIST}"
> +INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}
> ${INHERIT_BLACKLIST} ${INHERIT_DEPRECATED}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c122e2c413a4b05493f8b95
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Thu, Feb 23, 2017 at 8:00 PM Jo=
e MacDonald &lt;<a href=3D"mailto:joe_macdonald@mentor.com">joe_macdonald@m=
entor.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Based on=
 the blacklist behaviour, recipes can be tagged as deprecated.<br class=3D"=
gmail_msg">
Such recipes will produce a warning message when included in a build but<br=
 class=3D"gmail_msg">
unlike blacklisted recipes, the build will continue.</blockquote><div><br><=
/div><div>Perhaps this should also be documented in manuals</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Signed-off-by: Joe MacDonald &lt;<a href=3D"mailto:joe_macdonald@mentor.com=
" class=3D"gmail_msg" target=3D"_blank">joe_macdonald@mentor.com</a>&gt;<br=
 class=3D"gmail_msg">
---<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
I threw this together a long time ago and never got around to sending it ou=
t for<br class=3D"gmail_msg">
consideration, but after the excitement last week and this, I got thinking =
about<br class=3D"gmail_msg">
it again and thought it might be useful.=C2=A0 My specific use-case for thi=
s is<br class=3D"gmail_msg">
recipes I see in meta-networking that I know are largely abandonware but th=
at I<br class=3D"gmail_msg">
don&#39;t want to completely throw out without giving some kind of heads up=
.<br class=3D"gmail_msg">
Obviously this is purely informational, there&#39;s no mechanism set up for=
 purging<br class=3D"gmail_msg">
deprecated recipes, that&#39;s intended to be a maintainer activity, but th=
e idea<br class=3D"gmail_msg">
would be that the maintainer would flag a recipe as deprecated (probably wh=
en<br class=3D"gmail_msg">
it&#39;s become more trouble than it seems to be worth) and thereafter user=
s would<br class=3D"gmail_msg">
have fair warning that this thing is on notice.=C2=A0 If nobody speaks up w=
ithin some<br class=3D"gmail_msg">
amount of time the maintainer considers reasonable (I&#39;m thinking a Yoct=
o release<br class=3D"gmail_msg">
cycle) then it&#39;s fair game to remove the recipe in question.<br class=
=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0meta/classes/deprecated.bbclass=C2=A0 =C2=A0 | 16 ++++++++++++++++<br=
 class=3D"gmail_msg">
=C2=A0meta/conf/distro/defaultsetup.conf |=C2=A0 3 ++-<br class=3D"gmail_ms=
g">
=C2=A02 files changed, 18 insertions(+), 1 deletion(-)<br class=3D"gmail_ms=
g">
=C2=A0create mode 100644 meta/classes/deprecated.bbclass<br class=3D"gmail_=
msg">
<br class=3D"gmail_msg">
diff --git a/meta/classes/deprecated.bbclass b/meta/classes/deprecated.bbcl=
ass<br class=3D"gmail_msg">
new file mode 100644<br class=3D"gmail_msg">
index 0000000..3dcdadb<br class=3D"gmail_msg">
--- /dev/null<br class=3D"gmail_msg">
+++ b/meta/classes/deprecated.bbclass<br class=3D"gmail_msg">
@@ -0,0 +1,16 @@<br class=3D"gmail_msg">
+# To use the deprecated recipe check, a distribution should<br class=3D"gm=
ail_msg">
+# include this class in the INHERIT_DISTRO<br class=3D"gmail_msg">
+#<br class=3D"gmail_msg">
+# Features:<br class=3D"gmail_msg">
+#<br class=3D"gmail_msg">
+# * To add a package to the deprecated list, set:<br class=3D"gmail_msg">
+#=C2=A0 =C2=A0PNDEPRECATED[pn] =3D &quot;message&quot;<br class=3D"gmail_m=
sg">
+#<br class=3D"gmail_msg">
+<br class=3D"gmail_msg">
+addtask check_deprecated before do_fetch<br class=3D"gmail_msg">
+python do_check_deprecated () {<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 deprecated =3D d.getVarFlag(&#39;PNDEPRECATED&#39;, d.getVar=
(&#39;PN&#39;, True), False)<br class=3D"gmail_msg">
+<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 if deprecated:<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Recipe is deprecated: &quot;, (d=
eprecated))<br class=3D"gmail_msg">
+}<br class=3D"gmail_msg">
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaults=
etup.conf<br class=3D"gmail_msg">
index ca2f917..16ece3a 100644<br class=3D"gmail_msg">
--- a/meta/conf/distro/defaultsetup.conf<br class=3D"gmail_msg">
+++ b/meta/conf/distro/defaultsetup.conf<br class=3D"gmail_msg">
@@ -20,5 +20,6 @@ CACHE =3D &quot;${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@[&#=
39;&#39;, &#39;/&#39; + str(d.getVar(&#39;MACHINE&#39;<br class=3D"gmail_ms=
g">
=C2=A0USER_CLASSES ?=3D &quot;&quot;<br class=3D"gmail_msg">
=C2=A0PACKAGE_CLASSES ?=3D &quot;package_ipk&quot;<br class=3D"gmail_msg">
=C2=A0INHERIT_BLACKLIST =3D &quot;blacklist&quot;<br class=3D"gmail_msg">
+INHERIT_DEPRECATED =3D &quot;deprecated&quot;<br class=3D"gmail_msg">
=C2=A0INHERIT_DISTRO ?=3D &quot;debian devshell sstate license remove-libto=
ol&quot;<br class=3D"gmail_msg">
-INHERIT +=3D &quot;${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${=
INHERIT_BLACKLIST}&quot;<br class=3D"gmail_msg">
+INHERIT +=3D &quot;${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${=
INHERIT_BLACKLIST} ${INHERIT_DEPRECATED}&quot;<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
1.9.1<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
_______________________________________________<br class=3D"gmail_msg">
Openembedded-core mailing list<br class=3D"gmail_msg">
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" class=3D"gmail_=
msg" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br clas=
s=3D"gmail_msg">
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">http://lists.ope=
nembedded.org/mailman/listinfo/openembedded-core</a><br class=3D"gmail_msg"=
>
</blockquote></div></div>

--94eb2c122e2c413a4b05493f8b95--
