Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0C211600EB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 20:54:03 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id n11so41004645wma.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 12:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AlMOaT0ERNpBh2AG3qcOCP1uq++zusdNJ4a2Ggb1Qj8=;
	b=SeHJ0yY0ug+kp6m/HCU6bg4/ZZfBdLfcti+ZXZ6QqV+r8j+leMGT67Bg4m1TWI9Nhb
	Xb9yC4UG8Fbuv8JbehrO012Z5TDt9Bzxs4vNpqb2BwlOIBsFVMLtS8o8OB5sgnjaAIcX
	UjlYldhihgJSeP0FjHeIPvLXgB9q/Fv77mVwQkks0WQ+0UrEETtBpDvsaWDyZuWvOtDO
	fRn6g3CH5OhW0OGzDM8fTiyGGOWBrJwSuR8GYRgCUZM1P+Q8DqxE7NKTjGdBJ3Sh9Rp9
	hvq6Hbg50GqThXe/a2qvJ3JfK8R62om58sF8/jVDDOOqDtTZl3cEDFpKk9p2H6uDX0Fr
	M6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AlMOaT0ERNpBh2AG3qcOCP1uq++zusdNJ4a2Ggb1Qj8=;
	b=QpcZvmflXjbKUAs4Wd6EaEUPCquy7P6gsuxMAe3jEV4djq5KP33rUOqexWHFic4qQw
	i7hhglQHCeBjsa0o3tnsP97HgxZFdn/Id5Mx7hu69T+nZcxAN17fEc4Fw/J1eb9Z01Vh
	0ENHnPDEEkEvNaXEclwuAmYtZlx7EPsI+XYh4pbX/haURggyKt33N7K2O2dCiH8Mr6Eu
	twpqn6sY+D3zY2gPDQ45QkohexKb4RTmz6HN+CpvCPmNZOna8mfM7U7IslFUozSse2lg
	bctQc0YLzjEmot8Q6m0NPZnJsv5FVTmDi51n8HP22sPs9EY2+vpvDZlHJt+Cd6YVDU+T
	+Ssw==
X-Gm-Message-State: AMke39nP5YK314bv+9M/J4Lmh1Hzx6MkzFIU/zAH9pj7BWb1RPFVeCNxCCBT9zVQzmETBKc4IYW/CHi1wXFjAQ==
X-Received: by 10.28.186.70 with SMTP id k67mr7061517wmf.65.1489006444496;
	Wed, 08 Mar 2017 12:54:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Wed, 8 Mar 2017 12:54:04 -0800 (PST)
In-Reply-To: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
References: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 8 Mar 2017 12:54:04 -0800
Message-ID: <CAJ86T=XEAnT+ZR4b2GLE_V+vQjRoXuv7Tn0_sQ5Cv14B4PoN2Q@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Wed, 08 Mar 2017 20:54:04 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 8, 2017 at 9:25 AM, Ross Burton <ross.burton@intel.com> wrote:
> This class lets you use BBCLASSEXTEND to add a variant of the recipe that
> fetches from git instead of a tarball.

Looks good. This approach could perhaps also cover git -vs-
externalsrc variants of a recipe, which seems to be a big topic for a
lot of users.

> For example:
>
>  BBCLASSEXTEND = "gitupstream:target"
>  SRC_URI_class-gitupstream = "git://git.example.com/example"
>  SRCREV_class-gitupstream = "abcd1234"
>
> This variant will have DEFAULT_PREFERENCE set to -1 so it needs to be selected
> to be used

So if I want to select the gitupstream variant, what should I set
PREFERRED_VERSION to?

>, and any git-specific tweaks can be done with the class-gitupstream
> override, for example:
>
>  DEPENDS_append_class-gitupstream = " gperf-native"
>
>  do_configure_prepend_class-gitupstream() {
>     touch ${S}/README
>  }
>
> It currently only supports creating a git variant of the target recipe, not
> native or nativesdk.  The BBCLASSEXTEND syntax (gitupstream:target) was chosen
> so that support for native and nativesdk can be added at a later date.
>
> [ YOCTO #10215 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/gitupstream.bbclass | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta/classes/gitupstream.bbclass
>
> diff --git a/meta/classes/gitupstream.bbclass b/meta/classes/gitupstream.bbclass
> new file mode 100644
> index 0000000..405283d
> --- /dev/null
> +++ b/meta/classes/gitupstream.bbclass
> @@ -0,0 +1,25 @@
> +CLASSOVERRIDE = "class-gitupstream"
> +
> +# TODO doesn't let you gitupstream a native recipe yet
> +
> +python gitupstream_virtclass_handler () {
> +    # Do nothing if this is inherited, as it's for BBCLASSEXTEND
> +    if "gitupstream" not in (e.data.getVar('BBCLASSEXTEND', True) or ""):

What's the significance of e.data.getVar() here -vs- d.getVar() below?

(I ask because I've tried writing a few RecipePreFinalise event
handlers and they don't always work quite as expected, so maybe I've
been getting this wrong...).

> +        bb.error("Don't inherit gitupstream, use BBCLASSEXTEND")
> +        return
> +
> +    variant = d.getVar("BBEXTENDVARIANT", True)

Maybe drop the ", True" ?

> +    if variant not in ("target"):
> +        bb.error("Pass the variant when using gitupstream, for example gitupstream:target")
> +
> +    d.setVar("DEFAULT_PREFERENCE", "-1")
> +    d.setVar("S", "${WORKDIR}/git")
> +
> +    # Modify the SRCREV, if the recipe hasn't used PV_class-gitupstream to
> +    # assign a +gitX PV already.
> +    pv = d.getVar("PV", True)
> +    if "+git" not in pv:
> +        d.setVar("PV", pv + "+git${SRCPV}")
> +}
> +addhandler gitupstream_virtclass_handler
> +gitupstream_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

