Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f173.google.com (mail-it1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8967A7C096
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 20:37:48 +0000 (UTC)
Received: by mail-it1-f173.google.com with SMTP id z7so8367828iti.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 12:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zkgdwPyWBny6oQVHXD9aF5p/DUSvz8l/j20kufKD8Ic=;
	b=laMetPCDRNnPAWh/+SWkpTSVFA27mTGBSABjzRBOQTSWNz9bD+JnD6gnns8AEJOQJw
	J/iZO8EW/zXDS4Zgh1weL+bcQzZ3AAw6l7NfqKqQa/3jUwt3/BJOBthN0RdmjbUHecas
	yx6utkwImjiIiE9zval4ju1CiOmA5DeWcS8LgCGNnyjVDZ0+7lwSP092fN1NKutYEFHe
	ynHdkJJesRZXxh49QxtlXmkRCLgdsgFEVxlysmyC1bumNsdQvyGkJfxZUd5GYSOVul/2
	9gFyw9bxFJomfnaOGGGl2LNWgGk8XTQtQHCbwrur6vQlLdCpGQn2YX3vayKdIiCS/FCp
	c07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zkgdwPyWBny6oQVHXD9aF5p/DUSvz8l/j20kufKD8Ic=;
	b=H8j4A/xgh+aNT9mZwM8vOmz+iwXiWOH8gDJdKi7Zk/79STBIgAvz5RfhDT1+guhG+7
	fV6xR1Whs2yEtYwBcl6xAKv1S6Hct9tBqkoLPMUxkUrBsNXB+m1c/d64j702VPXcEy3O
	NDfuMO6y4IjQcyrkLuuZZr7aYPb49rbW8sujGwks6I5ZlbxXXbYocPF5FCW1tkNxaP6S
	0Vap2HaT3ZmiTwvu0lduNKvN9YFRAvuOeJ5Vg7i8l79nktVG+0HQUxxDbO/kJlcYps8e
	zB8pT68KVTTgAGjm7csSvK5xEhcWBX5oXS2WzBU7pWKpsgROFO1csacdAlkkMhjlSfnY
	rhbA==
X-Gm-Message-State: AJcUukfb4qCyuW7LSm1dAv2GzPqFRzN6cOAy1fYhO/0WGXQb7ohm1iDU
	BO/2Ak1uYzGmqL2OinB6WJAUYQqDG9z4Jue1SZdYeQ==
X-Google-Smtp-Source: ALg8bN7ROS/fvzykR/8KGtI3d6UZOWWo2iYPmMzSC6wPMm6HuyAIyDP87NEEqsF/x7ueqm0l8c/go8bMaEgiPdAmy+4=
X-Received: by 2002:a02:1bc5:: with SMTP id 66mr2269024jas.105.1546979869275; 
	Tue, 08 Jan 2019 12:37:49 -0800 (PST)
MIME-Version: 1.0
References: <05af53a7-6ed6-9615-be2e-d8c31dbfb321@siemens.com>
	<CAJTo0LbHTnSYrjm6QWGbXFJFj8jUGuk07t6hAhgB8dUnSYkAxw@mail.gmail.com>
	<d2772c25-a1ee-d20a-d913-323784db6933@windriver.com>
In-Reply-To: <d2772c25-a1ee-d20a-d913-323784db6933@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2019 20:37:38 +0000
Message-ID: <CAJTo0LYJyuYgj2MUnKPN8X2JNOK9AGFmDbcJ=-9EjPBoMDDGXQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Prelink problem
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
X-List-Received-Date: Tue, 08 Jan 2019 20:37:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Jan 2019 at 20:15, Mark Hatle <mark.hatle@windriver.com> wrote:
> > No idea why the opkg rootfs code is doing prelink operations when RPM
> > or dpkg don't.   CCing Mark who may have an idea here.  I thought the
> > autobuilder exerised multilib-on-opkg, but maybe not.
>
> They all should be doing prelink operations.  The operation SHOULD be
> generically implemented as part of the image-prelink class, which is where I
> would have expected that copy to exist.
>
> If any of the package types of specifically doing something, that sounds
> broken...  but the generic ones (last I looked) said to copy in the config file
> [if it didn't exist], run prelink, remove the file [if it wasn't there to start
> with].

Note that it's part of the incremental code, so needs to be in the
rootfs code directly I suspect. Frankly I'd love to see incremental
images removed.  It makes promises it can't keep (the moment a rootfs
postprocess command is used, all bets are off) and massively
complicates things.

Ross

