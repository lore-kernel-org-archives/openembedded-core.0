Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 060C965CBF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 10:12:51 +0000 (UTC)
Received: by qgeg89 with SMTP id g89so44368425qge.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 03:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EDV59XRUYhN6Y9YZj5W55W7EujPUQb9vpicerbEn9Vo=;
	b=PPbKAW5GvKA0xuNuUjwzTFg/4r2+KyMG/xgQ4yiYd9vZQcnt/GyEyiw30UN9C02TEz
	0+VIzLhCz+0+C/BbrwtKGW0EXkALhH4mj+jBTMv3HM54xuOUKZCTRkyixa64gauiTJoQ
	wvuOTt5A5iqII/9NQo+eOFR0hKsVUACQKU4DtrPkhbjJeXfx6ftxU+DE/jEy+f7xmXYZ
	oninh1VoPFdUqzDHEACckp9JF7cPfPldY8BDiMEmZZkVfFgKpygFH9GiVNijDdZFMWhn
	2p7/vtxM/50+hankLUVplMNPIJ5LWdePSfKqPFF6JARvVv6Ww1nriwiwJrxsh3vuCyHa
	VavA==
X-Gm-Message-State: ALoCoQkdQXRdGeIqjaWhGvFNWOMVPG39uLL53eCQ49PJaZti+tk7lEP+wRo42uaECCm9IXkttXuf
X-Received: by 10.140.235.19 with SMTP id g19mr52205272qhc.52.1435918370725;
	Fri, 03 Jul 2015 03:12:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 3 Jul 2015 03:12:31 -0700 (PDT)
In-Reply-To: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A858@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836@deeres07.ebgroup.elektrobit.com>
	<CAHiDW_FZoQudwPMdV-zTF-SZ2OVoAjNXuoYY8vUTkSQfoMXDtQ@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364939A858@deeres07.ebgroup.elektrobit.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Jul 2015 11:12:31 +0100
Message-ID: <CAJTo0LaTPtegrTJMA6nmsNwhY96ckVGO0QWBojF7_a1A=2Y-dQ@mail.gmail.com>
To: Steffen.Pankratz@elektrobit.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Upgrade to 2.4.62
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
X-List-Received-Date: Fri, 03 Jul 2015 10:12:54 -0000
Content-Type: multipart/alternative; boundary=001a11376dac69f5420519f5ccb1

--001a11376dac69f5420519f5ccb1
Content-Type: text/plain; charset=UTF-8

On 3 July 2015 at 09:30, <Steffen.Pankratz@elektrobit.com> wrote:

> +# Valgrind support is enabled by default currently
> +# already fixed upstream:
> http://cgit.freedesktop.org/mesa/drm/commit/?id=676c806d0221a7ea375676b2eab514c426fcacd3
> +EXTRA_OECONF += "--disable-valgrind"
>

No need for this comment.  We'd need the --disable-valgrind when that
commit is in a release as then libdrm will enable/disable valgrind support
depending on the sysroot, and non-determinism is bad.

(To avoid a cycle I'll pull this into staging but delete the comment)

Ross

--001a11376dac69f5420519f5ccb1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 July 2015 at 09:30,  <span dir=3D"ltr">&lt;<a href=3D"mailto:Steffen.P=
ankratz@elektrobit.com" target=3D"_blank">Steffen.Pankratz@elektrobit.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":bo" clas=
s=3D"a3s" style=3D"overflow:hidden">+# Valgrind support is enabled by defau=
lt currently<br>
+# already fixed upstream: <a href=3D"http://cgit.freedesktop.org/mesa/drm/=
commit/?id=3D676c806d0221a7ea375676b2eab514c426fcacd3" rel=3D"noreferrer" t=
arget=3D"_blank">http://cgit.freedesktop.org/mesa/drm/commit/?id=3D676c806d=
0221a7ea375676b2eab514c426fcacd3</a><br>
+EXTRA_OECONF +=3D &quot;--disable-valgrind&quot;</div></blockquote></div><=
br>No need for this comment.=C2=A0 We&#39;d need the --disable-valgrind whe=
n that commit is in a release as then libdrm will enable/disable valgrind s=
upport depending on the sysroot, and non-determinism is bad.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(To avoid a cycle I&=
#39;ll pull this into staging but delete the comment)</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11376dac69f5420519f5ccb1--
