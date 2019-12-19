Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6437FE10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 06:16:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47dhV965mwzQ3;
	Thu, 19 Dec 2019 07:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576736210;
	bh=BzBfBcBcanAp9c1GT0LdslaxYYE9CfobvGcEMnQsb5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZ89mHN/gF4R3E4+GdgsDxmpt+8r6r8NHnTO2PU4xj6m++87xBkZn1N7E3OZpmXVB
	/j94QlXHq1pE+ESDPs7v87llK97ckeDXtFKQMm8B7UWaQOgoOvAw/6F5xXw2SwuRQ+
	fE8YAzV/6td7TG+uCy9jibSqRTf3gEWUdeoAzVHXxKKQpRemE9y+8/OcpzU6fJsbYY
	kng+JaNkJwTF8Hu4P8UkA5MwiyOxCme78JZijEu/Vn48xBqoiszMIgw0ckbUpqBc9n
	Wts5ASaol6q37i7RiYsEdgQCz1JH7SEWj3hoJ+8RmXfhww/JDhqIM3IVScRrWU6ild
	zhiardUO8EC3YlewzsQDPNuuSJ4DOXJ36HL6b070JgTY4PWRJapPV5KmHvP/ul+YLo
	4Kc1lDRJSz38xkdkgcyXD9TtHs75Lfy/ofFHIJE8rSHWd5OMSQtfY9Z20tHt3C9a1i
	vP4XuOGTP5BzpPlnjEeXStfroKxci1Cy+DRa5aAraRw1y0o7vEJ8UFX37y/9b2mat8
	+0pf+IehYs7Ddgq3yCNP5T8bZotzS0djrW1FIAuxwF6Xw/0cvKuhzk7j3tCZXwQWYf
	T7GSombbLO6YMYNRaQTPSc7s+LaSmauSGeljpce53gSZxqkdga7Tk8qyUKat7G/J2a
	DKQ2CB1bgaK0fWHm+FvVouFc=
Date: Thu, 19 Dec 2019 08:16:47 +0200
From: Adrian Bunk <bunk@stusta.de>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Message-ID: <20191219061647.GB24309@localhost>
References: <cover.1576733575.git.anuj.mittal@intel.com>
	<509b450af8d1e4c25ded53db18524d669ecd834e.1576733575.git.anuj.mittal@intel.com>
	<20191219060153.GA24309@localhost>
	<dbe34e0d561707fdc40350bab67685f8bf7d2da9.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <dbe34e0d561707fdc40350bab67685f8bf7d2da9.camel@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] libtasn1: upgrade 4.14 -> 4.15.0
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
X-List-Received-Date: Thu, 19 Dec 2019 06:16:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Dec 19, 2019 at 06:09:40AM +0000, Mittal, Anuj wrote:
> On Thu, 2019-12-19 at 08:01 +0200, Adrian Bunk wrote:
> > On Thu, Dec 19, 2019 at 01:41:08PM +0800, Anuj Mittal wrote:
> > > Remove backported patches and explicitly pass -std=gnu99 to native
> > > CFLAGS
> > > to make sure build passes on older and still supported OSes like
> > > CentOS 7.
> > > ...
> > 
> > -std=gnu99 is default with the ancient gcc on CentOS 7,
> > you could pass -std=gnu11 to bring it to the same standard
> > as current gcc.
> > 
> 
> info gcc for gcc 4.8.5 says:
> 
> The default, if no C language dialect options are
> given, is '-std=gnu90';
>...

Sorry you are correct, I got the versions mixed up.

> Thanks,
> 
> Anuj

cu
Adrian

