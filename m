Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 331B8761A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 11:18:49 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so68572504pab.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 04:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=unJHqFWnIHIkRBrKWnJbZCKX30O+JlWGIeccMw2qWBw=;
	b=SFuq5KI+54RY89h4mKmdJxwMC3tbsMoa4UHVRGjwl3SLAa51eVdncjdFeLDua09Ete
	Z+fOEIXlqnaoppXbW5wgQc7ImLblhBBBvaVKk9nrtGroKY0j7M+o1ERqkKDFP3jDOCPN
	l/Ljc4MYOIT8tafQqqdZ8gObgqrrzv5EG0HHrfK857CNWD2XsjqRFPJ6GKHv3ZXyd36z
	iOcbn/gCaqHbfBD7qti5duvMckfKDn4H6a1iSDgXBV0gvZ2jIHQ20ixsuOGt3mnHM7XK
	Fl15YrJ6hOGR4/C7tRRj785+sZVv3rZbbIVV1sp60L7ihbtl2T2tLtoR6bzKQoUsD6wG
	SnPA==
X-Gm-Message-State: ALoCoQmQfVletklkVXMYAXpTrqHtN0qIBWJmJ9PhDVFn3bJ0JgV8vQ850Jj5eQptM98oFqxbmXix
X-Received: by 10.66.136.172 with SMTP id qb12mr81093239pab.84.1438082330161; 
	Tue, 28 Jul 2015 04:18:50 -0700 (PDT)
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com.
	[209.85.220.44]) by smtp.gmail.com with ESMTPSA id
	xs13sm34799344pac.3.2015.07.28.04.18.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jul 2015 04:18:49 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabkd10 with SMTP id kd10so68572049pab.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 04:18:48 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.67.5.2 with SMTP id ci2mr79100353pad.97.1438082328197; Tue,
	28 Jul 2015 04:18:48 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Tue, 28 Jul 2015 04:18:48 -0700 (PDT)
In-Reply-To: <DM2PR0301MB118383021F988F9AD22C44AB868D0@DM2PR0301MB1183.namprd03.prod.outlook.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
	<1437996407-29463-5-git-send-email-b54851@freescale.com>
	<CAP9ODKqYBs8XdR2+xL5ixxPRqSt2tMK1PbLmkAcg_Srhx5suMw@mail.gmail.com>
	<DM2PR0301MB118383021F988F9AD22C44AB868D0@DM2PR0301MB1183.namprd03.prod.outlook.com>
Date: Tue, 28 Jul 2015 08:18:48 -0300
Message-ID: <CAP9ODKrv04uCiQjEBS_0MV5i39j8UccuOBoZ-Ti0XMx5wOqm7A@mail.gmail.com>
To: Zhu Carol <B54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v2 4/6] gstreamer1.0-plugins-base: Add video-frame related patch
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
X-List-Received-Date: Tue, 28 Jul 2015 11:18:52 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 28, 2015 at 2:23 AM, Zhu Carol <B54851@freescale.com> wrote:
> Hi Otavio,
>    Really sorry for the Upstream-Status format error, we just kept the same with some patches on fido branch, maybe they are old version. And I still have a little confusion about the third comment. My question are as followed.

No problem; thanks by being responsive with the feedback. Comments below...

...
>> +Upstream Status: Accepted
>> +https://bugzilla.gnome.org/show_bug.cgi?id=736118
>
> The field is:
>
> Upstream-Status: Submitted [https://...]
>
> [Yuqing Zhu-b54851]: the Upstream-Status of this patch is "Accepted", I am not very clear about your comments "Submitted", do you mean I should add the web site in the same line with Upstream-Status?
> Just like this:
> Upstream-Status:  Accepted [https://bugzilla.gnome.org/show_bug.cgi?id=736118]

Accepted would be when upstream says it will apply it for next release
but you don't know when.

Looking at the bug, it seemed it was not been applied yet so it would
be submitted.

> I've read the guide line, here is my understanding:
> Upstream-Status:  Pending
> Upstream-Status:  Submitted [where]
> Upstream-Status:  Accepted
> Upstream-Status:  Backport [from where]
> Upstream-Status:  Denied
> Upstream-Status:  Inappropriate [reason]
>
> Just obey this, right?

Yes.

> So that is
> Upstream-Status:  Accepted
> That's it ?

To be honest, this specific case seems to have been addressed in 1.4.2
in a different way;

http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?h=1.4&id=f711288c7c86c33aed18f52ed6d7787d19b7741d

So this could be dropped.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

