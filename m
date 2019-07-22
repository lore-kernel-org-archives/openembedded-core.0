Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id CC0FC7EEBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 09:51:45 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id i10so72452458iol.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MW2AWZXCy1H9h6+azf8aRoT3tM9gCUejhtr+rz07K2Q=;
	b=tzkeVE5mfsEJRKF1Cb5EBI/IKvKQN6lqUiuE+GR//R/tFfW6o5woMb1ewEYWtbJoB1
	1P65dXBrDu/JGhIcEQdx3t44IFxHTKdKFwa5WjuKMiACUNeYZ0bALgjPG7RyOF7HblI5
	UkVKK7PF4eIo1mYywXzpJcYkbUGhtyEv5eHJdkg9jQ+dTHwN/4tt+gMMvoger2wU5Sew
	AytiAz8tS0G56gNOUQwpvS3vjhSH2Atych/9of8KA0Qg9Ur67MU1OkN+Hvqm2Tfhw/sJ
	Csq3tu3cxh/qISfRFFaWcIeMJpt6VSIoK6gTW6l9mpdsZylkEHjFBP3DCMs2dOeGLZzK
	bLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MW2AWZXCy1H9h6+azf8aRoT3tM9gCUejhtr+rz07K2Q=;
	b=gDiYQNC1YMWZkYFQFbFXs6i1mHA39KKNxOIjfN3OvwZZl8QS6hMqKP/f1B37wje6i6
	i27TqX38mSZwOGXVegVOzk86RASSOpOIc01TW6vSzHS2PDpA2Om48av68x42D6jwP0/A
	56xBCBCqj3GSA6pf34Snt5GjiEHmMZtv76jfZnafPHnh7Iuu0N+uJJyikUP/w2u+lIeT
	Njih++IAhgLDbwgtqPbrJyobNHWTtIHnHNkRLisW7a19839lfpRuwooYVdZjIxQI7gS0
	sH7hRlymrU9ljingzp5QjftsbeX/hTYy1QQ2NZiIIhnEhR0qsGNQMbUJd+Btjs4RuEdi
	SGOw==
X-Gm-Message-State: APjAAAVAw7AOM8D+8R2eNbkWsHZ0gL/tf43HuEx+fSa+L1/72KHDpfm4
	gZQ3DFS6RrQGeTtsJaKHt4DG8GA+8hGFy34J0gnCqImR
X-Google-Smtp-Source: APXvYqzdCWBPMDEWBqgfiyuJaLScC/+/aMP2rVfCp8foDzrB7Sii11oJHQ3WGk4wn73o5SQAvG5lmvf0U/Wj9NYz1q4=
X-Received: by 2002:a02:914c:: with SMTP id b12mr25807183jag.105.1563789106118;
	Mon, 22 Jul 2019 02:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jul 2019 10:51:35 +0100
Message-ID: <CAJTo0LaVCn47fzpMYcsO9sjwgRpaexGYDRxrrvoWTVny1uVQ_g@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] python-scons: update to 3.1.0
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
X-List-Received-Date: Mon, 22 Jul 2019 09:51:46 -0000
Content-Type: text/plain; charset="UTF-8"

Do we need the Python 2 variation of scons in oe-core, or even at all?

Ross

On Mon, 22 Jul 2019 at 01:18, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...hon-scons-native_3.0.5.bb => python-scons-native_3.1.0.bb} | 0
>  .../python/{python-scons_3.0.5.bb => python-scons_3.1.0.bb}   | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-scons-native_3.0.5.bb => python-scons-native_3.1.0.bb} (100%)
>  rename meta/recipes-devtools/python/{python-scons_3.0.5.bb => python-scons_3.1.0.bb} (79%)
>
> diff --git a/meta/recipes-devtools/python/python-scons-native_3.0.5.bb b/meta/recipes-devtools/python/python-scons-native_3.1.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python-scons-native_3.0.5.bb
> rename to meta/recipes-devtools/python/python-scons-native_3.1.0.bb
> diff --git a/meta/recipes-devtools/python/python-scons_3.0.5.bb b/meta/recipes-devtools/python/python-scons_3.1.0.bb
> similarity index 79%
> rename from meta/recipes-devtools/python/python-scons_3.0.5.bb
> rename to meta/recipes-devtools/python/python-scons_3.1.0.bb
> index 939c15bcc6..b174050583 100644
> --- a/meta/recipes-devtools/python/python-scons_3.0.5.bb
> +++ b/meta/recipes-devtools/python/python-scons_3.1.0.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
> -SRC_URI[md5sum] = "9f9c163e8bd48cf8cd92f03e85ca6395"
> -SRC_URI[sha256sum] = "df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c848958ba4befb73c73e"
> +SRC_URI[md5sum] = "e2fe9d16f81b0285b969238af4b552ff"
> +SRC_URI[sha256sum] = "f3f548d738d4a2179123ecd744271ec413b2d55735ea7625a59b1b59e6cd132f"
>
>  S = "${WORKDIR}/scons-${PV}"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

