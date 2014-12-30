Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8FF6017E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 19:00:10 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id uz6so45835064obc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 11:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6IHMYGXuUXCKpAUg3aHdgLbwkguXhAB4n5z+wZ19rF4=;
	b=D817O4M6v8AiFjYRJTyz2WHJ1EoYPRABBHDhFR/zjvqudDxoiQgCRixo/prgAqe4my
	q1uweFT1NNSJ+E1JE5B8AzTz93NYj0vkJSBah+5xp+NORa3O++hIAPY3M9HL9fcz5EkY
	oF/Wmr5i7xPZifIXPW4RG5k9tlDxQlJ3ymM8WUQT4WpKpGBvACvDN6FBM45bLaRqrH5e
	e7pCe+i1Asrtd7gnYfnNXkZWBDllh7lTkv7J+TXmUxIf2B7xr3loWjpKrD6EA4TzTVq2
	foRN8CCwDuq+gB+pUcdr7MaiGvtpS5JmGcOD1jDyJMFDwRuHprEz3/6XptLBKokaQAAT
	2F5w==
X-Gm-Message-State: ALoCoQldfvh7RjKC84aSV84XbJoh8uSIbe9yPNah7fp03TUXWyxoVxdj6bmMgK2D0DFTXRfN/ZlP
X-Received: by 10.182.22.198 with SMTP id g6mr4878815obf.16.1419966011530;
	Tue, 30 Dec 2014 11:00:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.79.1 with HTTP; Tue, 30 Dec 2014 10:59:51 -0800 (PST)
In-Reply-To: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
References: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 30 Dec 2014 19:59:51 +0100
Message-ID: <CAP71WjzcSN6yuA6-1UwH=z+8KAHFFZfKTuTU5=Oi552aPUFf4g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] gstreamer1.0: upgrade to 1.4.5
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
X-List-Received-Date: Tue, 30 Dec 2014 19:00:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 30, 2014 at 7:03 PM, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../gstreamer/{gstreamer1.0_1.4.1.bb => gstreamer1.0_1.4.5.bb}    |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.4.1.bb => gstreamer1.0_1.4.5.bb} (72%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
> similarity index 72%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.1.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
> index 56fc4f2..94be846 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
> @@ -7,7 +7,8 @@ SRC_URI = " \
>      http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
>      file://0001-Fix-crash-with-gst-inspect.patch \
>  "
> -SRC_URI[md5sum] = "bd0938d680d657249b885162f310702d"
> -SRC_URI[sha256sum] = "5638f75003282135815c0077d491da11e9a884ad91d4ba6ab3cc78bae0fb452e"
> +SRC_URI[md5sum] = "88a9289c64a4950ebb4f544980234289"
> +SRC_URI[sha256sum] = "40801aa7f979024526258a0e94707ba42b8ab6f7d2206e56adbc4433155cb0ae"
> +
>  S = "${WORKDIR}/gstreamer-${PV}"

thanks.. you beat me at sending the patches on the list... i have been
testing a similar patchset locally today.

i have reviewed all your patches, and look the same as mine.

however you are adding extra empty lines in the first 6 patches in the
series. was is intentionally done?

cheers

