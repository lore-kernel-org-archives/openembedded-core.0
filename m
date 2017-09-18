Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 018AE77BC5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 21:05:14 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id e71so218143wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 14:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xOG4QNm9+qQopVHLAaBGtF0NvzvD1vWmFFD0wL4Zfsw=;
	b=uTekgMJF8MRCA6CHJznWjnRCdGrW53j3v877Cvg+7OmwwAalK/+DRaC6UWpYx0lXUj
	Kd+X9FH1UofMTgcuPnN+i7lQZU5RRJYdds0pkmLmE2OLPP1xt3mXCXKQU/HtZrfG2isd
	m4shCIn9Pd/EngQ43qgqMtAiJD6FzEr3NKS0AsPF6qprxaV6yKguevVVIuSJKrO7CPSA
	jSQ6PvuZ5KH+DG+a83rkfaLhX2owbXxt3wikeeHz3+jyPi6+mrQH9h5q+N6JAXXZ34FJ
	gXEudLhTJDGJKjGZ9pERSM8deANRSwzPU31OiUYcSbHdHfYdbAm9FYQrDmiJu1M/Czly
	Qgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xOG4QNm9+qQopVHLAaBGtF0NvzvD1vWmFFD0wL4Zfsw=;
	b=oInYhw+enWVSVvckAFt8JwFX6uwj2ddktQzWLFTsQUVyWYNs9U7RZVUH4PU2pZS3PH
	BrdBSTytAfuSJLeGZMADYVE/7uKbSaNzf5lP4tnvyXULEIGh8MVPZBc6A1ZkdX8AMYBw
	tG/g4aNkOV2FvwH7KWr2Ka77RWb+xshHC4erqzyyNCz/ef+CzLlGLBS6DvWc7pTJLWBY
	UoIIT+MdbzGryiz4YOuqFqniKW9gtmKSe2nUjArfGGIJS80t7UpPglB+z1QxUFY8jpG4
	1x/JgbcJAnf0WeMknFUi4HwNX/eGGtY0eK+xN4foOGiYloxikf8t7dSwHH7MDZgmSN1h
	fFoQ==
X-Gm-Message-State: AHPjjUgxAC9pbcLvGgCAq6OsGKlPdzmHw8kfmTmJY082KNbG4hRhte1c
	WfyE3PPhhEC1S34KvI8lKz1SWvyPfk3pjc3/c0U=
X-Google-Smtp-Source: AOwi7QAbkTTPhade99750rnVnzx5FJfnSDYlZurWILlmHy4E5ejeHrM5OJcnZx+QnK41STGK13AHjJDlNSikJhVZbeo=
X-Received: by 10.28.43.129 with SMTP id r123mr9693666wmr.101.1505768715719;
	Mon, 18 Sep 2017 14:05:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Mon, 18 Sep 2017 14:05:15 -0700 (PDT)
In-Reply-To: <d8c3aa94-8f9f-2d06-0dac-9c46a1639505@windriver.com>
References: <d8c3aa94-8f9f-2d06-0dac-9c46a1639505@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Sep 2017 14:05:15 -0700
Message-ID: <CAJ86T=XSXk4DGhJqDT4hmKO1BK0y-39rFc7r_codDWf72vAoCg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain / /bin/sh requirement / ldconfig backfill
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
X-List-Received-Date: Mon, 18 Sep 2017 21:05:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 18, 2017 at 12:30 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>
> Because of this, there is no way (with a default configuration) to build
> meta-toolchain....
>
> Investigating further, ldconfig support moved from "USE_LDCONFIG" to a
> distribution configuration.  It does this via the "DISTRO_FEATURES_BACKFILL"
> (introduced in commit: a905df2dd8f43a2febffa64a39b6e508510326a0)

The intention of that commit was only to change the way support for
running ldconfig on the target is controlled (ie changed from an
ad-hoc bitbake variable to a distro config option). It's enabled by
default now, but it was enabled by default before that commit as well.

Did meta-toolchain work previously? If so, was USE_LDCONFIG being
forced to 0 somewhere?

> If I add to my configuration:
>
>  DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " ldconfig"
>
> This works around the issue...  but doesn't resolve the default issue....
>
> So my question is, is this behavior (the failure case) really acceptable without
> telling the user what is happening?  Or do we need to add something to the
> system that says meta-toolchain can't be used with this DISTRO_FEATURE?  or...
>
> --Mark
> --

