Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E0AFE71974
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 14:16:29 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r126so3996124wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 06:16:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wQYIBox/2LCwkubtjfxSpv1jt/c/95KZP67sYHaFMkc=;
	b=Yw9kZKYaoGyQu15MHXbdDf/hGihfK0eLbFn7+BTn0p8NblaW3NblCd2IlIuo3gyIsa
	v8PEnkhvsSdcJa+6cm+LkpKquqqH/w0IP06J1QwbyQzrxCPgi+10N4C+AzJrxi58XaBd
	gck7/m4MDkPPsDNDYUAGIbpQHI7yiyvz0sEZeNGy9u9aQqqBc9BeQRlIxH2AwTaSp2qL
	WUyx/gThBmdc3wFmPti96Fz0y4Uko8THZGs7squwAc8n11VtE/pxwqieTQwaM3D2mYLh
	QEK26LBZ0nhS+39q930WHOLeYAAUyaLSwuqlBa0dTzRh0+eb/laJqu965ZoCeUYIFR21
	rp+Q==
X-Gm-Message-State: AIkVDXJKRSbdHOOq60URZqkl1FbUb8rhkui0Yv2ak8Ow039k0QPqH8Qr2uaD+KWnJCoW7A==
X-Received: by 10.28.152.79 with SMTP id a76mr8129152wme.16.1484230589300;
	Thu, 12 Jan 2017 06:16:29 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id d64sm3427925wmh.3.2017.01.12.06.16.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 Jan 2017 06:16:28 -0800 (PST)
Message-ID: <1484230587.7594.30.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 14:16:27 +0000
In-Reply-To: <b391d833-f6fd-13d6-209e-03c3cf406248@linux.intel.com>
References: <1484167889-3198-1-git-send-email-anibal.limon@linux.intel.com>
	<1484211839.7594.16.camel@andred.net>
	<a2754fb6-0fda-fb36-eb3e-7f9ae50fd8b2@linux.intel.com>
	<1484229650.7594.26.camel@andred.net>
	<b391d833-f6fd-13d6-209e-03c3cf406248@linux.intel.com>
X-Mailer: Evolution 3.22.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Thu, 12 Jan 2017 14:16:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-01-12 at 16:06 +0200, Alexander Kanavin wrote:
> On 01/12/2017 04:00 PM, André Draszik wrote:
> > On Thu, 2017-01-12 at 15:47 +0200, Alexander Kanavin wrote:
> > > On 01/12/2017 11:03 AM, André Draszik wrote:
> > > 
> > > > The patch 0001-target-mips-add-24KEc-CPU-definition.patch should
> > > > also be
> > > > removed, as it's been merged.
> > > 
> > > Why is it applying without error?
> > 
> > Because the context doesn't change (at all), only line numbers.
> 
> So the patch is incorrectly being applied in the wrong location?

Looks like it. I'd say you'd have two entries with the same contents next to
each other in the array after applying the patch.


Cheers,
Andre'


