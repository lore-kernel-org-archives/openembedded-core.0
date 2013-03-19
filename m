Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UHvA7-0005I9-G3
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 12:57:06 +0100
Received: by mail-vc0-f171.google.com with SMTP id ha11so263043vcb.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 04:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=bkDRi6j3e9Rdw/cKH9e1lJj/tWTjdm/aT8DbQaFVbMY=;
	b=ghBjn+K4lyhc5rF1rf2xv97vpUa1dBDrLo4uqIx2UTSQJ+FIuGXEwL5MjUL+3TbVCQ
	wHGyYMjbhLDQi0ZWmIOdvGM8Dt16RI1BvljAlTA0pR9kQIP1q97MqFwDrVfahKRq9Hgr
	PS9erBuqnnOW2BGv4puMLAIJrSP/y43SlW9m3uZnmMm2dpTn1l8Qfpoi5sj84Cy1kTO3
	A5NxqPnLsW651pUFTzU0I9x2+1y+3NjEXvJxMDLOUrDQ45z1BnMNM/Fxk3EZ3f+X+QEU
	Qmgo1gW5ex1LDewv8lPiTQsEMfmWBC+8CUFjJxob1Y+Ou2roxPc+NAg2I147I5Pt20eH
	TMuQ==
X-Received: by 10.52.230.197 with SMTP id ta5mr1534864vdc.103.1363693213733;
	Tue, 19 Mar 2013 04:40:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Tue, 19 Mar 2013 04:39:53 -0700 (PDT)
In-Reply-To: <ly620wucp5.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1363031776.git.ross.burton@intel.com>
	<4ad7ea263a05fb3c1960623760340549a20c849c.1363031776.git.ross.burton@intel.com>
	<ly620wucp5.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Mar 2013 11:39:53 +0000
Message-ID: <CAJTo0LbdxA_kSdLQd8Qbr53BRzT8-EamBCbtzgk0hYsdnB_B3Q@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQkRhvUAImFc5+dv6P8fjGxlQV+3gRqkxcspiZZrusPYDLXgjNnBE42avlKwoZIzkxpMGat0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] systemd: allow postinsts to run without systemd being present
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
X-List-Received-Date: Tue, 19 Mar 2013 11:57:14 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2013 10:36, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> Checking for existence of programs in scriplets is a bad hack which
> might hide real problems and the scriplets are getting more complicated
> by this.
>
> Placing scriplets and related files into separate subpackages is a much
> cleaner solution.

Sure, but then you're just substituting one ugly hack for bigger
problems including upgrade paths, which aren't actually solvable in a
general way.

Ross


