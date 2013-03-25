Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKBFQ-0007VI-8w
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 18:31:55 +0100
Received: by mail-la0-f47.google.com with SMTP id fj20so11754589lab.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 10:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=lJeCOdtT5ye0ie6AtlKva4lDEUYFYJGgXkMDHeBpIt4=;
	b=XTFI1gxKoaWL6rBEmkrhdXkXYTbfffw1YC1LqOJEdPnCTHjqjU+hPh0rJO1q/Yukij
	9xPfyHSKmUR/efutKcLwfZduaP9jG3tKKKWKFYqUG7mcc2+MdtOInq66WW7vKIm7IvEB
	8ogOcUhE21Ti2x++Vss6O2kcmx5+Ql97Ks/jhVNu7rVpKzXPilcJuMpW4NpfylEewwZ8
	aDWUD/JRjmLA71yA49f/oxMPRIAXDtUXZcfSUq78wGefU+Afv+B/+tqdlAtQ3PugsI9x
	c2WfdJHWypPWyQYsZSBpAAeCW1bSeaSo7CX1AHwvPugRtlP1R0BW9FJclT2duCjP/6Js
	Steg==
X-Received: by 10.112.9.10 with SMTP id v10mr6629783lba.47.1364231693730; Mon,
	25 Mar 2013 10:14:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.81.231 with HTTP; Mon, 25 Mar 2013 10:14:33 -0700 (PDT)
In-Reply-To: <20130325170346.GD7539@jama>
References: <1364216841-32600-1-git-send-email-cristian.iorga@intel.com>
	<C39A6084-A254-4AE2-A9DD-49B88EDCB164@dominion.thruhere.net>
	<CAJTo0Lb9e4j-O2R5_wvkH=2APWYMZDnFw0pxj_YheeHZfUBdig@mail.gmail.com>
	<20130325170346.GD7539@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Mar 2013 17:14:33 +0000
Message-ID: <CAJTo0La=nhQTjNMLB=WwyOi-2akWsrj83m=1fbD9Y52y8+HxuQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmy8y1OypoWtAOp4LZ7+AzOU7LX5VgAajopLKNcZhDpzKj+x4pkZwW7FYQK4iscTSdZN0su
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/2] BlueZ 5.3 new package
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
X-List-Received-Date: Mon, 25 Mar 2013 17:31:55 -0000
Content-Type: text/plain; charset=UTF-8

On 25 March 2013 17:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> But opkg will still error out because of missing RPROVIDES, no?

I'll admit that I didn't test an upgrade path, but the scenario I can
see actually happening is that the distro flips its applications from
bluez4 to bluez5 so they rdepend on bluez5 now.  bluez5 will get
pulled in through that dependency, nothing depends on bluez4 anymore,
so opkg should remove bluez4.  bluez4 and bluez5 don't expose the same
ABI so they are not suitable RPROVIDES for eachother.

Ross


