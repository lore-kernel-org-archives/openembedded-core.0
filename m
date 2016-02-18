Return-Path: <andrea.adami@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id C38F8731C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 23:16:10 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id e6so59296371vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 15:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZEXNE6j8nqAo5ZNnEIDdTBYwHDPL+0/k49P9k6aYUrg=;
	b=BKatVkZacY50TuhuYVKkkXzE367W4ISBjWBu/cjVfGE00+pfQjxNlH8dcO0M71JeY0
	aH0eCAFmILjY1jjS+PQFHe7T3BJm0lcKLbfI0A/NkIjUNqTPbDlX5yDguzZUtITzbQ/8
	Q2tV0XGdZH94KOKFTLNPmTmpqRmw7zQRKP6OpH/r13v+9mUlx23eAf/EFBa3P05HFuPv
	iPVTSgO1XymHcPf353FyLjlOKQ4AitwbWGZ68DQL4JaRkF3sbVSthA/85Cs1xZvy+GAe
	Jk7raaF9hqBxcfV6Agakx40Ht6A/HxyYcrPEX1WjEa3kJdyPm8JJumDMxAUkaal/zKEy
	pqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ZEXNE6j8nqAo5ZNnEIDdTBYwHDPL+0/k49P9k6aYUrg=;
	b=V/LzpBvwAAP9f47ncUQe+RP93OJCFimxH4B4dqPcA4PWP6vnMV/yxlh/mb6VhNVz+S
	0r1Vv6aMU1FPNn9VSmnjjm3tQMlda4OapLWiSGIcVSGJ3RUjxc/NiCAdk50e4rWBpvGl
	jkUmBuYk7cCL/GCvbfdPqsz70ZN7/uRZrx9Cdu/kW8VRv6omzwzNSxjRNUmYAww+3G5v
	m2uCl30wrZxdgWpTCgV6G4bk2dxjfUD756+ld3X1aSAGWDhtDRNWvqo1WuhSO4LdEAvx
	9pwaTVC3EkzK2beCfVFSr4qw5udtx4Z/BhxE4ZCIVVwdnAyE2c6a7iryGju56gzaXCRn
	wrOA==
X-Gm-Message-State: AG10YOSaCUHeopJSe9b93bP1BQ60VS0bKYGKsv9R9By0ReGMToRk15luphiIut1Qxl7PDKyy7QKZ++7z3py9rA==
MIME-Version: 1.0
X-Received: by 10.31.48.132 with SMTP id w126mr8889857vkw.5.1455837370666;
	Thu, 18 Feb 2016 15:16:10 -0800 (PST)
Received: by 10.176.1.7 with HTTP; Thu, 18 Feb 2016 15:16:10 -0800 (PST)
In-Reply-To: <1455777999-14641-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1455777999-14641-1-git-send-email-markus.lehtonen@linux.intel.com>
Date: Fri, 19 Feb 2016 00:16:10 +0100
Message-ID: <CAAQYJAs-pxqumf+q9JqyWvVJ__2dpc1bs7K6qB45D5FeWU4pNQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cml1.bbclass: fix do_menuconfig
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
X-List-Received-Date: Thu, 18 Feb 2016 23:16:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 18, 2016 at 7:46 AM, Markus Lehtonen
<markus.lehtonen@linux.intel.com> wrote:
> The functionality got broken after bitbake commit
> 8bf33a8e92c0e188fa392030025756196c96fcbb
> which disabled the (bitbake) variable expansion inside python functions.
>
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta/classes/cml1.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index 95cf584..4067dc0 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -26,7 +26,8 @@ python do_menuconfig() {
>      except OSError:
>          mtime = 0
>
> -    oe_terminal("${SHELL} -c \"make ${KCONFIG_CONFIG_COMMAND}; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
> +    oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
> +                d.getVar('PN', True ) + ' Configuration', d)
>
>      # FIXME this check can be removed when the minimum bitbake version has been bumped
>      if hasattr(bb.build, 'write_taint'):
> --
> 2.6.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Hello,

with pull of today build fails with a deceiving log:
Exception: TypeError: getVar() takes at least 3 arguments (2 given)

There seems to be a missing expand parameter in your patch, mandatory
after commit aa3faeb

 -d.getVar('KCONFIG_CONFIG_COMMAND')
+d.getVar('KCONFIG_CONFIG_COMMAND', True)

Regards
Andrea

