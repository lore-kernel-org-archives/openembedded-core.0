Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id CD8A46A36C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 12:17:02 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id c14so3427863vea.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 05:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sYSstaGL/xbK4tYmzvYa5ByZVfBGBlp7kx3gjOn2AXs=;
	b=Lz5FksTG/V3T6/oaTFluRaZ6+FrfQf1KwTlrI6JlNRJJy8UOirZe0VLcZwIGXIKIS8
	hKZgu1q/3S3sY+oYkPHSkzZ0CtOECIrksh/YflDdeiywMa+SpYJNlCDbUhg+bcpJM5vM
	f5PqcC4mPKyqSo3XkjOG9atzQTjzdDrgXaz8Gl8iaeizOWMcxyXa5czPpfu26y0yYl+9
	ofFbSUDd5yyIDcRPqA77n9tH8XnLsrImlCJNT8dsM9GeZJiOGdtk/t3ySyVcgNG2SLm2
	zWpuHECtQ4hGeoGILkiqIzgG6qiYmhSFCZqqEm5M1OKDytUUlAyrElS0oi9gOq7hYKLA
	KVBA==
X-Gm-Message-State: ALoCoQmqJ2ZVhPwyeKso/149xoN0a1nYF/1suMnKQVw0fMSL2pW67p9ZB4mwXBF/YUFaCUSMcPye
X-Received: by 10.58.108.74 with SMTP id hi10mr17872822veb.14.1378729024637;
	Mon, 09 Sep 2013 05:17:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 9 Sep 2013 05:16:43 -0700 (PDT)
In-Reply-To: <CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
	<20130909120824.GQ11500@jama>
	<CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Sep 2013 13:16:44 +0100
Message-ID: <CAJTo0LYqNZjnuKtp8yJbZ+G7jQhBO1fq04Le=JZd+zRFNWkwmg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 09 Sep 2013 12:17:03 -0000
Content-Type: text/plain; charset=UTF-8

On 9 September 2013 13:12, Burton, Ross <ross.burton@intel.com> wrote:
> I'd always understood the "opengl" DISTRO_FEATURE to mean "give me GL
> support".  *What* that means depends on the target hardware, could be
> entirely software rendering through Mesa or binary HW drivers.

Forgot to say the rationale for the check is the same as the libX11
DISTRO_FEATURES check: a distribution asking for no opengl shouldn't
be building a GL stack, and aborting if that happens ensures that the
appropriate checks are in place.

Ross

