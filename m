Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6696E60745
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:18:18 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p187so37400180wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Khmwd92mYfUDT6OmXaWKJAdJkSOKsicTPRlR8b8MLjA=;
	b=H5uqOm1EjCZiACN8/8AJGqTs3FmAYgFVjJonCytsNmjoxxAQtVVU7bRH9oXfpkJHqV
	xkbw4TQBhxJ0wVGJDUipes7OV/t7al0UxK5OnNaLmph7py7OpZaaqx5rs8xliImElUUg
	JAednKWTZA7+8Gaiwy8YQbvu6OVONufHOph9MdAOkd9tb73Pd6uERMK2s+BCiAwaVHCW
	m6sesWL7Oy0Moi4zynUNGmzr0OBFBxp07E863GjuPKpbyeSodk2c1GBuAwzCe0Fw8C1q
	5fxJNhlwAo40MjTRGblF2qeZql4pZ78a0KGlNr5ZBn2lM2uZXU+RXOGY4gpzaUe+qEdJ
	Op4w==
MIME-Version: 1.0
X-Received: by 10.28.211.203 with SMTP id k194mr359898wmg.4.1450383498844;
	Thu, 17 Dec 2015 12:18:18 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Thu, 17 Dec 2015 12:18:18 -0800 (PST)
In-Reply-To: <1449623398-29127-1-git-send-email-armccurdy@gmail.com>
References: <1449623398-29127-1-git-send-email-armccurdy@gmail.com>
Date: Thu, 17 Dec 2015 12:18:18 -0800
Message-ID: <CAJ86T=VFUeJ6=BXkOz++xG-n7L5Gjtip8RN9r_x+pjPsb=FE=Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] feature-arm-thumb.inc cleanups
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
X-List-Received-Date: Thu, 17 Dec 2015 20:18:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 8, 2015 at 5:09 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Drop legacy interworking over-rides and cflags.

Ping. Does anyone see any issues with these changes?

> Andre McCurdy (3):
>   feature-arm-thumb.inc: drop ARM -vs- thumb comments
>   feature-arm-thumb.inc: drop legacy _thumb and _thumb-interwork over-rides
>   feature-arm-thumb.inc: drop 'no-thumb-interwork' tuning feature
>
>  meta/conf/machine/include/arm/feature-arm-thumb.inc | 17 -----------------
>  1 file changed, 17 deletions(-)
>
> --
> 1.9.1
>

