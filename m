Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 658777E34A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 10:09:40 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n14so1559871otk.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hIzpvpxKoMnypDgqVtWaRluj1iDQNAIwXQsUnEQ7RHE=;
	b=V3byiUYU4YlicE7kn0ZlTONp7V6LJE6Sl4WV9i0M6ZUVheSOGZjHzmoB7322F5O62f
	reckkHaudYhRjR2JwtwgsJDxF/DAq5GHAesILp3gJJbx+XJJra+mBUpCnfSAdrpYNjiD
	D3ILh7xaRrEpilJUr+z4eNxt6RfseQNSBDGm087HvO0r1hZMxkuMjbJabUS12FIsS+84
	nfyPUjBhHftpJ/mM/h5e8g18KUvYGR+FnyYZe3+8ZO4sqRJ7V8YhwQTTWrf7Yh9R796f
	4jgdYOQG/IINPrPcoOohkLm2fpW7UgQViS2ansCAor9WHZcrlUSbCkdNv5NY4wUJylQE
	A2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hIzpvpxKoMnypDgqVtWaRluj1iDQNAIwXQsUnEQ7RHE=;
	b=GZ3/7ZtcYvEHPvGi2QIMdHhbWKihK5tF7uUIV2eeNkVwskxZiVMZEwAJ3zYa+1STIe
	xAeJIgybrYK7OHfHAiVlW3nGXBLBiH3SjUqIZmiwAoiZvjTAg/At5d8qV917/5KkFsVC
	bd70YvdiKcJRSrwRbAQ/IQgnQtEyrD2d769uoPg5jdBvFxZNZuxMO5jZ3v0E4GYYal2b
	wMGJakcEIPV+FbZ0UJJN12dlqOs3+LFJXKDA9ZF4VMIp6otPpVQMu3G2G90z82BtBe+O
	4blRgz5BSd2rCGDGbKvo8fRZoUTGRiKLLpHi7yLDRZyNlbFR3BvNl6juORGMbOrHuDP/
	OLZg==
X-Gm-Message-State: APjAAAX9sA821x3PdRxN9MVj8khP72I/wV8IedbfpNYJxj21HyPA0CPk
	fL53NZCswJgroIc3G3JWBOBjjeR4xRpP9AogwOw=
X-Google-Smtp-Source: APXvYqy/qWSRq+8B9XqgRR0fYnFDIYArUBwchsn8SAqAN4Mpwjqjf+4kLrZJptYOjFtXW+7Qn6uEcPB8EVfht1PCTw0=
X-Received: by 2002:a05:6830:1541:: with SMTP id
	l1mr24566926otp.350.1558519781393; 
	Wed, 22 May 2019 03:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
	<20190520141125.10805-13-alex.kanavin@gmail.com>
	<BYAPR11MB3653872C0E596E71869D90C7CD070@BYAPR11MB3653.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3653872C0E596E71869D90C7CD070@BYAPR11MB3653.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 May 2019 12:09:30 +0200
Message-ID: <CANNYZj9SFZg7HzmYX+xXcxypS18keNALFPMPU2UDzSYVLVmg7w@mail.gmail.com>
To: "Victor Kamensky (kamensky)" <kamensky@cisco.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/42] systemtap: upgrade 4.0 -> 4.1
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
X-List-Received-Date: Wed, 22 May 2019 10:09:40 -0000
Content-Type: text/plain; charset="UTF-8"

Didn't test it at all; the patch was produced by AUH, so I simply picked it up.

Do we have anything in the autobuilder for it?

Alex

On Tue, 21 May 2019 at 23:37, Victor Kamensky (kamensky)
<kamensky@cisco.com> wrote:
>
> Hi Alexander,
>
> I am curios how much did you test it? I had the same patch for
> a while, waited to post it till proper regressions are done.
>
> Thanks,
> Victor
>
> ________________________________________
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-bounces@lists.openembedded.org> on behalf of Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Monday, May 20, 2019 7:10 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 13/42] systemtap: upgrade 4.0 -> 4.1
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index 54de7226608..c5348b3204b 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -1,7 +1,7 @@
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -SRCREV = "90ff34ac0506f0d5440393a4c78565f6aaf9b726"
> -PV = "4.0"
> +SRCREV = "984d6d1696ed06626b07cb65ab55d6ae0ece1131"
> +PV = "4.1"
>
>  SRC_URI = "git://sourceware.org/git/systemtap.git \
>             file://configure-allow-to-disable-libvirt.patch \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

