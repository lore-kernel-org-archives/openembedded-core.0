Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id DC79660119
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 01:34:34 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id u68so768888uau.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 18:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c+zF6jIBtjxEPDfCWuoaTuaA0fnapyO9Xv+xQaA0zak=;
	b=NmJ9X1ZzMsx/E4WtillksTTZqz8/hL1XEATy17DEFXS5kk2WZhTBdOmrv1JhG3eq8u
	vqMYyLUJYcdQptPELwl8JMWbBPYWWuqaPYm2yS1RfsFiRXCebYxLD1p/PgzJsgCSOeAM
	d9iPR6kzgS9Bm3Oqqeum/gBRbfmM89WpTa8UeKST26prF+RKCr92D90bqi9SL7KqKzOR
	OzvXerf/pRKTqAqt3iecdAAkbUddlfYTzs2Xh2pRqey9jGvlfqNKWiwvJ7ixcwwndLCg
	z2R+jl3bhpDvG7SHD9POl12jKM0SWukSIhTqfkt8GbPYjbuWKA0oi4NMGS7Rm13fUiPw
	Uz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c+zF6jIBtjxEPDfCWuoaTuaA0fnapyO9Xv+xQaA0zak=;
	b=GKOzb0bzWejtEWy4nfUYLLXj07kS+EkDcg1C+HKb3KSS1IIT3BdSZbVxQ+0ECh5Ge8
	T/tyZvn8CMfMj31SNb9HpgYOQXn3OpXdvi/+unCVi6nbV/fldBpikoVx9yneNiwnlKPk
	RmQTJRVBf0YTbScMZacMhwqVhm3j+8KLukGCbP2izI3hPNYQV3heOlHTwas7hEkw6t86
	WjwFC+1juV2wJpBJX+JvkMloKQXE+dk4A6tBAnLv79DGfboCTfvUuHE7ydVXocREARlx
	pgrGzTgkIVtQ3Gad5y6IqX93iq3fGuWgCwiVOFQjmGxx7cQqEnsEpGFqMNj8PW9DncGA
	U6qg==
X-Gm-Message-State: AE9vXwO5Dg4RJ09NUf7gX1e6iOyoIb45/u9nyOYajBn2N3XQW0Vp9fmGXueoLRpsuf3q2KERacmRc1b7TYWV2Q==
X-Received: by 10.176.4.81 with SMTP id 75mr2081178uav.142.1474594475981; Thu,
	22 Sep 2016 18:34:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Thu, 22 Sep 2016 18:34:05 -0700 (PDT)
In-Reply-To: <1474550474-10525-1-git-send-email-ross.burton@intel.com>
References: <1474550474-10525-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Sep 2016 18:34:05 -0700
Message-ID: <CAMKF1spQXDJtOgkrUX+eGNQij1QyAvUspaFKfeHtap-2LTVFJg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add a lazy default for SDKMACHINE
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
X-List-Received-Date: Fri, 23 Sep 2016 01:34:35 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 22, 2016 at 6:21 AM, Ross Burton <ross.burton@intel.com> wrote:
> If the user doesn't set SDKMACHINE in their local.conf then uninative and
> buildtools will fail in obscure ways, so ensure that a default value is set.
>

I think this should also be documented somewhere.

> Also as SDK_ARCH will be overritten then loading the machine-sdk configuration
> file, don't bother assigning it.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b6a1a68..359f787 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -129,7 +129,7 @@ TARGET_CC_ARCH = "${TUNE_CCARGS}"
>  TARGET_LD_ARCH = "${TUNE_LDARGS}"
>  TARGET_AS_ARCH = "${TUNE_ASARGS}"
>
> -SDK_ARCH = "${BUILD_ARCH}"
> +SDKMACHINE ??= "x86_64"
>  SDK_OS = "${BUILD_OS}"
>  SDK_VENDOR = "-oesdk"
>  SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS', True), ''][d.getVar('SDK_OS', True) == ('' or 'custom')]}"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

