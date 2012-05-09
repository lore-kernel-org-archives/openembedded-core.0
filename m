Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SS7Yc-00074t-SA
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 16:07:58 +0200
Received: by wgbdr1 with SMTP id dr1so293575wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 06:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=JttaaCGCzeor8IZxrZlpWwI0q0mF5+FNDSYHMFl6Lgs=;
	b=Hj2nx1e80eo7Wu1B814kaoRr+kQ2M2k01M3syFfIC6m5xPxqDH/M88keCavNQ/kGmX
	EoShv+IHFdaS3454ZI9kzeYQsfh05jln/z1eBM7qdVfToOm6m5TQUvJ+H7b/ccs/HySz
	w3hYaO9fJrKus68dMFhF9eeDpy5Nf1+w1LS48Efd66h+PXyG1v6g9ZGcxp+APyDNPrib
	pcFDw6W8Y/rRZ6A7IbCbr3dUlQqxz+A7iE3A8G/RA+mghzHlBPUqx34swN1UiAIqim59
	iIuwB77cxpX4lORgi1sMd0+HO2CEtHV7WDLOuJOfuMHbWmJKOTiSq20Xyal6luRNfP6T
	jsbg==
Received: by 10.180.83.38 with SMTP id n6mr38245484wiy.1.1336571886145;
	Wed, 09 May 2012 06:58:06 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm9891657wib.0.2012.05.09.06.58.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 06:58:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>
Date: Wed, 9 May 2012 15:58:01 +0200
Message-Id: <056CEBF9-AB73-43AB-ABFF-C511347BB8B3@dominion.thruhere.net>
References: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmt7d+zXx0W9OapGGFYVWNHPg9TSlHoU8P/6C6J0jPIVArjCiNvDk+dU+TQ1Egu8x8ZKE6s
Subject: Re: [PATCH] .gitignore: add /bitbake to the ignore list for external distributions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 14:07:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2012, om 15:46 heeft Jason Wessel het volgende geschreven:

> External distributions based on the oe-core will typically include
> bitbake in the top level directory.

Really?

>  The idea is to make it easy
> for external distributions to easily assemble a distribution
> with a pristine version of oe-core, add avoid the git untracked =
messages:
>=20
> # Untracked files:
> #   (use "git add <file>..." to include in what will be committed)
> #
> #       bitbake/
>=20
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
> .gitignore |    1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/.gitignore b/.gitignore
> index 04e36c5..366151c 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,3 +1,4 @@
> +/bitbake

Provided we want bitbake in here, shouldn't it be 'bitbake' to match the =
rest of the file?=


