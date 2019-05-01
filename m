Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2857D9AD;
	Wed,  1 May 2019 15:56:06 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id v10so14156056oib.1;
	Wed, 01 May 2019 08:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=tCHWP5J6VLdz2XwePBuWzlcBa52OX2EZBEDZMIQZgks=;
	b=R9aAxBcTa09RvE579GMWDjWJd5RogZQh/bZZgg7KP87gsxbdCrh13t/vE5mGIYdtP8
	AfqTdRbcHu/U9s1+9RLOELLxOJNQt6uKF79EfLFkBNER/uaqAqDKVlFWkciS0RWjJrHR
	g1JRvakIs18q1MpRMHZsY6GbkJvIwDoQ6HoWL/s8QZ6ivUcritC8/QG1p8qSwDpayYcq
	sxftkc2hTdlLg+aJ9se/JLAA+Aga0yi/F+0pchKp6L7tn7vA3rIUVtjE2mjkYmPX0Url
	3s2/LQu4TGhbmNpbuY+sMvaQWdS/JlZMSG2iSR7/xSzngmaCQIIcCy4YA8cQwch7noXL
	5Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tCHWP5J6VLdz2XwePBuWzlcBa52OX2EZBEDZMIQZgks=;
	b=mjNEGhZUWaxtlpjJvkKHAnL4hl2yk5d1k/mU3h4icNtSuIh8+wtWZAKntCltl3GYVz
	DYQZRQkoOcGzgTe2qR2ODwFHoCtKlK6bQV19VkW5wWKiCJgiasVuZfrzWQImaj+hf1+G
	CyyvItBSqjM0Z9Y7aLFy+slMduMyiyJl8/wnUK4xME36+GcTfBim3Zk883tD9ZKxvud+
	xefESA4B02UEwQoihnB0RP4Au0abNBSXjHz2q7wzJNpxYP7JeswdyF0haIkV2Msac72o
	kpn1HZR8nrpyPCqE5Q6NO/bQgnWnx6Ifdl/y+Px02lf3nX29h8PoV41Hb6JHAQTRfbmK
	jcHw==
X-Gm-Message-State: APjAAAVe0RW+MTIu+KGWRcWS9ShTSqnMlAGcvnpxucHde9ncK3cdQ3st
	79jBsDingqmZA1unsqZDekM=
X-Google-Smtp-Source: APXvYqyWXgroJ1WjpimUE6qN8w5BJ10schY7pzSxAISWgYRabLXIMruh7Dsvg5UVJLB/Ty6vuxjLjQ==
X-Received: by 2002:aca:5f88:: with SMTP id t130mr7269637oib.19.1556726167346; 
	Wed, 01 May 2019 08:56:07 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	j96sm661619otj.62.2019.05.01.08.56.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 01 May 2019 08:56:06 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <6b2775fcf074d183a37a6b8c83292ee019360653.camel@gmail.com>
To: Tom Rini <trini@konsulko.com>
Date: Wed, 01 May 2019 10:56:05 -0500
In-Reply-To: <20190501154818.GZ31207@bill-the-cat>
References: <1556722320-17827-1-git-send-email-akuster808@gmail.com>
	<20190501152748.GY31207@bill-the-cat>
	<f3d54ab2a6c9fd0f452483c86b4a1f84d31a8420.camel@gmail.com>
	<20190501154818.GZ31207@bill-the-cat>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [warrior][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Wed, 01 May 2019 15:56:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-01 at 11:48 -0400, Tom Rini wrote:
> On Wed, May 01, 2019 at 10:45:03AM -0500, Joshua Watt wrote:
> > On Wed, 2019-05-01 at 11:27 -0400, Tom Rini wrote:
> > > On Wed, May 01, 2019 at 07:52:00AM -0700, Armin Kuster wrote:
> > > > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > > > ---
> > > >  README                      |  2 +-
> > > >  meta-filesystems/README     | 12 ++++++------
> > > >  meta-gnome/README           | 10 +++++-----
> > > >  meta-initramfs/README       |  8 ++++----
> > > >  meta-multimedia/README      | 10 +++++-----
> > > >  meta-networking/MAINTAINERS | 32 +++------------------------
> > > > -----
> > > >  meta-networking/README      |  6 +++---
> > > >  meta-oe/README              |  8 ++++----
> > > >  meta-perl/README            | 10 ++++------
> > > >  meta-python/README          | 12 +++++-------
> > > >  meta-webserver/README       |  8 ++++----
> > > >  meta-xfce/README            | 10 +++++-----
> > > >  12 files changed, 49 insertions(+), 79 deletions(-)
> > > > 
> > > > diff --git a/README b/README
> > > > index 7318f09..881115e 100644
> > > > --- a/README
> > > > +++ b/README
> > > > @@ -1,6 +1,6 @@
> > > >  Collection of layers for the OE-core universe
> > > >  
> > > > -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> > > > +Warrior maintainer: Armin Kuster  <akuster808@gmail.com>
> > > >  
> > > >  This repository is a collection of layers to suppliment OE-
> > > > Core
> > > >  with additional packages, Each layer have designated
> > > > maintainer
> > > > diff --git a/meta-filesystems/README b/meta-filesystems/README
> > > > index 87cb685..d9f07df 100644
> > > > --- a/meta-filesystems/README
> > > > +++ b/meta-filesystems/README
> > > > @@ -10,30 +10,30 @@ Dependencies
> > > >  This layer depends on:
> > > >  
> > > >    URI: git://git.openembedded.org/bitbake
> > > > -  branch: master
> > > > +  branch: 1.40
> > > 
> > > I may be starting off on the wrong patch here, but, did 1.40 or
> > > bitbake.conf ever get patched up such that rm_work doesn't cause
> > > world-rebuilds every time?  I recall when digging into this
> > > before
> > > there
> > > was a "maybe if we tweak $something it'll be happy again with
> > > this
> > > older
> > > bitbake".  Thanks!
> > 
> > No it didn't... I seem to recall looking at it and it wasn't quite
> > as
> > trivial as I had assumed but got distracted; sorry about that. If
> > we
> > are still wanting to make oe-core backward compatible with older
> > bitbake I can open a bugzilla. 
> > 
> > For reference, here is the discussion: 
> > http://lists.openembedded.org/pipermail/openembedded-core/2019-March/279724.html
> 
> Please do, as IMHO we need to either fix the feature (rm_work +
> sstate
> equivalence) or mark a newer minimum bitbake version.  rm_work +
> sstate
> cache is part of the back-bone of internal deployments as there's
> never
> enough disk space and also never enough wall clock time.  Thanks!

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13314

> 
-- 
Joshua Watt <JPEWhacker@gmail.com>


