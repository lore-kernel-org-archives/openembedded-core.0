Return-Path: <eu@felipetonello.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6BCB66B23E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 22:07:59 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w56so1103050wes.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 15:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=9Wo+4ws0f9NNsY9rrnMSiIvQr2ksh5utK21iY5Oj5i4=;
	b=ps90XIbW91SUKGdHFPo20GiAYiAxaFY3PHq/1Hq8BtwsmwoIHkesg+72zRkYN1Wrse
	VUd8bo7vC1tZue9PFK4nOr9fWA3nyr5CIy9WzT6/t++uX1w/kG7Dwx6ZIn5dxj1+lacU
	i2oGFmYF3iZ0/lhKPst84wHIs73XdRGIoEbLj8Mfy29N48qo7jcIV3pQZ5lBdjCiHeyN
	QkKEuOe74IKS8zDIg14Pw4IrkW6OOwsNQEVN6OwJWb5ABUOYsn5F+DnG9dDm1PqCrIu5
	wsmXc2P9P+NoFk0s0Cw9dPq9Q8Cv17v5U8C1XRhmjTM2nH1pgra49wE+pcc/n2Dd7e80
	/ekw==
MIME-Version: 1.0
X-Received: by 10.180.184.12 with SMTP id eq12mr2605892wic.8.1374012479495;
	Tue, 16 Jul 2013 15:07:59 -0700 (PDT)
Received: by 10.194.59.203 with HTTP; Tue, 16 Jul 2013 15:07:59 -0700 (PDT)
In-Reply-To: <20130711122619.GH3288@jama>
References: <1373303785-8508-1-git-send-email-eu@felipetonello.com>
	<51DDACEA.1080503@linux.intel.com>
	<CAJTo0LZ7POY-i61qz8hUE=JXbc0=0uoNo_i1aTmgi-ma_cc8hw@mail.gmail.com>
	<20130711122619.GH3288@jama>
Date: Tue, 16 Jul 2013 15:07:59 -0700
Message-ID: <CAGrhNMxBrhvRm9aTf_fwWDCjJES4r-tt-yanZpOERkS-Weyhjg@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQkhNRajIU71HHi/J5no7HdflZRByl0rQHlJhk0sy+Kzen7NTCxI93N5vn3mcwfbaHLPOGJg
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: Added consolekit dependency for pulseaudio-module-console-kit package
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
X-List-Received-Date: Tue, 16 Jul 2013 22:07:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Martin,

On Thu, Jul 11, 2013 at 5:26 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jul 11, 2013 at 11:32:14AM +0100, Burton, Ross wrote:
>> On 10 July 2013 19:50, Saul Wold <sgw@linux.intel.com> wrote:
>> > Is this really a build-time dependency or a runtime dependency specific to
>> > the pulseaudio-module?
>>
>> It's a runtime dependency, but from memory bitbake doesn't manage to
>> piece the chain together enough to actually build consolekit (probably
>> because the packages are dynamically created).
>
> The problem is that RDEPENDS_<dynamic_package> = "foo"
> doesn't enforce foo to be built before <dynamic_package> is used in
> image:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3498
>
> So if <dynamic_package> is the only thing pulling "foo" into the image
> you can get do_rootfs error about missing "foo".
>
> Cheers,
>

Yes, that's exactly what happens. I added this dep in my bbappend for
a temporary fix, but I would like to see a final fix for it.

Regards,
Felipe

