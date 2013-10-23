Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id EB7D26D2DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 09:00:43 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id e15so297289vbg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 02:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sQhPcWNEObAfthsprHPZWPMmIyIhaIr6z2v9zsYqPJQ=;
	b=NqpwIbZPNQUF7zTP1C+h5M7TxeqbhGG66pHHvLblV3Kp0cAzm+wdsUASRPOlbJ3CSJ
	3FnIyOyyAY+mi+eOIbgVpfA7sc4c9sNSPgKL9Y4w8VMWs/KIAJGBiwsnPQXOjIrC+MSV
	L+7f9VoOHDJ+gWRlcZ2btw2PRJLMSmT6FYzgKsVC7iZt5OrY/Qg5nreyVDsxlpz3SZTF
	uaKa9eK+/iYtk2oeG50te6K3afBqqUREcSX1RgVjbXLOszYr7jZnRNOVglhWWmDeghQ1
	0kwdn5FnUbbGM7ujK4vB7W2/JGaO+MSyRmrOdWJ4jwQqYX+hc6p0ArrHYfg3Inyb1SKP
	ekEg==
X-Gm-Message-State: ALoCoQkmy5ZqixIILiAYfktMyWoCjZJ8L1+d8bfkfxID7eaOCCsrgoJZruZRdNnicl0wJryqGMQJ
X-Received: by 10.52.35.20 with SMTP id d20mr5456vdj.33.1382518845096; Wed, 23
	Oct 2013 02:00:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 23 Oct 2013 02:00:25 -0700 (PDT)
In-Reply-To: <CAP71Wjx-yoVSyqONwZsTWe5WNNac2nauCuxTNy81n3Ln5qJTzQ@mail.gmail.com>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
	<20130909120824.GQ11500@jama>
	<CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
	<CAP71WjxEp-LEe7UW+F9vUig4SAAd8vN4hkm3DUgjYvZQ6TSZ=A@mail.gmail.com>
	<CAP71Wjx-yoVSyqONwZsTWe5WNNac2nauCuxTNy81n3Ln5qJTzQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Oct 2013 10:00:25 +0100
Message-ID: <CAJTo0LarVcibeP+x93G1fVVh0xvSs7E3qBY-OHhRnsYL3VzGrA@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Haifeng Yan <haifeng.yan@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: use distro_features_check to abort build without opengl feature
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
X-List-Received-Date: Wed, 23 Oct 2013 09:00:44 -0000
Content-Type: text/plain; charset=UTF-8

On 23 October 2013 09:53, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
> i am still not convinced that we should treat GL and GLES with a
> single 'DISTRO_FEATURE' since they aren't 'equivalent' features. I
> understand we need a mechanism to say if the platforms has 'graphics'
> support, and for some recipes 'graphics' is enough, but especially for
> libsdl this isn't enough since on GLES platforms we don't want
> --enable-video-opengl to be enabled since that is a GL feature, not
> GLES.

I don't think anyone thinks that the current opengl feature is
sufficient but there hasn't been a good enough alternative just yet.
Are you proposing that the "opengl" distro feature is re-purposed as
"OpenGL", and we add "opengles" for "OpenGLES".  Does this need to be
GLES-version-specific, what about EGL, and what about machines which
can support multiple drivers/GPU hardware?

Ross

