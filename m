Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id CB57B6E835
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 13:29:04 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id z60so2554847qgd.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 06:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dHpWFNYf4BYuyX8q8RK89gVr1uZ1fDQO5ZZsmquaQ00=;
	b=URvtziL+mM8YRwugHFga9iudRiySwBRyAtM0GJnIIb/XPbK3G0jN6VLpVd9JBxTH4y
	8pDTmuMP38MpHnnEUoTtOytv+XWeflQJ2uAmyjxAJ+nlr3DHiQrS2sVCAs3WiCF9fcD7
	FVhtu1r4df6jggHwDrG9QbWyRrp/ITGUPKkRQdepIId8rPLO4YlVJq06SQQ6tmpUvMxX
	+yVRKAsXjS9bcZMYMRcjKOdUl2VgXbWKVtE4Leh/DA2QyIxsUmlBOy8ItGgX4a1C3vSV
	ymF/apdKvEhVw+9NeysChNL69iaccXDrYzB+t1/TyD2LBclYCg/e13LkvtZEhPDPrKTE
	mbZg==
X-Gm-Message-State: ALoCoQnKwJj5soIq4F5RDXnfYNQLx6xpdDSdgjnQElyXmQSAfNtRr4PBc9fY9IrPx/kW33Ja6nF6
X-Received: by 10.224.147.77 with SMTP id k13mr49686559qav.64.1395322145480;
	Thu, 20 Mar 2014 06:29:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Thu, 20 Mar 2014 06:28:45 -0700 (PDT)
In-Reply-To: <CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Mar 2014 13:28:45 +0000
Message-ID: <CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 13:29:07 -0000
Content-Type: text/plain; charset=UTF-8

On 20 March 2014 12:44, Laszlo Papp <lpapp@kde.org> wrote:
> You are free to NACK without an explanation why it is important, but
> do not expect it to weigh much that way, at least in my eyes, based on
> that you are not even a maintainer as far as I know.

One good reason: systemd reads the LSB headers.

Ross

