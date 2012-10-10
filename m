Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TLxk4-0000jH-CR
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 16:58:36 +0200
Received: by mail-la0-f47.google.com with SMTP id h5so408789lam.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2012 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=NigyFsPGMx2IjXT13B8B2lPX5kEnXZC+hj5uw8ycaW0=;
	b=Q+1XOTTE4ncv3GULd1wfyB+y2OnH9zHixL1RBkoDHMTocgruMMMvUQRb7+ZwIEEOi1
	bmpxfTS9wcH7v7odGscGpCxxR/IbucsVBCAQT2cCFm/UOw1CR/UTMw7ojv2nJNrjF2Sl
	kWDD3QkHnrrcan2Y9uVxQA5JrKPd6i+gSxODMk+3i2iGIHAtXrlV6H9Ho7TCStks7vbu
	khwzSV63AAEicbRctogWoaG7DYux94A6n6rpnYcUBPB8n+Hh/vnH4VKZCJlBN6rw0hT3
	clCLbUHrk3Axizoh8BDRmn/mKaq7bV1IA5bslavyfdEjxitBw3q8VZs1ZmkjmSFoJobq
	jrew==
Received: by 10.112.8.226 with SMTP id u2mr9135722lba.22.1349880327371; Wed,
	10 Oct 2012 07:45:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Wed, 10 Oct 2012 07:45:06 -0700 (PDT)
In-Reply-To: <1349711362.15658.120.camel@ted>
References: <1349711362.15658.120.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 10 Oct 2012 07:45:06 -0700
X-Google-Sender-Auth: YBvJubPlXaEYkal6fgwkBiMBz2w
Message-ID: <CABcZANmacqRHtQACFmO9kEw49LuboBC5w3D2zmuJsZhqhUUTCg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package: Recommend virtual-locale-*, don't depend on it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 14:58:36 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 8, 2012 at 8:49 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The virtual-locale-* packages are provided by libc which may or
> may not have a matching locale for any given recipes's provided locales.
> Certainly, we shouldn't get a failure if the locale package isn't
> available.
>
> This patch therefore makes the dependency optional rather than
> required, allowing the locale packages in question to install. This
> resolves errors like:
>
>         virtual-locale-eo is needed by bash-locale-eo-4.2-r5.i586
>         virtual-locale-en+boldquot is needed by bash-locale-en+boldquot-4.2-r5.i586
>         virtual-locale-en+quot is needed by bash-locale-en+quot-4.2-r5.i586
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This looks helpful -- I know of at least one person internal at Mentor
being bit by this.
-- 
Christopher Larson


