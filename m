Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id D5C5660424
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 20:31:41 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id o8so747428qcw.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jul 2014 13:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Y8ozU637GH6wv8wF4Cv4gS3uZupYo2bh2OfYrjMk5ZI=;
	b=BbqbxC/YL8y+fqO+Dcp3JXnpzgUk4Vj5GnUTvS1FZOX+b9Dqva1Mhsu7zhjbGpiMk5
	CLxRwqKSwn4SRpseGI27k4sSdEQ/B/gtkafNh2Kp1rsqrM2UlTSBbJuAUvLXpHojEHEt
	VnpCelb7+u7bk/D1B1a3NIBiRDog64pje1bDT95QUJk5HLTkUc3XyGyBWZa0BSu8MrBr
	gqNw5DDUzI6aONXAFDMTsUzHH038XaJBAJx16HpcMsNbJDGNN2YB71NvC/MHzCYd4PZs
	RGJqBAlIqFsxWG43hdT6pMtzA6eoiQ6C+G0W8MCiMqPIePwDyP7Rlo79SrOyRRPFGcVy
	A6qA==
X-Gm-Message-State: ALoCoQnfEhLiUcwvf5keB5LGv05vw21hCaSEDIZ8/v3cU211z1aE6is00rIIbp7LIwRyP/jD2zNj
X-Received: by 10.140.40.20 with SMTP id w20mr11041125qgw.92.1404419502816;
	Thu, 03 Jul 2014 13:31:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Thu, 3 Jul 2014 13:31:22 -0700 (PDT)
In-Reply-To: <53B59084.1090608@emagii.com>
References: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>
	<3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
	<CAJTo0LbmBrwHOdYKdeaiKzHxpCdJ5XtxTUO5CnK7yi+Rm3nUyQ@mail.gmail.com>
	<20140623123922.GF2437@jama> <20140623124437.GG2437@jama>
	<1404405934.6362.89.camel@ted> <53B59084.1090608@emagii.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Jul 2014 21:31:22 +0100
Message-ID: <CAJTo0LbexU5YCtswU8hhG1R0hNWhz85MhPpEPvaomcz+vWpPaA@mail.gmail.com>
To: Ulf Samuelsson <openembedded-core@emagii.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Avoiding getting the login prompt on the LCD at boot
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
X-List-Received-Date: Thu, 03 Jul 2014 20:31:46 -0000
Content-Type: text/plain; charset=UTF-8

On 3 July 2014 18:19, Ulf Samuelsson <openembedded-core@emagii.com> wrote:
> Between 2 and 3, I get an ugly login prompt.

So something is chvt'ing away from psplash too early.  Is the Qt
application running on framebuffer, or Wayland, or X11, or what?

Ross

