Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DFD87730B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 23:31:58 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id w194so13969867vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 15:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=erj7nerfxgvaIT9nvegmqiogx6WyxHAFIwxGDGhAb7I=;
	b=OZZPruzQNHzGzGupxcg6a083no4r5Uc5abMOnjOkH32dOSmfGgxy9kuDor42rcy4wB
	KW9g61gCoMQuLcZtvwIWM3pq1a3mYgJKZdRrOz8oUnZI6FyR8FKOxfDRGa6rHWDRg/ee
	P07CtjyYGSLpFymWyy8ekZWoeIEwTCthRq+TMmq/g4CI4ybUMFqoN0ts4VAL/h0Z/C8g
	hRAbS8NSWOf6yuQVGYZCrnJ4hpigviz7Be1DPI2m892dEW2vUVduT3egQieh7big6lRR
	JJd0PYaE/H3TmcpCFQeoiyvGHnl16nP48oZgt95dEOLz5jSTN3RLAWZMEoL5JPd490+c
	QSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=erj7nerfxgvaIT9nvegmqiogx6WyxHAFIwxGDGhAb7I=;
	b=hy08jXI4PyQKbh7VAKPAOVRxoE+RvhcVokGdyZRlDbXDamASmuAWMic9vMZUGCtr9v
	JDn8kGn/U80mRpAuo5w1g7WLxBET9QCCf1AZ/4e3oiXUUseVZ58lZGoyKBAIGco/QGy8
	CNdElmvSY2p4AF+b9Nm/UuH7UxMWS/mUhptU/M9ZMkdmHyB4xJcGhU2hABg9MqC/a59H
	LLS2yYB37PjTAlI8g9fzFuRF8Ikmrx0YuIdGsRqr7QPIlY7nEkYfHCPNQMk/1cH/8fJn
	DpD2gVPhAEoTxHM7mo+tRxhW/kLxCBabnEAVAhMBp9+HaFSc4hqKDo0125JgXoiGauxV
	w57g==
X-Gm-Message-State: AIkVDXJ0LOgswR0Z2hXoM4cyHwYvgEblhvG0MDr/I7OUlUQsW7b9zqR90uCedP/X4seXEwuUI2m3ZUK70R44Ag==
X-Received: by 10.31.108.144 with SMTP id j16mr5817325vki.93.1482190320302;
	Mon, 19 Dec 2016 15:32:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 19 Dec 2016 15:31:29 -0800 (PST)
In-Reply-To: <1482151262-22674-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1741618.15EvijL4zK@peggleto-mobl.ger.corp.intel.com>
	<1482151262-22674-1-git-send-email-ed.bartosh@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2016 15:31:29 -0800
Message-ID: <CAMKF1sqPsmaOfKHLeTVqsWUMY+jkNByV-ONMV7EnHLnOj=B0gw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] wic: look for wks files in <layer>/wic
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
X-List-Received-Date: Mon, 19 Dec 2016 23:31:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 4:41 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Currently wic looks for wks files in
> <layer dir>/scripts/lib/wic/canned-wks/ directories.
> This path is too nested and doesn't look consistent with the
> naming scheme of layer directories.
>
> Added <layer>/wic directory to the list of paths
> to look for wks files.

Does it also affect documentation ?

>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/engine.py | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index 5b10463..2adef2f 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -52,6 +52,7 @@ def verify_build_env():
>
>  CANNED_IMAGE_DIR = "lib/wic/canned-wks" # relative to scripts
>  SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
> +WIC_DIR = "wic"
>
>  def build_canned_image_list(path):
>      layers_path = misc.get_bitbake_var("BBLAYERS")
> @@ -59,8 +60,10 @@ def build_canned_image_list(path):
>
>      if layers_path is not None:
>          for layer_path in layers_path.split():
> -            cpath = os.path.join(layer_path, SCRIPTS_CANNED_IMAGE_DIR)
> -            canned_wks_layer_dirs.append(cpath)
> +            for wks_path in (WIC_DIR, SCRIPTS_CANNED_IMAGE_DIR):
> +                cpath = os.path.join(layer_path, wks_path)
> +                if os.path.isdir(cpath):
> +                    canned_wks_layer_dirs.append(cpath)
>
>      cpath = os.path.join(path, CANNED_IMAGE_DIR)
>      canned_wks_layer_dirs.append(cpath)
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

