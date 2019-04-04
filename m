Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id 72ED07D439
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 13:42:25 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id f22so3712559ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Awl9bpU+D2H1r9FCVzD96XO5TZvOp6y4U+pa69o0FeE=;
	b=loHjwWHqcKOHB1eN1rMiJadrJBHqvk9BHb9PeJgsrusNeKpzWNrAFT23PdVSBX+eGD
	1/zwDz7mzdZqXaezgczZLjxCWxHD9qO/zbxos8BIcHIPuHCj1FuGt7f0TCcxcK6bJXHH
	XQBrF0ug/MImDG8Dhk2MysZSn1kwQVsRC8ew5agC9k616l2LTJE3bcJQlWKj09j2EURG
	v9m3ZL3gr74uXe4NyxL068I+Kgny7scccD6RVobU89rbORfXNgOShfYfZXPHGcSkqvDo
	cs0Nl6gMG8F0nsGIeDXLXv0HfRAtV7eBFucREaxNpHa5cc7mCf05W8ga3WfPkom+kpuG
	7W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Awl9bpU+D2H1r9FCVzD96XO5TZvOp6y4U+pa69o0FeE=;
	b=mWZ0gaFwd968M5wgf4vFpD/Us8RYkedX43nOK5DpVo+FqWx7lNdBoAhAmWorsQEXPM
	+Ie52yt09ZKEttxS9ObCNQ1LB9jWnKA8oQsbIgwBzWY3eIXN8sSnb3pOLIN0kPDaNTzs
	RJgVKmuPCkD6emL9wklyrMjdPg2J9TSs23ytoPDEkeM65n0V+m3E7cnWsJNNvsdj6vt0
	zWOZoBG46JyrxGvlEHi+kKQPMqeC82phGjzvtaGE7e+CyEYoKqSohMhUhy7vJzX3RW9b
	APyDZCb+ExcbAWVEQlIJ8i9YI+i0EqmmSrrwyrtILDq7Yqn1WrsPhFScaBjSmGAA8453
	C4ng==
X-Gm-Message-State: APjAAAUQOaiQHHVSOO1ML37wnukg1erqoikx92LHDixKHoDHADadaZAn
	NoxqF9YmVe4agIH2Zy6d8J/pUPFo1TtMNzXu/B0KqA==
X-Google-Smtp-Source: APXvYqy5GMUSOqSEj8E7vhGMYXKaBJ/BxRNMkyE5lXnKsg54mwW8a8Useu2XMcIcCIGJxMFiu0koyORZLd7jY2S3+9A=
X-Received: by 2002:a02:b78e:: with SMTP id f14mr4637780jam.43.1554385346364; 
	Thu, 04 Apr 2019 06:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <1554196113-200535-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1554196113-200535-1-git-send-email-changqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Apr 2019 14:42:14 +0100
Message-ID: <CAJTo0LYUXZAW7ewEa_5=3eZm-mey-vBq6vkdZ2NX8gYW4Uz4zw@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cogl: fix compile error with -Werror=maybe-uninitialized
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
X-List-Received-Date: Thu, 04 Apr 2019 13:42:25 -0000
Content-Type: text/plain; charset="UTF-8"

+Upstream-Status: Submitted
[https://github.com/GNOME/cogl/pull/4/commits/be7a7b983952d3f2ce2cbaa7b89f413b92e15066]

That's a GNOME mirror, note how your PR was closed.  GNOME is at
gitlab.gnome.org.

Ross

On Tue, 2 Apr 2019 at 10:37, <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> fix below compile error with -Werror=maybe-uninitialized
>
> | ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:217:17: error: 'gltype' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> |      *out_gltype = gltype;
> |      ~~~~~~~~~~~~^~~~~~~~
> | ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:213:22: error: 'glintformat' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> |      *out_glintformat = glintformat;
> |      ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...mpile-error-with-Werror-maybe-uninitializ.patch | 40 ++++++++++++++++++++++
>  meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb      |  4 ++-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch
>
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch b/meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch
> new file mode 100644
> index 0000000..3c99d25
> --- /dev/null
> +++ b/meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch
> @@ -0,0 +1,40 @@
> +From e05ee89fcc978fceccab3e4724a3a37f7a338499 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 2 Apr 2019 14:48:49 +0800
> +Subject: [PATCH] cogl: fix compile error with -Werror=maybe-uninitialized
> +
> +fix below compile error with -Werror=maybe-uninitialized
> +
> +| ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:217:17: error: 'gltype' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> +|      *out_gltype = gltype;
> +|      ~~~~~~~~~~~~^~~~~~~~
> +| ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:213:22: error: 'glintformat' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> +|      *out_glintformat = glintformat;
> +|      ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
> +
> +Upstream-Status: Submitted [https://github.com/GNOME/cogl/pull/4/commits/be7a7b983952d3f2ce2cbaa7b89f413b92e15066]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + cogl/driver/gl/gles/cogl-driver-gles.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/cogl/driver/gl/gles/cogl-driver-gles.c b/cogl/driver/gl/gles/cogl-driver-gles.c
> +index e94449f..a59d815 100644
> +--- a/cogl/driver/gl/gles/cogl-driver-gles.c
> ++++ b/cogl/driver/gl/gles/cogl-driver-gles.c
> +@@ -74,9 +74,9 @@ _cogl_driver_pixel_format_to_gl (CoglContext *context,
> +                                  GLenum *out_gltype)
> + {
> +   CoglPixelFormat required_format;
> +-  GLenum glintformat;
> ++  GLenum glintformat = 0;
> +   GLenum glformat = 0;
> +-  GLenum gltype;
> ++  GLenum gltype = 0;
> +
> +   required_format = format;
> +
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
> index 5901062..5ddeb4a 100644
> --- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
> +++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
> @@ -1,7 +1,9 @@
>  require cogl-1.0.inc
>
>  SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch \
> -            file://0001-Fix-an-incorrect-preprocessor-conditional.patch"
> +            file://0001-Fix-an-incorrect-preprocessor-conditional.patch \
> +            file://0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch \
> +           "
>  SRC_URI[archive.md5sum] = "d53b708ca7c4af03d7254e46945d6b33"
>  SRC_URI[archive.sha256sum] = "39a718cdb64ea45225a7e94f88dddec1869ab37a21b339ad058a9d898782c00d"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

