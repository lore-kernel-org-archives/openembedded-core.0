Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SS7iC-0007Cf-5D
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 16:17:52 +0200
Received: by werb13 with SMTP id b13so229460wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=nUEEcleh2isYfzxGhTK6jHIrndb97VycTc08+Prttw0=;
	b=S6Fe3ob2RTzlQbR9PRwx9EZxPKmGGLxX7B/bqEJiBx6l90XcNLHgOwrCwKyVqL/sfz
	pcFW4qwKRVcC5g2q8S7e0dd/m8lV2+fxSpDBqJApsbkHs+DZiKR0pKylL4VafCA9Jvfj
	WKAmBwULWecwSzAOLkdbfH5wy1zZBApAi2tBgtlNxARUcjYWacnkJsFJtweYe5UoZLOc
	d+Aifr/hI1hJPO1wgJS4iJC7VXrwMW4SOr/IiO2Wt2uxZ8uAEkECjb18CveoWolvKFDb
	55i0g6Ziar/Lfj9s20LhBWe/FzhPsKijp72pLjzbWDO2Qx1VxJhLXm2AavdnZ1kWxjPr
	xEqQ==
MIME-Version: 1.0
Received: by 10.42.150.8 with SMTP id y8mr158465icv.10.1336572478955; Wed, 09
	May 2012 07:07:58 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Wed, 9 May 2012 07:07:58 -0700 (PDT)
In-Reply-To: <056CEBF9-AB73-43AB-ABFF-C511347BB8B3@dominion.thruhere.net>
References: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>
	<056CEBF9-AB73-43AB-ABFF-C511347BB8B3@dominion.thruhere.net>
Date: Wed, 9 May 2012 17:07:58 +0300
Message-ID: <CAF6bG8eTT0OPwLdJR1C=Acb+fx0oD4GLmRTwt5qX8Kq5m8Ckpg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 09 May 2012 14:17:52 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2012 16:58, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 9 mei 2012, om 15:46 heeft Jason Wessel het volgende geschreven:
>
>> External distributions based on the oe-core will typically include
>> bitbake in the top level directory.
>
> Really?

 Don't know about distributions, but when I first tried

> . openembedded-core/oe-init-build-env
> bitbake core-image-minimal

 it complained that bitbake was not there, so it seems to be some sort
of default of openembedded-core.


 - ML


