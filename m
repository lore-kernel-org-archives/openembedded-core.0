Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFAzr-00020L-Ms
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 23:15:10 +0100
Received: by mail-vc0-f181.google.com with SMTP id fw7so987798vcb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 14:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=lsoQwkqLMvqvceAiqOdmqAcs69jM+My5s7UNAfNtz0o=;
	b=gBq1U2hcFFz4l0HFx9pW4RPeTs5vWjL2+UGUZWMs1UFxhri2jS9D5xUQllWDKuANbX
	qQ85KTnbkEp8Jh+7I3ceI4Si/Mw/1oMXsajWcL63FY3tytEEXNM9IYCoBJr5b+d4oanV
	Fkax2Hm7PDB17X3UIulAAVWr0ZvLXysIN5raP/7KrQXqH6OsgH96Ilj9reLJZixV+L0q
	jMlxk+rHTa7Ktx5ad642Aq+PBlusMJjUG7wSVN3J8yPZZuMFfZUtVauSuw1+fDZTuMAC
	VzBsbZn1Ll3EgnDHUdGtF8ljJLxh+eDbfzSs4OMd2QHnMM/cofLqSKzbyf1aY6VPBbjs
	YEmw==
X-Received: by 10.52.155.5 with SMTP id vs5mr4836976vdb.24.1363039109033; Mon,
	11 Mar 2013 14:58:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Mon, 11 Mar 2013 14:58:08 -0700 (PDT)
In-Reply-To: <CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
References: <cover.1363031776.git.ross.burton@intel.com>
	<CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
	<CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Mar 2013 14:58:08 -0700
Message-ID: <CAJTo0LbD5r6EJJKpUngtx7e7ZKjMaTSK_HfterELoCbTj77PWg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQlB3YZaxqQKmYVMmQNagvknwjDjGpGcCiU0MqA3b71J1tWy2vv/ORdO3xoe2EmUInfS4+DT
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/9] hybrid systemd/sysvinit
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
X-List-Received-Date: Mon, 11 Mar 2013 22:15:14 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 11 March 2013 14:47, Otavio Salvador <otavio@ossystems.com.br> wrote:
> I personally prefer to still use meta-oe systemd class and keep the
> possibility to product images with choosen init system. I think Martin
> will also prefer it.

I'd love Martin to speak for himself in this thread.

The big difference between meta-systemd and this series is that if you
enable both, you'll get a few service files in the sysvinit images and
probably libsystemd-daemon.  In total we're talking about a 50K
increase here which is for practical purposes negligible.

Are you objecting to the redundant service files (which you could
remove in a image construction hook, along with anything else that can
be wiped when you need to save every byte), or something else?

Ross


