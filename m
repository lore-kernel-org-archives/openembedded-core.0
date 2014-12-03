Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0990B7226C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 16:25:30 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id a108so11184742qge.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 08:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Gc/3TCdChnI+jCm9tPyy5zqobjXZ4YoFOWYgA3zCRqo=;
	b=GnBSH9dRbhP2f6JJ2IJroKbZta463ZVg1SFsZcoJhpH2FUipyFB8oBTxvAxLDAfFEV
	mWAMjAycrCnNL4hEpClZOXuK0z8D1SV2n4FyM2tv0/QYxDGWBvvayI28DxU7h/cJOiWy
	hXdyXSzaWxrbj83pP8rYL8MrEbJWL0TWq7P2sGc82W5ksmgMYrypWGZfT3clPLCUv0uZ
	bPSd932TjYNAH5TrEuOqzottkkTUA6zftLmXRH0CgBk3782SuRd3d6ORZzRgXbZcgArs
	rnaEhhktjNrfZ0PvP3nooWfDtUgTtL17rWlTT79LmQsM8Q+YR90v92XriZYhlN/C1NmA
	xYew==
X-Gm-Message-State: ALoCoQkGWqolyhKP/AMmwqtzeF4eIyeKNcE/YmmXwfQjgTanaeBZXsDGKVQebiabZ896WFhO8sEg
X-Received: by 10.229.252.201 with SMTP id mx9mr9147433qcb.4.1417623931143;
	Wed, 03 Dec 2014 08:25:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 3 Dec 2014 08:25:10 -0800 (PST)
In-Reply-To: <a2191d9a3fd6dae80094288cafe95c1ef2ded30f.1417552133.git.sgw@linux.intel.com>
References: <cover.1417552133.git.sgw@linux.intel.com>
	<a2191d9a3fd6dae80094288cafe95c1ef2ded30f.1417552133.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 16:25:10 +0000
Message-ID: <CAJTo0LZvBRNAx-sN0xVOY6o3kc8REkzVi8B6BNcjBgm6=T6VMw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gnupg: Upgrade to 2.1.0
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
X-List-Received-Date: Wed, 03 Dec 2014 16:25:36 -0000
Content-Type: multipart/alternative; boundary=001a11c2ef94d760b30509524af5

--001a11c2ef94d760b30509524af5
Content-Type: text/plain; charset=UTF-8

On 3 December 2014 at 01:18, Saul Wold <sgw@linux.intel.com> wrote:

> Add patch to use pkg-config instead of npth-config and remove
> --without-curl as it's not used anymore.
>
> Also needed a patch to add libgpg-error to correctly build dirmngr
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
> meta/recipes-support/gnupg
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>

Super-signed-off-by? :)

Ross

--001a11c2ef94d760b30509524af5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 December 2014 at 01:18, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":8n8" class=3D"a3s" =
style=3D"overflow:hidden">Add patch to use pkg-config instead of npth-confi=
g and remove<br>
--without-curl as it&#39;s not used anymore.<br>
<br>
Also needed a patch to add libgpg-error to correctly build dirmngr<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>
<br>
meta/recipes-support/gnupg<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;</div></blockquote></div><br></div><div class=3D"gmail_=
extra">Super-signed-off-by? :)</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a11c2ef94d760b30509524af5--
