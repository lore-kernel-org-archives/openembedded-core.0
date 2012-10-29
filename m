Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TSni5-0005fL-UU
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 12:40:50 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 29 Oct 2012 04:27:14 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so14528059obb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 04:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=2xmw543xHThUho+IyZU0ZC8NBmwE5pyjvTBKpohSHO8=;
	b=pX0z1Ef6XzpjIQH6efmCcLbcqcnCSao9ZcoaDKHhu3lKPgy/NBsYdODnr2DvLvyQrE
	G70m7C5CfXqaIBn6bJu+EYxHIAARLxuTSi7y2SqhWpcbmG0otJPxkP7aSPydW80UCt4z
	roOgsoKO4gCO8XU1xca/W/vU8bUisuKYY1VP3J3eoiVwbIthsOqD0D0VO67zxn+vSIA+
	pL/grbFJ6p3+79Lc+chXUOxRcEvK2imn3GP9M8gECkLem0Ot7mBYDF5wqWV7WY6zRm0a
	YZqlmMXevCNkYPYyDiDIqNOmkwC8drBdmJlHvZbEErbegIVAHwIxtH/Ylrsd9YWN/ElE
	d2+w==
Received: by 10.60.31.199 with SMTP id c7mr15790816oei.126.1351510033458;
	Mon, 29 Oct 2012 04:27:13 -0700 (PDT)
Received: by 10.60.31.199 with SMTP id c7mr15790813oei.126.1351510033401; Mon,
	29 Oct 2012 04:27:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Mon, 29 Oct 2012 04:26:53 -0700 (PDT)
In-Reply-To: <1351509628-12898-1-git-send-email-ross.burton@intel.com>
References: <1351509628-12898-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Oct 2012 11:26:53 +0000
Message-ID: <CAJTo0LZ-+o18QSpgqu+EzYAEnRWaXW_pU6uqKGyXJZ_ONuCK3g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQnSaaRd66/rijRWRzzSGgLLikxhImJuu13shsv0joQ8icNAtaEsIC0yhMN3PDROJOH/7Tc7EdxwRDEDUv7HS6R5GnQxu2scMu4ffVWutuFr1Q7SY44USc8Cy5UXe6H6E/F42hFgcA+waE4z+Q9y8GB7uTcCZH6k7y3pUX6qV4Fo/6DjiNclcRCxUhNJhOTu6JTHdDIT
Subject: Re: [PATCH] clutter-box2d: add missing glib-2.0 build dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2012 11:40:50 -0000
Content-Type: text/plain; charset=UTF-8

Ignore this, brainfart.  Something to do with being up at 0430 probably...

Ross

On 29 October 2012 11:20, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/clutter/clutter-box2d_git.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> index d256a28..86e0711 100644
> --- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> +++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> @@ -4,11 +4,11 @@ LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6
>
>  SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
>  PV = "0.12.1+git${SRCPV}"
> -PR = "r1"
> +PR = "r2"
>
>  SRC_URI = "git://git.gnome.org/clutter-box2d.git"
>
>  S = "${WORKDIR}/git"
>
> -DEPENDS += "clutter-1.8"
> +DEPENDS += "glib-2.0 clutter-1.8"
>  PROVIDES = "clutter-box2d-1.6"
> --
> 1.7.10
>


