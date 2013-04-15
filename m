Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URgT5-0000HW-AG
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:17:15 +0200
Received: by mail-vc0-f171.google.com with SMTP id ha12so3583638vcb.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 02:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=/Vep6bC4hhf/5mYpO05pB0e7dgT2QVwFXNAcnCTPKkk=;
	b=TzKfWwAQz+BOHTArt7QaJO1GKwb1toOJ1FLktLfCzJu5awy0zJA1P+a3EukcW9S0Fh
	Me3aVaWsnB6MoxagICZKxYx5rr9Fe+i9fPLfNVJVxmX/CDu66FhnFnBE2IpY9eKiO0zd
	6O/5RI3vjPJhm6VgUCCl5b4oMVFVmIN8GxyJwJcXlm1yA8Bh/uK+Zl2H4Ot+AJNlk/2u
	sFESrRMajY572ehWmtMMWc2NhiqF3Y/BJvMWNOuRwkKYzJY1HUOmGzFXM4GXu8uCLBne
	6qoNCduZ5Qa+oxJLso7EG1PcmtfTMT3MIxRU6yV24XClz8CzUq8alnbOwoXFR7vBhoyO
	yL9Q==
X-Received: by 10.52.28.139 with SMTP id b11mr13174448vdh.4.1366019970143;
	Mon, 15 Apr 2013 02:59:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 02:59:10 -0700 (PDT)
In-Reply-To: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 10:59:10 +0100
Message-ID: <CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmNwt6gR/kelPa8cQ3XpsuL32H8qTOwYtREjianuC0UIYuHpJq1Ib2m+w02z+j/Hra3u5Z/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-dylan][PATCH] systemd: fix bootup with 'ro' by re-adding util-linux-mount to RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 10:17:38 -0000
Content-Type: text/plain; charset=UTF-8

On 14 April 2013 14:48, Koen Kooi <koen@dominion.thruhere.net> wrote:
> When using busybox mount the filesystem won't get remounted as 'rw' and bootup will fail.
>
> This fixes the regression seen after switching from 'danny' to 'dylan'.

I was going to say that I've never noticed this and have been running
busybox's mount, but on reading the hddimg boot scripts I see it
mounts / as read-write before switching the root.

Does busybox produce any useful errors as to why it's not working?  I
cherry-picked some fixes from busybox git but hopefully we're still
missing some and I'd prefer to pull a fix instead of util-linux-mount.

Ross


