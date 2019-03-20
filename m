Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8D2D67CEA2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 10:15:39 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id z124so31636406itc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 03:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BOEDiwK1mOSVUDYP6Zr7+QPlGGMRZX9Q13nTnOkhPkk=;
	b=2Nq1z6a8wzMMxSBNAScfvNP0a4OOyQ5svo7u/WpPeKt7NagYKueT4lng7G4yWYhTSK
	AqvFxSJ77SEfyS1v5mLi3m0XK+4j4m6LFaZOL4dlCQ2cT/f+a6RTaqcoDf3QtF0rGCjo
	WBuFYfX7YJJzn3cd4vRYwobKbR06VNNcqI4OuEJo69QBr2K7jpyVuTuZhory77e5fIV1
	mDkauFDa/sTutcLNikUkSVxe2Kw/nENmMA2EnfV8VuZiiFrXfmYf5oM2v8A96WXR0+aq
	FHZCL9B4XbABR0BlZAE45E9N9uGTUYXVRpjGDzTwL+1iU7T8OHz9pnehVoF1SNynLoNz
	CKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BOEDiwK1mOSVUDYP6Zr7+QPlGGMRZX9Q13nTnOkhPkk=;
	b=Ek/3wL2cYQiroSGeeV2zJX0wH4X5efDNwhc4b6umm02nNeQHJrKWJuGN2+9paBMzmn
	a0YXzDuWSSkQjNElZAAnYkjhL+TfY90wEnCHlCN9T5mNT2wcTwFRpYyBSZMWgqalI2ms
	a/uLLufTEG2ZsHwjTz1aDAFrb08UdWKGLQTFC5WS+G8DTauLcWC9QttxE2uqqAdqJRsc
	+OTkrCTThIMd1Dz4UlF3QSbJpxDulpITW7r+FFyDdYPvFYrM2VW+z5ssFDXZwlyhmM5h
	mnOLx01uIhSBe5YRNkRN+kEs9/aTIyNawSNqtRCMKCFp758mteNqervO2jYfoJAUaGcD
	RxXg==
X-Gm-Message-State: APjAAAUbSKRrrHWK0NybL9Q6r7rgp1kaX/t1uYNhTNyoWRUeeUHLjVOQ
	3kP0IXbZF2cKEIxL4nqjKTkMYI2E48wff1ALR2ywdg==
X-Google-Smtp-Source: APXvYqwx5WYHPiDkWUCXSYlOduEDZBD4qBmH9/roRUcyNto50ZabhKAN9nyWkPXrnZXo1Vp7VmSsS10YT90KaiQ4k1Y=
X-Received: by 2002:a24:2405:: with SMTP id f5mr4520531ita.130.1553076940325; 
	Wed, 20 Mar 2019 03:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190320093929.28688-1-lu.jiang@windriver.com>
	<20190320093929.28688-3-lu.jiang@windriver.com>
In-Reply-To: <20190320093929.28688-3-lu.jiang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Mar 2019 10:15:29 +0000
Message-ID: <CAJTo0LaLGSYRXyB_id+wFvTT6fSNjn109rqQhaOOKuUQ_M9hiQ@mail.gmail.com>
To: Jiang Lu <lu.jiang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] libsoup:enable libsoup build as native package
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
X-List-Received-Date: Wed, 20 Mar 2019 10:15:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Mar 2019 at 09:43, Jiang Lu <lu.jiang@windriver.com> wrote:
> +BBCLASSEXTEND = "native"

Can you test a nativesdk build too, might as well add both.

Ross

