Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URgcv-0001GX-Fg
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:27:09 +0200
Received: by mail-ee0-f48.google.com with SMTP id b15so2195724eek.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=wiMgK7Jw6FPMx6qC9RuEQHRsJc4blWEyQaf1Du8kxbo=;
	b=H6SdPzVMmltppQh4UmGwBBQWQ7mdqI5VCyVAO8rl+CoreXejEZzhY+cqCputXnHHdl
	1ZKbgzHETLhakltbOHt+VcQafmWMU7n7geOyExSKI+g1hVWOqYAd9NUpqqm+wuRvWJN7
	9JXZIxtcpWUghaNRBvzI7P62oTzLZkoCH6H7CRDwmf0xAleXpcqsu52lUHaHJePwRid2
	FbfTXtnDzff8JkHKWDickUGUXZrWaJ15Z/sFv1Ub7lXAp2+nQpE4gZg4aKYaO5gI/+Z3
	rmWlk1rK6HJVDgfJ3+UxYzziBsN6zebh2O7q0L+QOdc5l6TH2XZvuQj6kmzsuN2pJOOK
	MMQQ==
X-Received: by 10.14.5.137 with SMTP id 9mr56023332eel.30.1366020580899;
	Mon, 15 Apr 2013 03:09:40 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id b5sm25925111eew.16.2013.04.15.03.09.39
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 03:09:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
Date: Mon, 15 Apr 2013 12:09:38 +0200
Message-Id: <9D7AC92D-FF69-4A31-B99C-D2008675A27B@dominion.thruhere.net>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkie6KTg5g0QqcH/W9FwcIhrTEG1YQOEgEh5IQR3D7CQmXUyEF0MdPajywTHrqm8zBf4RE8
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
X-List-Received-Date: Mon, 15 Apr 2013 10:27:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 11:59 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 14 April 2013 14:48, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> When using busybox mount the filesystem won't get remounted as 'rw' =
and bootup will fail.
>>=20
>> This fixes the regression seen after switching from 'danny' to =
'dylan'.
>=20
> I was going to say that I've never noticed this and have been running
> busybox's mount, but on reading the hddimg boot scripts I see it
> mounts / as read-write before switching the root.
>=20
> Does busybox produce any useful errors as to why it's not working? =20

No, it pretends everything is OK and the remount succeeded.=20

regards,

Koen=


