Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 00E276065F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 12:34:10 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id n12so4220559oag.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=2vVBE0dW914YHmU7CUWwls3tmA8nOhHZCrdoqu3Wryg=;
	b=Ji533eN6S8GFxRf1WC4pKW3TQUx1tRU+WRY7jfbiPW/1QlvMpqosOi8QFz4vkDPrqw
	b3vJHf8+PneZnwivVbaZzOK172w9UPEn22Prk8emBazdwCrg7dvihcy8XON9FziTzpy4
	mhTR0f3f5EqR8EsyYvU6KVWvJomWuVV1YRh8Kriu7tHIKu2VoVrnYR7JLUv2d0dgs37k
	nozlS4eWEEVn9ZsdYmA3R8nwAODhiOFewJ+TxUG9rIUlbEMiAGOn+qizKZ5XLSGaGYm/
	Yo/75YIdg/FTIIIZmshDZ5FJcAD7MmBJKk+N6nyhiKO9lMRa/CwR3zYXL98X2nYmsa2R
	8jFg==
MIME-Version: 1.0
X-Received: by 10.182.27.74 with SMTP id r10mr20389658obg.63.1374496451292;
	Mon, 22 Jul 2013 05:34:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Mon, 22 Jul 2013 05:34:11 -0700 (PDT)
In-Reply-To: <1374496199.6719.87.camel@bril0118.bri.st.com>
References: <CAP9ODKoHGqwBXZVbEAtMgig=x6RVud1ZWo2oXFPcD8gUyqiVCg@mail.gmail.com>
	<1374496199.6719.87.camel@bril0118.bri.st.com>
Date: Mon, 22 Jul 2013 09:34:11 -0300
X-Google-Sender-Auth: wy7YAYZfUlMMKDJyPW5QllWrdis
Message-ID: <CAP9ODKq2JNvmkr+P9Sw6MON8u=Q96mJO-7kMHTPzN=NVC8vOzA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Andr=E9_Draszik?= <andre.draszik@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Handle of kernels which need dtc_cpp use
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
X-List-Received-Date: Mon, 22 Jul 2013 12:34:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2013 at 9:29 AM, Andr=E9 Draszik <andre.draszik@linaro.org>=
 wrote:
> Hi,
>
> I am using the attached.
>
> To use DTC+CPP, instead of giving the full path
> arch/${ARCH}/boot/dts/<filename>, you only have to specify <filename> in
> KERNEL_DEVICETREE.
>
> This was done to stay compatible with existing build rules, but I don't
> know if this would work for the case ${ARCH} !=3D arm

I tried to apply this on master and it failed. Can you please rebase
this? This does look like the way to go.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

