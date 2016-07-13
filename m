Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 32AFA6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:04:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so5645938wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 05:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2jUfw3r1jph105uYluEUIhOQlqeWbfx2QdAJEWENlW4=;
	b=Jz4H1dsUy6oHND/HYPuIjJzM33zQkFeixhLXssijvLafKAC4JjSEOF/dToHmqRMJBr
	/WqcmNmFhBzgWnyPcEn8CZA3Nm3k1/9BymdtWpmdAPXt6SSLkhdnKaLm7da9LtresDLx
	vhUSZvHBGcgcM/bC/KM98662xX2sAVVQkrX2/mMzrxl/M9zQLx6w+84lF4sibJ8kPALA
	9Xte/iRVNEos/2CneBiIEoRD/FEnAgkfb/rg513TwBF+rnEN9+FwalwE+bfX09XZUAwX
	2wxcmMoWaJKbn6USVt30XVNVw4a+1ZcXxvJw9ZD8WP2n5DIi/8Mxwpmm+ms61eeDGpBH
	DLJQ==
X-Gm-Message-State: ALyK8tJ8SMC/5yNUjDFmQf7kPcok7rNwW9y0RUCsOK03X0NeVJB0b/JLmdqgYY2Q5VwS+w==
X-Received: by 10.28.32.77 with SMTP id g74mr9523750wmg.45.1468411474020;
	Wed, 13 Jul 2016 05:04:34 -0700 (PDT)
Received: from localhost ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id ju2sm571401wjc.14.2016.07.13.05.04.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Jul 2016 05:04:33 -0700 (PDT)
Message-ID: <1468411471.23527.13.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jul 2016 13:04:31 +0100
In-Reply-To: <CAJTo0LZnQXU+uFXxi6pYX6Q9-Xb9hM=VtG8m6PEeUL6QYT2G-Q@mail.gmail.com>
References: <1468405152-1725-1-git-send-email-git@andred.net>
	<CAJTo0LZnQXU+uFXxi6pYX6Q9-Xb9hM=VtG8m6PEeUL6QYT2G-Q@mail.gmail.com>
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: backport patch to fix build when sha256 support is enabled
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
X-List-Received-Date: Wed, 13 Jul 2016 12:04:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Ross,

On Mi, 2016-07-13 at 11:23 +0100, Burton, Ross wrote:
> On 13 July 2016 at 11:19, André Draszik <git@andred.net> wrote:
> 
> > +++
> > b/meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-declaration-
> > of-release_get_sha2.patch
> > @@ -0,0 +1,78 @@
> > +From 3fe6c043f5d62710f86ca92692b02f4ffd3bb5c9 Mon Sep 17 00:00:00 2001
> > +From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <ad@andred.net>
> > +Date: Fri, 24 Jun 2016 13:18:52 +0100
> > +Subject: [PATCH] release: fix implicit declaration of
> > release_get_sha256()
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=UTF-8
> > +Content-Transfer-Encoding: 8bit
> > 
> 
> This patch needs an explanation, signed-off-by, and upstream-status.

Explanation and upstream-status are in the commit message of the actual
cherry-picked opkg patch, just not explicitly in the OE commit message.

Do you want me to copy the two into the OE commit message as well?

I've added the Signed-off-by in v2 before I saw your mail.


Cheers,
Andre'


