Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id ABF9B6A960
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 11:22:48 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id x13so705933vbb.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 04:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=7v6fSbFyjzLy4lYGDWzVn2TamezU6J1ys1LwPTyKC5I=;
	b=oWS93x7TsKIruu+UHx27cyFblrrhgckOGD/LpUO/VTT6UbWOdqmcPr3LXwf+e1N0ro
	Rr68VlW1l0tNaQ9GpOeJu+zTQTXE4nJZkIRWW2k2Rl5VqIkzI0OeAUWSxspSw0XbUvJa
	/Q4Z3ONqE7EBUXlpY4vOkxF9Dqevmr5XNys5SLD1GauodJ8PuS2vZ8Vw/oie7wUyX5Zv
	2YALcAWLLIonVma1tKH8oKolhQloWLUGCv6P7PAx5XYerZPd3iIpe/Q6an880czXYFpD
	gdwU+feKMb9lHfnGdrse/8FEDbOTrFNjhJCylo3cf40CAK9R/515fJJyFMpPsUft5Lvu
	km0Q==
X-Received: by 10.58.171.4 with SMTP id aq4mr19907917vec.26.1374837769146;
	Fri, 26 Jul 2013 04:22:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Fri, 26 Jul 2013 04:22:29 -0700 (PDT)
In-Reply-To: <51F258A0.9090007@topic.nl>
References: <cover.1374642547.git.Qi.Chen@windriver.com>
	<5dc3be245a9757c51dadd7ce446c5116ce79496d.1374642547.git.Qi.Chen@windriver.com>
	<20130726092812.GD3280@jama> <51F258A0.9090007@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jul 2013 12:22:29 +0100
Message-ID: <CAJTo0LZOvjmz3hPEj3uPJhmHcHPWPmwxYLBeddJPG4QYhb8F9g@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQncmLB+UQcTGNVQUn4HlffXjVWaCY1eE8LYibsGgqLsa0Rwuxmz8ygY9r4O+t8LjsTTUgGm
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 9/9] Generate ssh keys at rootfs creation time in case of a read-only rootfs
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
X-List-Received-Date: Fri, 26 Jul 2013 11:22:48 -0000
Content-Type: text/plain; charset=UTF-8

On 26 July 2013 12:08, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> I would suggest creating a separate recipe that places a ssh key on the
> filesystem. That would be about equally useful, and it gives people a
> choice. During development, such a feature is very nice to have, as it lets
> the test board keep its current ssh key. It's a recipe that I'd be happy to
> contribute. I alread have one that puts my pulic key on the box so i can
> safely log in and/or run automated test software with passwords disabled.

Please do that, I'd appreciate this too. :)

Ross

