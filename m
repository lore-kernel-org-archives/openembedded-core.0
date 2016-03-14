Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id EF9C46FF0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 21:02:21 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id mh10so253707igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 14:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1wYWbCsVDj1nIaqyCDwg3eKzMhX1c2gnEXF7ZemQFB4=;
	b=roOttSVyqdCk/byj4pkTNBBEtJF5V9Yj2xZR99CYhGjEioy4ncO28Z3pfVP1zFNZOZ
	i+omOAQ58zZMNKIrw7iMylKLufJjnus+Q49rFl5rljKjB2too56gi7bmU9je33wTuunV
	hSVJoKsMqqQ+N+FuDHfVlOUwWXN07g47tdhGBQs9u6ZoEc5fPs5/opdfyFQOoG6u8T6A
	kYOvkzFxWaTzVHJzsKSSDVRLvDfHsu2UgOdAlJsbYAPHIMECy7ITo+UA5ywyirOTRiMs
	dP8l33C5Zji14RiOKjIdUD3XbbQk21URugowoBJRqyGzoYnS7kv+Mi/os7C0NCO1awUd
	jDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1wYWbCsVDj1nIaqyCDwg3eKzMhX1c2gnEXF7ZemQFB4=;
	b=WP8o5/o8SOq6b56xNeRYytApRorgjSWpSYwQ/lMCr5hk9qHD6PLR73kxD8bydzy3EN
	ngBfg6GAtPVt6OtC13JGu+KLxJtYobTiaZJQNhX3oGo3/MWZ7nin88GSr0PdgFlR5obj
	4aBjAfCN+3xh9u7HM2ahCeznjkkdJBfXcjNaC46fgjFJdTZEhYjXJ44FxEcGQruUqxLa
	lIKDjSdtkJ33CPa6OT+Vq1sSkFK0tFK8WkQary3ygFjEYe/MwLq5gy0RrgRiBZk3ZnCY
	LxS9goy9VVV7atl8zXseDBQx8+83LKm3ebVjLQP8sOvRBCgbpaHLbDN8hhu8LB3GK9iU
	U91w==
X-Gm-Message-State: AD7BkJK6ZEYwLKN9ux0dLxMp0l4LGh7yynx0k1/IETDlL+wgg8/vRZb560OD7J0sQxsyfoXsHSL2jytyMXLMi+6T
X-Received: by 10.50.118.67 with SMTP id kk3mr18684580igb.64.1457989342052;
	Mon, 14 Mar 2016 14:02:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 14 Mar 2016 14:02:02 -0700 (PDT)
In-Reply-To: <CAP9ODKp=+6F6dMDryHOtNcMsmBL3VqHpNwioxpi3AtoxQ3ji9A@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
	<CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
	<CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
	<CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
	<CAJTo0Lbx5YajNU5fcRkn1sk43LW1tCLm7p1WxCM=fQqTYo=zWA@mail.gmail.com>
	<CAP9ODKp=+6F6dMDryHOtNcMsmBL3VqHpNwioxpi3AtoxQ3ji9A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Mar 2016 21:02:02 +0000
Message-ID: <CAJTo0LY=BQxpH0Eq=86OnLB7M_bAR5+HhrWg7YqfhVPZgQ6=ng@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 21:02:22 -0000
Content-Type: multipart/alternative; boundary=089e0122a0d4d2010e052e089818

--089e0122a0d4d2010e052e089818
Content-Type: text/plain; charset=UTF-8

On 14 March 2016 at 20:55, Otavio Salvador <otavio.salvador@ossystems.com.br
> wrote:

> I know it however up to now we could know that native and nativesdk
> might respect DISTRO_FEATURES and be in sync. Now this is not truth
> anymore.
>

It's been like this in master since December and the world hasn't exploded
just yet :)

Ross

--089e0122a0d4d2010e052e089818
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2016 at 20:55, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":25l" class=3D"a3s" style=3D"overflow:hidden">I know it however u=
p to now we could know that native and nativesdk<br>
might respect DISTRO_FEATURES and be in sync. Now this is not truth<br>
anymore.<br></div></blockquote></div><br>It&#39;s been like this in master =
since December and the world hasn&#39;t exploded just yet :)</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e0122a0d4d2010e052e089818--
