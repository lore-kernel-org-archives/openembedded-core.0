Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 461F16F90D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:59:33 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id f11so1430863qae.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 12:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6w5GQfHuyrKgJAb18CjEqo7SnSrWUJSOqM/NMBLqGNc=;
	b=klz7xE88IvZnVBsKDwU6J67eLj184/sqW/bg1uZ5Dr1Uc3oxOUksKy6mwdHsnGWN9Q
	I+d0aI+spvOdSRcDKf2Km0uD7QGJmR9E00XaitcELMGh+uFPVy8QFTe1uKFZXxiq3Zg0
	hWbOFvoKjG2i0yanhJnsaeR0lMErpaRSpDuJMBYNtS2/aJY7nVprJUjxXUPQF8fYsghi
	fdyi4oMqcrPAzjwlBc4iY0eBEmjzM5fXuWlTvQLMevxQGNOq+qfeNVVTaNsko02xRhGx
	KJ6AQsnKffZc1K2nn5ERozGgIUpEMWWLf5k8SxywaX6PAmVC4pA8zxF96tgQw5+daLWv
	3UZQ==
X-Gm-Message-State: ALoCoQnYYZQyr2oEaFpEHuLOtYFTfMraKA3WD9ew+YjqEa+goR99RX7r17qMkpdicZzwnx3TFwv9
X-Received: by 10.224.147.77 with SMTP id k13mr52382371qav.64.1395345574765;
	Thu, 20 Mar 2014 12:59:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Thu, 20 Mar 2014 12:59:14 -0700 (PDT)
In-Reply-To: <CAOMwXhMDOma1N73M5n64G2T-FaH+Zevo2r8baenFsX9EZiFa5Q@mail.gmail.com>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
	<B0C68756-9FE4-459F-9DFE-753106847A87@dominion.thruhere.net>
	<CAOMwXhMDOma1N73M5n64G2T-FaH+Zevo2r8baenFsX9EZiFa5Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Mar 2014 19:59:14 +0000
Message-ID: <CAJTo0LYuTsUkt8E0oTn0CGG+JFQhM67eCAHBRiX8W_1Fw67ErQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Mar 2014 19:59:39 -0000
Content-Type: text/plain; charset=UTF-8

On 20 March 2014 19:01, Laszlo Papp <lpapp@kde.org> wrote:
> This init script is adding support for sysv and no more. This is also
> indicated in the first line of the commit message. I am sorry, but I
> will not test it systemd and with other systems

You're not being asked to test with systemd.  You're being asked to
add LSB-standard sysvinit-specific headers to a sysvinit script.

Ross

