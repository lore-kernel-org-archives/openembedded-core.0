Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id D0250706D8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jul 2014 22:15:57 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id c1so2887191igq.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jul 2014 15:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UItFV4pMUB2LEjgekpasE24XL5dKpCSg2izw8MpM47w=;
	b=d+neq4hswJ9PkKj1sJtpq0zujmHg0CIH1BwKeUGx+dUW3VTWCoC2IqgWW1sihH6QmA
	pN1zdk21I6V1VC9zIbxaD4RD7tMQ6dr+XTzzDEv2k2iySTP9bj7OgIelwNBiMTX2GgPW
	3w9DtfrvJ/FHZDj+WuJXe6fz1u9LitAts1PHpvK0sIDY7B6Mzkskfm2I56bfE1WXzt7w
	I0KjcypVra/GaNa31LdWMr9f4FqLbRdvo7/2TqKOupgUwnyvmfv3Z/fpWzR4tj0dr0M0
	f7qRaCXzqxd0bWnD0KaYKxsT+2jkcV0QOY4zBazTlqE6xesPBTe7OFO47g4tCcF9s/2y
	EFIg==
X-Received: by 10.50.25.71 with SMTP id a7mr24642348igg.17.1406499358612; Sun,
	27 Jul 2014 15:15:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Sun, 27 Jul 2014 15:15:28 -0700 (PDT)
In-Reply-To: <CAH21_vFKch78Ez+jxcdDCSYHAY_kHcLYXjcz6XjO9fnUW=tq7A@mail.gmail.com>
References: <mailman.1097.1406462291.1406.openembedded-core@lists.openembedded.org>
	<CAH21_vFKch78Ez+jxcdDCSYHAY_kHcLYXjcz6XjO9fnUW=tq7A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Jul 2014 15:15:28 -0700
Message-ID: <CAMKF1srR9zYyuRTrRhAGf1x61akA1zJFQUcp+LjOvbswXjK6wQ@mail.gmail.com>
To: atulkumar singh <atul.singh008@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Aarch64 support needed
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
X-List-Received-Date: Sun, 27 Jul 2014 22:16:04 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 27, 2014 at 5:04 AM, atulkumar singh
<atul.singh008@gmail.com> wrote:
> BBLAYERS ?= " \
>    /home/atulk/yocto/poky-master/meta \
>    /home/atulk/yocto/poky-master/meta-yocto \
>   /home/atulk/yocto/poky-master/meta-yocto-bsp \
>   /home/atulk/yocto/poky-master/meta-aarch64 \
>   /home/atulk/yocto/poky-master/meta-linaro \
>   /home/atulk/yocto/poky-master/meta-linaro-toolchain \
>   /home/atulk/yocto/poky-master/meta-openembedded/meta-networking \
> /home/atulk/yocto/poky-master/meta-openembedded/meta-oe \
> "
>
> Please let me know with your valuable suggestions.

You have to specify the path correctly for layers under meta-linaro umbrella

/home/atulk/yocto/poky-master/meta-linaro/meta-aarch64
/home/atulk/yocto/poky-master/meta-linaro/meta-linaro-toolchain
.....
and so on

-Khem

