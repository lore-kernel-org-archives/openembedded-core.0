Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE9273130
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 22:47:48 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id g30so3546722uac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 14:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ufOT1WXz4uibbC0urYqRS6ikVea9cC/kfORvfWQZLGg=;
	b=csLZq4UQeqBcTjrLZLdQTzRy7ufmtk+AUkopPTIgU6l76AXY72fE6xXAs373r/Y2Na
	PX+cZZ7ol2mdnUaqcO8JmJ7D/OfJRxqEycPwmGW+9d+fkSLOBEcTXW+K1ePKHYbrOcrN
	8wpX5uE3DydI7iH+cWNOUvCddS+tMVoknTWQiySGyG8OLmnOMGUV7dDUqNsN+pIC191R
	OnUlgD3HXDTOaBq7e7z6Yzc2/d48DsYbR5FcM8T5J67QQ31EwDbhCYdxmqGq4GeXoLVF
	7nMwdc0+JUZkduwwxd1NzBVIIB+MlpMZkHo/0E/a5ehqjfn0UwOm/T6AHzDT2hFwv3dS
	FShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ufOT1WXz4uibbC0urYqRS6ikVea9cC/kfORvfWQZLGg=;
	b=pchgBATZQLAVK7JlXCggkb08YMruRToY6JvXzWnd+QZfzsUQ+c4vvTD8vPC16q+xEQ
	xzvx4/RF1m9ui/+Ni0l8GRhpnDE4wbY2dSTyPea4ddHUyd0anoc5M6MxErNTDA7kzVVp
	/Y3tht5NAWaUrDSWHBUBkeSm2t/nabZreTgSWYDQWVQxpM/B4VRZILXgPNiwmOBlTwKM
	eGcPX2886hxVAmcyYpM/+jGhvJTmcmO1BIa6Yz5YwQiUfMWBXjmvAFpNT6644KwWRzen
	Ul8gs4gjEfGMj+XabqBCFA7rlDzrkmB1uBiIb6+g6NnM9SltHZzSRw9/zNOyrWffd2cc
	04fg==
X-Gm-Message-State: AMke39nXlTpOilLOcUCpDNNCmSafgkHbiBthtZQkOj+CyCVXyvxntjmZQCXky9mVuJqi5EeTTFHjEu3Tp2Cr3g==
X-Received: by 10.176.71.234 with SMTP id w42mr11172852uac.141.1487890069306; 
	Thu, 23 Feb 2017 14:47:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.52.202 with HTTP; Thu, 23 Feb 2017 14:47:18 -0800 (PST)
In-Reply-To: <CAJTo0LYeRPDGFjL2113ciF7sN9F2o1iap8e5Z_m8b4LPpL3GbQ@mail.gmail.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
	<82576a21b491938531cbbba58160459b91ec6960.1487774787.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LYeRPDGFjL2113ciF7sN9F2o1iap8e5Z_m8b4LPpL3GbQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Feb 2017 14:47:18 -0800
Message-ID: <CAMKF1squEy9GvqMPCGBtNg06frrW1csujShZMX2fq06rrruX+Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/24] libiconv: remove recipe
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
X-List-Received-Date: Thu, 23 Feb 2017 22:47:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 23, 2017 at 2:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 22 February 2017 at 14:51, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>>
>> It was in use only when uclibc was used, and so serves no purpose anymore.
>> Both glibc and musl provide their own implementation.
>
> Either this isn't entirely accurate or we need more RPROVIDES set:
>
> ERROR: Nothing PROVIDES 'virtual/nativesdk-libiconv' (but
> virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-extras/build/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> DEPENDS on or otherwise requires it)

It seems that nativesdk-glibc is not providing it. We
should fix that

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

