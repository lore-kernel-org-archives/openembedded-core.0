Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm2Bc-00045a-MU
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:58:49 +0100
Received: from mail-qc0-f197.google.com ([209.85.216.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 04:44:01 -0800
Received: by mail-qc0-f197.google.com with SMTP id x40so6458066qcs.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 04:44:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=yODpwaa0uSANB8pkjRdkmhMh9HwOMkAce7h0dPdJWtQ=;
	b=WGC0TjbsIcHM645wLe3eWMfbrRakbt5eZsQKpQhHTSo/J5QvHz33hd1g4RFnSDZxrN
	nvkRD68YntQ/+uvUsreovRbJPIOevA54Udt3wvNSmKqoZJttgWuJT/pmh7dwCmBb1rzb
	aSiRc17GsTkMwAQdyVss3F4xU9wAiYwaw4CoczmMi8Vc/bDtyqQ6jAHRbTzvB8xiA1++
	EED7rY7+D4A51ajy35uJZfqbp4emPRfAr23s2JJATQJQEMLgMB9y8nAARKOy8+0BMpZ2
	UbDTLtrz/4VVN3TXPjsOEAAcKLrieUB2bqXPFqqAlOdI80btTLCobD8H22Ryu6kTxnZ7
	nLtg==
X-Received: by 10.52.75.105 with SMTP id b9mr17271610vdw.28.1356093840890;
	Fri, 21 Dec 2012 04:44:00 -0800 (PST)
Received: by 10.52.75.105 with SMTP id b9mr17271608vdw.28.1356093840835; Fri,
	21 Dec 2012 04:44:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 04:43:40 -0800 (PST)
In-Reply-To: <CAJ2CSBuAX8OZbCMmiscgUmpTqyxvHf9Nz_DrVVzucKVB=bqWdQ@mail.gmail.com>
References: <cover.1356021837.git.alexandru.damian@intel.com>
	<CAJTo0LbiAedLWj7YNHEjXyS9XhUPpOWcHuB+RUuXhMBkWFSAiQ@mail.gmail.com>
	<CAJ2CSBuAX8OZbCMmiscgUmpTqyxvHf9Nz_DrVVzucKVB=bqWdQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 12:43:40 +0000
Message-ID: <CAJTo0LaUveLeohPNW2ADAUPJeVmqOC8EHNNL6S5n0jRW7m7dSw@mail.gmail.com>
To: "Damian, Alexandru" <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQls7dsPaqiFxuBbAr7tcPxLYh2iZQfLHX7cIBED99pEcZ991kDz33d5ThuNdpUvOZHXtvbAgQsK/8lFzlepUsIAat8/nwKm4KT6eNxR8N6kXs3eLUWSWR9NA6mHsxGcM0nclXhA0djcLYgjIcJaLsj5yexYC1J6qq3VMxMkbpTjk38D48G/imEGOEgdhIdV2Dkz9QKt
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Initial wayland integration
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
X-List-Received-Date: Fri, 21 Dec 2012 12:58:49 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2012 12:38, Damian, Alexandru <alexandru.damian@intel.com> wrote:
> Actually, I'm thinking like this:
>
> - wayland, weston - initial commits
> - mesa-dri - only patches.
>
> It makes sense in my mind to add first the commits and then enable the
> recipe change,
> especially when it's not gonna work by default anyway (since mesa-git isn't
> enabled).

At patch 2/3 you have a weston package that doesn't build.  Reodering
to wayland/mesa/weston means you:

- add wayland protocol
- enable wayland in mesa
- add weston

It's a logical series of patches, the categorisation of patches vs new
recipes is irrelevant.

Ross


