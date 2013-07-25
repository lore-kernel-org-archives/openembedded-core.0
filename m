Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id BA73060FEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 09:56:27 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id kw10so23482vcb.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 02:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=R8SNT5f/pwn+W0p7r8LT5FoB6jxAuWNwWKyO4kUudOE=;
	b=LdkKoCZFlfLAhBaAMEJuXQL68gMN93MkzJfrCq34brCPS9uXz4FdrC6g5El95gui42
	s4Wv/JI6i/96BaKOMX8uRMNPv5ILo6KjZ7/+oqa5PjyCBPavWUx5ZN0tCLiUKJ9vVOs3
	Dgx2SmuV9t0tBt1/ChQx8zpSVIfwQ/jN5wZ4UQkWTmZtkaeCQXE9jj82P9+5xlsg554Q
	Jf4qc0NtNs5BlZQGKL6E8eqAYZ7Vg35joDCI/V/N1+DuhToZiuhsvEx2QGWhpf2xXXIE
	ke9x+hRfre2Xkpc9c3PY6khsvZ24RmrbNB5M+qB6ixYUGegXPa1MPYYkw3ZVGq/a6Srk
	Ol9g==
X-Received: by 10.58.67.9 with SMTP id j9mr17500521vet.22.1374746187859; Thu,
	25 Jul 2013 02:56:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Thu, 25 Jul 2013 02:56:06 -0700 (PDT)
In-Reply-To: <2332743.8PXxt6HHNa@helios>
References: <1374573823-27458-1-git-send-email-muhammad_shakeel@mentor.com>
	<ly4nblpn8m.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51EFD503.9070404@mentor.com> <2332743.8PXxt6HHNa@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Jul 2013 10:56:06 +0100
Message-ID: <CAJTo0LYi3+yOEVFPgfN8Q4NCg+8bwsViTXK386x4vk-TijB3nA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQmhxWb4jkIIwnjvwNYpfDoUaaeMk5dKXJaJpXfCTvfZyJzjAt+pq/PzxekzoUb9U+S/fr3v
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Remove init.d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Thu, 25 Jul 2013 09:56:28 -0000
Content-Type: text/plain; charset=UTF-8

On 24 July 2013 14:55, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> Would it work to simply check for any files instaled into systemd_unitdir?

Agreed - the list of file types has grown over time so we'd been
constantly chasing systemd, and it's not like anything else is dropped
into this directory.

Ross

