Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id D9C9860097;
	Mon, 15 Jun 2015 11:53:10 +0000 (UTC)
Received: by pdbnf5 with SMTP id nf5so71657164pdb.2;
	Mon, 15 Jun 2015 04:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ofBYcWAABMgHOwDTX+Jy28p4Rsm/VmxyiQY3Na9+Ebg=;
	b=Uyl9KSWQ/pdX8+JK6+cDqbgTXh/UQXNsFjIXY7fiFlLO/qeH1iCkqbiKCwhqGU08up
	yvx2q5xvWsUOk10Flf1f83VnWIafwJ0K2+XZB0got7hTnEACgkZeZEFyMjqpPQa6pi8K
	PuE87oyNhGkHl2yJCH6EG5ijQGP6FBbwMKOrlHTd9j1drAHXi1yQwehHbKCARm8PCHBA
	sWeJnESsKGQLZF1p70PuN5Miw1RwDjvhQ/mjPBXexe2g068Op837+9hPIMpVLaf88c4i
	hs/ZwWbuljpO/cZBMu1hVXQwhj6oLOiDpWU3Ig69agw6joOTaQh0oSpsWnW+ucxmKJU3
	dJmQ==
MIME-Version: 1.0
X-Received: by 10.66.233.232 with SMTP id tz8mr47318643pac.77.1434369191925;
	Mon, 15 Jun 2015 04:53:11 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Mon, 15 Jun 2015 04:53:11 -0700 (PDT)
In-Reply-To: <557E9EFE.1030703@linux.intel.com>
References: <557E9EFE.1030703@linux.intel.com>
Date: Mon, 15 Jun 2015 13:53:11 +0200
Message-ID: <CALbNGRS9UWjVQQh8POPc5zVYOeYa9VaeC7dEfzH3AMs4k9Mjzw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Webkit-gtk will be updated to latest upstream; midori browser to be replaced with Epiphany
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
X-List-Received-Date: Mon, 15 Jun 2015 11:53:11 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 15, 2015 at 11:46 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Hello everyone,
>
> I've been looking into updating oe-core's aging web engine/browser combo,
> and want to give you a heads up about what's going to happen:
>
> 1) webkit-gtk engine will be updated to latest stable upstream release
> (2.8.3 which is providing Webkit2 API and is a Gtk3 port)
>
> 2) midori browser will be replaced with Epiphany browser from the Gnome
> project. The reason is that the latest release of midori still defaults to
> Webkit1 and gtk2, a new version of midori is in development, but is a major
> rewrite with no target release date and is far from ready at the moment
> (from looking at the list of open issues).
>
> The downside to this is extra bloat and dependencies, but I can't see any
> other way we can provide a modern client stack for the web. Having a browser
> is important nowadays for any kiosk-type device with a touchscreen, because
> that's how UIs are written.
>
So we are loosing last working browser around - what get's better
except later is greater?

Andreas

