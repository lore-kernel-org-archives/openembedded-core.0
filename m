Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D085D7E5B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 17:07:41 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n4so1741437wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 10:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=+Gk5/Q0hD/pk5NksMhbpMemw5Qvi8hyfGlxc7Ur8rjs=;
	b=EYfZx4r2ySvLoX0XJos0/zM1qm4edq895QtFR+VdtTJrAYbP/+6OhJgr/DqMGyywyl
	euslcePKZGd6g3Zfgrzrt+XP8hpkDYQmJGm0V5m6MicpS4kNAt8zka3+YhcHhTkZw8U6
	QxNOfLFBi5kupLBye4zREX7GidFHe72W5WaYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+Gk5/Q0hD/pk5NksMhbpMemw5Qvi8hyfGlxc7Ur8rjs=;
	b=agaB3FKJ/MdHjfSkJOQwxg3eLOCymE+ePFmbUpMgptgfFXtUtZHE6c3/OAdk5u1ZBR
	LjT/NI9Mk50RiCc5t+kq9LNOwEsMXSOZUNUiI50jMiBYo/SSD9q30RX7jKMySBSk0fid
	oPdPH0Y1x+/nh4gjDCz3tXaQEvBUaEwPr2ax3pcwW4uluy67gmqmFpHBth/uW81obvlp
	FV0EgwPFHo8k0X+gg2kisFFARLu1+V04MnP0eanyP0sGfLGWbAsZKnZ33RJMmIsjChDQ
	LF9ouQYdPiYkya/ib95fKGJOQyIItW0Yp75Ll8BJp7nMSlNSpXMWOXaOY6KeoFFMW0AN
	XvNQ==
X-Gm-Message-State: APjAAAXrVy9KdmEpQvK0q+vEM2ghN5Mz0a1sCulhtwj5i6kVq0ph6rcW
	7E/c9K9/Zd6fQ1I+DWCOvXgrCQ==
X-Google-Smtp-Source: APXvYqzSQBN8VgxGBnXgx9R/1bXtCuIrg9zyYVuJ+uEDJZaGhrKj6rSaHgqn0oNGlRtkWpytaEhs4A==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr7080860wrt.111.1559322462632; 
	Fri, 31 May 2019 10:07:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b10sm17274856wrh.59.2019.05.31.10.07.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 10:07:42 -0700 (PDT)
Message-ID: <037a7bb7f19f73dae1c51b663ad4471100e37b4a.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 May 2019 18:07:40 +0100
In-Reply-To: <CADkTA4NU6SZTcr3FSCiwEozWFjde9PZYW=d5ivpowFE_Q6qA=Q@mail.gmail.com>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<18e169f17346d84787ec550696cf0cc19ea83256.camel@linuxfoundation.org>
	<CADkTA4M=hUbCPwa6H_KMFN=hDbpdy-XE5kZ8magBQFD-f=ML0w@mail.gmail.com>
	<dc3b129e2bf00200521f1a86d1384a1087fa4664.camel@linuxfoundation.org>
	<CADkTA4NU6SZTcr3FSCiwEozWFjde9PZYW=d5ivpowFE_Q6qA=Q@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 31 May 2019 17:07:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-31 at 09:46 -0400, Bruce Ashfield wrote:
> On Fri, May 31, 2019 at 9:22 AM <richard.purdie@linuxfoundation.org>
> wrote:
> > On Fri, 2019-05-31 at 08:53 -0400, Bruce Ashfield wrote:
> > > On Fri, May 31, 2019 at 4:01 AM <
> > > richard.purdie@linuxfoundation.org>
> > > wrote:
> > > > This fails in testing with one failure on qemuarm:
> > > > 
> > > 
> > > bugger, I didn't expect that!
> > > 
> > > I'll dig up how I mocked up a systemtap test environment before
> > > (it
> > > will be next week before I get to it though (unless I'm lucky),
> > > since
> > > my cycles today are spoken for)
> > 
> > FWIW this is some change after 5.0.13 that is triggering the issue.
> > I
> > can likely merge the patches to that point (tests are still
> > completing).
> 
> Yah. I spawned a core-image-kernel-dev build and will setup a quick
> bisect environment to track it down. I'll also test against my 5.2-rc
> kernel, to have a look for a fix, or do a fix there as well.

Just for fun I checked the 5.0.17 update and that does fail so its
somewhere between .13 and .17 afaict.

Cheers,

Richard


