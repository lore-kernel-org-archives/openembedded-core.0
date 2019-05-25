Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 99E317E430
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 15:51:56 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id g24so13694419iti.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3oP8PWoNfa56hxRXeAp7af4lJky/Za6UmkxwbjaLPTY=;
	b=CnBj5URTagclDfEcunFyeTbnt5CjbbOaPesImjRpVYrYvGRz/hb6DXcg5b5yoJs3zz
	tLiItzn05RvjDxTzPwyPIa1dkYNbF5hSNNPQhV7W5Aic/w8GaRd34UkoUd75VsoWc5aL
	Z12QZmVGaqnm3WVWvJqCm5PxO7ms5TDxeSPyNQ5CNiXKYModkRbhiq580OL5punoSzun
	YNdRIuEFiTPagmiA/tIz/t7jfd1gS/AdDRzzk+vrePHwTNmeYMYQFkD+WYhtMu03zxoN
	6/kzMs+sa+fXecai7jbhSY3XKsVQm0E7D6AKnt/NPPXY4IEuF5QsGhTB+rB/G8rLXwhc
	qQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3oP8PWoNfa56hxRXeAp7af4lJky/Za6UmkxwbjaLPTY=;
	b=tU+MsOAE17T4u07OwrieJA3IoqQYZ+XHMOAKBpaD88Wy3GU+t3xmryPQGXBkX+P1X3
	wpCj0TerNB8XA9NGnrfyhPIpjaD8s/k5iqRn3W4G3XfcpCXG/hfzHsNLW5j0oOqtzbFw
	d3K35KrgvENLOay0OExLmcdeBaFzSAMu5vNWrD5ktdAdhHnfQGQm3pqJP5tgVbk799t6
	Y533MV6QpB62Od5IllhvFsBKtUGo6tLc15vTAZXVcPy/xYXCKWxANI5gzHLH1SyH+gVn
	5r+A9xvrIAXxjXvLNkOfy2RmzM5ITVcheCnOKUtj1wZp4ez/EY5X+M/amCctFlGJv+HW
	7FbQ==
X-Gm-Message-State: APjAAAVrEbYpW1C/1TBeJT50B3SCj4rKFbeA2+Aj2/ryuw29SjgNKmO2
	U7boJ5mSuDeHBns3MuYlWz8bBhE1Tydtvv/NLS6M5A==
X-Google-Smtp-Source: APXvYqwXYuXPXc3wfxGIDw7VN1Re6p2Qa5ir5uCnlcLeyJuLEm60pfkDmcpGg5zwEPBwa7euIpnS6Q4Ua8+lgG4vFGY=
X-Received: by 2002:a24:c204:: with SMTP id i4mr22124998itg.83.1558799517225; 
	Sat, 25 May 2019 08:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190523164121.20983-1-dpfrey@gmail.com>
In-Reply-To: <20190523164121.20983-1-dpfrey@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 25 May 2019 16:51:45 +0100
Message-ID: <CAJTo0LZr5s=SFSLYBVaWWi=9u1UtjVV2UoNP1U5rNv4zE=Q1_g@mail.gmail.com>
To: David Frey <dpfrey@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bluez5: remove udev dependency
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
X-List-Received-Date: Sat, 25 May 2019 15:51:56 -0000
Content-Type: text/plain; charset="UTF-8"

The commit message and the patch disagree: you're not removing the
udev dependency but allowing the user to remove it.

A better message would be 'bluez5: allow udev dependency to be
disabled with PACKAGECONFIG'

Ross

On Thu, 23 May 2019 at 17:42, David Frey <dpfrey@gmail.com> wrote:
>
> udev is an optional dependency of bluez5, so use PACKAGECONFIG to allow
> users to decide if they want udev support.
>
> Signed-off-by: David Frey <dpfrey@gmail.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index aaf2af975d..93d1b4d8b0 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                      file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>                      file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
> -DEPENDS = "udev dbus-glib glib-2.0"
> +DEPENDS = "dbus-glib glib-2.0"
>  PROVIDES += "bluez-hcidump"
>  RPROVIDES_${PN} += "bluez-hcidump"
>
> @@ -22,6 +22,7 @@ PACKAGECONFIG ??= "obex-profiles \
>      hog-profiles \
>      tools \
>      deprecated \
> +    udev \
>  "
>  PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
>  PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
> @@ -43,6 +44,7 @@ PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
>  PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
>  PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
>  PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>
>  SRC_URI = "\
>      ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

