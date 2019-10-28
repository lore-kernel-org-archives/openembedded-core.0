Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0E47FA47
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 19:12:06 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id 70so2295921vkz.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 12:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x9FidVOamIVg7iYuvilnh3XPJe+i2NTc6RgF1p/g4Wk=;
	b=oFuFookTpFfc6zvoCMdOkzY9bTzzt4U0BTPR8KpEFn8nJN8cml+hFiTA7BUvgSJMRp
	bPsjPrsRLX/GsQEye7iMJtg2i9C9worY02EvCINhk6IUIw8YsHZAp8zFbHmTAfmTS4Ad
	sWj5E8YF5HIIpa/QIHdwAG59KC9HnOlquj+CQCFwLnvlDyVbJ2w9XXEzV5lnjeBoJLoG
	X3bRcNjw/EkJ7sGUdQULAGSgGxDtnuLfbfYLMCRp/uWNFxEgpRE8aR+wHwS7c4mnGpmV
	8KaaaVVg4sG2mPGNsPEhsJTJA0XRZHbchSWtKksFtYXUQZgRAg4E6DqDon0v+McDFF6P
	kNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x9FidVOamIVg7iYuvilnh3XPJe+i2NTc6RgF1p/g4Wk=;
	b=ka9iRZ9WUr1Ie1vcaDAZutKx23R/91dlmUzY6tA1m7arx008QtdD/th6UjA8U1JCpe
	xMSEwl0uLJO7Ne1r8+Nn+dXCJyGj3dCJSnDgzSHSIqww9pRPsVcWDLbpdUnx6HKddeUM
	BN5DsdpBbs/xptYnj52+EElyK0UKaBd0P0+oWJhdYjtbhhtQa3RR8oXtdiXUk8hfEJfz
	Z611spbHu7lv4btor54NWqQ4fYD7eee8gcuni3XQ6TgvfiowYB0ei/IB30Dq/aq/YAJZ
	3Sa83X35dsmrkE2+Ci+y4m6aTR0EYuyRjjtOEb6TpbGKT+95TQEUKW6PRjwue2nyC0Ar
	uHOA==
X-Gm-Message-State: APjAAAVxnJrHhYBvJoWLnTCR10mMN7EzyJt+jsv69swB5N4ECD9b15sO
	jaC1aAAssZ+3zw738zDGz+MzSirBA4hl6uWJXXBN5xvq
X-Google-Smtp-Source: APXvYqyC9ISuGZ3juz/vwgBHypNf+dX0pXpfrliHqs/aIm5EodlRQrAfdzjNcGrv61+AAYQIzNKFw8g+7P8ACZ20IGY=
X-Received: by 2002:ac5:c9aa:: with SMTP id f10mr9346741vkm.52.1572289927712; 
	Mon, 28 Oct 2019 12:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191028171449.8489-1-frazer.clews@codethink.co.uk>
In-Reply-To: <20191028171449.8489-1-frazer.clews@codethink.co.uk>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 28 Oct 2019 12:11:56 -0700
Message-ID: <CAJ86T=WBz6OkPcOLWH2gyH8JGnC8-d2-9=TE8ThtjeD4rE+ssg@mail.gmail.com>
To: Frazer Leslie Clews <frazer.clews@codethink.co.uk>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Bug fixes for makedevs.c
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
X-List-Received-Date: Mon, 28 Oct 2019 19:12:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 28, 2019 at 10:15 AM Frazer Leslie Clews
<frazer.clews@codethink.co.uk> wrote:
>
> fixes a few bugs in some print statements and an overflow bug with usr_buf
>
> Frazer Leslie Clews (2):
>   fix format strings in makedevs.c in print statements
>   fix invalidScanfFormatWidth to prevent overflowing usr_buf

Perhaps fixing these issues would be a good opportunity to align with
the Buildroot (ie upstream?) version instead of diverging even more.

  https://git.buildroot.net/buildroot/tree/package/makedevs/makedevs.c

>  meta/recipes-devtools/makedevs/makedevs/makedevs.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

