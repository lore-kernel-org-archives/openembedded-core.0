Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9006671B0B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 18:05:01 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id n21so422007702qka.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 10:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gZt3pkUU1VeJDt0VD+KUfqTvP55b9OfEyzgNfriiTHE=;
	b=AJWd6qW50s2jLi+mAeNU0r1p+XIAtiUQvHm/1rdT8kjS0O/uOhpKMhrcSkc7VrUBDy
	Z3oY35XwrvybW9F0rjXnhmwyhxAg9vhNargPc6icVPgr6K9FKr9avbHPqH9FptWJW1/A
	d9E80wl7VUzrVfXWB++AXuePGzyjLn4n7StAT6btqP7UP25mW1nfq6MTjBu8bZ1pRe9e
	NmJ03QtD6MuGBLTB+TEKmmvT0j0+i5vie9nsaa0fkmzMZ9sMsGUxkw9VVswdKk5+tqYA
	ECeeSXmOEAtyZmPMmwq2tDzStyCzeuuZkXSpgzfarzuepX+bckAybv/x7fJKbnxNfJti
	CC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gZt3pkUU1VeJDt0VD+KUfqTvP55b9OfEyzgNfriiTHE=;
	b=dmGV1dKFaqnUsYtO6YTeb/oO12npUlTFbopdWTY33Feqdhu9vTDlVypcgBmHtjyeN3
	T4yS4LTBd3cS2iAwwx+yTWXgGIixwTW6ooLF5HxkcI+EbiHo1Krz3dusGpm5loyZQhYT
	cLA9lKX1Phf0fFR+sPfDhx+2wOx9bPOnUsov3hEAowYKHTAiG3Rs2cDiDuxlxgE+bkYm
	COX/66P+E/ztCVJgh3FBcP+zyyVTdrn1LdfE5/9Bpb68W9nhjyecUhZ9KNk5TjTETPmT
	0Fmko059yE7o71b04qCbPpvdcCJbs7O6QBk5nTre86I1Lx1zUUAjxJvT9m514nMJBnI5
	cMEg==
X-Gm-Message-State: AKaTC00x2CKgKmK6UJsTwfubWbXF3RXHHaDpUW22XEihnEyXUIB0fD5Df5WcfO8lxDUSb0qKYO9X7Fg7uO6E0Q==
X-Received: by 10.55.94.135 with SMTP id s129mr57555550qkb.124.1481133902550; 
	Wed, 07 Dec 2016 10:05:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.46.162 with HTTP; Wed, 7 Dec 2016 10:05:01 -0800 (PST)
In-Reply-To: <78eef00e-4156-bdbf-cda1-688ae0495414@windriver.com>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
	<48f1e3e16ca28e1194d6024689d000cb6ffc303c.1480711764.git.bruce.ashfield@windriver.com>
	<1481058881.17535.58.camel@intel.com>
	<20161206230222.5411d7b6@nuc.betafive.co.uk>
	<CAHUNapQ847n7e=acLQ+hkLqziqaP8EQg5_0wrw5oJ9i9+Tw6tg@mail.gmail.com>
	<78eef00e-4156-bdbf-cda1-688ae0495414@windriver.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 7 Dec 2016 13:05:01 -0500
Message-ID: <CAHUNapSr5a2cuKN1xiK=2K0S+zkwMA7J0ALfe1hUZAVgXv2Fpw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] kern-tools: fix processing for no branch meta-data
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
X-List-Received-Date: Wed, 07 Dec 2016 18:05:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 7, 2016 at 11:18 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> With the attached patch, I see nothing else that is named  in /tmp/
>
> If you have the cycles, can you give it a try and let me know ?

Yes, I'm giving it a whirl right now. Thanks!

