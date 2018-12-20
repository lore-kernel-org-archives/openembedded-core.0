Return-Path: <ross.burton@intel.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 36E0E79C81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 11:49:10 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id i26so1118268lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 03:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W9WGm8A0wYjujYLy56izI403BlksygDfHyfdgsy45ro=;
	b=a8oqI2rwy9aHbK7NvZCA+jArVVyFu6CaO48+pCQDET3ScN4RppzLvEtNoJ+G2l0oke
	LBl/KS8PteeQDJL5qYdmZcwXoS0TFTqdBY/m0MTS6QXHyRNw1hZNh1SIEotD0NcVn71G
	AwnRXX+1tn1IYnIBYHdaUcPU7Eiyp+HvaY9fJ2WLwDYxCrVE5Q4CbslS+gWn+BJYWxSY
	nf5mL3BKKM46OKT+h6F8LM97KYVRK8/+rKBAd7/yr54QUf0yEA2VimHDEhNlbysdIj56
	SEzoexikPmFxOYmmzFB6LvFGL0SRM29YW3xLI3fiK331j+x1Rwy431l09EAQsb4agkDU
	dI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W9WGm8A0wYjujYLy56izI403BlksygDfHyfdgsy45ro=;
	b=H1Ks5lmsfDLdXwIAGHbQb9ZkIAr60HP0aTJWU5HHpLhgf/JCaCJu8/X488ERuzHlsr
	JVI78jA6qlFSNUs5yG1UJu85jd44QtKphgEgMAeik+boVJ+XJr2erKUZ914C+h1U/x1g
	0JrWJlPj8p/3v8O4duJqpePbLMSbOsKVqi23xjtV4ChRsD5WUCiwgt01Lva6Lq/G2oSB
	9zr72zG1MdOEwZTA/rt9vs3gaYMKI0dIJeg5GFwkboAYufeav1zd+IXR4o6ueKr6VDDB
	7Ec6KuBSLEGVZCQZuDTonL2RPmXAWJvPMsKa9ulYMD0SV6RDh+6WFCBY8tU+gN3AjukZ
	zA0A==
X-Gm-Message-State: AA+aEWZ10tGbgRMyvGcN+zejB/P/5925fYOqaHcHA5GD9IAKyK6+tF3l
	QUcAhXieG6i2c/Kf0qy3S1ViWpPbWUGEm5vHC9eRUptM
X-Google-Smtp-Source: AFSGD/XapBGPvxvUWeOqlg08RXVTYBvHkeSDkWHfeEJQvjZRUqeejueuzV1YKOXbvnGs7Td0MwT2NPez/xUPmPcj950=
X-Received: by 2002:a19:9c92:: with SMTP id f140mr14423157lfe.41.1545306550702;
	Thu, 20 Dec 2018 03:49:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1545293075.git.liezhi.yang@windriver.com>
	<3d6fbb3825ef92b93f0e99d4ff06af2156ecac71.1545293075.git.liezhi.yang@windriver.com>
In-Reply-To: <3d6fbb3825ef92b93f0e99d4ff06af2156ecac71.1545293075.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 11:48:58 +0000
Message-ID: <CAJTo0LZE6v5A5ioR1B0iYiuaHiosK=BYpW4-0KqqGW-FT1MS=g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] create-pull-request: fix sed command for SUBJECT
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
X-List-Received-Date: Thu, 20 Dec 2018 11:49:10 -0000
Content-Type: text/plain; charset="UTF-8"

So if I sent a patch with the subject "Fix #1234" it fails?

Sounds like a good reason to rewrite create-pull-request in Python to
avoid this nonsense.

Ross
On Thu, 20 Dec 2018 at 08:05, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Fixed when SUBJECT contains slash(/):
> sed: -e expression #1, char 35: unknown option to `s'
>
> Use '#' as separator to fix the problem.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/create-pull-request | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index 280880b..ff0f7e6 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -278,7 +278,7 @@ fi
>
>  # Replace the SUBJECT token with it.
>  if [ -n "$SUBJECT" ]; then
> -       sed -i -e "s/\*\*\* SUBJECT HERE \*\*\*/$SUBJECT/" "$CL"
> +       sed -i -e "s#\*\*\* SUBJECT HERE \*\*\*#$SUBJECT#" "$CL"
>  fi
>
>
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

