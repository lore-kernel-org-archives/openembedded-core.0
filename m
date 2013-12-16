Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 59A8C6D7CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 10:34:51 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id jx11so3122368veb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 02:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k3SAbwaQ81+1r0SaT2VcwHoSJ8J+RklzFa9gJCACCnQ=;
	b=mOteDk3kjD8QyW0RYsW3eKeH65tu9eJvT/yfX1p6T7lMVSmFRDZj0ZjP/DBwVa/LSI
	KKwIiHzO0BIfU3XXg9cekXu1G1n1KkbVv+6fFwQjiHFCootmc1UnqCOWYqQfhadujJP1
	mW1BaituRC1bd/1uFewxu1YZun0RyzQUtTQqtWQ6r4BsbOqkP43QWt2Y4nZD7GEjI7pb
	CCyabW9A6rEJnaO/wzo4/rpxqo4+vA52fLiCdlctKk1SUH7piySWDzesoVS/EEUqw8u4
	wDGrLDQLHPHIkWuxRc9kGl8acSCWWh+YDHuvFnbAwQf+W/lEua3IZwvPmKGL9MWJLI/f
	RHEw==
X-Gm-Message-State: ALoCoQk+eKPxhkxBdwuVPumRX4TQ534U/sEeU4356rFYo4xo1SoPzo0QFHh8owp9dDYAPkKMoqoE
X-Received: by 10.52.245.132 with SMTP id xo4mr37240vdc.64.1387190090627; Mon,
	16 Dec 2013 02:34:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Dec 2013 02:34:30 -0800 (PST)
In-Reply-To: <ly38lw1xg3.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1386903269.git.Qi.Chen@windriver.com>
	<ly38lw1xg3.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Dec 2013 10:34:30 +0000
Message-ID: <CAJTo0Lak2xLA5U12A5=kEKVs=v+VEM6R=yT6UCP50gX9cRV=yA@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Change the way of handling CONFFILES
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
X-List-Received-Date: Mon, 16 Dec 2013 10:34:54 -0000
Content-Type: text/plain; charset=UTF-8

On 13 December 2013 17:18, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> A lot of projects (especially from the freedesktop edge) are (ab)using
> /etc to store non configuration files. E.g. all the dbus confguration or
> gconf schemes are not intended to be modified by users.

DBus configuration is available to be modified by admins, which is why
it's in /etc.

Ross

