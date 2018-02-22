Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1C748786E1;
	Thu, 22 Feb 2018 07:55:50 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id q83so2070832wme.5;
	Wed, 21 Feb 2018 23:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ff8v+K70RMtAa9BfHDulbMhcCpN7o//rtPkjX1a5i+0=;
	b=ASmzKr7670UFnDOcjPd+M1XkEzXsI1o2rAUGmtXKGIzjkf9bd0/oONY5r1zH9QDVGo
	1ee31/OCVQxpn96gHec2EonMbuff41SNFB4dOMVfYLpJJYrnQYaw6zaaiscFNkfEOQgq
	iLY45nRQBKIAKy1pzty9PA1n/JqYHxks9SWzPd2TVtXQzLPNEwAZRvWSmX1viF0azTWm
	wOB6csz9d7iy1Me+XyjZeiv2Eil1+3bcDLNhKFCMsrIInso9pwHi+qVHPQQm+kc1J4Wt
	mAkzLNvTc9tPeQ9wnWhfaDXjibQlHBnSLDObnfv6/o/+A2TWuXTCatdGEvguBkF/JHJN
	oDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ff8v+K70RMtAa9BfHDulbMhcCpN7o//rtPkjX1a5i+0=;
	b=XpOPIvriASvsXApb5PVV28VD+sK4nUuS9lvpHP3VamfqP7KfoPymXLfVDT25BhJy5C
	U5e6fj6paw9EK9Ob0WKGSQFdvwI9Hx6NAsRcOIzopaxmdqUrnWecUUXLjf2q030ZZm49
	qqXWZy0zB/iozQxnbSZlHRHGs6NpiDM1XKeQLVtVpS8LNdPMphieIRlavRuDmqjx+Ob7
	NK6Qd7F8XbiBpyl4hVA/2bAy7IIQYtGHnDPxt9zjzHH8PpAJAlBeuIsAeU3P6ydkNFx5
	O7WyhTbUd2kdAfdJtX8T5KckqNhZSQj64v7iiA5unw6hHovXBI/i2NhlXwmhKNk1xrHw
	2Znw==
X-Gm-Message-State: APf1xPC8EjR4kDWhRTV7+zdzYVYqtZHA6A850XrMJCyIL/+SXzyGPwyO
	o7DkJiXDXoISdAJsvRpdPPPmsch4qTYi9j5OKi4=
X-Google-Smtp-Source: AH8x224q4uWloJcCubuVxrbAn909OpBjFLH+cxXNI0oOqjhWIl2EePaTBTGqShjkkrW7S19sWaUXKGgsIhp8SU276bU=
X-Received: by 10.80.143.38 with SMTP id 35mr8039482edy.183.1519286151470;
	Wed, 21 Feb 2018 23:55:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.168.1 with HTTP; Wed, 21 Feb 2018 23:55:51 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 22 Feb 2018 08:55:51 +0100
Message-ID: <CAAQYJAudtnFaY1S2j6FF_pN9B1OJhN-6fEBY8nWCtM73Kx8tSw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] Rename meta-openembedded to openembedded-extras
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
X-List-Received-Date: Thu, 22 Feb 2018 07:55:51 -0000
Content-Type: text/plain; charset="UTF-8"

All,
it seems there is some consensus about reordering/cleaning the
"OpenEmbedded layers".

I think that before starting any cleaning *inside* we should finally
clean up the confusion about meta-oe meta-openembedded
openembedded-layers, etc..

I think it would be advisable to rename the repository from
meta-openembedded to openembedded-extras, matching the
openembedded-core naming schema.

Regards
Andrea


P.S.
One layer of this repo would be the (in)famous meta-oe.
I can't imagine right now a definition for it: it contains old
versions of oe-core recipes, expunged recipes, tools and libraries
needed by other layers (i.e. tslib), etc. etc.
This one will need a separate thread.

