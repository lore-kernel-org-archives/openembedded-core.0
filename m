Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Swapa-0001Kp-Vv
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:27:27 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:15:47 -0700
Received: by obbuo19 with SMTP id uo19so10589864obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=R2QeSOPLzfWD1iMeuO4tBW9KQsXZdb6iBysSB3attGM=;
	b=OtZ8cAe8tKTY0zIlmJzwuT50QAxkPGPwu9m3vj+hmjAc0juX83If15qjR8MgSJhINf
	8D47BRpXbADPLEj07uu18PghP1UXxfRqk7i5m3q0Ua7OZNTpeNAMlwtNMjaz7ei7FQtK
	MjiGmYbtgnH9DC9+jeQ/LBrMC6afZVbimh4+0KXk0xZnRkw7kdKW6byXBkdHO/+lD7gr
	ndf4fiRfSSc56F5kC7zmEot+JEmnKuRKpDvg9B08s9FhsZm5v0qLqnY+dgixE+WSeWaO
	DdHO2MQ02Klt0RtEbOd8jaoKugHil2Y+NTLgDwjyypbEjiBwEalhrqR/P0WScIbojpF4
	EDog==
Received: by 10.182.169.40 with SMTP id ab8mr29841142obc.34.1343834146876;
	Wed, 01 Aug 2012 08:15:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Wed, 1 Aug 2012 08:15:25 -0700 (PDT)
In-Reply-To: <607356EE-A40D-42AA-9D2E-AF7991F8F013@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<6d27974b9045ca97ce135095a9d48715ac5bdc6c.1343823907.git.ross.burton@intel.com>
	<20120801124455.GE16306@jama.jama.net>
	<CAJTo0LaTWibL0ep=H0UsLXrL9mrFroX6vVcQGW-1vySoDAX_sA@mail.gmail.com>
	<607356EE-A40D-42AA-9D2E-AF7991F8F013@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Aug 2012 16:15:25 +0100
Message-ID: <CAJTo0LYxEsbHuE-viwV0HUf1B0p+J5_nOys2XC7cw6OH=njRPA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQld2HIVsNBwlOadzsn4MiY/qMf2JWPLYqNBqxbozdtHC2khhWG64LjmMvLxDKNx8nqgB5uv
Subject: Re: [PATCH 07/12] mesa: enable GLESv2
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
X-List-Received-Date: Wed, 01 Aug 2012 15:27:27 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2012 16:14, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> I've changed my mind on this -- gles2 is just another library so if it
>> isn't used on the distro it won't be installed.
>
> And shouldn't all this be a machine feature? Making it a distro feature is a bit draconian, no?

It's not a feature in my local branch.

Ross


