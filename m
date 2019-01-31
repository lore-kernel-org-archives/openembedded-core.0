Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id B272B7C459
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 19:24:09 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v1-v6so3727633ljd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 11:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=f9qmMNL+yDcJzePxfMdiSyYdjDislgiqJDh/cwYx8tk=;
	b=ijDH00zADXI1Hgdur2EdBIy+6Oq2CgKCCHK0T8L2A4rK0pWneO1HTFOGAL7/O57g2f
	m8+Qsulbthl51HZNOVRDvY0KwfiQ/UNfZc3trPrAWFipiFZL3wkEtgia41HmUx18PTlI
	lcZzzTOTRJVYlzxD7Df/JVNDc1jUep8bkq8RHATUgt/gGj0utXXAizMutx1p7ZqRwbzz
	HVKKOlkS3H5Bb0qdqiSzvKOayGpPAttRiMYboBBgsNGcmNUamt4xvTaPxHgXz0EuyGRq
	MHKvOIxxlyJMpuvZfLJtizN9GS4MV09rxR6hu5HHICELCRwr5LLNVMNQ/nUEaybx6vbE
	F/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=f9qmMNL+yDcJzePxfMdiSyYdjDislgiqJDh/cwYx8tk=;
	b=ohj3gs94gNAK1g3msRSuJP5t0ZOWpex4wuqeiHdz5T9Vh41fh7N4r5ue+F6Uymb14B
	cLutdwdXGngULOV+dpNkwZHccC4SnpyatrK6oDwft8soICx5DjedF58/MW6pmwaNxRBS
	o4njkiQ9+6riWsRbwLKwJ65xNBPlld0Zsr66uiaJ4R9mDZm2K0eo/NVmqLCMfbUIQhbb
	6DH70Wo38H0HEdnRBc+yTWA9240s6uPP7yVf+YClC9OR1ZIDYjnLhFdLaJpmcvkCKk2c
	aU3Gc4djHP87jbYFesJB0dRT/ZLN3uYe/PGchUqbciXR63AaUwfakP8HAyg/2R+pbjgE
	JzOA==
X-Gm-Message-State: AHQUAualDmu62EdP0UBHGUsLIGaHZ/6j28WbgdR6CWqae3Y+1bk7Q24W
	4jTZ99MwSUkI/K1USg8IlL3iXJnFQnE=
X-Google-Smtp-Source: AHgI3Ib9mSe+oDCcbEQzcG7zVzsUw5hBhdzMGhcWhVTWm6ea8Niz180OuH615MuULqY+VT+xtwSxfQ==
X-Received: by 2002:a2e:7c13:: with SMTP id
	x19-v6mr6821994ljc.83.1548962649986; 
	Thu, 31 Jan 2019 11:24:09 -0800 (PST)
Received: from skeletor.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	j138sm987269lfg.64.2019.01.31.11.24.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 31 Jan 2019 11:24:09 -0800 (PST)
Date: Thu, 31 Jan 2019 20:23:12 +0100
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190131192312.GA593@skeletor.localdomain>
References: <20190131191532.5445-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190131191532.5445-1-jacob.kroon@gmail.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
Subject: Re: [PATCH] base-passwd: Add kvm group
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
X-List-Received-Date: Thu, 31 Jan 2019 19:24:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 31, 2019 at 07:15:32PM +0000, Jacob Kroon wrote:
> Fixes the following warning when starting eudev:
> 
>   udevd[<pid>]: specified group 'kvm' unknown
> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  .../base-passwd/base-passwd/kvm.patch         | 23 +++++++++++++++++++
>  .../base-passwd/base-passwd_3.5.29.bb         |  3 ++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/base-passwd/base-passwd/kvm.patch
> 
> diff --git a/meta/recipes-core/base-passwd/base-passwd/kvm.patch b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
> new file mode 100644
> index 0000000000..113d5151e7
> --- /dev/null
> +++ b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
> @@ -0,0 +1,23 @@
> +From 6355278b9f744291864c373a32a8da8f84aaaf37 Mon Sep 17 00:00:00 2001
> +From: Jacob Kroon <jacob.kroon@gmail.com>
> +Date: Wed, 30 Jan 2019 04:53:48 +0000
> +Subject: [PATCH] Add kvm group
> +
> +Upstream-Status: Pending
> +Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> +---
> + group.master | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/group.master b/group.master
> +index cea9d60..5b62284 100644
> +--- a/group.master
> ++++ b/group.master
> +@@ -34,6 +34,7 @@ utmp:*:43:
> + video:*:44:
> + sasl:*:45:
> + plugdev:*:46:
> ++kvm:*:47:

I wasn't sure which number to pick, is there a recommended one for kvm ?
My Arch Linux has it set to 992.

> + staff:*:50:
> + games:*:60:
> + shutdown:*:70:
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> index c6be1c1d08..d1aab09181 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> @@ -12,7 +12,8 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>             file://noshadow.patch \
>             file://input.patch \
>             file://disable-docs.patch \
> -          "
> +           file://kvm.patch \
> +           "
>  
>  SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
>  SRC_URI[sha256sum] = "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f64accc55986b6a36"
> -- 
> 2.18.1
> 

