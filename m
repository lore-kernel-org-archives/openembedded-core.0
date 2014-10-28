Return-Path: <alexandru.damian@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC4F601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 15:42:22 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id g201so714935oib.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 08:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Iql4hcvVbQ0ugPuwCbRiMeTj8KUU4krfMWiWWZQ8TvQ=;
	b=epXVo/ZrQY5JCMSeTT+WxdtwR7HWZr2P3aksnFatrMObpBfzSkJfziDcfuVcxUVQM1
	qngbYw/fB2O1Z6dphcbU95Q8hhsi+hHZAI35VnTJFws/QdB1u4SMietZ2D2j6q2kqxWH
	zMQNkS2j0DskPFH7c0Q2DEjjzUF0MS9iNiY+YwgTeSsM/b2lcATMpH7Q1Z40P78DxmFb
	0gBWyMh9CW+MNmRFe3dN8lliFavX077l3gfBu7yrHcVmw/iCXkR+egcNhVGLxA78qI2G
	yiUPooDsK6jbCLipSE4lgOb7HoRXYj0KjFWUqvKO6KDT+liAbdwBRNLHJSuWbY/S78eD
	lMOQ==
X-Gm-Message-State: ALoCoQnS5CcFUfWzNyK+a9kt9GI8ZKDZrtnccPnimSH7a23foSq5FNlbE+da9b9EqQReEO1Xu2zp
X-Received: by 10.202.51.132 with SMTP id z126mr2974952oiz.57.1414510942953;
	Tue, 28 Oct 2014 08:42:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.134.106 with HTTP; Tue, 28 Oct 2014 08:42:02 -0700 (PDT)
In-Reply-To: <1414505359-1271-1-git-send-email-alexandru.damian@intel.com>
References: <1414505359-1271-1-git-send-email-alexandru.damian@intel.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Tue, 28 Oct 2014 15:42:02 +0000
Message-ID: <CAJ2CSBu4bGMifaXtQhgZMvr8Pp7_LiqQ1UmgONFpoJa3zzMd4Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: Re: [PATCH 01/27] toaster: add toaster layer configuration file
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
X-List-Received-Date: Tue, 28 Oct 2014 15:42:30 -0000
Content-Type: multipart/alternative; boundary=001a113cbf38496db205067d7e00

--001a113cbf38496db205067d7e00
Content-Type: text/plain; charset=UTF-8

This is just one patch, sorry about the confusing headline. It should read
[PATCH 01/01].

Alex

On Tue, Oct 28, 2014 at 2:09 PM, Alex DAMIAN <alexandru.damian@intel.com>
wrote:

> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> In managed mode, Toaster tries to discover layers
> that are being checked-out on disk.
>
> In base layers, the toasterconf.json file
> describes basic configuration file for builds based
> on that layer, like default configuration variable
> settings, toaster-compatible branches, and the
> layerindex URL where the base layer and
> compatible layers are listed.
>
> This patch adds toasterconf.json file to the oe core layer.
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  meta/conf/toasterconf.json | 71
> ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 meta/conf/toasterconf.json
>
> diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
> new file mode 100644
> index 0000000..cdc7564
> --- /dev/null
> +++ b/meta/conf/toasterconf.json
> @@ -0,0 +1,71 @@
> +{
> +    "config": {"MACHINE": "qemux86", "DISTRO": "poky"},
> +    "layersources": [
> +        {
> +            "name": "Poky",
> +            "sourcetype": 0,
> +            "apiurl": "../../",
> +            "branches": ["master"],
> +            "layers": [
> +                {
> +                    "name": "openembedded-core",
> +                    "local_path": "meta",
> +                    "vcs_url": "remote:origin",
> +                    "dirpath": "meta"
> +                },
> +                {
> +                    "name": "meta-yocto",
> +                    "local_path": "meta",
> +                    "vcs_url": "remote:origin",
> +                    "dirpath": "meta-yocto"
> +                },
> +                {
> +                    "name": "meta-yocto-bsp",
> +                    "local_path": "meta",
> +                    "vcs_url": "remote:origin",
> +                    "dirpath": "meta-yocto-bsp"
> +                }
> +
> +            ]
> +        },
> +        {
> +            "name": "OpenEmbedded",
> +            "sourcetype": 1,
> +            "apiurl": "http://layers.openembedded.org/layerindex/api/",
> +            "branches": ["master", "dizzy"]
> +        }
> +    ],
> +    "bitbake" : [
> +        {
> +            "name": "master",
> +            "giturl": "git://git.yoctoproject.org/poky.git",
> +            "branch": "dizzy",
> +            "dirpath": "bitbake"
> +        },
> +        {
> +            "name": "master",
> +            "giturl": "git://git.yoctoproject.org/poky.git",
> +            "branch": "master",
> +            "dirpath": "bitbake"
> +        }
> +    ],
> +
> +    "defaultrelease": "master",
> +
> +    "releases": [
> +        {
> +            "name": "master",
> +            "description": "Yocto Project master",
> +            "bitbake": "master",
> +            "branch": "master",
> +            "defaultlayers": [ "Poky:openembedded-core",
> "Poky:meta-yocto", "Poky:meta-yocto-bsp"]
> +        },
> +        {
> +            "name": "dizzy",
> +            "description": "Yocto Project 1.7 Dizzy",
> +            "bitbake": "master",
> +            "branch": "dizzy",
> +            "defaultlayers": [ "Poky:openembedded-core",
> "Poky:meta-yocto", "Poky:meta-yocto-bsp"]
> +        }
> +    ]
> +}
> --
> 1.9.1
>
>


-- 
Alex Damian
Yocto Project
SSG / OTC

--001a113cbf38496db205067d7e00
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">This is just one patch, sorry about the confusing headline. It s=
hould read [PATCH 01/01].<br><br>Alex<br></div></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Tue, Oct 28, 2014 at 2:09 PM, Alex D=
AMIAN <span dir=3D"ltr">&lt;<a href=3D"mailto:alexandru.damian@intel.com" t=
arget=3D"_blank">alexandru.damian@intel.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexa=
ndru.damian@intel.com">alexandru.damian@intel.com</a>&gt;<br>
<br>
In managed mode, Toaster tries to discover layers<br>
that are being checked-out on disk.<br>
<br>
In base layers, the toasterconf.json file<br>
describes basic configuration file for builds based<br>
on that layer, like default configuration variable<br>
settings, toaster-compatible branches, and the<br>
layerindex URL where the base layer and<br>
compatible layers are listed.<br>
<br>
This patch adds toasterconf.json file to the oe core layer.<br>
<br>
Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@inte=
l.com">alexandru.damian@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/toasterconf.json | 71 +++++++++++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A01 file changed, 71 insertions(+)<br>
=C2=A0create mode 100644 meta/conf/toasterconf.json<br>
<br>
diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json<br>
new file mode 100644<br>
index 0000000..cdc7564<br>
--- /dev/null<br>
+++ b/meta/conf/toasterconf.json<br>
@@ -0,0 +1,71 @@<br>
+{<br>
+=C2=A0 =C2=A0 &quot;config&quot;: {&quot;MACHINE&quot;: &quot;qemux86&quot=
;, &quot;DISTRO&quot;: &quot;poky&quot;},<br>
+=C2=A0 =C2=A0 &quot;layersources&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;Poky&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sourcetype&quot;: 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apiurl&quot;: &quot;../../=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;branches&quot;: [&quot;mas=
ter&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;layers&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;name&quot;: &quot;openembedded-core&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;local_path&quot;: &quot;meta&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;vcs_url&quot;: &quot;remote:origin&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;dirpath&quot;: &quot;meta&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;name&quot;: &quot;meta-yocto&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;local_path&quot;: &quot;meta&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;vcs_url&quot;: &quot;remote:origin&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;dirpath&quot;: &quot;meta-yocto&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;name&quot;: &quot;meta-yocto-bsp&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;local_path&quot;: &quot;meta&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;vcs_url&quot;: &quot;remote:origin&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;dirpath&quot;: &quot;meta-yocto-bsp&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;OpenEmbe=
dded&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sourcetype&quot;: 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apiurl&quot;: &quot;<a hre=
f=3D"http://layers.openembedded.org/layerindex/api/" target=3D"_blank">http=
://layers.openembedded.org/layerindex/api/</a>&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;branches&quot;: [&quot;mas=
ter&quot;, &quot;dizzy&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 &quot;bitbake&quot; : [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;master&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;giturl&quot;: &quot;git://=
<a href=3D"http://git.yoctoproject.org/poky.git" target=3D"_blank">git.yoct=
oproject.org/poky.git</a>&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;branch&quot;: &quot;dizzy&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dirpath&quot;: &quot;bitba=
ke&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;master&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;giturl&quot;: &quot;git://=
<a href=3D"http://git.yoctoproject.org/poky.git" target=3D"_blank">git.yoct=
oproject.org/poky.git</a>&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;branch&quot;: &quot;master=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dirpath&quot;: &quot;bitba=
ke&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ],<br>
+<br>
+=C2=A0 =C2=A0 &quot;defaultrelease&quot;: &quot;master&quot;,<br>
+<br>
+=C2=A0 =C2=A0 &quot;releases&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;master&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;description&quot;: &quot;Y=
octo Project master&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bitbake&quot;: &quot;maste=
r&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;branch&quot;: &quot;master=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;defaultlayers&quot;: [ &qu=
ot;Poky:openembedded-core&quot;, &quot;Poky:meta-yocto&quot;, &quot;Poky:me=
ta-yocto-bsp&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;dizzy&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;description&quot;: &quot;Y=
octo Project 1.7 Dizzy&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bitbake&quot;: &quot;maste=
r&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;branch&quot;: &quot;dizzy&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;defaultlayers&quot;: [ &qu=
ot;Poky:openembedded-core&quot;, &quot;Poky:meta-yocto&quot;, &quot;Poky:me=
ta-yocto-bsp&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ]<br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr">Alex Damian<div>Yocto Project<br></div><div>SSG / OTC=C2=A0</div><=
/div>
</div>

--001a113cbf38496db205067d7e00--
