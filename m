Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 699826B03A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:42:57 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id db10so2808761veb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=qaEQOiEQZ/FRs0jr65i+ZeNcwuaBA0QC9E7TL+Ao9cA=;
	b=BZGyllKCI7F+55Cv9Kz9vLKwtTfaVaiBViQEQ92FjmBgdYeZrviE9WAK0HFkSDPGvs
	I6fjiaItT8Oav+/bBqMyR/aeof0EXHqBcMoZY/Hjvv6K5XBL0+CnsYwup3TFUlXXoUdL
	GT+V+1Bvd7kuscDa/9iQ/MD4RhpYx+EGsadxkvlZUjnmXbBJTd0RPFfuL9bppTcqq+W0
	6nFfq1WN0GhYeSbqmKz/SFmF9mg2qLgR+NtPpRgB1fCyZyWcyIwNw41R2gFncV7+fVjL
	wWPFpvOiYWdf5DK6hMzlYpVoFgaBgWoTrq2Ccfk1Cl0klspiU3irIDRnBhuzRC4WzEIn
	1wnA==
X-Received: by 10.52.103.84 with SMTP id fu20mr16980059vdb.51.1375094577556;
	Mon, 29 Jul 2013 03:42:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 29 Jul 2013 03:42:37 -0700 (PDT)
In-Reply-To: <1375093253.13247.5.camel@phil-desktop.brightsign>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jul 2013 11:42:37 +0100
Message-ID: <CAJTo0LazaFL14=WbXSM4CnF0y=25VLt7m4cP9nU4B7Qs2kXEnQ@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
X-Gm-Message-State: ALoCoQn6MrduzrSJgwDoF17iJWDK7lKrnP/JosDuVUuFS8SEKXoM1r7HHscJYmZFS6mxfSBtmD8O
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 10:42:57 -0000
Content-Type: text/plain; charset=UTF-8

On 29 July 2013 11:20, Phil Blundell <pb@pbcl.net> wrote:
> But in this particular case, your new patch seems to have more serious
> problems since it will cause rfkill to silently disappear for many
> people who do currently have it.
>
> If your distro selects a toolchain which doesn't contain the necessary
> bits to support rfkill then it seems as though the appropriate course of
> action would be to either:

I'm in agreement  with Phil. Whilst support for userspaces that from
2009 is patchy at best with modern software (you'll need an equally
old udev, systemd won't happen, etc) this is a trivial change but
let's be clear that it's an option to handle older external userspaces
and not our so there should be a PACKAGECONFIG for rfkill that
defaults to enabled.

Ross

