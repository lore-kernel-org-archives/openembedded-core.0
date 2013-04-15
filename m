Received: from mail-vb0-f54.google.com ([209.85.212.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URhVj-0007fP-FH
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:23:49 +0200
Received: by mail-vb0-f54.google.com with SMTP id w16so3658021vbf.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 04:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Kl5LyvEcgRbtry2gUsuYd4uVlM2BWc/g2mQC/H9bNiY=;
	b=NUT6g/DaztxqX79C4g3cf2yq/CrWD2KUhLp+f5d2RcZbPjboWc2gC8cHxXRPjOE9uF
	TbkUnSQlDr8imnBUpdmS+cWyYu79KvnHQvlO5W2cHcs6Im86oWp3dV4ZsYEFjXX6bN1/
	A/AKoulrxQye5xWx6hKKgc6xBx1VsxdkwbmXU1zQD2VHBfkAOjNOOiOcMKJCeWpDI5N8
	0zHk9ONQ515fPn9HUjizkLSA2pjafe6B7+UqYd19nejpevr8YJM15Xc1reD5Hq0HCCPR
	MeDHdgnMGgExbpwXf4IsGemR3T3l5KPb9gqSezVupm91hI0jkyRw5XRhIzq9sOsE8z9D
	mJXQ==
X-Received: by 10.52.108.10 with SMTP id hg10mr13163193vdb.34.1366023978254;
	Mon, 15 Apr 2013 04:06:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 04:05:58 -0700 (PDT)
In-Reply-To: <053E167B-AF9D-4E0B-B8D8-D518096D2C49@dominion.thruhere.net>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
	<9D7AC92D-FF69-4A31-B99C-D2008675A27B@dominion.thruhere.net>
	<CAJTo0Laqc93oxZcHZ+vF99q_UqJ_8TUV4QAxPy6VfBLDBUxOYg@mail.gmail.com>
	<CAJTo0LbfDu6bOAPYjd3ohzZJcvPDmYiT4RcUhZC9JXkQB6dmOw@mail.gmail.com>
	<053E167B-AF9D-4E0B-B8D8-D518096D2C49@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 12:05:58 +0100
Message-ID: <CAJTo0LakpuA=dRgETNpqMh59AXmc+-2uEbfo2q-spfzqaB5z9w@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnTBH+fxiKOOEQ8tRpHYuE+VEYIuktLfG44ugOKbu2jk3FwZtl3vPk5dRU92RicjGHT8iMR
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
X-List-Received-Date: Mon, 15 Apr 2013 11:23:49 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2013 12:00, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mount&id=1fc11cc25938b6a0c1e9b69a30326de8608cb98f
>
> Do you have an oe-core patch?

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/patch/?id=1fc11cc25938b6a0c1e9b69a30326de8608cb98f
will apply to oe-core just as well as it applies to poky.

Ross


