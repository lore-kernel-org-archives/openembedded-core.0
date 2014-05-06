Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 302B1609BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 17:23:08 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id hl10so6582157igb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 10:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gx2bX59T8S4C5qrRcuBM+FY0bDc6XrkX/dws/A41TIs=;
	b=RMFVnB81CIqLWGGXsXCyFnFiI/mtlm0snomRzYuLys49rwpeukPBdGlTllROu6XJsl
	g8YAvKpFxM77uQHncagbyGa0tMLMNUjIDrP3S1/q6ZnKIUWkuiMRB26f8HGxf8EbFNEq
	EIIq3GXAnwqOMX8k1nHbyoesIwelomrmdhuC4WijmkLUbedhLaZ8w+z2/g3DnGuj06HU
	QCui/CueJ2NPIooiY0I+O25Mel5sGaq2CfnFIhvmIW4lRmDzW3w/t+FRvTLRqi8dN9yA
	uvbquPXepuEVCqt4yq6Elhixl4Qqi7XbDnKSM4cRtdP5Cln+LSSRW9Mtpwk0z7HYCCtM
	7dHw==
X-Received: by 10.43.35.143 with SMTP id sw15mr39185884icb.29.1399396989903;
	Tue, 06 May 2014 10:23:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 10:22:39 -0700 (PDT)
In-Reply-To: <CAPybu_2QJ=GXH0Vo_hvAOu-uoj=KDe2ouyQ1EC6pmx6cSKc8TQ@mail.gmail.com>
References: <CAPybu_2QJ=GXH0Vo_hvAOu-uoj=KDe2ouyQ1EC6pmx6cSKc8TQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2014 10:22:39 -0700
Message-ID: <CAMKF1so0OkCq73JeZGLAQGb5Cn3+ZKwU=GimrW0CAu39BC+6DA@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: daisy: System crash running grub-efi on 64 bit machine
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
X-List-Received-Date: Tue, 06 May 2014 17:23:09 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 6, 2014 at 6:20 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> I have just ported my build system to daisy and I am unable to boot
> from grub-efi. As soon as the grub binary is loaded by uefi, the
> system freezes. The error can be reproduced on virtualbox.
>
> Since it is even before the kernel is loaded, and no error message is
> given I don't know which will be the easiest way to debug the issue. I
> hope that the log message from virtualbox can give you a hint of the
> issue: https://gist.github.com/anonymous/7ffd78aa3aada41801fe .
>
> It could be a toolchain issue, because if I build the same code (even
> with the patches) with Debian's gcc everything works as expected.
>
> If anyone needs the .vdi file I will be more than happy to share it.

what was the working release you used before and whats the compiler
version on that release

