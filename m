Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id 117557ED17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 20:37:41 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id f4so47923406ioh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 13:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=cPDegesFKOF14fHWvXJWO293w29aPKJUAmrm2tHRAmE=;
	b=Nc2q/C4gVzWuFnbqeB731tSiXj8+PRY9Z+qgQW47kgBNsjY8GJHCknBbYpBV2ux1km
	+V/VeMs6T3oveG+WPLMVKou6qlIfGX5eUnBGjsg3RZDwqOKWuE2NH/v1lw2bQDSCBG2i
	HdUD7tFYCoad5dFUZxCBdSpnlk/QGt9caZ60FgOKKBMA1EzDSCU2usPh83wxEL634eEw
	qgtqvQ0DNTrVAi5igPfDN3VJt4vOYrYTbQG6+aS2NJIlm9lcWeYWuMEyT/o3FL+REYBD
	gWLLKFgIX7KzaswN54CXkIOA7amI8d9rZ16iizNd6pzkcxa0t4EDzIHvSSGIOfqoBi+C
	doMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=cPDegesFKOF14fHWvXJWO293w29aPKJUAmrm2tHRAmE=;
	b=C1+SJFZhoRGXxJ9TYqcETbVNvul94MnsFoCIh3TgGXy5oWOOA2+mXpqYIVAKZlGdmM
	l4/bkJf+PP/8bxCSCFv8137xorBqe1LRNsHKs29WZxJNksk5clrqdzAryMMtsiOkStED
	mG9FIJR8MWz5n5fOJqbkPI3biktA+Kk4Bh8MJ6jzN/+TfyK//4zaaSqhNE4zzbR/m9j9
	9ZaRXmhC3LKEXBWMRZratphT4jHsEYuaGumWOYq2cTi8N2kgIlHNW4g16IAG9eESfB2U
	5j8wDWkDyb6I7KSJOyUq6fN7gKRJd37xdjC9oexsd3xybnnyQpV6DkWAtOZwR+aYWarO
	+y9A==
X-Gm-Message-State: APjAAAW19+1bkBIM9rb4LbZA15XFq6oMZFbO03vwSkE6rr0FxcvKlx9R
	8yyZIdoxeMHdfAwlmcSuVeKj/5TzpZG7NuLvnf+17w==
X-Google-Smtp-Source: APXvYqz/0FiS0po3PIoZpcPI3XMBRuJb7VAnkEpZ3gxsiy4e9l7YP98qzWHM3KIqNSs+j2sffmajlPaRYyoIqwktHno=
X-Received: by 2002:a5e:c744:: with SMTP id g4mr37533006iop.187.1563395862880; 
	Wed, 17 Jul 2019 13:37:42 -0700 (PDT)
MIME-Version: 1.0
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Jul 2019 21:37:31 +0100
Message-ID: <CAJTo0LaOHbSB75OGLsHJ3Vxd5eVgg9+7Cq3k0=P-BwPLpFiyjg@mail.gmail.com>
To: Yocto-mailing-list <yocto@yoctoproject.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: RFC: dropping official support for Debian 8 / Opensuse 42.3
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
X-List-Received-Date: Wed, 17 Jul 2019 20:37:42 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Now that both Debian 8 and OpenSuse 42.3 are end-of-life and no longer
formally supported, we think it's time to drop them from the supported
distribution list.  Initially this involves removing them from the
SANITY_TESTED_DISTROS list in Poky, at some point during this cycle we
may remove those distributions from the Yocto Project autobuilder to
add more workers for other supported distributions.

It is expected that the next release will probably work on those two
distributions, there are no plans to do new and exciting things
dropping these unsupported distributions enables -- like increasing
the minimum Python version to 3.5 until after the 2.8 release in
October.

Please, if this impacts you, speak up now.

Ross

