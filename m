Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id EFFEA77266
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 19:59:38 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so2129251wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 11:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vWsP4f5zLhcgntDEJb0BB7BS0YMbmYkik3Fqf6GnaZQ=;
	b=zRYlGs6x8zipABpZn+KGRK8Nu2emdF4rAg/M7Qrj03goCDVV8HGs2H7ZzKc7FtlVqs
	SiIpQWMzPKUDFm9OLfKeYCaAwilE1FMK9LvvfvwdWik7WZXye3LMxVfcH6ll3jADgO/s
	M4WF2qwl4GyK3rn05cSBcC8FWh7BU6aNsiHG+MNheskIEt10qK0ZF0dXnJxUvigq+a7V
	2SpcxZfJxtG+r5ScMy4IUy/9FE9ZZFsC62QBAWJZsddJ3QPU3GQ7m9081PXpdUSkQSMg
	CbVphnMxTp6G+Y3hBqNUWRv+AjCvDSd8QDGjTcWgOud7DefsUgjE5Brngs4eYytT3XcY
	CyQw==
MIME-Version: 1.0
X-Received: by 10.194.9.104 with SMTP id y8mr18495931wja.106.1447358378549;
	Thu, 12 Nov 2015 11:59:38 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Thu, 12 Nov 2015 11:59:38 -0800 (PST)
In-Reply-To: <CAJTo0LYoc6vqX=vU645oWxL74z__7BNRCrNMjcX3RDt9XHkDEQ@mail.gmail.com>
References: <1447303449-20796-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LYoc6vqX=vU645oWxL74z__7BNRCrNMjcX3RDt9XHkDEQ@mail.gmail.com>
Date: Thu, 12 Nov 2015 11:59:38 -0800
Message-ID: <CAJ86T=WZg5sBm9pfOVWv9Fxg2QAqj8u=jTYe6WnA3NyaiG+RAA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bootimg.bbclass: make default KERNEL_IMAGETYPE match kernel.bbclass
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
X-List-Received-Date: Thu, 12 Nov 2015 19:59:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 2:15 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 12 November 2015 at 04:44, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> -KERNEL_IMAGETYPE ??= "bzImage"
>> +KERNEL_IMAGETYPE ??= "zImage"
>
> Or would it be better to unify on bzImage for master?

I'm not sure. I guess most people set their preferred image type via
machine config and for those that don't, switching the default is just
going to cause confusion rather than being helpful.

I did wonder about moving the default definition from kernel.bbclass
into bitbake.conf though. Then the duplicate default definition in
bootimg.bbclass could be removed.

> (this patch would be suitable for jethro)
>
> Ross

