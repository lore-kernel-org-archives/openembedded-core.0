Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id A650F60273
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 18:10:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2018 10:10:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,366,1539673200"; d="scan'208";a="119038621"
Received: from jlowis-mobl.amr.corp.intel.com ([10.251.128.106])
	by orsmga002.jf.intel.com with ESMTP; 17 Dec 2018 10:10:09 -0800
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <20181217180651.16040-1-jed.openxt@gmail.com>
Date: Mon, 17 Dec 2018 10:10:09 -0800
Message-Id: <18DA3CB1-CC7C-4EB3-A52D-333508FC5779@linux.intel.com>
References: <20181217180651.16040-1-jed.openxt@gmail.com>
To: Jed <jed.openxt@gmail.com>
X-Mailer: Apple Mail (2.3445.102.3)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk3: enable wayland banckend
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
X-List-Received-Date: Mon, 17 Dec 2018 18:10:08 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Dec 17, 2018, at 10:06 AM, Jed <jed.openxt@gmail.com> wrote:
>=20
> It is disabled by default, and required for things like mutter to
> be able to run under Wayland.
>=20
> Signed-off-by: Jed <jed.openxt@gmail.com>
> ---
> meta/recipes-gnome/gtk+/gtk+3.inc | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc =
b/meta/recipes-gnome/gtk+/gtk+3.inc
> index 6331a4323c..83967ccb7e 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -35,6 +35,7 @@ EXTRA_OECONF +=3D " \
>                  --enable-modules \
>                  --disable-cups \
>                  --disable-colord \
> +                 --enable-wayland-backend \

Wouldn=E2=80=99t it be better to check that DISTRO_FEATURES contains =
wayland and then enable it?

>                  ${@bb.utils.contains("DISTRO_FEATURES", "x11", "", =
"--disable-gtk-doc", d)} \
>                  "
>=20
> --=20
> 2.11.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


