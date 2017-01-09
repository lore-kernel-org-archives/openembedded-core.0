Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id C0A3071ABF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 18:40:28 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id r136so1723329vke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 10:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7V3pNShckUyb8AFHASMYs51vipbiOmn5EtzSbyPiYBE=;
	b=E/3//G/3KKO1VBqAeqYm4x/jhNkTXIHlaj4dhducdBLN7Rr1Nb8cdju4RfD9O/ZNVb
	y5aJPEk9FCegbdpUduu047n6+G4AjWegj8XyvhtWU4J2fxf81JDDsPu/dQA1561ZPGMv
	ZBOhJ828qs9K8kD2yEnz2wFOscKr5IgAwt9TP0N3v3LsSAvYEvqFUwE+cQVj1+J7SPnc
	fMfeS4OtdQvNUxw/bsJXUD1srxCoGkWfc6qm0e54emGoO99YYUL7W8RWRmDWxPsitBCR
	/bFvB0i4aB2Le1Ln4W0sOphWjWLhWptAYEdyNSLJyR90Eh9fnLs+T8hGnRBWt390IJ3U
	L+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7V3pNShckUyb8AFHASMYs51vipbiOmn5EtzSbyPiYBE=;
	b=BDW/gFx8rzH9O0OROfKnFcBMZn4j158oDskCzx38mPJd/QA9bsaKG7wUWMGAin+zrJ
	ayetkOyGp5SLCMFBy+/Y5ukI3Ay7Ey8yNVQYGV+tO8RFc/yGks+T7AW8u69WKL+IT2an
	kifGKLyR0b961Qz78pLpyD3P9V0HoB8g8sVDEzT8yh3uQr94UPvBuLZ8jQ+ZHFIt/c7M
	NPsvzrtvUj+CW17UjKP+WYySbIbrbTFrsqLfTP3WvfYM+nCDK++O9b27Pfhcn3qZ8ok7
	T+L62nW6uIagZx+w/XO9saWF6l2czUB2ZdezVoHac4QtEYDn42L3FHfkILGk3b8MJpQp
	h+uw==
X-Gm-Message-State: AIkVDXJfCKAOMCAe5DgCgAKyXzq1Ri/fcAQ9vW1JFziaDBlT48unY9dWgM/1BLVrvqLmf72LFOG/nTyhHJchVg==
X-Received: by 10.31.234.199 with SMTP id i190mr31815303vkh.31.1483987228726; 
	Mon, 09 Jan 2017 10:40:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 9 Jan 2017 10:39:58 -0800 (PST)
In-Reply-To: <2bc5740d-4245-a666-d21a-e89940ebe2fc@efficios.com>
References: <2b581c5f-7199-7a0b-5288-cae9e8309a73@efficios.com>
	<2bc5740d-4245-a666-d21a-e89940ebe2fc@efficios.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2017 10:39:58 -0800
Message-ID: <CAMKF1sqFvv7ndY19PYHrRAxc8fJ9tvuYLJZKtHD2DPXWDK5+UA@mail.gmail.com>
To: Jonathan Rajotte Julien <Jonathan.rajotte-julien@efficios.com>, 
	Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Babeltrace - Backport fix to fido (as-needed.inc: add babeltrace exception)
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
X-List-Received-Date: Mon, 09 Jan 2017 18:40:29 -0000
Content-Type: text/plain; charset=UTF-8

add the release maintainers to the request too. Armin in this case.

On Fri, Jan 6, 2017 at 1:41 PM, Jonathan Rajotte Julien
<Jonathan.rajotte-julien@efficios.com> wrote:
> Hi,
>
> Reposting to mailing list since I was not allowed without a subscription.
>
> Both Alexander Kanavin (Babeltrace recipe maintainer) and Richard Purdie
> were CC on the initial message.
>
> Original Message
> --
>
> Hi,
>
> The following commit [1] is present since Jethro but the issue is also
> present in Fido.
>
> Since the commit apply cleanly, could it be possible to backport it to Fido?
>
> Cheers
>
> [1]
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3006cb260004a7bd88cfd4ea3e2cbcac600347bc
>
> --
> Jonathan R. Julien
> Efficios
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

