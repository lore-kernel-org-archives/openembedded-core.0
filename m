Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5E01B78DD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 14:18:15 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id y207-v6so21504700oie.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/QsmXdIukDEo8A2TiYVwTKDjo/6LNc7gufFYOsJWrhs=;
	b=lv2dUkRvT+85dALSis99VTUDZjAQ3j35K5c25QEhUfZV2aWIPU7RJnN0OtW7uZlc6B
	IY4KEWEdp2DMXW+KyhmQOqWTovjR8RAu3Lh+tB5jQwSJkWLkGgwj8J1kx2LdJNgOjvVb
	yNk2FXm7IpIm9MswqW1u+0BMJIWlZW1SiBJMsnIWcKu+tvl09GxdtvS1eB9bH+4tKoy3
	dGmPjILTjvgDYl/Vb5R2dyIEdLc6QAbkXEvZLNZh55VJaNCuanvPkSkuXNzkl41OBQpg
	0iTsRS02f9VH23mjGz9IFmFk/xVfz5FrnxKnEWS42eeIip3sxLt7Yw/JE/NPCFbeJ8n5
	XJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/QsmXdIukDEo8A2TiYVwTKDjo/6LNc7gufFYOsJWrhs=;
	b=niqQB+QYIobtnH6EGug0xkE1nu4MAROl+HbngrjvuDBLI8+SkUC9yhzTAziU8j0VQB
	t9+LqN3zJCoRuU/MFHNEkaOmelAV23AfqZBJLLYydkf3TXPQ0ZDSBuvEGa62nxOsd+RP
	GQbE6OzdbOOBbrh7h3MTMfp23Lr0ybdL7OziX6MqZ5zXcywOtGxV12y6EYJmIE3GHfct
	caPB3Imqhb7bs5ydlTFyMJXtO7MRg8vRabV9EAzdiWSEO911Smub564q4czkPaZHTnLc
	qHOwbTGAus5aU9xYEcEdnzqwTljp0cMyMTPH1aFCRkRWXg/CizsYVpLjmew0ZQdKTReX
	mflw==
X-Gm-Message-State: AOUpUlHJMeVYDq6RRlyqTeGhzOEdKfNc1MCxPy+b93E1762nKoa464bX
	Ntn4kWkAmP8ClXHaZLY9RnO9S4s+6Cg0+7oQOlapmw==
X-Google-Smtp-Source: AAOMgpcO4At698L7TH/7nhZcKXZQA42molCUC7XK1XJdrLS0QHu8WFkLz2GXbGzO6JSSuEeCSZEiakZ8ZOvqgPcA/6c=
X-Received: by 2002:aca:b256:: with SMTP id
	b83-v6mr19233809oif.235.1532960296289; 
	Mon, 30 Jul 2018 07:18:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 07:17:55
	-0700 (PDT)
In-Reply-To: <CAFeBWL4qPSzB=o8BicxhpW-xwi4BQhBFQPuajx5A0GA=X=znYg@mail.gmail.com>
References: <CAFeBWL4qPSzB=o8BicxhpW-xwi4BQhBFQPuajx5A0GA=X=znYg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Jul 2018 15:17:55 +0100
Message-ID: <CAJTo0Lb+KsKi2fKwEJx-KbDmbTnCPVwwNaM0M0-mO3G2xOeDeg@mail.gmail.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: devtool add recipe with no srctree / fetchuri?
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
X-List-Received-Date: Mon, 30 Jul 2018 14:18:15 -0000
Content-Type: text/plain; charset="UTF-8"

devtool add's primary convenience is how it can examine the source and
write the LICENSE correctly, the correct inherits, etc.  If you're
just going to install a few files then just write a recipe from
scratch.

Ross

On 30 July 2018 at 15:10, Adam Lee <adam.yh.lee@gmail.com> wrote:
> Is it possible to run 'devtool add [recipe-name]' without 'srctree' or
> 'fetchuri'?
> I just want to add a simple recipe with a few files to be installed on the
> target file system.
> I can directly add a file in my meta-layer, but devtool is probably the more
> correct approach.
>
> Adam
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

