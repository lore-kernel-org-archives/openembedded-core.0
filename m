Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id AB47A606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 14:15:09 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id i133so371007vka.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Sv3vi8fDut7BPSEGqyhWsZ+c7NpAJkTzLkj/xpWD7CE=;
	b=od/6NQch+fR62K0LMPV/NvrwwL3n1T+MGfsIcOFZfHC1RjKDdlrw/OMRzIksQ8aWjA
	dqEbc7fuiIJLkac61ungwkQa7sUuggpmkM5RbtsZT36mrU3gA0UsQK2m6yx8wnZWqDQu
	lEpXp/pnuypCCBp2v3hveSDz0hJxksCs0HeGMZa7NzrHexwxsh7B0gxgqypDjb59BAUq
	vZkUr0P87+IRA8VRKBC2Vwzu1NCAy0/J3w5uOKU220zUQy5lmWwRIeAFqf6fnjNzLWkV
	3Lbb1sZqczP0B1j2wx00/35pH5FGA3s0wr/pzzaB7JVBdoLBJmFGSHgMAyLskF30wkOQ
	p/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Sv3vi8fDut7BPSEGqyhWsZ+c7NpAJkTzLkj/xpWD7CE=;
	b=AjkJ+MArCVLKY4NK9whyNSA1UIQxE0pr/ZoHIg3334lb1WQ5Ei+CE258Ixq2JowoWs
	/SQdWHF7/WTp/DUJNZsHIi9Lpa+jUV8DecxEeoFlUxM/ErpQjg5NM0py689frSIMNPgL
	PLltCWGrdw6tUJhkl3AHsXvPNjzlmG08fvX4sUyQI15qnl+u6mnOFW/YM6Y6+Dkoc43/
	TZNbRXFm10JgM6zc90oQ2LiWFhlH0xPxTQiCKWY/kbAg/UNGC/PN7KpRb3r4rjfi7+g2
	xO6woyASlkhctoK4iP4V1g4WVrPgCqvdJmn6ILLgfRjgUOdo6a2FGW+18XOps8d6EKWb
	Ctjw==
X-Gm-Message-State: AHYfb5imDMqoZ1OiM+z0QfKiMSOV+ZXShU6T9n9BwXPz6QIvYWe3My18
	6P4MTqb+YIEQxLMRZR7qqsYKt+ROIw==
X-Received: by 10.31.13.78 with SMTP id 75mr16767625vkn.121.1502806509479;
	Tue, 15 Aug 2017 07:15:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.84.146 with HTTP; Tue, 15 Aug 2017 07:14:49 -0700 (PDT)
In-Reply-To: <1502785464-89944-3-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1502785464-89944-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1502785464-89944-3-git-send-email-rebecca.swee.fun.chang@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 15 Aug 2017 07:14:49 -0700
Message-ID: <CABcZANmZTFM4V86SS-tgoCFrpPG83ik-3G3y_yhkAYm=bG6Kkw@mail.gmail.com>
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] recipetool: create: handle git URLs specifying only a tag
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
X-List-Received-Date: Tue, 15 Aug 2017 14:15:09 -0000
Content-Type: multipart/alternative; boundary="001a11440f4429ed4c0556cb6803"

--001a11440f4429ed4c0556cb6803
Content-Type: text/plain; charset="UTF-8"

rev-parse is a better bet than rev-list for ref validation, IMO.

On Tue, Aug 15, 2017 at 1:24 AM, Chang Rebecca Swee Fun <
rebecca.swee.fun.chang@intel.com> wrote:

> From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
>
> If a git URL is passed to recipetool create with a tag=, recipetool
> should handle it assuming that the tag is valid.
>
> [YOCTO #11393]
>
> Signed-off-by: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
> ---
>  scripts/lib/recipetool/create.py | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/
> create.py
> index d2e6fc0..52c10e5 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -423,6 +423,7 @@ def create_recipe(args):
>      srcsubdir = ''
>      srcrev = '${AUTOREV}'
>      srcbranch = ''
> +    storeTagName = ''
>
>      if os.path.isfile(source):
>          source = 'file://%s' % os.path.abspath(source)
> @@ -446,13 +447,21 @@ def create_recipe(args):
>          scheme, network, path, user, passwd, params =
> bb.fetch2.decodeurl(fetchuri)
>          srcbranch = params.get('branch')
>          nobranch = params.get('nobranch')
> +        tag = params.get('tag')
>          if not srcbranch and not nobranch and srcrev != '${AUTOREV}':
>              # Append nobranch=1 in the following conditions:
>              # 1. User did not set 'branch=' in srcuri, and
>              # 2. User did not set 'nobranch=1' in srcuri, and
>              # 3. Source revision is not '${AUTOREV}'
>              params['nobranch'] = '1'
> -            fetchuri = bb.fetch2.encodeurl((scheme, network, path, user,
> passwd, params))
> +        if tag:
> +            # Keep a copy of tag and append nobranch=1 then remove tag
> from URL.
> +            # Bitbake fetcher unable to fetch when {AUTOREV} and tag is
> set at the same time.
> +            # We will re-introduce tag argument after bitbake fetcher
> process is complete.
> +            storeTagName = params['tag']
> +            params['nobranch'] = '1'
> +            del params['tag']
> +        fetchuri = bb.fetch2.encodeurl((scheme, network, path, user,
> passwd, params))
>
>          tmpparent = tinfoil.config_data.getVar('BASE_WORKDIR')
>          bb.utils.mkdirhier(tmpparent)
> @@ -523,6 +532,18 @@ def create_recipe(args):
>              params['branch'] = srcbranch
>              srcuri = bb.fetch2.encodeurl((scheme, network, path, user,
> passwd, params))
>
> +        if storeTagName:
> +            # Re-introduced tag variable from storeTagName
> +            # Check srcrev using tag and check validity of the tag
> +            try:
> +                cmd = ('git rev-list -n 1 %s' % (storeTagName))
> +                check_tag, check_tag_err = bb.process.run('%s' % cmd,
> cwd=srctree)
> +                srcrev = check_tag.split()[0]
> +            except bb.process.ExecutionError as err:
> +                logger.error(str(err))
> +                logger.error("Possibly wrong tag name is provided")
> +                sys.exit(1)
> +
>          if os.path.exists(os.path.join(srctree, '.gitmodules')) and
> srcuri.startswith('git://'):
>              srcuri = 'gitsm://' + srcuri[6:]
>              logger.info('Fetching submodules...')
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a11440f4429ed4c0556cb6803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">rev-parse is a better bet than rev-list for ref validation=
, IMO.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tu=
e, Aug 15, 2017 at 1:24 AM, Chang Rebecca Swee Fun <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:rebecca.swee.fun.chang@intel.com" target=3D"_blank">rebecca=
.swee.fun.chang@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">From: Stanley Phoong &lt;<a href=3D"mailto:stanley.cheong.kwan.phoon=
g@intel.com">stanley.cheong.kwan.phoong@<wbr>intel.com</a>&gt;<br>
<br>
If a git URL is passed to recipetool create with a tag=3D, recipetool<br>
should handle it assuming that the tag is valid.<br>
<br>
[YOCTO #11393]<br>
<br>
Signed-off-by: Stanley Phoong &lt;<a href=3D"mailto:stanley.cheong.kwan.pho=
ong@intel.com">stanley.cheong.kwan.phoong@<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/recipetool/create.<wbr>py | 23 ++++++++++++++++++++++-<br=
>
=C2=A01 file changed, 22 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/lib/recipetool/<wbr>create.py b/scripts/lib/recipetool=
/<wbr>create.py<br>
index d2e6fc0..52c10e5 100644<br>
--- a/scripts/lib/recipetool/<wbr>create.py<br>
+++ b/scripts/lib/recipetool/<wbr>create.py<br>
@@ -423,6 +423,7 @@ def create_recipe(args):<br>
=C2=A0 =C2=A0 =C2=A0srcsubdir =3D &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0srcrev =3D &#39;${AUTOREV}&#39;<br>
=C2=A0 =C2=A0 =C2=A0srcbranch =3D &#39;&#39;<br>
+=C2=A0 =C2=A0 storeTagName =3D &#39;&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if os.path.isfile(source):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source =3D &#39;file://%s&#39; % os.path.=
abspath(source)<br>
@@ -446,13 +447,21 @@ def create_recipe(args):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scheme, network, path, user, passwd, para=
ms =3D bb.fetch2.decodeurl(fetchuri)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcbranch =3D params.get(&#39;branch&#39;=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nobranch =3D params.get(&#39;nobranch&#39=
;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tag =3D params.get(&#39;tag&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not srcbranch and not nobranch and src=
rev !=3D &#39;${AUTOREV}&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Append nobranch=3D1 in th=
e following conditions:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# 1. User did not set &#39;=
branch=3D&#39; in srcuri, and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# 2. User did not set &#39;=
nobranch=3D1&#39; in srcuri, and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# 3. Source revision is not=
 &#39;${AUTOREV}&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params[&#39;nobranch&#39;] =
=3D &#39;1&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetchuri =3D bb.fetch2.encodeurl=
((scheme, network, path, user, passwd, params))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if tag:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Keep a copy of tag and append =
nobranch=3D1 then remove tag from URL.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Bitbake fetcher unable to fetc=
h when {AUTOREV} and tag is set at the same time.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We will re-introduce tag argum=
ent after bitbake fetcher process is complete.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 storeTagName =3D params[&#39;tag=
&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params[&#39;nobranch&#39;] =3D &=
#39;1&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del params[&#39;tag&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fetchuri =3D bb.fetch2.encodeurl((scheme, netw=
ork, path, user, passwd, params))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpparent =3D tinfoil.config_data.getVar(=
&#39;<wbr>BASE_WORKDIR&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(tmpparent)<br>
@@ -523,6 +532,18 @@ def create_recipe(args):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params[&#39;branch&#39;] =
=3D srcbranch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcuri =3D bb.fetch2.encode=
url((scheme, network, path, user, passwd, params))<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if storeTagName:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Re-introduced tag variable fro=
m storeTagName<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check srcrev using tag and che=
ck validity of the tag<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D (&#39;git =
rev-list -n 1 %s&#39; % (storeTagName))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check_tag, check_t=
ag_err =3D bb.process.run(&#39;%s&#39; % cmd, cwd=3Dsrctree)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcrev =3D check_t=
ag.split()[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except bb.process.ExecutionError=
 as err:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(str(e=
rr))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&quot=
;Possibly wrong tag name is provided&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(os.path.join(<wbr>srctr=
ee, &#39;.gitmodules&#39;)) and srcuri.startswith(&#39;git://&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcuri =3D &#39;gitsm://&#3=
9; + srcuri[6:]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.in=
fo" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Fetching subm=
odules...&#39;)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engin=
eer, Mentor Graphics</div></div></div></div>
</div>

--001a11440f4429ed4c0556cb6803--
