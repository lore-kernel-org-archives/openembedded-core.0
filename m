Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SoYs0-0000K2-D9
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 13:44:44 +0200
Received: from mail-qa0-f52.google.com ([209.85.216.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 10 Jul 2012 04:33:32 -0700
Received: by qabj34 with SMTP id j34so48218qab.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 04:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=wOaF6XYaOeQN6f/Squ1nqehy8ilMlODx96p8T/FO3/0=;
	b=oUJ71yzpV11wIdVIleZg5FkIc48zxFJiZJuqXp6f8Opclgj4QxZyBqAAXSbhQ2q2K9
	q5zb3ZXY3pB0of90XX1Qt+zA3LhUG380zgCfhCivCESZA8MEA4+1+03GTMyienE98orw
	VSMvYCnwCsTO6Q/GLMr/vs7y8YkOz4AIVejlsuyRkFyTAR1Memfhsl3rGC5FhIj09xuP
	YOOibYlpL9uLZQ0Bx0Xb1KbcjY2UtWSKmsvMGWuN3MihI5v41fu7FXalrzsBB8lsEoth
	1JknJS2apw60ELz4h+V8hueiNdrNog4fBaNCldmZOplThcOqETEAyNi2vHy6UXM0J1LU
	qDCQ==
Received: by 10.224.39.75 with SMTP id f11mr69020686qae.70.1341920011600; Tue,
	10 Jul 2012 04:33:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.218.201 with HTTP; Tue, 10 Jul 2012 04:33:11 -0700 (PDT)
In-Reply-To: <4FFBEE58.7040101@communistcode.co.uk>
References: <CAJTo0LZ1W6mD2mdadeqdvyVubgGSozcF_Nw8xbvr4fAsRgJK8A@mail.gmail.com>
	<CAMKF1spG4BHD6aHQ1WeSFt5hS0tWgoF2HHT6BFg3tbC_aFEpbA@mail.gmail.com>
	<4FFBEE58.7040101@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jul 2012 12:33:11 +0100
Message-ID: <CAJTo0LY0RrMY5FbSbyK4VQm67AHHs2wgFU9G=N6_a6eVkv+d8Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn0SbRcbA/inzb3so6P9IFX6iQdNSyosmlEMApVTmBJeyKqgZWkueYchlYG25fS9AKmZaJb
Subject: Re: The Mythical Sato Replacement
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 11:44:44 -0000
Content-Type: text/plain; charset=UTF-8

On 10 July 2012 09:56, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> Did you consider QT instead of GTK+ ? I think having wayland would be
>> cool.
>
> I think Wayland support would be cool also. I think it would be a fantastic
> way to get people involved and encourage adoption.

Regarding Wayland, I covered that later in the email.  I really want
to see Wayland in oe-core, and the Shuku plan includes a Wayland
route.  I had a good chat with krh last night, the hardest bit will be
updating GTK+ to work with the latest Wayland.

Regarding Qt/EFL/wxWidgets/whatever, as Richard explained the
underlying principle is the most return on investment.  There are
several factors:

- the toolkit must be known by the person doing the work
- the toolkit must have a regular release cycle
- the toolkit must have ABI/API stability so that upgrading the
toolkit doesn't imply updating the UI
- working on an existing UI is better than starting from scratch

I'm willing to step up and do the initial work, and my preferred
toolkit is GTK+.  The Sato shell is sufficient for our requirements,
so the Shuku proposal is a low-investment plan that should give us a
refreshed UI for a few more years.

Sato has been on life-support for several years now, so if someone had
a pressing urge to write a replacement in Qt or EFL they've had plenty
of time to do it... and nobody has.

Ross


