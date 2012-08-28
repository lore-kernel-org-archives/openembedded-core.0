Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6SKl-0001P9-3E
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 22:24:23 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 28 Aug 2012 13:12:08 -0700
Received: by obceq6 with SMTP id eq6so9628836obc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 13:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=tPfnLTf5Q+NZQ+i3A+MZvMOo8uYmfy7BNKjAnWE4vP8=;
	b=KQ5JJZZmds1C0mkYxzSPt6kC8W4LOoySy6oMN70pCeM/CrS/IZKDjhe8auTcdFGkXE
	7LemXLWDjm0ohUm7YaBx10kdpQclPDaPUFMMJJFqr0CiO9QqInPTETGZ6z/tvFmbPMl4
	Rf1kwgGX010mND1Ls7MfxGH+ru5s/uHVU9n4FGdUEFdKQIQA1Y/nF6rDeKtYXtjHX+5F
	58zDNSEELel0ODWonGy2n+YwfiDQuV6Nmm2rDR+RitoxAvqk0gvTB3QtJi8hR6fGOJBx
	tkW75vIJP1SEvuMZFNMtgw2P1L0e9D1X5p85jZJ74wmJQB/VErCG62rwXmK9ToCEnk7G
	2uIA==
Received: by 10.182.124.102 with SMTP id mh6mr13378663obb.48.1346184727460;
	Tue, 28 Aug 2012 13:12:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 28 Aug 2012 13:11:47 -0700 (PDT)
In-Reply-To: <5151998.0QU9eL25sN@yow-masselst-d1>
References: <1346178028-2036-1-git-send-email-mark.asselstine@windriver.com>
	<14807078.5pTOjMOMpo@yow-masselst-d1>
	<CAJTo0LaA16HKH7MDJ1b=CA-+qvqmMEY47ZsrKd9d_W0z8LBMRw@mail.gmail.com>
	<5151998.0QU9eL25sN@yow-masselst-d1>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Aug 2012 21:11:47 +0100
Message-ID: <CAJTo0Lb0P23jieSdtFuTPn+e2h+L9MNXbfQDz4Y+D3bRxSOBYg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Gm-Message-State: ALoCoQnHyzWSMeFWPi24hJX0dI5CmnLzdTNIqgpyJJy0NhIu/uTFbeq4Q8cJuwKuFG38bdAKSZ/Z
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] base-files: provide a mechanism to skip creation of the hostname file
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
X-List-Received-Date: Tue, 28 Aug 2012 20:24:23 -0000
Content-Type: text/plain; charset=UTF-8

On 28 August 2012 21:01, Mark Asselstine <mark.asselstine@windriver.com> wrote:
>> But surely this should be running very early in the boot, and a
>> DHCP-assigned name should be running afterwards?
>
> That hasn't been what I have observed, and doesn't cover the command line
> case. If you have an NFS root this would also not be the case as init will be
> run after the network is setup and root mounted.

There was an implied "and if this isn't the case, a bug should be
filed".  I hadn't thought about NFS-root though.

Ross


