Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id AFB506065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:27:24 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so443652pbb.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=x7ewNlAX0Veyh7XfhvEo6vPvFBYhL7i24/9KJLpzxMQ=;
	b=PfUvCn4mo4Bq90MBOBLXWJt2gh4A1nr/KG1cCe1M3zZPQjcTp6n/DviGs5fwYPkYq/
	olBxKTEnn8Zy5LpWo8gCR23ZYW2nHgXzvZfFW1kwZ88llDSAycuojiszALmhCdWt0TQc
	vrJyGe3IYDc+REItEWnKjK+9DEChCjCbnNk131w51qaiSEuZoiY4HPj7xc4t5LfZYDaW
	UtypZupk7u5ePX9jWOrhrSj0b/61uceBogCDVXO72Q8Q8tOwrsMzp+aSX1k+qLppUlQ5
	dzkakFot1HzlT+S1Q1BGsulGlFKetsp3aP4OSaDEu7L1H6t1o7NUjOXOYbCGJPr1AJii
	fWTg==
X-Received: by 10.66.13.169 with SMTP id i9mr8558432pac.212.1369924045937;
	Thu, 30 May 2013 07:27:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Thu, 30 May 2013 07:27:05 -0700 (PDT)
In-Reply-To: <51A75D03.7040601@gmail.com>
References: <cover.1369922325.git.ross.burton@intel.com>
	<9f69a701378d78848eeccd84759014a4afed492d.1369922325.git.ross.burton@intel.com>
	<51A75D03.7040601@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 May 2013 15:27:05 +0100
Message-ID: <CAJTo0LYttBEdajFsRnQ5aN20mRnKdpbixfEp16vNTQS8Gbq2Vw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQkiBqSaW4qycXyhAdyawccR/dBOhO+vZvR5cwQYKQlGnljHxAjQ70Hl/zI2HVrdHPTZYwPx
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] mesa: upgrade to 9.1.2
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
X-List-Received-Date: Thu, 30 May 2013 14:27:24 -0000
Content-Type: text/plain; charset=UTF-8

On 30 May 2013 15:06, Jonathan Liu <net147@gmail.com> wrote:
> Note that the current upstream version of Mesa is 9.1.3 -
> http://lists.freedesktop.org/archives/mesa-announce/2013-May/000051.html

That will teach me for relying on their web site.  Testing a 9.1.3
upgrade now, and also fixing the git recipe that I appear to have
broken.

Ross

