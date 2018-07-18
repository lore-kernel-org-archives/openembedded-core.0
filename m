Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 795B174FE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 23:48:00 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id x24-v6so4042541ual.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 16:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ecaM0xzpEebbLWdYbG1qbpcVEHqhTmi2jir9zPbyZZ8=;
	b=udf8JJbxUWVfuPFOfa2DED7VylWEb/YAiryjZh5imkDYwrb5iqVQbPioH3F6h5etYX
	GCELz4KvJdW7aLbGWCzA8Qv2cnHOwekfHb5MSoMIGLr9nrb6lalmMvYAR91dYnQU1eEM
	JpNBIEXuOMgOWgPG6w+rdEZMWqybO9pUbpY9N9jrSnSCvt0hpo2nWdCUWBt/++pwFw4o
	pI5Ewy4jOH+nn4pRQgOKQffB8svt3CtJsgfOfNBvoqRw1N/11FksVMQPlfKS5NsyrZ57
	ZOv8qE7uLmx6j7oNuV1UsDRt9Rpqi6JHV/DrwFJUcCXE0e9FJL9ol/z0ubqdyWhhcPfI
	btMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ecaM0xzpEebbLWdYbG1qbpcVEHqhTmi2jir9zPbyZZ8=;
	b=HMt9YkwLeu71tN3RiimCKT+e/XuT8XGTorxjolocPIqblhnz5sn9bydL3Q76MzL6WV
	w+phloNixu2piyypGqu/Iw9YLYU0e8PbYHxP6za9UA62cxY7W95acOvxhGl4lKbnoamB
	mYU9yCRN2PamW82+AxYhf/ipTd56+0lo4wpdc1zjRv2Jxd7WUrCrrFtp+QzWCHRoTNym
	Z3Mdnzi89SZXFsj0+9Da4YRFuKYJL5HJ3mYR82G+BVwiCYzEFUmy9YV8hbrZ+1CLGzwq
	yRizZFnKigUwgXDDVALhIKC1EceZHHXAiB4aMsYgbthJTPcObsh9Fi8fOC9xRx/NDOuE
	bQzQ==
X-Gm-Message-State: AOUpUlEQWNux+BzFhGmSNxYoavq7j4iUr2Wo/WIurigQsg31g/j58CRf
	0vuH+YhW/BWB/61VqHDrG8/Yg4ugAtgzrN5c5Sc=
X-Google-Smtp-Source: AAOMgpc8/Iu58Mn8rt1mlhvPfZFVFaDc8JyEfRUfet49d+hwffDSx6A3tGKHF9tznxbjmEwVh1guIS4FHc6ghgsC73g=
X-Received: by 2002:ab0:e3:: with SMTP id 90-v6mr4986314uaj.52.1531957681193; 
	Wed, 18 Jul 2018 16:48:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Wed, 18 Jul 2018 16:48:00 -0700 (PDT)
In-Reply-To: <20180718225304.28673-1-alistair.francis@wdc.com>
References: <20180718225304.28673-1-alistair.francis@wdc.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 18 Jul 2018 16:48:00 -0700
Message-ID: <CAJ86T=XuEUrsb8gZAXmh3m+sXFpU2T=bXqNRhjLYUNCH9DNtDg@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: Allow custom coredump config options
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
X-List-Received-Date: Wed, 18 Jul 2018 23:48:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 18, 2018 at 3:53 PM, Alistair Francis
<alistair.francis@wdc.com> wrote:
> If the user has enabled coredump let's allow them to customise the
> config options.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-core/systemd/systemd_239.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
> index 7822548993..a625d060a9 100644
> --- a/meta/recipes-core/systemd/systemd_239.bb
> +++ b/meta/recipes-core/systemd/systemd_239.bb
> @@ -279,6 +279,18 @@ do_install() {
>                         chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>                 fi
>         fi
> +
> +  # If coredump was enabled, enable it in the config.
> +  # This just sets the default, but can be used to customise the values.
> +  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false', d)}; then
> +    sed 's|#Storage.*|Storage=external|g' -i ${D}${sysconfdir}/systemd/coredump.conf
> +    sed 's|#Compress.*|Compress=yes|g' -i ${D}${sysconfdir}/systemd/coredump.conf
> +    sed 's|#ProcessSizeMax.*|ProcessSizeMax=2G|g' -i ${D}${sysconfdir}/systemd/coredump.conf
> +    sed 's|#ExternalSizeMax.*|ExternalSizeMax=2G|g' -i ${D}${sysconfdir}/systemd/coredump.conf
> +    sed 's|#JournalSizeMax.*|JournalSizeMax=767M|g' -i ${D}${sysconfdir}/systemd/coredump.conf
> +    sed 's|#MaxUse.*|MaxUse=|g' -i ${D}${sysconfdir}/systemd/coredump.conf
> +    sed 's|#KeepFree.*|KeepFree=|g' -i ${D}${sysconfdir}/systemd/coredump.conf

How does this allow the user to customise the config options?

By forcing the options to the _current_ default values you are
creating a maintenance problem - ie you'll still be forcing these
values even if/when the upstream defaults are changed.

> +  fi
>  }
>
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

