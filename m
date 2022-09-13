Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B30C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 15:40:40 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.6362.1663083634044506391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 08:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ds+3xQyu;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id z12so3128112wrp.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=r/WfBXVRk24QoCsbX7Pu792CY6vfWsQmi+Qp+HQeOW8=;
        b=ds+3xQyuFSZotax8Ktta9td0JJ/eLxSigQRGBYF3fMKlal+HItWemThTR/vdsjoQ6a
         +M1oh4FDAa0l/+hS30zk4rKPg5LAOgjKksIyOZLsGc5EFWnOyDK7QxnpaEyJHVFWFgZW
         Q1u/MWaFDIer+X613OeuurylLP4t5i4w6C+veXhfRuJFoE0O4MwV2YQz6b0gGtqHXB5e
         WUCulmPmX2SwfZrpM57idaLhyk0cXF1n2/29G32ZPJ7YdGS4kcYQRdIIPFu6HPUG6qOc
         0pKKLvCsOGw7FBXVmqL3DTmddd3IeqGAa09aIUDCWmyxNWfpz67/atiA2iuUyzFmV5Be
         wIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=r/WfBXVRk24QoCsbX7Pu792CY6vfWsQmi+Qp+HQeOW8=;
        b=ivHuMr4RD2P+Ebdy5viZM3rNMIHl6AC/r3LIvzFK2YqT1meYJbhQyTdo0zRm/170wY
         g5aVbhPVPojxZmr4lBS0f4JjRDS1j2inN3us92PpdZPfzzVRL/wcn3yDYWdlkaQbM+B5
         VK0pnMSB4cnn3Mj7Fv11XvxmM9DLzWU/stnyZBiGz9eF+GneGt77NruNmV65fDxAisrs
         IUoDLRyL19PCrYn6ThFVR7wyIONXEDgSi2Olc1E7A5nM0HoEHqgkJXQxIhCenajZEwMs
         1Y9iRKz7zPARYD0nBYRpYnek9iVua8x2kVWFklAyM6hTsqcEpDDEmtDiPR2SIYJ85cT/
         s8zQ==
X-Gm-Message-State: ACgBeo2SZrSF7Sjk70qkzaeAvU1CZjhdApVNDR2oF+V/SaedHRsWOHfd
	mx74FeQwTke1yRiqeN8bOZuiX+cdRSBwWsX6kpE=
X-Google-Smtp-Source: 
 AA6agR5DDAEGO2GCSxFYN6KZx8+4iUQU9XIavnMLtNvd0wc/WSHpG4sW2DZI7lGq+6BrCfwVgnRBKBVj6QYrPtrkx8M=
X-Received: by 2002:adf:d1e1:0:b0:226:eae1:992e with SMTP id
 g1-20020adfd1e1000000b00226eae1992emr18233795wrd.548.1663083632433; Tue, 13
 Sep 2022 08:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662559557.git.steve@sakoman.com>
 <bfce90b1260d07f01a8dc2998c9e63ca36d4ebbe.1662559557.git.steve@sakoman.com>
In-Reply-To: 
 <bfce90b1260d07f01a8dc2998c9e63ca36d4ebbe.1662559557.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 13 Sep 2022 17:40:20 +0200
Message-ID: 
 <CA+chaQd2Do7wreXzMb0ysucTkSFmuYT7Mgvd=puqWZN7k73h1g@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 24/24] npm: use npm_registry to cache package
To: Steve Sakoman <steve@sakoman.com>, akuster808 <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000249d4205e890d5a2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 15:40:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170599

--000000000000249d4205e890d5a2
Content-Type: text/plain; charset="UTF-8"

FWIW: this depends on meta-oe change to add meta-oe-cache-native as
reported in:
https://github.com/openembedded/meta-openembedded/issues/606
I've sent the backport request for meta-oe/kirkstone:
https://lists.openembedded.org/g/openembedded-devel/message/98787

On Wed, Sep 7, 2022 at 4:21 PM Steve Sakoman <steve@sakoman.com> wrote:

> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>
> With nodejs 16, the simple 'npm cache add' approach does not work
> anymore because its fetcher implementation downloads also meta
> information from the registry.
>
> We have to generate these information and add them to the cache.
> There is no direct support in 'npm' for task so we have to implement
> it manually.
>
> This implementation consists of a openembedded python module (in
> oe-core) and a nodejs version specific helper (in oe-meta).
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 019b9c341d539939098962c228c1fd5c99331312)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/npm.bbclass | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 11c80a738e..8379c7b988 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -19,7 +19,7 @@
>
>  inherit python3native
>
> -DEPENDS:prepend = "nodejs-native "
> +DEPENDS:prepend = "nodejs-native nodejs-oe-cache-native "
>  RDEPENDS:${PN}:append:class-target = " nodejs"
>
>  EXTRA_OENPM = ""
> @@ -46,6 +46,7 @@ NPM_ARCH ?=
> "${@npm_target_arch_map(d.getVar("TARGET_ARCH"))}"
>  NPM_PACKAGE = "${WORKDIR}/npm-package"
>  NPM_CACHE = "${WORKDIR}/npm-cache"
>  NPM_BUILD = "${WORKDIR}/npm-build"
> +NPM_REGISTRY = "${WORKDIR}/npm-registry"
>
>  def npm_global_configs(d):
>      """Get the npm global configuration"""
> @@ -109,16 +110,18 @@ python npm_do_configure() {
>      from bb.fetch2.npm import npm_unpack
>      from bb.fetch2.npmsw import foreach_dependencies
>      from bb.progress import OutOfProgressHandler
> +    from oe.npm_registry import NpmRegistry
>
>      bb.utils.remove(d.getVar("NPM_CACHE"), recurse=True)
>      bb.utils.remove(d.getVar("NPM_PACKAGE"), recurse=True)
>
>      env = NpmEnvironment(d, configs=npm_global_configs(d))
> +    registry = NpmRegistry(d.getVar('NPM_REGISTRY'),
> d.getVar('NPM_CACHE'))
>
> -    def _npm_cache_add(tarball):
> -        """Run 'npm cache add' for a specified tarball"""
> -        cmd = "npm cache add %s" % shlex.quote(tarball)
> -        env.run(cmd)
> +    def _npm_cache_add(tarball, pkg):
> +        """Add tarball to local registry and register it in the
> +           cache"""
> +        registry.add_pkg(tarball, pkg)
>
>      def _npm_integrity(tarball):
>          """Return the npm integrity of a specified tarball"""
> @@ -182,7 +185,7 @@ python npm_do_configure() {
>              # Add the dependency to the npm cache
>              destdir = os.path.join(d.getVar("S"), destsuffix)
>              (tarball, pkg) = npm_pack(env, destdir, tmpdir)
> -            _npm_cache_add(tarball)
> +            _npm_cache_add(tarball, pkg)
>              # Add its signature to the cached shrinkwrap
>              dep = _npmsw_dependency_dict(cached_shrinkwrap, deptree)
>              dep["version"] = pkg['version']
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170419):
> https://lists.openembedded.org/g/openembedded-core/message/170419
> Mute This Topic: https://lists.openembedded.org/mt/93525927/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000249d4205e890d5a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: this depends on meta-oe change to add meta-oe-cache-=
native as reported in:<div><a href=3D"https://github.com/openembedded/meta-=
openembedded/issues/606">https://github.com/openembedded/meta-openembedded/=
issues/606</a><br></div><div>I&#39;ve sent the backport request for meta-oe=
/kirkstone:</div><div><a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/message/98787">https://lists.openembedded.org/g/openembedded-deve=
l/message/98787</a><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Sep 7, 2022 at 4:21 PM Steve Sakoman =
&lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Enrico Scho=
lz &lt;<a href=3D"mailto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank"=
>enrico.scholz@sigma-chemnitz.de</a>&gt;<br>
<br>
With nodejs 16, the simple &#39;npm cache add&#39; approach does not work<b=
r>
anymore because its fetcher implementation downloads also meta<br>
information from the registry.<br>
<br>
We have to generate these information and add them to the cache.<br>
There is no direct support in &#39;npm&#39; for task so we have to implemen=
t<br>
it manually.<br>
<br>
This implementation consists of a openembedded python module (in<br>
oe-core) and a nodejs version specific helper (in oe-meta).<br>
<br>
Signed-off-by: Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz@sigma-chem=
nitz.de" target=3D"_blank">enrico.scholz@sigma-chemnitz.de</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
(cherry picked from commit 019b9c341d539939098962c228c1fd5c99331312)<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/npm.bbclass | 15 +++++++++------<br>
=C2=A01 file changed, 9 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass<br>
index 11c80a738e..8379c7b988 100644<br>
--- a/meta/classes/npm.bbclass<br>
+++ b/meta/classes/npm.bbclass<br>
@@ -19,7 +19,7 @@<br>
<br>
=C2=A0inherit python3native<br>
<br>
-DEPENDS:prepend =3D &quot;nodejs-native &quot;<br>
+DEPENDS:prepend =3D &quot;nodejs-native nodejs-oe-cache-native &quot;<br>
=C2=A0RDEPENDS:${PN}:append:class-target =3D &quot; nodejs&quot;<br>
<br>
=C2=A0EXTRA_OENPM =3D &quot;&quot;<br>
@@ -46,6 +46,7 @@ NPM_ARCH ?=3D &quot;${@npm_target_arch_map(d.getVar(&quot=
;TARGET_ARCH&quot;))}&quot;<br>
=C2=A0NPM_PACKAGE =3D &quot;${WORKDIR}/npm-package&quot;<br>
=C2=A0NPM_CACHE =3D &quot;${WORKDIR}/npm-cache&quot;<br>
=C2=A0NPM_BUILD =3D &quot;${WORKDIR}/npm-build&quot;<br>
+NPM_REGISTRY =3D &quot;${WORKDIR}/npm-registry&quot;<br>
<br>
=C2=A0def npm_global_configs(d):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Get the npm global configuration&quot=
;&quot;&quot;<br>
@@ -109,16 +110,18 @@ python npm_do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0from bb.fetch2.npm import npm_unpack<br>
=C2=A0 =C2=A0 =C2=A0from bb.fetch2.npmsw import foreach_dependencies<br>
=C2=A0 =C2=A0 =C2=A0from bb.progress import OutOfProgressHandler<br>
+=C2=A0 =C2=A0 from oe.npm_registry import NpmRegistry<br>
<br>
=C2=A0 =C2=A0 =C2=A0bb.utils.remove(d.getVar(&quot;NPM_CACHE&quot;), recurs=
e=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0bb.utils.remove(d.getVar(&quot;NPM_PACKAGE&quot;), recu=
rse=3DTrue)<br>
<br>
=C2=A0 =C2=A0 =C2=A0env =3D NpmEnvironment(d, configs=3Dnpm_global_configs(=
d))<br>
+=C2=A0 =C2=A0 registry =3D NpmRegistry(d.getVar(&#39;NPM_REGISTRY&#39;), d=
.getVar(&#39;NPM_CACHE&#39;))<br>
<br>
-=C2=A0 =C2=A0 def _npm_cache_add(tarball):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Run &#39;npm cache add&#39; =
for a specified tarball&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;npm cache add %s&quot; % shlex.q=
uote(tarball)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env.run(cmd)<br>
+=C2=A0 =C2=A0 def _npm_cache_add(tarball, pkg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Add tarball to local registr=
y and register it in the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 registry.add_pkg(tarball, pkg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _npm_integrity(tarball):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Return the npm integrit=
y of a specified tarball&quot;&quot;&quot;<br>
@@ -182,7 +185,7 @@ python npm_do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Add the dependency to the=
 npm cache<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0destdir =3D os.path.join(d.=
getVar(&quot;S&quot;), destsuffix)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(tarball, pkg) =3D npm_pack=
(env, destdir, tmpdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _npm_cache_add(tarball)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _npm_cache_add(tarball, pkg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Add its signature to the =
cached shrinkwrap<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dep =3D _npmsw_dependency_d=
ict(cached_shrinkwrap, deptree)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dep[&quot;version&quot;] =
=3D pkg[&#39;version&#39;]<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#170419): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/170419" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/170419</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93525927/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93525927/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000249d4205e890d5a2--

