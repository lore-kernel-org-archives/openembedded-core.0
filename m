Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id D7E5678711
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 13:32:09 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id r6so15728650itr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 05:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZWFPthiaw5p6LyYOhVfNMmeku5BrB3btipSPI+tYmGk=;
	b=vN/nQYk5JH3hujJZq7kexzmeN7EvzKl7qCO50Ii/ouxNSndpgwF4iGyXAXcQYRqImu
	4NW6en8gZ1W7d3kGd6kF6w1pIuCLTxoN6/nO8rwUyZZJr6LJzorITAjPSJno97Nwf6JV
	ySzYfanFXTIOdMJYneP2160hIVH4W9nXh38fTMa0oAm4jGPmFYJAILOg+5MGz8oYBBAk
	xMAnyM7GqjghPUCAEge53IbTwYFwqDdusUZ7wjENEZSolNXG0Sihw1Lz9mT7bew2/B80
	fczeOvs9tbXtRhSu8fvxONig5fyZ//YlnoRDewJdgfzoiIaFBB89aJw2GBeB8LANllFv
	/OqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZWFPthiaw5p6LyYOhVfNMmeku5BrB3btipSPI+tYmGk=;
	b=mBMQnjBQ1+iIzzEcDZvnAAhBtqrIEI7bHbLS55kPB06MUUKQFMphvNp3AhpcvAT/Eh
	JqDKEbBhNwtjqnedCoClPL2JiYjDF2Aajm77nToX8O0OYBGHcGMxX3lSXfyzar75Ipz+
	4RekB79ohK7FplOVw99EKHLNvjWK4xEMOVfn1kWGAxlXd2iBVlPv9JFrfs0N/3BYi9uX
	6392GD+tGgZehYTXpD08B73QtQi05v/Zy1u0dXvqiYlUMqfOdSRAoNb9YKGXSAeFv/Zu
	O+F8r76toHXwJvrsRxls9C8r2MMHr8Loo/jX5a0ac+tpFJr3CiRu4KChS01LEshFmSkF
	ehXA==
X-Gm-Message-State: AKGB3mK/CYYX9NF2UAM5troTTbhMYQhEJrLcZds21JSYDwTfjWmW3KFe
	hlROcgn9AmCGnljbEU6emkV7eVh7lfBT6vespsmjsQ==
X-Google-Smtp-Source: ACJfBosLTb1uO6n4Yut/9nzhJooRiLT9yeM/+3vupCPCUyns8ONP3bJTjqCWw3H2EHdnoY0xSTMEFiglafWYrtbZ5eQ=
X-Received: by 10.107.146.195 with SMTP id u186mr509375iod.37.1512999130765;
	Mon, 11 Dec 2017 05:32:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Mon, 11 Dec 2017 05:31:50 -0800 (PST)
In-Reply-To: <85FBA9CE-6DE1-480F-8A3F-3556868DCE2E@intel.com>
References: <1510711273-102914-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<85FBA9CE-6DE1-480F-8A3F-3556868DCE2E@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Dec 2017 13:31:50 +0000
Message-ID: <CAJTo0LYo3b6GiMLchtNJRKoRY30osdD8XL=kC5xf1KQrYQPKtQ@mail.gmail.com>
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipetool: create: fix conflict between SRCREV and tag
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
X-List-Received-Date: Mon, 11 Dec 2017 13:32:10 -0000
Content-Type: multipart/alternative; boundary="94eb2c0553b2bc32a60560108fcd"

--94eb2c0553b2bc32a60560108fcd
Content-Type: text/plain; charset="UTF-8"

I think there were selftest failures and I removed it to see what happened,
added back again now.

Ross

On 11 December 2017 at 01:10, Chang, Rebecca Swee Fun <
rebecca.swee.fun.chang@intel.com> wrote:

> Ping again.
> I noticed that it was on mut2 2 weeks ago. I think this was dropped
> somehow at that point. May I know what I can do in order to make it into M1
> cycle?
>
> Thanks,
> Rebecca
>
>
> On 15/11/2017, 10:00 AM, "openembedded-core-bounces@lists.openembedded.org
> on behalf of Chang Rebecca Swee Fun" <openembedded-core-bounces@
> lists.openembedded.org on behalf of rebecca.swee.fun.chang@intel.com>
> wrote:
>
>     If you specify 'tag=' for a git URL and passed to recipetool create,
> you
>     will get into Bitbake expansion error shown below:
>
>     ----- snip -----
>     $ devtool add --version 2.4.2 mbedtls "git://github.com/ARMmbed/
> mbedtls;tag=mbedtls-2.4.2"
>     ...
>     bb.data_smart.ExpansionError: Failure expanding variable SRCPV,
> expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception
> FetchError: Fetcher failure: Conflicting revisions (
> abeccb9dbd7e19ae91ac50e1edd3803111c5f9b6 from SRCREV and mbedtls-2.4.2
> from the url) found, please specify one valid value
>     ----- snip -----
>
>     Assuming the tag is valid, we should get the tag commit hash and
>     drop the usage of 'tag=' from SRC_URI. By using a commit hash
>     corresponding to the tag will prevent bitbake from accessing
>     remote repository in order to expand SRCPV.
>
>     Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.
> com>
>     ---
>      scripts/lib/recipetool/create.py | 8 ++++----
>      1 file changed, 4 insertions(+), 4 deletions(-)
>
>     diff --git a/scripts/lib/recipetool/create.py
> b/scripts/lib/recipetool/create.py
>     index 54e7e85..2fc9e0a 100644
>     --- a/scripts/lib/recipetool/create.py
>     +++ b/scripts/lib/recipetool/create.py
>     @@ -480,7 +480,6 @@ def create_recipe(args):
>              if tag:
>                  # Keep a copy of tag and append nobranch=1 then remove
> tag from URL.
>                  # Bitbake fetcher unable to fetch when {AUTOREV} and tag
> is set at the same time.
>     -            # We will re-introduce tag argument after bitbake fetcher
> process is complete.
>                  storeTagName = params['tag']
>                  params['nobranch'] = '1'
>                  del params['tag']
>     @@ -552,13 +551,11 @@ def create_recipe(args):
>
>              # Since we might have a value in srcbranch, we need to
>              # recontruct the srcuri to include 'branch' in params.
>     +        scheme, network, path, user, passwd, params =
> bb.fetch2.decodeurl(srcuri)
>              if srcbranch:
>     -            scheme, network, path, user, passwd, params =
> bb.fetch2.decodeurl(srcuri)
>                  params['branch'] = srcbranch
>     -            srcuri = bb.fetch2.encodeurl((scheme, network, path,
> user, passwd, params))
>
>              if storeTagName and scheme in ['git', 'gitsm']:
>     -            # Re-introduced tag variable from storeTagName
>                  # Check srcrev using tag and check validity of the tag
>                  cmd = ('git rev-parse --verify %s' % (storeTagName))
>                  try:
>     @@ -568,6 +565,9 @@ def create_recipe(args):
>                      logger.error(str(err))
>                      logger.error("Possibly wrong tag name is provided")
>                      sys.exit(1)
>     +            # Drop tag from srcuri as it will have conflicts with
> SRCREV during recipe parse.
>     +            del params['tag']
>     +        srcuri = bb.fetch2.encodeurl((scheme, network, path, user,
> passwd, params))
>
>              if os.path.exists(os.path.join(srctree, '.gitmodules')) and
> srcuri.startswith('git://'):
>                  srcuri = 'gitsm://' + srcuri[6:]
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0553b2bc32a60560108fcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think there were selftest failures and I removed it to s=
ee what happened, added back again now.<div><br></div><div>Ross</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 11 December 20=
17 at 01:10, Chang, Rebecca Swee Fun <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:rebecca.swee.fun.chang@intel.com" target=3D"_blank">rebecca.swee.fun.chan=
g@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping ag=
ain.<br>
I noticed that it was on mut2 2 weeks ago. I think this was dropped somehow=
 at that point. May I know what I can do in order to make it into M1 cycle?=
<br>
<br>
Thanks,<br>
Rebecca<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 15/11/2017, 10:00 AM, &quot;<a href=3D"mailto:openembedded-core-bounces@=
lists.openembedded.org">openembedded-core-bounces@<wbr>lists.openembedded.o=
rg</a> on behalf of Chang Rebecca Swee Fun&quot; &lt;<a href=3D"mailto:open=
embedded-core-bounces@lists.openembedded.org">openembedded-core-bounces@<wb=
r>lists.openembedded.org</a> on behalf of <a href=3D"mailto:rebecca.swee.fu=
n.chang@intel.com">rebecca.swee.fun.chang@intel.<wbr>com</a>&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 If you specify &#39;tag=3D&#39; for a git URL and passed to r=
ecipetool create, you<br>
=C2=A0 =C2=A0 will get into Bitbake expansion error shown below:<br>
<br>
=C2=A0 =C2=A0 ----- snip -----<br>
=C2=A0 =C2=A0 $ devtool add --version 2.4.2 mbedtls &quot;git://<a href=3D"=
http://github.com/ARMmbed/mbedtls;tag=3Dmbedtls-2.4.2" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/ARMmbed/<wbr>mbedtls;tag=3Dmbedtls-2.4.2</a>&qu=
ot;<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 bb.data_smart.ExpansionError: Failure expanding variable SRCP=
V, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception Fet=
chError: Fetcher failure: Conflicting revisions (<wbr>abeccb9dbd7e19ae91ac5=
0e1edd380<wbr>3111c5f9b6 from SRCREV and mbedtls-2.4.2 from the url) found,=
 please specify one valid value<br>
=C2=A0 =C2=A0 ----- snip -----<br>
<br>
=C2=A0 =C2=A0 Assuming the tag is valid, we should get the tag commit hash =
and<br>
=C2=A0 =C2=A0 drop the usage of &#39;tag=3D&#39; from SRC_URI. By using a c=
ommit hash<br>
=C2=A0 =C2=A0 corresponding to the tag will prevent bitbake from accessing<=
br>
=C2=A0 =C2=A0 remote repository in order to expand SRCPV.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Chang Rebecca Swee Fun &lt;<a href=3D"mailto:r=
ebecca.swee.fun.chang@intel.com">rebecca.swee.fun.chang@intel.<wbr>com</a>&=
gt;<br>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0scripts/lib/recipetool/create.<wbr>py | 8 ++++----<br>
=C2=A0 =C2=A0 =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
=C2=A0 =C2=A0 diff --git a/scripts/lib/recipetool/<wbr>create.py b/scripts/=
lib/recipetool/<wbr>create.py<br>
=C2=A0 =C2=A0 index 54e7e85..2fc9e0a 100644<br>
=C2=A0 =C2=A0 --- a/scripts/lib/recipetool/<wbr>create.py<br>
=C2=A0 =C2=A0 +++ b/scripts/lib/recipetool/<wbr>create.py<br>
=C2=A0 =C2=A0 @@ -480,7 +480,6 @@ def create_recipe(args):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if tag:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Keep a copy=
 of tag and append nobranch=3D1 then remove tag from URL.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Bitbake fet=
cher unable to fetch when {AUTOREV} and tag is set at the same time.<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We will re-intro=
duce tag argument after bitbake fetcher process is complete.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0storeTagName =
=3D params[&#39;tag&#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params[&#39;n=
obranch&#39;] =3D &#39;1&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0del params[&#=
39;tag&#39;]<br>
=C2=A0 =C2=A0 @@ -552,13 +551,11 @@ def create_recipe(args):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Since we might have a val=
ue in srcbranch, we need to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# recontruct the srcuri to =
include &#39;branch&#39; in params.<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 scheme, network, path, user, pas=
swd, params =3D bb.fetch2.decodeurl(srcuri)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if srcbranch:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scheme, network, p=
ath, user, passwd, params =3D bb.fetch2.decodeurl(srcuri)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params[&#39;b=
ranch&#39;] =3D srcbranch<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcuri =3D bb.fetc=
h2.encodeurl((scheme, network, path, user, passwd, params))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if storeTagName and scheme =
in [&#39;git&#39;, &#39;gitsm&#39;]:<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Re-introduced ta=
g variable from storeTagName<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check srcre=
v using tag and check validity of the tag<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D (&#39=
;git rev-parse --verify %s&#39; % (storeTagName))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 @@ -568,6 +565,9 @@ def create_recipe(args):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0logger.error(str(err))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0logger.error(&quot;Possibly wrong tag name is provided&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sys.exit(1)<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Drop tag from sr=
curi as it will have conflicts with SRCREV during recipe parse.<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del params[&#39;ta=
g&#39;]<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcuri =3D bb.fetch2.encodeurl((=
scheme, network, path, user, passwd, params))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(os.path.j=
oin(<wbr>srctree, &#39;.gitmodules&#39;)) and srcuri.startswith(&#39;git://=
&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcuri =3D &#=
39;gitsm://&#39; + srcuri[6:]<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 2.7.4<br>
<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 ______________________________<wbr>_________________<br>
=C2=A0 =C2=A0 Openembedded-core mailing list<br>
=C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.<wbr>openembedded.org</a><br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c0553b2bc32a60560108fcd--
