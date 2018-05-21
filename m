Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4D29374F83
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 19:21:05 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id g72-v6so9426296vke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 12:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r4QEtmA44P7OG39x7NHXf6ViPt17PXEH2761OFWuLnI=;
	b=gPB8cZuAj5/hi7pEA3SfgEGIXhF3bK4fcfxhHndftoG9PtarX85Wy5LHPAg7miph8q
	bfk+EkLZNaWjOyWzYM+8VmOPgTanawiTmKyEEwBpcy1v9hLtIJp9s1AighOef/t9KCaO
	JZJlXcudc8Z0gYrVDy2jYaq6NQRng9ROwIS9OPxPJ+cvAhwGMqrY4hX4EoJiXWl0wioD
	436S0gnQXCb+6qVT4pNT0y5cRWb0oumQsbx3C6sGI8NjKPSGVMEy7u6cUpF2paCSZH8n
	81POKJbqWA7dsjICCocRcinQvwXTN1bpLjLNQdlESp0Gb0wPffFUDehTtYHDJW5tHOWm
	yPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r4QEtmA44P7OG39x7NHXf6ViPt17PXEH2761OFWuLnI=;
	b=A5Kre4Se5ZowQtG1kFMFzU5hq0LVZs2mgztjSB/49no9eCquhbvHp665iuzxGfu4Nx
	4rEs7vwAfM2MidiHudX/QFCungwnl2OdgpxkBVxjeFgNoIsOah9ArOMBUQMn51f58nZG
	iS/mGT5wIZIvKNaI+pkFwV/JflGpEH8lpT6gmPcN+2TuN1Jscq0WvH82rJBdzV+92MBl
	5nHL3TO+H/COfpVUqDCgtFtGuOQk4zFNYFV9QS+oJW3je8RA3FV0qZsr5D/RpEEsX/5R
	FRwAlQ8J7PWX1CV3ZiVHjKiKF9JKyfWWKNprnfcNgteXCOeS4HQoz6RmKs0vcQOVZI8W
	hsNg==
X-Gm-Message-State: ALKqPwda+83nGXm3eAKpnAYuDjD9HRfgcCN0Fpp/YBKLA6YEJNV9RaeL
	COYBADbKSAeBZgwGI5D6neeY3Ldbclm+OxOcx+E=
X-Google-Smtp-Source: AB8JxZqsiv6pa2OzqAqAjoyryc/oEYcZvErsViTtql/1Hdj6HNcEzTRF4HQ/iwVcroFVnsnfJWtFN8R7QddXIT0MgbU=
X-Received: by 2002:a1f:28ca:: with SMTP id
	o193-v6mr14099898vko.194.1526930466820; 
	Mon, 21 May 2018 12:21:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Mon, 21 May 2018 12:21:06
	-0700 (PDT)
In-Reply-To: <759e0c6d-d9cc-4ec2-2e56-871b18ae9313@gmail.com>
References: <1526827795-10448-1-git-send-email-akuster@mvista.com>
	<CAJ86T=XKQdbiH3ND0Smmpne7FX=PqEtox9GJrJJi9WfiRZcOBQ@mail.gmail.com>
	<759e0c6d-d9cc-4ec2-2e56-871b18ae9313@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 21 May 2018 12:21:06 -0700
Message-ID: <CAJ86T=UX195m2f_aSiR4uM7G++1rjLKj+_vvtERsKCLH7uMDOg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] busybox: update to 1.28.3
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
X-List-Received-Date: Mon, 21 May 2018 19:21:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 21, 2018 at 12:13 PM, akuster808 <akuster808@gmail.com> wrote:
> On 05/21/2018 11:18 AM, Andre McCurdy wrote:
>> On Sun, May 20, 2018 at 7:49 AM, Armin Kuster <akuster808@gmail.com> wrote:
>>> From: Armin Kuster <akuster808@gmail.com>
>>>
>>> [v2]
>>> Add back busybox-udhcpc-no_deconfig.patch ti SRC_URI, missed earlier
>>>
>>> [v1]
>>> removed patches included in update:
>>> busybox/CVE-2011-5325.patch
>>> busybox/CVE-2017-15873.patch
>>> busybox/busybox-CVE-2017-16544.patch
>>>
>>> refactored busybox-udhcpc-no_deconfig.patch for this update
>> Did you check the defconfig?
>  That patch does not touch the defconfigs? It changes the dhcpd.c it self.

Right, removing that patch has nothing to do with the busybox
defconfig. I wasn't commenting that particular line in the patch.

>> Often it needs a refresh, otherwise any new config options added
>> between busybox 1.27.2 and 1.28.3 will take busybox's defaults (which
>> may enable new applets or features which we haven't historically
>> enabled when configuring busybox for OE).
> am I missing some context here?

Refreshing (or at least checking) the busybox defconfig is something
that should ideally be done whenever the busybox version is updated
and it wasn't clear from your patch that it's been done, so I just
wanted to double check.

