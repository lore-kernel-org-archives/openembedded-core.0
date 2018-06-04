Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id D9AA9753BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 19:16:23 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id x4-v6so3810555vkx.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=GCyFF6X4TutCISN1lMAvCypMzq5t8rQx/WC9HORSKrA=;
	b=fYwpfF/NkcLIBLbY5VNPNbEiFfxptSPce7UKG/ZM+geuZo+o9k512QA6lgsYtu5TqS
	JHWpGr1oGthcC0Ds6EcIkae0XlcBWdU0IjCCpmrlz3tH3ghbWmEWa5XPmsSAfyio+jS0
	gQ4M/8CWW4zDmG1OHE5OMuN5HEx4CIZqtNiF0WucR8QUYVvN5nR1lTxG+wIdcWSmHzyT
	Vr91TztDPrjxwmUpduyFiiGmLxqiaxQ2MR3U5NBTP5s9upD70jvt/IdTCS0oa2VyPC4E
	QjphicwEuFx4G6jRiXuH9qquyt5Dbp30tAxaLrDOecH6cu88RSUAHfl4AcH+rIH30z1c
	t+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=GCyFF6X4TutCISN1lMAvCypMzq5t8rQx/WC9HORSKrA=;
	b=VhGaQSXYmT26jcCBFP0JxYD46Em0hP5YfdT6HtP+Rd9wB9sPLX9OqQlF3fIGfPl8Ej
	ZX4tUt/CZtzDCPqNUxYININRoNv4OzJ9iWA/jvs8eNKsOYFraXiuMDuTSyXTf5C0Jb4e
	0CS1o8fnjWD/E+vMUyobuL5qKK9KyAxRD/K3ZygYXNfPWBmVnqhG012N6GZ0meG3Du35
	2wZjOA6Y/6kBMXRbgw6ly4ja6ROjUshAhqcb5+06U0TZyokXRZ1D26k1wJcJIDaz2Z4M
	/6QygIaUTSAudGtKdHkYZaFencC9PUcCt6AbIMn/Xf0vOXkQYSCnm2YyoU1gVgH42auq
	S+CQ==
X-Gm-Message-State: ALKqPwcewpw5SzqOxmHIohcsqwYxKGdSTsPTWNR07zrX02gsZFO/szrE
	DAssnk2svBwfG20wKIN6iDRM6mtxX89+sINzGxA=
X-Google-Smtp-Source: ADUXVKIU+7FWjTSXBHga4v67Np7WKilTLUR8KlPcVp7a8ebWSAhrHBkyWgA0/sM9gGBU0ubi4NS+y/G/SsPayL+oY74=
X-Received: by 2002:a1f:9615:: with SMTP id
	y21-v6mr13932517vkd.154.1528139784451; 
	Mon, 04 Jun 2018 12:16:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 12:16:23 -0700 (PDT)
In-Reply-To: <1527627535-317-1-git-send-email-armccurdy@gmail.com>
References: <1527627535-317-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 4 Jun 2018 12:16:23 -0700
Message-ID: <CAJ86T=VeP3pym7kyPnGvag0R=okZ=Z6iLFXy0wQJHm=GmcY08A@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] dropbear: drop obsolete patch 0004-fix-2kb-keys.patch
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
X-List-Received-Date: Mon, 04 Jun 2018 19:16:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 1:58 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> The origins of the patch date back to early 2005 (prior to the start
> of git history in oe-core) to fix a hardcoded limit on the maximum
> size of remote host keys:
>
>   http://familiar.handhelds.narkive.com/b1VGg2bI/problem-w-dropbear-ssh
>
> The hardcoded limit was fixed upstream in dropbear 0.47:
>
>   https://github.com/mkj/dropbear/commit/736f370dce614b717193f45d084e9e009de723ce
>
> The patch has therefore been obsolete since then. It went unnoticed
> until now as the patch has continued to apply - it modifies a value
> which is not used.

Ping.

Does the commit message now have enough detail?

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/dropbear/dropbear.inc               |  1 -
>  .../dropbear/dropbear/0004-fix-2kb-keys.patch         | 19 -------------------
>  2 files changed, 20 deletions(-)
>  delete mode 100644 meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
>
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index 16ac644..a5dcab8 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -14,7 +14,6 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
>  SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
>             file://0001-urandom-xauth-changes-to-options.h.patch \
> -           file://0004-fix-2kb-keys.patch \
>             file://0007-fix-localoptions-search-path.patch \
>             file://init \
>             file://dropbearkey.service \
> diff --git a/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch b/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
> deleted file mode 100644
> index 60c6a29..0000000
> --- a/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Subject: [PATCH 4/6] fix 2kb keys
> -
> -Upstream-Status: Inappropriate [configuration]
> ----
> - kex.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: dropbear-2017.75/kex.h
> -===================================================================
> ---- dropbear-2017.75.orig/kex.h
> -+++ dropbear-2017.75/kex.h
> -@@ -106,6 +106,6 @@ int curve25519_donna(unsigned char *out,
> - #endif
> -
> -
> --#define MAX_KEXHASHBUF 2000
> -+#define MAX_KEXHASHBUF 3000
> -
> - #endif /* DROPBEAR_KEX_H_ */
> --
> 1.9.1
>

