Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5N4s-0003js-4B
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 22:08:08 +0100
Received: by mail-vc0-f177.google.com with SMTP id m18so328836vcm.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 12:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=4IF06jpmst79MxgdIqn2bCqa3EH+s+DgD/MUh4bX5dQ=;
	b=dkqPA1jy40RDkBhgcHjRmLzjDnluM8SAyzOnrFbDhdJ/Eb1i9yLsZ6URV2A0T0otT2
	2yQOj6F/3G6hSN6KzCoqUunp6GpmatAzRmuIpzCRfr21PL4UtJal6i/tXJlFznobKj5c
	/JrkCoT19b5JycZjQ2jh6nI3tVdeA1m0AQj9ZJzayMu0OHLJ3BR04al6qy5HfN4HWekD
	BKZLvyHG94c8ccsOy28l6fVcFKzVl3pWn7VmLRzwk5PHb3DSPM4UA5EVCArDBdJT+Lh+
	+tLT9apyUHswIdgU6t4tuCbyXWLim+6lLnLyGsGJ/73rcxowcPz1DoTGdwQwXO7hVm8F
	rW0w==
X-Received: by 10.52.23.18 with SMTP id i18mr22199783vdf.46.1360702305897;
	Tue, 12 Feb 2013 12:51:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Tue, 12 Feb 2013 12:51:25 -0800 (PST)
In-Reply-To: <CAP9ODKrOM9bh-MnzQvU29iVwYdRvw4m7DMYZUcMV=wKYJ5Q4bg@mail.gmail.com>
References: <2760168.9kFd94gL1F@helios>
	<CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
	<1906630.s5um26QAQj@helios>
	<CAP9ODKrOM9bh-MnzQvU29iVwYdRvw4m7DMYZUcMV=wKYJ5Q4bg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Feb 2013 20:51:25 +0000
Message-ID: <CAJTo0LYFcT5P=p62Nn2kBak33LCfBXQ_KFL-oF2bHFKhguk1rg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQnlDZeQsW43BPvBBoIkJfDw2u9N8ARStirqF5CoexxVl+kicRCChpRqZBhqJ7KR+jL5zGTo
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 21:08:12 -0000
Content-Type: text/plain; charset=UTF-8

On 12 February 2013 16:43, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Qt Embedded as we build it is currently configured to use tslib, as is
>> SDL. If the alternative (evdev?) is supported they could presumably be
>> switched over though. I don't know how practical that is however.
>
> Yes Qt Embedded uses it; not sure evdev is an alternative here.

I'd be surprised if QtE doesn't support evdev, but I've been surprised
a lot recently.  Can you investigate quickly to see if QtE supports
evdev?

As far as X and oe-core is concerned, tslib isn't involve at all
anymore.  There are xorg-input-tslib drivers in Debian but they've not
been touched for years, the upstream source URL doesn't exist any
more, and I'd actually be somewhat surprised if they worked.  Xorg is
all about evdev + xinput for touchscreens.

Ross


