Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69E8E6C492
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 14:38:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s12so664064wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=sIrxjETRIooX5H6WhHSp0zzUSB6zWi+aodYK1pBNwok=;
	b=D3r+GfuRB4Y9w7Adf7Gq3p3mVPekMhyYOC1bw2TZ2i5fUY0Ugf0/tjmGOUJtAmPNGb
	t1a2JjYBGTTwy4WTMFgOwoQHp7z8xjw+soLdc9IM2gOanH3ElL7BJaWyt5RTAyUZx7nB
	3cd3OSkRLYvgnkop2DRPatPutntFyL0Lg+ssA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=sIrxjETRIooX5H6WhHSp0zzUSB6zWi+aodYK1pBNwok=;
	b=jgFoFVJuu83tHNavrpfR+/y+cKAl364lureRUce98svGqbh3/IlQjExpj//1UPn7Yl
	AJpGj5S/eNOkhaSPbTU9Xww97BFl/2JIRBi5i0HMCf3PM1vjcGXdfw4w+rE+whnBl/9k
	XzIBbc0ljDm4DmziFdMl5QwPvHzVHN6qVKmtoAkQ1puNXZ6cj8jConlAnwVV+fjybhyE
	w0AiGrs5/Cm1BAyX3Uc4hvlZV7B9XNqOS0P9KAxqS+X4g29yPvGOHvbvORwZb/pgUEjB
	yVR/C0Fi86lJwwCcsJ25BhoOnNxfWdbtdQU9SOa8Bk7E6qx19FuAmUTFFz0xi+bCxOTJ
	CCVw==
X-Gm-Message-State: AJcUukdTgCyeaJekQkwiqGoDcNJzTRZZ4nNppXBWu6u06jUvz8DAXmO0
	qgps0DGEr4bpDacwAMlUlLCZdA==
X-Google-Smtp-Source: ALg8bN5h7b8PTz0QkrVCcPY/Dz40fJPA2YyQoK7Op/f9i5fG1ktvauNy00cSx+U4tPAslxWXd5a5fA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr50780626wrr.271.1546871888054;
	Mon, 07 Jan 2019 06:38:08 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f66sm7896872wmd.28.2019.01.07.06.38.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 07 Jan 2019 06:38:07 -0800 (PST)
Message-ID: <e8d6a8d1ee7ff0d86ae25c22a09367f0cdb2eeae.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, ChenQi <Qi.Chen@windriver.com>
Date: Mon, 07 Jan 2019 14:38:06 +0000
In-Reply-To: <CAJTo0LaEJ6FTnsbAydx18wKAvHa8dfSAoSo0BpXdVtszAtHn8A@mail.gmail.com>
References: <cover.1543484174.git.Qi.Chen@windriver.com>
	<75835e51f6c88a58056350759080d5c0004562b7.1543484174.git.Qi.Chen@windriver.com>
	<CAJTo0LaEJ6FTnsbAydx18wKAvHa8dfSAoSo0BpXdVtszAtHn8A@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase: add entry to /etc/hosts according to /etc/hostname
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
X-List-Received-Date: Mon, 07 Jan 2019 14:38:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-14 at 21:45 +0000, Burton, Ross wrote:
> On Fri, 30 Nov 2018 at 02:18, Chen Qi <Qi.Chen@windriver.com> wrote:
> > We default hostname to ${MACHINE}, but it's not in /etc/hosts,
> > resulting in commands like `hostname -f' failing due to lack
> > of entry.
> > 
> > So add entry to /etc/hosts according to /etc/hostname. We do
> > this via pkg_postinst because hostname is set in base-files
> > recipe.
> 
> RP and myself are still arguing over this so I thought I'd make my
> argument on the list for debate.
> 
> Updating /etc/hosts is being done with a postinst in netbase simply
> because /etc/hostname is contained in the base-files recipe. I
> advocate just moving the creation of /etc/hosts to base-files along
> with /etc/hostname, then base-files can write both files at the same
> time.  There's already a dependency on base-files from netbase so
> there will be no change in the rootfs, a file will just move between
> packages.

Coming back to this after the holidays, I agree with Ross, we should
move /etc/hostname to base-files and keep this simple. I'd like to get
this fixed, could you update the patch please?

Cheers,

Richard


