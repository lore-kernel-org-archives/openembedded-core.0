Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4636B74966
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 12:18:58 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id p10-v6so3988392ljg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lr+r7D6CfCSsjgqHzXax/26qxlz2T2Y6jpg/ZiODwAE=;
	b=T7G3L9i90qHWlxHta48ZjUgQei9/09tlpjQEbiOEeVJvay9SauqRAYYAzTB1jKKVYU
	RZ+8cdXtZboIbui5i5G0LeQFdJAeqMf1W3fzAXkrXbxaxIZSb6hPWT8lVIPxy0mw5HCC
	ds9q/ZfhAsIODh206NnEQJNfOXSd6tUmsfr0bzXzzdBEXanJtUH8wYGEXEdVBPMExvu7
	YXNlBR6RK+34dHfKKYO9hljHxvtUAPUEbLWvgHY2jVyZQV9sEAoJEdtny3BBHdRrcLPS
	V4YpE9GP8VhTejNM8vrsl0Yi81olMCOFDjAKDP2QOIi3HH7VXvodGBBNqzdtPoWD0nEB
	Rnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lr+r7D6CfCSsjgqHzXax/26qxlz2T2Y6jpg/ZiODwAE=;
	b=AYLbQBkChelFemiTbf/1Z3fd1fT2eCzNKLOtuzDgWBZmO5fMqSykY7ufUEMbUcdFTZ
	mrIrk3ryi3BlizB6eemR+oSuTOVpJSTymUUW4zXczt7hyXjuiaGEINJtMaMqufyIb1t/
	Q7QrY4dEfYKNpxsWdRE9mUirOnO+g5YNWxRbo3PtIBzjBhxTLVIY4tny4xNSSF4Ko2/a
	AcTsm2OoQXhEbJv9DDPci7ss8V3vq3R5m1R36UaqAEvpv6WiPEtybxvJUGprjxrSvmiQ
	Kfsd7n8obssV9ksPaadrN9+SHqyUWbkgR44yBnaC8fN9jwm3P6ttOPNpKV+SkYfs65OS
	iUAw==
X-Gm-Message-State: APzg51A8bKUk4Zg1EpjYN2bvC8xdXwgbCUchZS3PXjBfYTHTWyprm7Is
	fqukTWEBr5b4n3+BKo1pS8YQWgAtxw2s4giXZks=
X-Google-Smtp-Source: ANB0VdbQ1mF3nVavAVug6NMg5uVUxsLKAXYTA88JoxcIGfHl16Bbed/LDSTo+g5FHC7KFTqhsFOWSZtNsCPyODmaZps=
X-Received: by 2002:a2e:2b1b:: with SMTP id
	q27-v6mr5343470lje.147.1535026738833; 
	Thu, 23 Aug 2018 05:18:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 05:18:58
	-0700 (PDT)
In-Reply-To: <a0835110df531e0fadc6a769223556057c0e5c6c.1535011588.git.liezhi.yang@windriver.com>
References: <cover.1535011588.git.liezhi.yang@windriver.com>
	<a0835110df531e0fadc6a769223556057c0e5c6c.1535011588.git.liezhi.yang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Aug 2018 08:18:58 -0400
Message-ID: <CADkTA4OSxqbhWxAyC+ub=QSMK6iAQQv6p6x5d6tG-Fe=7Y_QoA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] kernel-yocto.bbclass: Clean up getstatusoutput usage
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
X-List-Received-Date: Thu, 23 Aug 2018 12:18:58 -0000
Content-Type: text/plain; charset="UTF-8"

ignore this patch. I already have a more complete version that was
sent previously and is in my queue I'll send later today.

Bruce

On Thu, Aug 23, 2018 at 4:07 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Replace usage of oe.utils.getstatusoutput() with direct subprocess calls.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 077a1ab..8c5667d 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -322,6 +322,7 @@ addtask kernel_configme before do_configure after do_patch
>
>  python do_kernel_configcheck() {
>      import re, string, sys
> +    import subprocess
>
>      # if KMETA isn't set globally by a recipe using this routine, we need to
>      # set the default to 'meta'. Otherwise, kconf_check is not passed a valid
> @@ -333,10 +334,10 @@ python do_kernel_configcheck() {
>      pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH'), "${S}/scripts/util/")
>
>      cmd = d.expand("scc --configs -o ${S}/.kernel-meta")
> -    ret, configs = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
> +    configs = subprocess.getoutput("%s%s" % (pathprefix, cmd))
>
>      cmd = d.expand("cd ${S}; kconf_check --report -o ${S}/%s/cfg/ ${B}/.config ${S} %s" % (kmeta,configs))
> -    ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
> +    result = subprocess.getoutput("%s%s" % (pathprefix, cmd))
>
>      config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
>      bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

