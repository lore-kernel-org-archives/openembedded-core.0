Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id A30AC65D51
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 07:47:22 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id lf12so452232vcb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 00:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5ws2kH6VtbhJl4wKL5X4Y+HlmghEwdei9SmVsB2cDpA=;
	b=1F1VtYBBJJFdfrcH0OQU6PR0Dh8Ki/p69wNKBGwxLSj3Wo0VMsj9Pzjzbkvfqz8q2e
	5T2WiFpOQCB4Lq8hJfFaGIs1vDtz47e7j5Q3MObIgYM05nk8AxWmY1EKqxJz+LfaAoU7
	+2BPJPGqkwZqJP6Kg+WI7xsgjzNDRsoCzVtBD2YThlkIpPv1ucTrhvzw4mZxpBpxvZMM
	FqFcluLnG8b07maLJJcUfhoc+xuKAFPhJsC9uqLz6n4t1u+LQE8ky/kKmWn8oV0Ep5Py
	9Av3cbTNC2LtaB2ui7xLspttjKW3pJV0ptQP3MpJxXdAAMh2comY71Tp3bKctfRCuauL
	pPlQ==
MIME-Version: 1.0
X-Received: by 10.220.12.66 with SMTP id w2mr1856735vcw.15.1396943243501; Tue,
	08 Apr 2014 00:47:23 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Tue, 8 Apr 2014 00:47:23 -0700 (PDT)
In-Reply-To: <1396362098-14134-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396362098-14134-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 8 Apr 2014 09:47:23 +0200
Message-ID: <CALbNGRRm0JJ2Eq43V5kS2uHehoMWTFiSSbeBGxWav1XyLhmj_g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: make x11-base a valid image feature
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
X-List-Received-Date: Tue, 08 Apr 2014 07:47:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2014 at 4:21 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> make
>
> commit 049f89155b1e80875aad6e53b21808b827c06915
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Fri Dec 20 10:45:52 2013 +0800
>
>     image.bbclass: add ability to set systemd default target
>
>     Add ability to set the default target for systemd images.
>
>     The default target for system is controlled by SYSTEMD_DEFAULT_TARGET=
.
>     The default value for this variable is derived from checking whether
>     IMAGE_FEATURES contains 'x11-base' or not. Each image could override
>     this value in its own recipe. For now, we don't need to do any change=
,
>     because all images that support graphical environment has 'x11-base'
>     in its IMAGE_FEATURES.
>
>     [YOCTO #3816]
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>     Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
> work for users wanting graphical target. Fixes
>
> ERROR: 'x11-base' in IMAGE_FEATURES is not a valid image feature. Valid f=
eatures: dbg-pkgs debug-tweaks dev-pkgs doc doc-pkgs package-management pte=
st-pkgs qtcreator-debug read-only-rootfs splash staticdev-pkgs
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/classes/image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 29309f5..35e8d3b 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -22,7 +22,7 @@ inherit ${TESTIMAGECLASS}
>  # IMAGE_FEATURES may contain any available package group
>  IMAGE_FEATURES ?=3D ""
>  IMAGE_FEATURES[type] =3D "list"
> -IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs"
> +IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs x11-base"
>
>  # rootfs bootstrap install
>  ROOTFS_BOOTSTRAP_INSTALL =3D "${@base_contains("IMAGE_FEATURES", "packag=
e-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
> --
> 1.8.3.1
>

ping

Andreas

