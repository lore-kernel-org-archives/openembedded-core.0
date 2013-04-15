Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URhNi-0006kJ-4m
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:15:31 +0200
Received: by mail-ve0-f170.google.com with SMTP id 14so1538317vea.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=jK1IN4v6qsWl++5V7SYEEI49QmRF8eNttwmrHaL/wvc=;
	b=Tyxuf3vMtPhi5HFArQL68TCtGTOZhcevI7dzeGP7qnjPlCm3n1T3EUY9qyQUWl0REs
	IwCh9N36tDhqX8v4WMqiUnAn2uDO3V5z0RKyQFrfF4Xirey+lcjeagVPfyONjmZRlF8W
	m0b+fFRrAJ75DOXUCW01Aq9MmFSCABW2yiiBXsZblLIl2AYd0CvCJD6OYeSO9Yd1h2Ze
	ODu0WbxzxpxS3kGEvnGIXzUxIkzI0iU4Rbcqw4a3veAlPzA+15Wlm6iaPTgX2bG+fnnN
	SaO6qVqhMLwntn3WgHjuXrTZqYU1hrSxPHqQ3CPI7YhUsYLdFcxCtwPIW9PG9ZctWPlp
	bHjQ==
X-Received: by 10.52.158.163 with SMTP id wv3mr13369746vdb.82.1366023481106;
	Mon, 15 Apr 2013 03:58:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 03:57:40 -0700 (PDT)
In-Reply-To: <lyppxw135p.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
	<lyppxw135p.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 11:57:40 +0100
Message-ID: <CAJTo0LYFJfP-R+aNecNXYcFxFnF2GFB-BfXwc4zvoMoeCVFN=Q@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQmqBKTxW2l4/x1maLnctOxnLZ766iTmX142jVUrX4BBrFLbOrQSNCqmI5YQiZO8P+QDf1hT
Cc: "Burton, Ross" <public-ross.burton-ral2JQCrhuEAvxtiuMwx3w@plane.gmane.org>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 15 Apr 2013 11:15:31 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2013 11:47, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
>> I was going to say that I've never noticed this and have been running
>> busybox's mount, but on reading the hddimg boot scripts I see it
>> mounts / as read-write before switching the root.
>
> This might break systemd's fsck'ing of /.

And initscripts's fscking too.  I'll fix this in init-live.sh (for 1.5!).

Ross


