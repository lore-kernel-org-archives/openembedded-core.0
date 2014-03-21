Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2280A6FA23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 13:59:14 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id kq14so2439266pab.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 06:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ZfDBtOhouhSAec+YVvDqosL4SbVkgaYuMn8UQLMRDDI=;
	b=H22GCphWTLIIGrVneBeaVmu4GVUSpz9tDkw5Dc0SxcQ+TexoFCBgcgl/Fp/s6z8vB+
	c6xapZnwtNGRCr7OeQnQ7j0x5jDUCdAAMmnmk7UhGljT6O5oPAs93zDob/nh6H5bGGAz
	XihrmJ2NypKAMxqpzGHn0MaEBC1u7tp4GMYU+jEh+E5oXJkIyx8SJjsbfWRr/FWr5FMb
	zw6NzZBarWdZkOHp7N4ifSHuV4yEYF6XOyXh//OeMZcO+ynwfjgw0LHlCC35/GZT1OjV
	GUgDC7MmjTIOAY7w6p9ugG00c6V0fFUGDlPiDmYKZjTTozE8f00gcKNsB5C1D+oJllSO
	ymlQ==
X-Gm-Message-State: ALoCoQnp3pwWSVr24nmgslqhJfLKGQyk8CWpY4mqQ/ShHCcxGXAPLLoOR5su+MpJm2N+Sc0PSCKL
MIME-Version: 1.0
X-Received: by 10.68.249.100 with SMTP id yt4mr4303482pbc.165.1395410355290;
	Fri, 21 Mar 2014 06:59:15 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.11.164 with HTTP; Fri, 21 Mar 2014 06:59:15 -0700 (PDT)
In-Reply-To: <CAJTo0LYuTsUkt8E0oTn0CGG+JFQhM67eCAHBRiX8W_1Fw67ErQ@mail.gmail.com>
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
	<CAJTo0LYuTsUkt8E0oTn0CGG+JFQhM67eCAHBRiX8W_1Fw67ErQ@mail.gmail.com>
Date: Fri, 21 Mar 2014 13:59:15 +0000
X-Google-Sender-Auth: oJGRg_o1ZPVjVqv0JpWFkLzYxgA
Message-ID: <CAOMwXhNqH76QKt9hsqpeOeRTBjKUix4e0GCy8PZVkrjCdm+OAA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Fri, 21 Mar 2014 13:59:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 7:59 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 20 March 2014 19:01, Laszlo Papp <lpapp@kde.org> wrote:
>> This init script is adding support for sysv and no more. This is also
>> indicated in the first line of the commit message. I am sorry, but I
>> will not test it systemd and with other systems
>
> You're not being asked to test with systemd.  You're being asked to
> add LSB-standard sysvinit-specific headers to a sysvinit script.

In my understanding, people were referring to two issues:

1) not working with systemd and what not compat modes. This is not
something I will test any soon.

2) It is not consistent, whereas if I take a look into busybox, the
consistency is what I do, apparently.

I would like to quote from the Fedora wiki for instance:

"LSB Headers are not required for Fedora SysV-style initscripts, but
they may be used. There is no requirement in the LSB certification for
any system scripts to be LSB compliant, and it can cause issues with
ordering."

So what is wrong about it without systemd and other compat modes? If
it is that big a deal (i.e. blocker), perhaps it is better to document
it in the contribution guideline as a generic trap.

