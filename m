Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A87BE77B20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 16:50:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x124so731161wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MMtE3YADkcanvo8hICy8S0B0vSmK2N18okpchpF3L/g=;
	b=roIKqjaINvTUIr/QHaYXJNsfliCxA4JcEpzRk6rlthwrx4+K0DXa/pGRU0R/6ADwwx
	kGbkpYzdUkrEUZEcsRIevjkWy07hlZeHnpM2KFXKlLQYkbiWnk234v/BpqoSRm4PGuDw
	VJFhHndiUVIhVYBvd0WLTnT93J/cmHn0YAP2SLFij+e6Ld2c2OwtI01P+e1eamoFQ726
	UFK+2uWCE6k7Q3a3wC7upw3NtemlT5JkMyIsWc2yPqMhnsFojWx/NK6YZcieKGu3pYOQ
	pV1mrZHcC9NQC4Ked+a4LX85XExK8AKiy1G0CLyE+ZXgbxzksQtwR4js0lv7AUnBT000
	LdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MMtE3YADkcanvo8hICy8S0B0vSmK2N18okpchpF3L/g=;
	b=oE9CmewLyh/4sfqNycABW3teqgaBSBtAucbVxMVDBcaIwQ+l1ZZqxkKFJFvfXMO872
	WV8t7XHpqftiZGBXLiIqYg2ScpZX3AkAENq3lR1H/DAapUDScW9COaV4L0BVpVRGnLNN
	invMExR0xaxteuiYKBqxcsbZ9ZGScCS/U/Rmhg+A384Q1hh0junoIOcjPy8/e1lGrXI9
	2herzUTiDh9/zMMaEY77uYUl+1+1LznE1NZRNw8wW9b9QqNaDORcKTF+kbnyUVT4qIQs
	3ts1ZsJosOYyHxqzBwfIen64ugFjOYV9NRugI1si7ZW8ALceST5ooicHuvIO7b0uR09R
	yKgw==
X-Gm-Message-State: AFeK/H3MgjOq4ldKJ7XiEolHLgDTryIBw0vrQak6t6NAf5Ev+EhfVQyEUdBPncub3Us7aPtOuJS01esNqjWFwQ==
X-Received: by 10.28.215.18 with SMTP id o18mr15639232wmg.98.1490719811190;
	Tue, 28 Mar 2017 09:50:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Tue, 28 Mar 2017 09:50:10 -0700 (PDT)
In-Reply-To: <1490701251-20408-1-git-send-email-pidge@toganlabs.com>
References: <1490701251-20408-1-git-send-email-pidge@toganlabs.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 Mar 2017 09:50:10 -0700
Message-ID: <CAJ86T=UUfShQ2Ap0ExTrL6qKT62pBt_v=GCMvT2Cw-qdjAR60w@mail.gmail.com>
To: "Elizabeth 'pidge' Flanagan" <pidge@toganlabs.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] aws-cli_1.11.66.bb: Initial commit of aws-cli
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
X-List-Received-Date: Tue, 28 Mar 2017 16:50:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 28, 2017 at 4:40 AM, Elizabeth 'pidge' Flanagan
<pidge@toganlabs.com> wrote:
> With fetch2 supporting s3, having an aws-cli recipe makes sense.
>
> Signed-off-by: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
> ---
>  meta/recipes-devtools/aws-cli/aws-cli.inc        | 14 ++++++++++++++
>  meta/recipes-devtools/aws-cli/aws-cli_1.11.66.bb |  5 +++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta/recipes-devtools/aws-cli/aws-cli.inc
>  create mode 100644 meta/recipes-devtools/aws-cli/aws-cli_1.11.66.bb
>
> diff --git a/meta/recipes-devtools/aws-cli/aws-cli.inc b/meta/recipes-devtools/aws-cli/aws-cli.inc
> new file mode 100644
> index 0000000..e9a2677
> --- /dev/null
> +++ b/meta/recipes-devtools/aws-cli/aws-cli.inc
> @@ -0,0 +1,14 @@
> +SUMMARY = "Amazon Web Services Command Line Interface"
> +DESCRIPTION = "The AWS Command Line Interface (CLI) is a \
> +unified tool to manage your AWS services."
> +HOMEPAGE = "https://aws.amazon.com/cli/"
> +SECTION = "console/utils"
> +
> +SRC_URI = "https://github.com/aws/${BPN}/archive/${PV}.tar.gz"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=71a3e14f29ac5c23e1b5b934ca4ddfc9"

According to the style guide, LICENSE should come before SRC_URI.

> +
> +S = "${WORKDIR}/${BPN}-${PV}"

That's the default.

> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/aws-cli/aws-cli_1.11.66.bb b/meta/recipes-devtools/aws-cli/aws-cli_1.11.66.bb
> new file mode 100644
> index 0000000..a96b71e
> --- /dev/null
> +++ b/meta/recipes-devtools/aws-cli/aws-cli_1.11.66.bb
> @@ -0,0 +1,5 @@
> +require aws-cli.inc

Ross has been merging single use .inc files into their respective
recipes. Not sure if we should be creating new ones.

> +SRC_URI[md5sum] = "c556adb58d0234eb661520488b9b467f"
> +SRC_URI[sha256sum] = "2c1da406203e0a9b5c717004bd463228e4fa4fa8fe47208f0e1836c02bee6f60"
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

