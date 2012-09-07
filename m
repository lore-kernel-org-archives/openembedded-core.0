Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TA7Yr-00086J-Al
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 01:02:05 +0200
Received: by eekb57 with SMTP id b57so41068eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 15:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dCLwVwKIRHtUHOJT94l8cwwGAnH6/kiaHe+2NNNY/7A=;
	b=mk2Zdu7nCjnLdglfl93Ms/Fj+c6GgdU0LSG6zmN97s0IZx6AImWyj7N/nEEKtoxSCf
	fojmKWLD+0mKish1EhrfCSU4oH/KDiDmWq2fgPNaeSsAmqmk92+EDdIXfQOEoaH3ikKM
	UvJR9jSdzeQwmQP2OEn64ZbWAnBpPr48Qg8LngGnpW+Mdubb+Fc+k/XRZpZst91MbY8s
	YHuyJ4MSHg3fjWoGJgVChzXEXzkl7LXSKnwrMYtYxYn+UTioGavhyQzPvyyeLrOg5XLC
	d5Mwxi9ACG4FY9W8W4u/I+lXp0M3B3AD8cpI86RWevpQJVpi4YZ/YZ5z6fhBG7FbL5hq
	Cj8Q==
Received: by 10.14.218.134 with SMTP id k6mr10192519eep.14.1347058179165; Fri,
	07 Sep 2012 15:49:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 7 Sep 2012 15:49:08 -0700 (PDT)
In-Reply-To: <1347052157.4396.225.camel@x121e.pbcl.net>
References: <1347041849-1559-1-git-send-email-sgw@linux.intel.com>
	<1347052157.4396.225.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2012 15:49:08 -0700
Message-ID: <CAMKF1spw6qdJkZ7xDZcF=AHJkr7xT=fvHvg2b4Akgsp+MDqeYA@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core@lists.openembedded.org,
	Marc Ferland <marc.ferland@gmail.com>
Subject: Re: [PATCH] openssh: allow root login when debug-tweaks is enabled
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
X-List-Received-Date: Fri, 07 Sep 2012 23:02:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 7, 2012 at 2:09 PM, Phil Blundell <philb@gnu.org> wrote:
>
> I know dropbear does this sort of thing already but we should really try
> not to add more of that stuff.  If it's an IMAGE_FEATURE then it should
> really be getting handled at the rootfs level, not burned into the
> packages in the feed.

infact yes thats a good approach. I have something similar locally
implemented as ROOTFS_POSTPROCESS_COMMAND


