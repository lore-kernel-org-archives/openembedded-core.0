Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Se0tK-0000vq-Bw
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 11:26:30 +0200
Received: by ghbz2 with SMTP id z2so2144471ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 02:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=PYcD4MmhvAv1uJ0xbscm4biBvRKCc6N65/BEbe6Tn54=;
	b=hMqIWcyzqrl8+hGwAfbU0xnNvTkgnQsvi2cEE+1x4hw8eOP67rF6eVPec2oXYMeD/B
	6mupst2rh0I8NcGus3byl5pEfeWFbvmWVbIn99hO4yvBoGBKEKuudxYCoEgqVyEHzVUI
	IEkWoUfECeRn5k00elmnXAaoQJ0WSHJlWtZaE6tlNaiNDRxPE6OXB2sFbtMoPpk7wnnU
	irHSghdQJHQ7AxA2qHRUg9UfGrt0xRxSZ7k94Dy9ONbrZy+pphQHnX3Is3yzpHN17idw
	AlGmFKd7V+Ep7mSccv92UcrqRWMXAW6YxNr+7aTd9cVu/lcXDohJYvNLFiWrAzdSYlM+
	eNeA==
Received: by 10.50.135.1 with SMTP id po1mr5768088igb.67.1339406156525; Mon,
	11 Jun 2012 02:15:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.162.166 with HTTP; Mon, 11 Jun 2012 02:15:35 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <de4d8424907e977a377790243abb15f509fab4e5.1339163939.git.tom.zanussi@intel.com>
References: <cover.1339163939.git.tom.zanussi@intel.com>
	<de4d8424907e977a377790243abb15f509fab4e5.1339163939.git.tom.zanussi@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 11 Jun 2012 12:15:35 +0300
Message-ID: <CAK18fxFMFhBJUtm-F4p54wL2M3+n83kWVP47qQbA2NQGCaQXoA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm+hLKhJcZoRrMxaB766Nni/w0EwCFz/sBF1dAppCdEqyKSOnHuj0NQESDyxzOBrwo6I2dC
Subject: Re: [PATCH 1/1] linux-yocto/3.2: fix meta SRCREV typo
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
X-List-Received-Date: Mon, 11 Jun 2012 09:26:30 -0000
Content-Type: multipart/alternative; boundary=e89a8f6432c22b71a804c22eccb2

--e89a8f6432c22b71a804c22eccb2
Content-Type: text/plain; charset=ISO-8859-1

Please merge this minor but important fix.


On Fri, Jun 8, 2012 at 5:03 PM, <tom.zanussi@intel.com> wrote:

> From: Tom Zanussi <tom.zanussi@intel.com>
>
> Remove a stray character at the end of the meta SRCREV.
>
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_3.2.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bbb/meta/recipes-kernel/linux/
> linux-yocto_3.2.bb
> index 85c0096..e6cf9bb 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> @@ -16,7 +16,7 @@ SRCREV_machine_qemuppc ?=
> "1396a8f7b62f8926dc1fa474c7d94ae920d81852"
>  SRCREV_machine_qemux86 ?= "9d32bb075e349cc69c7af42b60f6715c5d8c972e"
>  SRCREV_machine_qemux86-64 ?= "dd488f551fa0f8e3bf1aadd78083b8547bba8bdf"
>  SRCREV_machine ?= "76133a1cadf0de417c29ed15d6fbb12c41c0802b"
> -SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654l"
> +SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
>
>  PR = "r1"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f6432c22b71a804c22eccb2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Please merge this minor but important fix.<br>
<br><br><div class=3D"gmail_quote">On Fri, Jun 8, 2012 at 5:03 PM,  <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:tom.zanussi@intel.com" target=3D"_blank">t=
om.zanussi@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">

From: Tom Zanussi &lt;<a href=3D"mailto:tom.zanussi@intel.com">tom.zanussi@=
intel.com</a>&gt;<br>
<br>
Remove a stray character at the end of the meta SRCREV.<br>
<br>
Signed-off-by: Tom Zanussi &lt;<a href=3D"mailto:tom.zanussi@intel.com">tom=
.zanussi@intel.com</a>&gt;<br>
---<br>
=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_3.2.bb" target=
=3D"_blank">linux-yocto_3.2.bb</a> | =A0 =A02 +-<br>
=A01 files changed, 1 insertions(+), 1 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_3.2.bb=
" target=3D"_blank">linux-yocto_3.2.bb</a> b/meta/recipes-kernel/linux/<a h=
ref=3D"http://linux-yocto_3.2.bb" target=3D"_blank">linux-yocto_3.2.bb</a><=
br>


index 85c0096..e6cf9bb 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_3.2.bb" targe=
t=3D"_blank">linux-yocto_3.2.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_3.2.bb" targe=
t=3D"_blank">linux-yocto_3.2.bb</a><br>
@@ -16,7 +16,7 @@ SRCREV_machine_qemuppc ?=3D &quot;1396a8f7b62f8926dc1fa47=
4c7d94ae920d81852&quot;<br>
=A0SRCREV_machine_qemux86 ?=3D &quot;9d32bb075e349cc69c7af42b60f6715c5d8c97=
2e&quot;<br>
=A0SRCREV_machine_qemux86-64 ?=3D &quot;dd488f551fa0f8e3bf1aadd78083b8547bb=
a8bdf&quot;<br>
=A0SRCREV_machine ?=3D &quot;76133a1cadf0de417c29ed15d6fbb12c41c0802b&quot;=
<br>
-SRCREV_meta ?=3D &quot;ee78519365bdb25287703bbc31c06b193263c654l&quot;<br>
+SRCREV_meta ?=3D &quot;ee78519365bdb25287703bbc31c06b193263c654&quot;<br>
<br>
=A0PR =3D &quot;r1&quot;<br>
=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.0.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br>

--e89a8f6432c22b71a804c22eccb2--
