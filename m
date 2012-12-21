Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm1Mz-000881-4K
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:06:29 +0100
Received: from mail-gh0-f199.google.com ([209.85.160.199])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 03:51:42 -0800
Received: by mail-gh0-f199.google.com with SMTP id r16so2457772ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 03:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=+PIqA3llySMe3QnnK/dICKbGhP4ovLngHYvP2F94yco=;
	b=oWREDL4jJPvjLLvghhs0INCGl1XkIBojyhI58t/xB1GtngGAF0uGkXl+mX8ylPUYbF
	leE7ontwC3c25SaFYDoHbHnG4OoJb4OyjO+MBKRcYgzKxig4Z9ZmSRB5ZQZQ748Wcnd/
	Fq4LiasC6UJdYuvSPUN+JyKcMZJPANVGjE3nY/pdPLnZNPOCqMq5ON9mARSF1NksRRyu
	IY1jkMG58dAKvaLK+ggBXCUZZt51+RE2WdmFxDZX2GM9boVX13Dg5gGj2+ac2ROdTFZW
	+YN+2GBOFe1AL5mC2sJczuGE9gXEMhb6VZZLeUbA8Ccpqepfk18nabDFQ1i25cdWcQp3
	BB1A==
X-Received: by 10.52.70.46 with SMTP id j14mr16698722vdu.99.1356090701670;
	Fri, 21 Dec 2012 03:51:41 -0800 (PST)
Received: by 10.52.70.46 with SMTP id j14mr16698715vdu.99.1356090701587; Fri,
	21 Dec 2012 03:51:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 03:51:21 -0800 (PST)
In-Reply-To: <44b5cd3486d37209bdebc0f1e278059e5694e306.1356089735.git.alexandru.damian@intel.com>
References: <cover.1356089735.git.alexandru.damian@intel.com>
	<44b5cd3486d37209bdebc0f1e278059e5694e306.1356089735.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 11:51:21 +0000
Message-ID: <CAJTo0LaOCgoKWZjmgMwW9fgOrG0hKmnu5py9skbUyvHqnUXjNA@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQljRTzx+JRxtjez0CymQS6lWJoDvHBcIO/gH+EJt5Ev/xZ3x6s66ovQpjwuC5BZ8C7K27BBug5Azvgtr9m9iAu5/V7huXReTkHTm+z5SWK2qRqZbxTXIgaajLOi79vPwhzklu5W0rnzyvW0sFco05GhX7MfXeb1ucOYr0VbKhMmAe2nDJ2CE0aKVgH9p+AKSGe2H2Ds
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] Prepare mesa-dri for weston compatibility
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
X-List-Received-Date: Fri, 21 Dec 2012 12:06:29 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2012 11:38, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This patch enables mesa-git to build wayland-compatible
> packages for usage with weston.
>
> It adds wayland platform support, packs the wayland-egl
> files, and sets the -git version as preffered provider.

This message isn't right anymore.

> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa-common.inc |   13 ++++++++++---
>  meta/recipes-graphics/mesa/mesa-dri.inc    |    1 +
>  2 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
> index 70957eb..65f70e7 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -12,13 +12,12 @@ SECTION = "x11"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
>
> -INC_PR = "r9"
> +INC_PR = "r10"
>  PE = "2"

No need to fiddle PR in oe-core.

>  DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
>
>  PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
> -

Please restore this whitespace.

Ross


