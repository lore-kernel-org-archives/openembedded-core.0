Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4626A6B7AD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 12:01:17 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id uo5so6433240pbc.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 04:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=NAn84pvrIGWBkKuA9q22uAA/Il9ZcIg/H3hdTFBkwv8=;
	b=X4tGklPsov4037gP+RW+JC2afaINzXqwvJ599OG7x9RYt7YsX1fL+O4JbrlS35+TQg
	FEzBkh23jEUWxxw4OwifJHouYHm4wofq71TrHG4mEeE3k70Sn8J/LU2kwbxh4EZQlA6H
	q/IBq7wbr0j90UqkymQxxUuapJSf50+PMkU6npVkGB4NdJVLk2Np5lj+inADpKevTTPl
	QM/yyiSPbvl+xBewkbjCEOl7ViToan4bBD+J2qjXtWcerzGivPJLtCprdPZUkghYPSmi
	bPoRi9tAjZzKP3uXCfsWQbQjnRDRtSP/tqBazFD8E84FOrJHVWXIg7cHfuE2nVxXYbEQ
	YkvQ==
X-Gm-Message-State: ALoCoQnzfMomwQbRaDmZioUpd2DNjlpJ8i7g+mXMzF/tg6MKZEcxthJl33oy8sWav/LMnd1VRPBB
MIME-Version: 1.0
X-Received: by 10.66.49.74 with SMTP id s10mr25044729pan.0.1393243278773; Mon,
	24 Feb 2014 04:01:18 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 04:01:18 -0800 (PST)
Date: Mon, 24 Feb 2014 12:01:18 +0000
X-Google-Sender-Auth: ivazKjAnyQoBw1PsYJXhcugulE0
Message-ID: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: No versioning for existing images
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
X-List-Received-Date: Mon, 24 Feb 2014 12:01:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I was wondering why existing images would not have version numbers
attached. Say, we have a core-image-minimal image, but from the
recipe, it is not possible which image version it is.

Perhaps, it is just my ignorance and lack of understand, but for the
moment, it seems to be an important information for e.g. distribution
vendors and image creators to have an image version and the
corresponding packages and versions attached to that particular
version.

It is easier to do a software upgrade then if you wish to do that
based on the information of a certain image variant. I mean, it will
lead to more manageable and reproducable images.

It is possible that I am not aware of something important, so please
enlighten me. It would be nice to see how other OE users do a system
upgrade.

For instance, the MeeGo Nokia phone had a software version information
in the settings, and that is something I would personally consider as
the image version, but again, there might be better ways. Please share
good practices in here., or alternatively, feel free to point me to
any documentation, examples, etc.

Cheers, L.

