Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id DC93A605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 13:02:22 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ht10so2888453vcb.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 06:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=9Ox7lNr5gg8jJFfJ8rhqQepa0O4IGch1rix2iVcvu3o=;
	b=Ic/u5rDUFWsi0bccoZRNxNABUvLmJvgB/DBK1jkgN6aowcCdq+K9JvVFHTxYqTvl7W
	ulSxLXNK5RYRpzlz8dr45wpMvzIDuPLT2DMwzFEV2EQt9fkGiXZvcMTDQVidWZLU/1pe
	h9CO5iPdD/SQB/PvcP+EFSp8xDkRcmx5ptAQPiycO0zBj8aSU3/vc2iWj/Axd0qw8p+S
	zdlktrxMo19p41T7eSW4gWTKbA02Xw/U20i6FPRalD4DdpcsVl16IIsgltvb+RLdrHV0
	DT4ZTmbRFRrHpj3S+Ocge0W+02S5AyjDuM8z1TBQA/dmZMqDlhEqimWEmluKrm4WWISv
	YSxA==
X-Received: by 10.52.29.106 with SMTP id j10mr1462366vdh.77.1371560543501;
	Tue, 18 Jun 2013 06:02:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 18 Jun 2013 06:02:03 -0700 (PDT)
In-Reply-To: <20130618105824.GF16785@lpalcu-linux>
References: <cover.1371471166.git.laurentiu.palcu@intel.com>
	<6a4980046a3175ecdd4216cdd75c754b0b0ffa16.1371471166.git.laurentiu.palcu@intel.com>
	<CAJTo0LbPGDehVTaspjcZBCL2F0DRS-HondvaO-6K0ntZj_Zu6A@mail.gmail.com>
	<20130618105824.GF16785@lpalcu-linux>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jun 2013 14:02:03 +0100
Message-ID: <CAJTo0Lb4bk6UReu4sEuaY-FekrzSbXhChsLX0M0VOU5YP1di8g@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQngWG9yA3b7hCxtDIj69jMJLnfx0mbzZ2HLZiwVfhAYtMFGOpwQIHhpqEOURPVXEKqPs6AL
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] xinput-calibrator: move it from meta-oe to oe-core
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
X-List-Received-Date: Tue, 18 Jun 2013 13:02:23 -0000
Content-Type: text/plain; charset=UTF-8

On 18 June 2013 11:58, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> I'm not sure I understand what's wrong with using xdg-autostart.
> Xsession parses each .desktop file in xdg/autostart and executes the
> application listed in 'Exec'. Having a separate xsession file created
> in /etc/X11/Xsession.d (like xtscal does) is, basically, the same thing.
> Only the moment of execution differs. Or, maybe, I misunderstood your
> point.

XDG autostart doesn't block the app, so the rest of the system starts
up.  Really calibration should pause the startup and only when the
input is calibrated, continue.

Ross

