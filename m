Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 067D3606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 12:23:37 +0000 (UTC)
Received: by obbeb7 with SMTP id eb7so102181659obb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 05:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0xc5O5rzLN6+Iy/kNgl7+4fs4+Ys4Emi4FgLy307Qw0=;
	b=M5ZUywp1XrpDXefsYd0DRtFioZX+j+Kj/+72hNc7Zx3fNCZSnC0QdzCieGa7Ockda8
	PtwPPADp+ZJ0r9y6ZB/xgnHHxuq4r81Mmkoj8YbbrlO+RsVmfr9v2r7OIsbqoTxbg4xv
	6Ryrg9Wqt51K3Ujj59UwnQtFyEBzPrcCIjExc+T44c3JMP+peukbYcARaT7l94xUutPz
	iORL+yt8TTLlvJSX6hZatTDlHxO8A5XxGb/l3swvd2WuLmSfMKdmDZoADbPECSN2WKoD
	DXLrrXVXGq1nMWDG7gpn6Py36hOZCH0do01TnQtLkg9a5+U50zCBVk/JNiDzYRn4iP89
	/w0w==
X-Gm-Message-State: ALoCoQlaDaAP+2AJOKnKYYU6HCI/2enMH2n5l80K+nKTWWYKMbLM5WmimB945jYNvOu7JUn2ounf
X-Received: by 10.60.46.66 with SMTP id t2mr37708452oem.60.1428582218353; Thu,
	09 Apr 2015 05:23:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.92.139 with HTTP; Thu, 9 Apr 2015 05:23:08 -0700 (PDT)
In-Reply-To: <6cb3f4e0e51908d8c57b74330f0fa6bcbf2cbb03.1428577515.git.jussi.kukkonen@intel.com>
References: <cover.1428577515.git.jussi.kukkonen@intel.com>
	<6cb3f4e0e51908d8c57b74330f0fa6bcbf2cbb03.1428577515.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 9 Apr 2015 15:23:08 +0300
Message-ID: <CAHiDW_GB6HEXJvAVgmSjKPyUTT9uhDOzjTEJ9yP2dGJbNAyYKw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] libepoxy: Add as GTK+ 3.16 requirement
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
X-List-Received-Date: Thu, 09 Apr 2015 12:23:39 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2015 at 15:16, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> Libepoxy is a OpenGL function pointer management library required by
> GTK 3.16.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-graphics/libepoxy/libepoxy_1.2.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
>
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
> new file mode 100644
> index 0000000..4357331
> --- /dev/null
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "OpenGL function pointer management library"
> +HOMEPAGE = "https://github.com/anholt/libepoxy/"
> +SECTION = "libs"
> +
> +LICENSE = "MIT"

Something I forgot from the cover letter: epoxy is covered by two
different licenses (see
https://github.com/anholt/libepoxy/blob/master/COPYING) and while both
look exactly like MIT to me (the Khronos one just replaces "Software"
with "Materials"), I thought it's appropriate to mention... Do I need
to add another license variant or do something else?


> +LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
> +
> +
> +SRC_URI = "git://github.com/anholt/libepoxy.git"
> +SRCREV="7422de5b4be7b19d789136b3bb5f932de42db27c"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS = "util-macros"
> --
> 2.1.4
>

