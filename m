Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 120E877EA9
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 12:49:58 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id d127so51250368wmf.0
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=FYGyBUs79ZipUh88WdhGifIGVHh90A9VoWeDpxR1IJ8=;
	b=sPv2/EdcunNvohwosz3WwalQ76BNy759iKmvs7MQ9n52aBlVgQqdEjwbJBGJ9npVMd
	YL/SC1Sl23HxBbmpGmV5lJvjm4SNc5sebIC6HSoi72iasBjR9PGaNdhED/i5qHMb8Nfl
	OdZRi3TL6+VBgFex/OFHyQ6+HVYa7nwz47SHxwrDASK7bh9Si8yLlyFQSxef88ExEpXy
	pRIwELJxneGeSRxEzg+YbwlEYGuz27m3mpePAVYnjteRj2mr6c9ENPJE6O78B1jhaFtH
	DGZHmkoKXdCosfnCswxjftTkh1Vg6QlKcOUTf6lX+NkskANYE+XAvTLZcaihnJo6cttb
	aQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=FYGyBUs79ZipUh88WdhGifIGVHh90A9VoWeDpxR1IJ8=;
	b=oWTWKHNkCAgro9qumS3qAbm6sXMhGjQ/PYTiK+Tya5j+uOGjqRAfsfOgttCocVb4FZ
	dKaD7QktC+l6UkWjjXSY2b2EwC4VQRcqm2jpZCHdgwCZrgljcOpzVmJNoX3aMOAl3VGp
	s712YC0qSf2AqGmWrgnSL/dtKkVooMZ5qf/F//vNRb+folGmzlFJ3zDVfE5rTKBn3a6w
	DsgZrdI5ePd4X7PodKTLJY24iiE6oFPUxgmkW7vkklcsZxNXeXHLrjxH5S/Sz3qQbJ44
	97wsQRvkyP7+2gBRMIFGTYJTQ84kAFEK5zzRnNO1x5iPbqr4fU3rUciASSrDkl6muTq2
	Eagg==
X-Gm-Message-State: AODbwcB5Wi2dTbuU5Z4rCHDwQR71xvW5LvV6UWaHr/ssWpFooBYZ1GJU
	lwWVW4/YwmnJpsRN
X-Received: by 10.25.201.135 with SMTP id z129mr1087443lff.45.1495111799289;
	Thu, 18 May 2017 05:49:59 -0700 (PDT)
Received: from [10.20.33.141] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	b5sm358317lfb.23.2017.05.18.05.49.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 May 2017 05:49:58 -0700 (PDT)
To: Andrea Galbusera <gizero@gmail.com>
References: <d84852f6-9ce4-3f9a-cb7f-fa92c6a74462@mender.io>
	<CAC+thW08cG3Mt+E3O5fRmf=wyv4vrdp_ZphbRcNWEmq8VRhMnA@mail.gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <7f5af52a-5832-cafe-7af2-8ca63daf77f8@mender.io>
Date: Thu, 18 May 2017 14:49:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAC+thW08cG3Mt+E3O5fRmf=wyv4vrdp_ZphbRcNWEmq8VRhMnA@mail.gmail.com>
Cc: Joe Slater <jslater@windriver.com>,
	OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: volatile-binds and DNS
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
X-List-Received-Date: Thu, 18 May 2017 12:49:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 18/05/17 14:30, Andrea Galbusera wrote:
> On Thu, May 18, 2017 at 9:16 AM, Kristian Amlie
> <kristian.amlie@mender.io <mailto:kristian.amlie@mender.io>> wrote:
> 
>     We've discovered that one of the recent commits to poky has broken DNS
>     resolution in our image. The commit in questions is this one:
> 
>     -------------------
>     commit fcd48092d7bcab0cad2606e65332da62420935ad
>     Author: Joe Slater <jslater@windriver.com
>     <mailto:jslater@windriver.com>>
>     Date:   Fri Mar 31 03:06:33 2017
> 
>         volatile-binds: correct some errors reported by systemd
> 
>         systemd-tmpfiles-setup will fail at boot, so we suppress
>         the default versions of etc.conf and home.conf.
> 
>         We also make sure that /var/{cache,spool} and /srv are writeable
>         if they exist.
>     ...
>     -------------------
> 
>     The problem is that this suppresses the creation of a /etc/resolv.conf
>     file, and without that DNS does not work.
> 
>     The file is a symlink to the resolv.conf that systemd provides in
>     /run/systemd/resolve/resolv.conf, so it could potentially be
>     prepopulated, but I admit I don't fully understand how this fits
>     together.
> 
>     Any advice?
> 
> 
> There's a bug open on this [1]. My workaround as for now is to apply
> [2], but I'm not completely aware of the issue that suggested the
> original commit you mention, hence there might be a better approach to
> fix this...
> 
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11331
> [2] http://lists.openembedded.org/pipermail/openembedded-core/2017-April/136074.html

Thanks. Yes, that looks like the same issue. Reverting the line seems to
work, but this should ideally work out of the box. Unfortunately I don't
know enough about volatile-binds to suggest a proper fix...

-- 
Kristian

