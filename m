Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 989E5755FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 14:05:23 +0000 (UTC)
Received: by oifu123 with SMTP id u123so32955616oif.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 07:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bJZ1a9rIZGalGKgXX58y8q3qSlDfI/p6Sg1ayppL8vo=;
	b=nEqfbzdPB1dJ5N+h4E0UDwFy3p5BQDiUbNRCsr2wCBYfK9iHFL0uziUd1S+B/kbZ91
	wt6mh0qn0Vqm/AJObgdB1uck5Rfvq9cktfE+YE4iZBn47lcx2KhLfJi13Pwp44mNJNlm
	RjuHbUAAGx1Ped8++H4mZkV+1GaK071l8+fZZBR4tVNbBszjJzToG50J2f5E+Z01gi1K
	B9U6VLCs1cTzsMbC4gektxKPm6Vw30GUXuoZsFtfLXvLonPTh5J4Ql6J1JYl0PtlSFSP
	7TrZcOWD8lx5IwNy849MewcAi+NWjqLYOe6vEhpC5wQBBM5XmtHxtpTRIa7+5AUZHx+z
	M3Mg==
X-Gm-Message-State: ALoCoQmP43u+YVg8CmgiJH+Tjs4MYGCoGpf4r78UXz19whBbP+JKyl0SlICEQvTHANv1I888uJE6
X-Received: by 10.60.145.131 with SMTP id su3mr2569326oeb.55.1432821924023;
	Thu, 28 May 2015 07:05:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Thu, 28 May 2015 07:04:53 -0700 (PDT)
In-Reply-To: <73D9548F-A53A-4223-B028-D116F8EDF929@gmail.com>
References: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
	<73D9548F-A53A-4223-B028-D116F8EDF929@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 28 May 2015 17:04:53 +0300
Message-ID: <CAHiDW_F3w8FTR7Z_AWOMfCJfMy9sMpQofRB9uDuHErReAMJZyQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][RFT] cogl/clutter/libinput/wayland/weston updates
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
X-List-Received-Date: Thu, 28 May 2015 14:05:24 -0000
Content-Type: text/plain; charset=UTF-8

On 28 April 2015 at 18:46, Khem Raj <raj.khem@gmail.com> wrote:
> I have had wayland/weston updates lying on my tree for some time now
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=eb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b
>
> tried git versions too
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=992c13dcd4b79fe64f4f9b8122627f918257ccef
>
> There are problem with emulator with 1.7 and libinput I guess where the
> mouse does not work
> in qemux86 as well as qemux86-64, it works fine with 1.6, I have tested all
> versions 0.8 and newer of lib input
> for no success. That was the reason I did not propose those patches.

I've been testing this and it looks like mouse does not work even on
our current version of weston on QEMU, _if_ it's using libinput.
Current Weston recipe happens to work because we default to "
--disable-libinput-backend".

I'll try to look into this more closely tomorrow.

 - Jussi

