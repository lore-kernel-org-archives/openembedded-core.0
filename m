Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQof7-0000n3-MS
	for openembedded-core@lists.openembedded.org;
	Sun, 06 May 2012 01:45:17 +0200
Received: by lags15 with SMTP id s15so338338lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 May 2012 16:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=JntY8lyzIQOjAMmkrhvDkJBII80eKO90AvXABaQx6s0=;
	b=dszKKqc8siXEA0kYUgM6nN3I6mx1E34qdPFNRVD4NfpZutaBiGTwAHLmeNB1rWqeA/
	rZwNrTos2YpFUvRD+dIEZIhW6XGNbpTKUfNiAa8P/P+i2+xSmtTiCnaL13U8J30pGCLb
	kn+n6LhGUjapLkfSq3fas3FpfVBGvaSDfPKgQ0eu66RurQmNnibeIOzqSu1tj4sTKU3t
	D0Smkq/DmgX8nz0duef6DkSU0PmLdWdtmyu6d8Hf2Udcz/seLsrMFJCiBDFU1TezowXP
	bQdKm7f/3ISHpGRcLn+l1igXzcLncY9bHfudVGg1NsgjrSYIer9N6eXiJRGMOQXKW2Ry
	PfbQ==
Received: by 10.112.103.8 with SMTP id fs8mr5242551lbb.29.1336260929128; Sat,
	05 May 2012 16:35:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sat, 5 May 2012 16:34:58 -0700 (PDT)
In-Reply-To: <CAF6bG8fVsrmqeFZenj=5TihBbYRDD4Jaa6uJcXnPHS7Ru5i+-A@mail.gmail.com>
References: <CAF6bG8fVsrmqeFZenj=5TihBbYRDD4Jaa6uJcXnPHS7Ru5i+-A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 May 2012 16:34:58 -0700
Message-ID: <CAMKF1srhg3CaqQ3g=0bqcFe5u1cfvrcEcNCYepCRmeiRP95fJQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt: update to upstream version 0.9.2
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
X-List-Received-Date: Sat, 05 May 2012 23:45:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 5, 2012 at 3:45 PM, Marko Lindqvist <cazfi74@gmail.com> wrote:
> =C2=A0I'm sending this already in case someone else wants to test it. I'm
> still failing to build image that uses deb-packages, but as without
> this my build failed even earlier and more miserably, I don't yet know
> if the problems I'm now encountering are regressions brought by this
> patch or problem that already existed. You shouldn't put this in until
> someone has confirmed that it's not causing new breakage even on
> typical build.

dpkg is lesser of excercised backend in OE its possible that you are
running into latent issues. This update seems good to me.


