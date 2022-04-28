Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DC2C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 21:50:41 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.2992.1651182639805385885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vkiCWiH/;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id k23so12115131ejd.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n43Kym6Pnf4Ou1oyRCuizoge0WjSDad86ryPAAqC7UQ=;
        b=vkiCWiH/d3JFVbYPkIPR6YK/rt2uPx9etJuNsIPofoBDCQbm/Heu0rcKU+cpXUW+1/
         XFS4864Kj5XAt5jyHBB8qXlG2wFbYpjPn3d6IYHenGmn9Iu/5PBSNCwLx47RR1ayxK1U
         iCATVmvFPmBhsE/meXog5i91VF7Y9kEAzY797L4thQMh0z+OBCwYm2NkqB4GhOwyfle8
         OETtJg7dhMYQ2DFSBfKxGSWZo+Qjpl5ibtm1Q+GjtI/FgWZI6R5hADbBK/NvkELFv6Ty
         eMp+cBFozl+uFIuefuZ6K6ivxzZnqajskuw2sYYnvDB+tJT7m3ySz/cmyb0fUmntInl9
         f/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n43Kym6Pnf4Ou1oyRCuizoge0WjSDad86ryPAAqC7UQ=;
        b=ZMFeMDYSNCDZqKliapZQoKNJ9Iq03ZFGFTu9aVo/WTMlx4iukMvABwRDug0epWxwUf
         8cGj9O7aEs2gfkCCMrWi5N/IiC1IRaq3ouGyEepxDvw3m6/JENV9I2W0Xrc6A/8sZ3zi
         C/MnJp9hVf8dfh3RZB7OI3Sn8se6oH8gRegm0DsK1WqZ8kxw8bI/aA+QlU44ggGAwtXI
         VLcPzGaSKXo3GBjQUTTXUf3Gx8jbfcV07uUWWo69DVztc6Pc4uQdam8iZVTc3HeiP2aM
         jCh+gRHbHelZuRcinLu3kdWhSuzCn4+FvVrR8OLX6DERrH/lyzGTShjwLOUFXx0Azt/7
         meuQ==
X-Gm-Message-State: AOAM533iN90Lxr1Ol8V/OktWLmcb3dRKHPir28g1IVi1GkqF9ux3tngg
	f/43gVeI0oV8pnws/WWV1scHXodtJKswpKlZff4PNQ==
X-Google-Smtp-Source: 
 ABdhPJxlRTikDBRL28+TLO+33Rla2TayXrTxSvEoaX3RZiebFxtREXP4mKS0p75ZOy7LG+NEb4LdCdqxL/FAN2Mn850=
X-Received: by 2002:a17:906:32d5:b0:6f3:be75:8485 with SMTP id
 k21-20020a17090632d500b006f3be758485mr12476224ejk.685.1651182638235; Thu, 28
 Apr 2022 14:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651182153.git.steve@sakoman.com>
 <16EA2DAFCFBF96EF.16550@lists.openembedded.org>
In-Reply-To: <16EA2DAFCFBF96EF.16550@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 28 Apr 2022 11:50:26 -1000
Message-ID: 
 <CAOSpxdZ91SdkV8_sZ7Efv-m7ZTtGf07ygH29EQbVUUExrRgFAw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 6/6]
 scripts/contrib/oe-build-perf-report-email.py:
 remove obsolete check for phantomjs and optipng
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 21:50:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164985

This patch is in master-next, but not yet master.  I decided to run
the dunfell review process in parallel with master.  I will wait till
the patch hits master before sending a pull request (and will add the
cherry-pick notation)

Steve

On Thu, Apr 28, 2022 at 11:47 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Use of those tools was removed in b5c131006e3fad0a15e6cdf81f71dc1e96647028
> perf-build-test/report: Drop phantomjs and html email reports support
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  scripts/contrib/oe-build-perf-report-email.py | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/scripts/contrib/oe-build-perf-report-email.py b/scripts/contrib/oe-build-perf-report-email.py
> index c900720f6e..7192113c28 100755
> --- a/scripts/contrib/oe-build-perf-report-email.py
> +++ b/scripts/contrib/oe-build-perf-report-email.py
> @@ -27,17 +27,6 @@ logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
>  log = logging.getLogger('oe-build-perf-report')
>
>
> -def check_utils():
> -    """Check that all needed utils are installed in the system"""
> -    missing = []
> -    for cmd in ('phantomjs', 'optipng'):
> -        if not shutil.which(cmd):
> -            missing.append(cmd)
> -    if missing:
> -        log.error("The following tools are missing: %s", ' '.join(missing))
> -        sys.exit(1)
> -
> -
>  def parse_args(argv):
>      """Parse command line arguments"""
>      description = """Email build perf test report"""
> @@ -101,8 +90,6 @@ def main(argv=None):
>      if args.debug:
>          log.setLevel(logging.DEBUG)
>
> -    check_utils()
> -
>      if args.outdir:
>          outdir = args.outdir
>          if not os.path.exists(outdir):
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164984): https://lists.openembedded.org/g/openembedded-core/message/164984
> Mute This Topic: https://lists.openembedded.org/mt/90764072/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

