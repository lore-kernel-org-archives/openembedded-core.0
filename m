Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 303B46C45D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 08:15:18 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id c126so39700wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2018 00:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dVe/T3JN1jZp+t1NPl4OQ8ZJCYv1qTNUSD2XSTAEAxE=;
	b=lPvImgs0+tbCjUI3XKPgpQNSpKprW06VH2EsjRZqTE+Mi47Hz8wfU+gLClUZ1ELHdc
	9Ro7a4LytIfofkvwX5YOM2TW99agabI5A2rAgbLMW26S64Y9Rrxwl1QTU51KWBt3c2Yw
	Ia+3TAKwK872ygo+Vkub5AGlCoL0hwFS1z0oMPZKuYAiBM0oq8Jp2/C8hzCy4UZiE8Qt
	1RishKA8w27h1qY9/Iu5RssxpN32MagfyfmfsYGXPuuBO1jdrG2nrorxaUJORzmOpSdW
	kq+DBaLEF/yQNZcwWN+RPIbrIY+58JG7wIiw3pEzCQiWwVmjhCwGTyX82aE4AnjAYLuw
	2T8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dVe/T3JN1jZp+t1NPl4OQ8ZJCYv1qTNUSD2XSTAEAxE=;
	b=f9gy1dOn+YJFT6uZqpyVYaE3wenhiVPqxWOpBg+icAhton7BEutAC8JmTxzfZYRM7F
	0ZEmmotJTKrBFM5UqSsFXqfngXnKQpGe5JE2m8wJLI2LKdWGUWo8IWqHmPD1rSCNc+uc
	c4uQsJnOFxpNYkqGGgnv7n5I7Xj6jOLEAZZIVUTj4wONKrjxGkemLcnnIkgu1RDBpcnR
	riefcowmgcdRYdy6tCcwa6Tj1umJDHIBu2AtV2XBO9frhBO6BF5YNAbRnhy4PuHLBuxV
	tH5MWVyduZdIb+O04cE4GugwxgqjIIS6ahUtF/hPEha5cLYRNj+4oj3i7dycxIkN1adg
	l8gg==
X-Gm-Message-State: AA+aEWb3zGDqeXs6H70PbS2MwXxxFCMbzzgzxDlYovNxjK4Nz5Uasp1j
	0TSpYdpQgz28vZ1T8bp2vmZ6JiXvxY0+tbfmtPg=
X-Google-Smtp-Source: AFSGD/UKaZ5ThDp4+BJYRCBlw29K2rFUGLGiqywJkMEtNmLSwSVkeP+89hqjUdHa7xHYJ/T6bSTDv/roXVxbhA1KDP4=
X-Received: by 2002:a1c:44d6:: with SMTP id r205mr19370253wma.50.1544084118522;
	Thu, 06 Dec 2018 00:15:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542971171.git.liezhi.yang@windriver.com>
	<85fe4df7c0ce3e3c8017fbf410d98498669f7363.1542971171.git.liezhi.yang@windriver.com>
	<CA+chaQegPbZ05LK3ZMNNHDYdjsi4ba-kp4=m3BBj6EbzbaHf8A@mail.gmail.com>
	<01bf1405-68d4-59c1-bb14-c12e7d75cd7b@windriver.com>
In-Reply-To: <01bf1405-68d4-59c1-bb14-c12e7d75cd7b@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Dec 2018 09:15:06 +0100
Message-ID: <CA+chaQdRO=U8m4dpqKE9GJK85JVfSu8yYo2w5fzWh+ueDgVO0Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] uboot-sign.bbclass: Remove tab indentations in python code
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
X-List-Received-Date: Thu, 06 Dec 2018 08:15:18 -0000
Content-Type: multipart/alternative; boundary="000000000000634ff9057c561958"

--000000000000634ff9057c561958
Content-Type: text/plain; charset="UTF-8"

> So I think that shell code can use either spaces or tabs as indentation.

True, that's why I used "I wish" and ":)" because as Christmas gift I
always wanted consistency (not only between layers, but between shell and
python code as well).

On Thu, Dec 6, 2018 at 3:55 AM Robert Yang <liezhi.yang@windriver.com>
wrote:

> Hi Martin,
>
> On 12/5/18 10:40 PM, Martin Jansa wrote:
> > I wish we could have the same warning for shell code as well :).
> >
>
> According to oe's Format Guidelines:
>
> https://www.openembedded.org/wiki/Styleguide#Format_Guidelines
>
> - Python functions must be four space indented - no tabs.
> - Shell functions in OE-Core usually use tabs for indentation, but other
> layers
> usually use consistent indentation with 4 spaces (in shell functions,
> python
> functions and for indentation of multi-line variables)
>
>
> So I think that shell code can use either spaces or tabs as indentation.
>
> > Can you please take care of meta-gplv2 as well?
> > WARNING: meta-gplv2/recipes-core/coreutils/coreutils_6.9.bb
> > <http://coreutils_6.9.bb>: python should use 4 spaces indentation, but
> found
> > tabs in coreutils_6.9.bb <http://coreutils_6.9.bb>, line 95
>
> Thanks, I've sent a patch for it.
>
> // Robert
>
> >
> > I've sent patch for meta-oe issue:
> >
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-December/197803.html
> >
> >
> > On Fri, Nov 23, 2018 at 11:51 AM Robert Yang <liezhi.yang@windriver.com
> > <mailto:liezhi.yang@windriver.com>> wrote:
> >
> >     Use 4 spaces to replace a tab.
> >
> >     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
> >     <mailto:liezhi.yang@windriver.com>>
> >     ---
> >       meta/classes/uboot-sign.bbclass | 16 ++++++++--------
> >       1 file changed, 8 insertions(+), 8 deletions(-)
> >
> >     diff --git a/meta/classes/uboot-sign.bbclass
> b/meta/classes/uboot-sign.bbclass
> >     index 0e5e1b1..03100b8 100644
> >     --- a/meta/classes/uboot-sign.bbclass
> >     +++ b/meta/classes/uboot-sign.bbclass
> >     @@ -93,14 +93,14 @@ do_install_append() {
> >       }
> >
> >       python () {
> >     -       if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') ==
> >     d.getVar('UBOOT_PN'):
> >     -               kernel_pn =
> d.getVar('PREFERRED_PROVIDER_virtual/kernel')
> >     +    if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') ==
> >     d.getVar('UBOOT_PN'):
> >     +        kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
> >
> >     -               # Make "bitbake u-boot -cdeploy" deploys the signed
> u-boot.dtb
> >     -               d.appendVarFlag('do_deploy', 'depends', '
> %s:do_deploy' %
> >     kernel_pn)
> >     +        # Make "bitbake u-boot -cdeploy" deploys the signed
> u-boot.dtb
> >     +        d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' %
> kernel_pn)
> >
> >     -               # kernerl's do_deploy is a litle special, so we
> can't use
> >     -               # do_deploy_append, otherwise it would override
> >     -               # kernel_do_deploy.
> >     -               d.appendVarFlag('do_deploy', 'prefuncs', '
> concat_dtb')
> >     +        # kernerl's do_deploy is a litle special, so we can't use
> >     +        # do_deploy_append, otherwise it would override
> >     +        # kernel_do_deploy.
> >     +        d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
> >       }
> >     --
> >     2.7.4
> >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--000000000000634ff9057c561958
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; So I think that shell code can use either spaces or t=
abs as indentation.<div><br></div><div>True, that&#39;s why I used &quot;I =
wish&quot; and &quot;:)&quot; because as Christmas gift I always wanted con=
sistency (not only between layers, but between shell and python code as wel=
l).<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, =
Dec 6, 2018 at 3:55 AM Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windri=
ver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">Hi Martin,<br>
<br>
On 12/5/18 10:40 PM, Martin Jansa wrote:<br>
&gt; I wish we could have the same warning for shell code as well :).<br>
&gt;<br>
<br>
According to oe&#39;s Format Guidelines:<br>
<br>
<a href=3D"https://www.openembedded.org/wiki/Styleguide#Format_Guidelines" =
rel=3D"noreferrer" target=3D"_blank">https://www.openembedded.org/wiki/Styl=
eguide#Format_Guidelines</a><br>
<br>
- Python functions must be four space indented - no tabs.<br>
- Shell functions in OE-Core usually use tabs for indentation, but other la=
yers <br>
usually use consistent indentation with 4 spaces (in shell functions, pytho=
n <br>
functions and for indentation of multi-line variables)<br>
<br>
<br>
So I think that shell code can use either spaces or tabs as indentation.<br=
>
<br>
&gt; Can you please take care of meta-gplv2 as well?<br>
&gt; WARNING: meta-gplv2/recipes-core/coreutils/<a href=3D"http://coreutils=
_6.9.bb" rel=3D"noreferrer" target=3D"_blank">coreutils_6.9.bb</a> <br>
&gt; &lt;<a href=3D"http://coreutils_6.9.bb" rel=3D"noreferrer" target=3D"_=
blank">http://coreutils_6.9.bb</a>&gt;: python should use 4 spaces indentat=
ion, but found <br>
&gt; tabs in <a href=3D"http://coreutils_6.9.bb" rel=3D"noreferrer" target=
=3D"_blank">coreutils_6.9.bb</a> &lt;<a href=3D"http://coreutils_6.9.bb" re=
l=3D"noreferrer" target=3D"_blank">http://coreutils_6.9.bb</a>&gt;, line 95=
<br>
<br>
Thanks, I&#39;ve sent a patch for it.<br>
<br>
// Robert<br>
<br>
&gt; <br>
&gt; I&#39;ve sent patch for meta-oe issue:<br>
&gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-devel/=
2018-December/197803.html" rel=3D"noreferrer" target=3D"_blank">http://list=
s.openembedded.org/pipermail/openembedded-devel/2018-December/197803.html</=
a><br>
&gt; <br>
&gt; <br>
&gt; On Fri, Nov 23, 2018 at 11:51 AM Robert Yang &lt;<a href=3D"mailto:lie=
zhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a> <br=
>
&gt; &lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_bla=
nk">liezhi.yang@windriver.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Use 4 spaces to replace a tab.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Robert Yang &lt;<a href=3D"mailto:li=
ezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.=
com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes/uboot-sign.bbclass | 16 +++++++=
+--------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 8 insertions(+), 8 deletions=
(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes/uboot-sign.bbclass b/meta=
/classes/uboot-sign.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0e5e1b1..03100b8 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/uboot-sign.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/uboot-sign.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -93,14 +93,14 @@ do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;UBOOT_=
SIGN_ENABLE&#39;) =3D=3D &#39;1&#39; and d.getVar(&#39;PN&#39;) =3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0d.getVar(&#39;UBOOT_PN&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0kernel_pn =3D d.getVar(&#39;PREFERRED_PROVIDER_virtual/kernel&#39;)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if d.getVar(&#39;UBOOT_SIGN_ENABLE&#=
39;) =3D=3D &#39;1&#39; and d.getVar(&#39;PN&#39;) =3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0d.getVar(&#39;UBOOT_PN&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_pn =3D d.getVar=
(&#39;PREFERRED_PROVIDER_virtual/kernel&#39;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# Make &quot;bitbake u-boot -cdeploy&quot; deploys the signed u-boot.=
dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0d.appendVarFlag(&#39;do_deploy&#39;, &#39;depends&#39;, &#39; %s:do_d=
eploy&#39; %<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel_pn)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Make &quot;bitbake u=
-boot -cdeploy&quot; deploys the signed u-boot.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;d=
o_deploy&#39;, &#39;depends&#39;, &#39; %s:do_deploy&#39; % kernel_pn)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# kernerl&#39;s do_deploy is a litle special, so we can&#39;t use<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# do_deploy_append, otherwise it would override<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# kernel_do_deploy.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0d.appendVarFlag(&#39;do_deploy&#39;, &#39;prefuncs&#39;, &#39; concat=
_dtb&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # kernerl&#39;s do_dep=
loy is a litle special, so we can&#39;t use<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # do_deploy_append, ot=
herwise it would override<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # kernel_do_deploy.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;d=
o_deploy&#39;, &#39;prefuncs&#39;, &#39; concat_dtb&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.7.4<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedded-core@list=
s.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.=
org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt; <br>
</blockquote></div>

--000000000000634ff9057c561958--
