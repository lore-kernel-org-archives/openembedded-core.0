Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAOnp-0001rx-Ce
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:58:58 +0100
Received: by mail-ve0-f179.google.com with SMTP id da11so3997080veb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=WvZkcW08y7/lRiFls2//dRpRoQAizjtpGmzO8OMOSXM=;
	b=SOgarYw3wqTvg0ZEI1hfxmvLk3Hh+1eu5CPowNSNvESZEZeWsF5CW88SrIbC9otLKG
	VOzSj/1tqmNvGBdFspuQ7OVtf0YIczrrhFUfO6w4U5hH2Jt4PHmAgyQXeGhm6uPfD0qb
	qnK8iIHO9gMQ/RURHnsRLYLLpBPr1LRwTSYx7jGzkwvyXaz0p3gPbjaVPjE71e07PS6Z
	ckN59Gl2QkNib8AYeYZJnv2VCy0vqubl5RnDUJDVz6s9/X3vpgl3kj9TtuvV+0GOtcTB
	jSpfodLfIvR/P0Y4MugbUrYIpFo7gwsduvrNno/oWhvsn6VYrwdl+uTCiyEXG1+O+kNg
	gvRw==
X-Received: by 10.52.91.39 with SMTP id cb7mr10434707vdb.71.1361900556929;
	Tue, 26 Feb 2013 09:42:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Tue, 26 Feb 2013 09:42:16 -0800 (PST)
In-Reply-To: <CAP9ODKrv9kbMuhMK6OnEGNqNRn0ZHM1R7xZwYAFa=QjivCcigg@mail.gmail.com>
References: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrv9kbMuhMK6OnEGNqNRn0ZHM1R7xZwYAFa=QjivCcigg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Feb 2013 17:42:16 +0000
Message-ID: <CAJTo0LYFL_-YuemRozDYKaGaa1+mKtv8YgHUJdGnnHqPRKzDQA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQkCR7T8S52AO6nxycfTGFoS+qm1MrvI4Ad7rBaZ9+OzAMNim+VNpoLjoRTJ5uGBgYrsRIv5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
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
X-List-Received-Date: Tue, 26 Feb 2013 17:59:02 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 14:32, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Please inherit allarch

That doesn't play nicely with autotools:

| checking build system type... x86_64-pc-linux-gnu
| checking host system type... Invalid configuration
`allarch-poky-linux': machine `allarch-poky' not recognized
| configure: error: /bin/bash ./config.sub allarch-poky-linux failed

Considering a lot of allarch is designed to remove dependencies that
this package uses and thus will need to be restored, directly setting
PACKAGE_ARCH is the cleaner solution.

Ross


