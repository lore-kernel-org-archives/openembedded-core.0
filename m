Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id E53A86E593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 16:16:19 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id e89so13546522qgf.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 08:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VVzqHwnczr0IMXoq3OLn+PQcintOPWWJTC9uhdmGMVI=;
	b=imRTHQhbKJ/uRiyF6gmlO2Qi1CoPIAxmyvng40j/hAfbomWQGvTwYPbPIF3Ls/brOP
	j+z/EvG8s7sA3Iysk9CWQASH62z/SBPoV9n6NrMFheMo6xCpBpbcNdX8oKa8NIrZQdYK
	0c7+WRb/fgRIiph9njWX289mpLRAqMqYOwur//LBDAOZxXIgJb7O9bpBGvJY3Nv/fLV2
	APrsl66YqQxaBI+c09/OQWVUZbHzNbTpMbLOd21PR5kXVCK6b8weJtuafBpT2Kbjv/jv
	WzN57aLXrrb3v9korjtmGLl+Ib9FziqmlGMxT07j0csnuUXuu3TeMmtiRz0W1hDrav8r
	P1+Q==
X-Gm-Message-State: ALoCoQnjrpuL7zgRfwOcG+7NtezH+fGuoAFVZZNX605VF4LhCqcnfW0lRWlzpwVPvqS353M32QYW
X-Received: by 10.224.16.207 with SMTP id p15mr22132698qaa.22.1423584980631;
	Tue, 10 Feb 2015 08:16:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 10 Feb 2015 08:16:00 -0800 (PST)
In-Reply-To: <1423584126-27786-1-git-send-email-denis@denix.org>
References: <1423584126-27786-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Feb 2015 16:16:00 +0000
Message-ID: <CAJTo0LZHiTSkhv9YPobmssY_szH4jyzBeUXVyZnnTGYo5oAf4Q@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Tue, 10 Feb 2015 16:16:21 -0000
Content-Type: multipart/alternative; boundary=047d7bf166201410ea050ebe357d

--047d7bf166201410ea050ebe357d
Content-Type: text/plain; charset=UTF-8

Hi Denys,

On 10 February 2015 at 16:02, Denys Dmytriyenko <denis@denix.org> wrote:

> +DEPENDS = "openssl"
> +DEPENDS_class-native = "openssl-native"
>

That *really* shouldn't be required. :(

And indeed, the old patch with -e shows that it isn't:

# $DEPENDS [6 operations]
#   set /home/ross/Yocto/poky/meta/conf/bitbake.conf:246
#     ""
#   set /home/ross/Yocto/poky/meta/conf/documentation.conf:135
#     [doc] "Lists a recipe's build-time dependencies (i.e. other recipe
files)."
#   _prepend /home/ross/Yocto/poky/meta/classes/base.bbclass:81
#     "${BASEDEPENDS} "
#   set /home/ross/Yocto/poky/meta/recipes-bsp/u-boot/
u-boot-mkimage_2015.01.bb:6
#     "openssl"
#   set native_virtclass_handler(e):27 [map_dependencies]
#     "openssl-native"
#   set data_smart.py:437 [finalize]
#     "${BASEDEPENDS} openssl-native"
# pre-expansion value:
#   "${BASEDEPENDS} openssl-native"
DEPENDS=" openssl-native"

This is *very* strange.  When the AB is free I'll do another rebuild to see
what happens under load.  Was the DEPENDS_class-native change the only
difference between v1 and v2?

Ross

--047d7bf166201410ea050ebe357d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Denys,</div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 10 February 2015 at 16:02, Den=
ys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org" tar=
get=3D"_blank">denis@denix.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<div style=3D"overflow:hidden">+DEPENDS =3D &quot;openssl&quot;<br>
+DEPENDS_class-native =3D &quot;openssl-native&quot;</div></blockquote></di=
v><br>That *really* shouldn&#39;t be required. :(</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">And indeed, the old patch with =
-e shows that it isn&#39;t:</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra"><div class=3D"gmail_extra"># $DEPENDS [6 operations]<=
/div><div class=3D"gmail_extra"># =C2=A0 set /home/ross/Yocto/poky/meta/con=
f/bitbake.conf:246</div><div class=3D"gmail_extra"># =C2=A0 =C2=A0 &quot;&q=
uot;</div><div class=3D"gmail_extra"># =C2=A0 set /home/ross/Yocto/poky/met=
a/conf/documentation.conf:135</div><div class=3D"gmail_extra"># =C2=A0 =C2=
=A0 [doc] &quot;Lists a recipe&#39;s build-time dependencies (i.e. other re=
cipe files).&quot;</div><div class=3D"gmail_extra"># =C2=A0 _prepend /home/=
ross/Yocto/poky/meta/classes/base.bbclass:81</div><div class=3D"gmail_extra=
"># =C2=A0 =C2=A0 &quot;${BASEDEPENDS} &quot;</div><div class=3D"gmail_extr=
a"># =C2=A0 set /home/ross/Yocto/poky/meta/recipes-bsp/u-boot/<a href=3D"ht=
tp://u-boot-mkimage_2015.01.bb:6">u-boot-mkimage_2015.01.bb:6</a></div><div=
 class=3D"gmail_extra"># =C2=A0 =C2=A0 &quot;openssl&quot;</div><div class=
=3D"gmail_extra"># =C2=A0 set native_virtclass_handler(e):27 [map_dependenc=
ies]</div><div class=3D"gmail_extra"># =C2=A0 =C2=A0 &quot;openssl-native&q=
uot;</div><div class=3D"gmail_extra"># =C2=A0 set data_smart.py:437 [finali=
ze]</div><div class=3D"gmail_extra"># =C2=A0 =C2=A0 &quot;${BASEDEPENDS} op=
enssl-native&quot;</div><div class=3D"gmail_extra"># pre-expansion value:</=
div><div class=3D"gmail_extra"># =C2=A0 &quot;${BASEDEPENDS} openssl-native=
&quot;</div><div class=3D"gmail_extra">DEPENDS=3D&quot; openssl-native&quot=
;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">This=
 is *very* strange.=C2=A0 When the AB is free I&#39;ll do another rebuild t=
o see what happens under load.=C2=A0 Was the DEPENDS_class-native change th=
e only difference between v1 and v2?</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div></div>

--047d7bf166201410ea050ebe357d--
