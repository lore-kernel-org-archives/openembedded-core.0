Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id C6B896E9AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 12:32:23 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id x10so1640035pdj.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 04:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:cc:content-type;
	bh=yqQ8mANyrAucRrO7LIXQ+yD+n8Wicd60kkUXE+z/l3I=;
	b=WATqinY3VpPXpKivo9HeUaQNx7GSpjMllT7nibQtFld43f/2s8ZalcYVURtSQkRyOp
	Mochj0r/MNVuJK/lxtZOAnZG7R1rZu6MQUAfXMuszmZPkwXhcRMB3Vf4xg+2TcOXnQlS
	Lpq3nBt0ypzU9XqeZevdWpdV0Xj5E2ctEWICZw9slWVX1XXE4VonecQPVDWu/1yT99Pl
	VbzrxzCp0SKDlsffPPxw6P11+pEmGtuewMrDqOHhn3glHESNpbXlO3al1vA6kjrSQ/If
	pe1uLKNWT0598MNjtQYv7ksug6deXHIPiF7+9mjIIg4n12IRXej5cv60moXksTkLtaaA
	MITA==
X-Gm-Message-State: ALoCoQl4G1Jzh7iG3+2/WFGElg7+io4ir96K6FvD1Io5VXABNdhUY+DEzBJyVFYoYMfSVhTL8PzR
MIME-Version: 1.0
X-Received: by 10.66.4.130 with SMTP id k2mr7607494pak.95.1390998744838; Wed,
	29 Jan 2014 04:32:24 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Wed, 29 Jan 2014 04:32:24 -0800 (PST)
Date: Wed, 29 Jan 2014 12:32:24 +0000
X-Google-Sender-Auth: zBusFAu-tTaaklCyaAjxLEId7LM
Message-ID: <CAOMwXhOUo7tUOdAno5-ebFxEqO9LW_C4bz1KghFfEg6_TUe40g@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: daniel.elstner@kdab.com
Subject: ROOT_HOME: /home/root
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
X-List-Received-Date: Wed, 29 Jan 2014 12:32:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Is there any obstacle why this cannot be /root as per default Unix
philosophy [1]?

It is not an unusual that the /home partition is a separate, and the
sysadmins would like to manage the core system without getting that
partition mounted, etc.

It is true that it would be possible to work that around, but /root as
a default just feels so much more natural on a Unix system.

What I currently see after talking to a few people, the people keep
changing it in their layer (distribution) config. It looks sub-optimal
at first, but perhaps there are still valid reasons to keep this
around?

I was told on IRC the first embedded debian may have done it to keep
rootfs read-only. First, you can remount the root partition on jffs2,
ubifs, etc... as R/W.

Even if you could not, you can have a separate /root partition which
is a good idea anyway to keep the super-user separate from the
"regular" users. If that is not OK, there is still the option for the
minority to override it to /home/root if really needed, but I
personally do not think it should be...

So, all in all, I am in favor of changing this back to /root to be
more linux-y and well-separated from the normal users.

Unfortunately, it would lead to some breakages out there when they
update Yocto, so it may not be acceptable in this project. I do not
know the rules. The migration could be aided though with some proper
documentation.

Cheers, L.

[1] FHS 2.3 still says  /root : Home directory for the root user (optional)

