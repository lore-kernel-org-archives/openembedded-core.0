Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1StHnM-0004Le-Ls
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 14:31:28 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 23 Jul 2012 05:20:00 -0700
Received: by obbuo19 with SMTP id uo19so8201386obb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 05:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=dFWIZjzpSKxnhCnogXuMb2oBMdEukHwn52Cm2rkCh74=;
	b=Wol6WXnhv8MjBGsmUyDl5F7byimw7GIlRu2lHloILrU3i3OtsjVZ+90GjZ+0hQOBct
	vpiqK2yt4NXvMIMDsPuZE6tIz9MWx+sOD7/9sBAEsT0cutQoMV4S1ATZ40xJZUU87lgp
	LBvSueDL0tmhvnqPrfpCBcpIpXoifOmbOETdO1y18wM0jYd4yZds78kvtO+/A2JdIygd
	s2uRhBeSN+jsRlW2GVP7V+xYxws4slDArWJ63OSLoikuKEIu/VIGHAPXrpvz2fYDigaJ
	YXBk5s/iVQju5QgKRcxmT+MRN9cHO6kS5EPLLoU7uyQGnMDdkwzyYqCUTDMDTYQGdsOr
	lX+A==
Received: by 10.182.146.84 with SMTP id ta20mr20560241obb.19.1343045999870;
	Mon, 23 Jul 2012 05:19:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.33.4 with HTTP; Mon, 23 Jul 2012 05:19:39 -0700 (PDT)
In-Reply-To: <20120723113034.GD3271@jama.jama.net>
References: <20120722104320.C057610218@opal>
	<20120723081543.GA3271@jama.jama.net>
	<CAJTo0LYK43FiO-iJ3wQf3Dsid14ckSkW9cAGhKtBUV8sDACd2Q@mail.gmail.com>
	<20120723091809.GC3271@jama.jama.net>
	<CAJTo0LbGnXz1UeVv6etPOsTVpi_mtFhBNLSDHeKK1Ci10zKOwg@mail.gmail.com>
	<20120723113034.GD3271@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jul 2012 13:19:39 +0100
Message-ID: <CAJTo0LYZ+mc=xnYDgzi4i3POveZe3s1Z46ME=wb+MHYsBYmJjg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlDdkyl+icrolSHOI8lmIY6qvftxqRgUkkk4LRG4jpAPcY2Qj+pCvOuO+yD/11WAcK0LLAR
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : Add gtk-doc-stub
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
X-List-Received-Date: Mon, 23 Jul 2012 12:31:28 -0000
Content-Type: text/plain; charset=UTF-8

On 23 July 2012 12:30, Martin Jansa <martin.jansa@gmail.com> wrote:
> That's probably because of one of those:
> OE @ ~/meta-openembedded $ git grep DEPENDS.*gtk-doc
> meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb:DEPENDS = "libgnomecanvas libbonobo libgnome glib-2.0 gtk-doc gconf libxml2 libglade"
> meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb:DEPENDS = "libidl popt gtk-doc ${IDL_COMPILER_DEPENDS}"
> meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb:DEPENDS_virtclass-native = "libidl-native popt-native gtk-doc-native"
> meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb:DEPENDS = "gtk+ cairo libxinerama libxcomposite libxrender gtk-doc"

They are all wrong.  You'll never DEPEND on gtk-doc, it's a build tool
so you'll DEPEND on gtk-doc-native (indirectly, inherit gtkdoc
instead) and maybe (say a build tools metapackage) RDEPEND on gtk-doc.

Ross


