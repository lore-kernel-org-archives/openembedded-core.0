Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id C73CD70249
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:38:53 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id q108so3403478qgd.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 03:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=57V0f73P37ImnZuaZ/yvjSCDrtANBYZtch7DK6XXfcg=;
	b=CMaKu2nM36DFo+Bi1KV/DCb0GNm26sRLaQ/GaRxqaq7wftkIr/kQv9KTrpgKG9LSLj
	zgNj66/mUlWYvja4sXMEPLJFUy/ZDMlCdRq9EE1TWjhwgn2p+C8bKdPGC5XZ5rGRMmKO
	PME4qzcsY3iN//QkV1PnaEkjinpveWk4ZpoeI7Iusw21SIXObf1jQhD6JY1y6RoZT+2D
	TFHk764fRrcXWBQG7XCzo999lCmRdIfGAghVRO6GxKaV2djgGSwqkm1Wq+vcJZegTvxh
	HgS0IMnQxEaQwvXaM1UivCbUHUQW3h2sUvQdJ9KPG7XgRve4HbPApboXqie/9cOLKSJe
	+DyA==
X-Gm-Message-State: ALoCoQkOXoifoHCk+lC0x/FBFEjq9ShthhWt2pmtRfYNXxkI3pnkDY2bc8eASpP5PQR/oK7vlP2P
X-Received: by 10.224.167.70 with SMTP id p6mr46792931qay.79.1404729534891;
	Mon, 07 Jul 2014 03:38:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Mon, 7 Jul 2014 03:38:34 -0700 (PDT)
In-Reply-To: <53BA715D.6010901@windriver.com>
References: <1404540383-13425-1-git-send-email-ming.liu@windriver.com>
	<CAJTo0LbLcADdC0qC7cYNDWoZOjvj_BXg42-K4siPE518MykU2Q@mail.gmail.com>
	<53BA715D.6010901@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jul 2014 11:38:34 +0100
Message-ID: <CAJTo0Lban=ZhrrPMXN6kLvkHyuhUbinOGWwyhQsNyKh7rsMLZg@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Mon, 07 Jul 2014 10:38:59 -0000
Content-Type: text/plain; charset=UTF-8

On 7 July 2014 11:07, Ming Liu <ming.liu@windriver.com> wrote:
> I got your point, but my patch was not tring to address the conflict of
> binaries or libraries, that kind of conflicts would not cause build error,
> as you pointed out, only ever a single instance be installed at one time.
> It's actually tring to fix a conflict of conf file, if the gconfd-2 is put
> into libexec directory, we have to keep a path like
> /usr/lib64/gconf/gconfd-2(or /usr/lib/gconf/gconfd-2 in lib32 case)
> referring it in /usr/share/dbus-1/services/org.gnome.GConf.service which
> will cause the conflict.

So why did the commit message talk about
/usr/share/dbus-1/services/GConf.service conflicting between
installation, and how will your patch fix that error?  As far as I can
tell ${datadir} isn't in the MULTILIBRE_ALLOW_REP so they'll still
conflict, right?

I still think that splitting up the gconf package into library and
tooling is the logical solution.

Ross

