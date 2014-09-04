Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 313B571496
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 17:38:02 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hq11so11209420vcb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 10:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CXjgdyjRMBloKV6iLFSCTiwGklOTlTNrxIzTT8eS7J8=;
	b=pe70mL9qMyalElUSm+STZrsqxSEM+rzNtESx+O/6MIdwXyM//ako387q790zj4SNx9
	FXn04fFxiBoJjZtFuFM12yzpUonhiVv//PTQNCg0w3G8YkecKivRD70FPjFzHImzOPWG
	EBvpkHMk+42KEvLv2k/mL/2Ufz+kKcYtZ0GEItMU+IZ+DJCplayTrMmiJCqacMaac40m
	Q4TDqdfLT0fv6uqUVrRaoe4SNSkd/CU5DrO/vVsNK4Ze8b1muisNIK8CpqWyC5MzKYKg
	xG2KS6T/hcjXVPW7V2CSAvAxSZk/TX8y8Pcj8FFISzvcyvlxgyGtwX10u3lchI/B3CjO
	19hQ==
MIME-Version: 1.0
X-Received: by 10.52.175.130 with SMTP id ca2mr2465641vdc.94.1409852283760;
	Thu, 04 Sep 2014 10:38:03 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Thu, 4 Sep 2014 10:38:03 -0700 (PDT)
In-Reply-To: <lyiol3uxra.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	<lysik75pyt.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbNG14cHQN8JewwOd-Z0rBOeSpEQKHOQguSQweiQzLVtQ@mail.gmail.com>
	<540896F8.9040805@pabigot.com>
	<lyiol3uxra.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Thu, 4 Sep 2014 19:38:03 +0200
Message-ID: <CALbNGRRTcV8bst1tQYNZ-z6w7_aSXT3=pVMVLRQncDw4TwQEow@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 17:38:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 4, 2014 at 7:00 PM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> "Peter A. Bigot" <pab@pabigot.com> writes:
>
>>>> .inc files make sense with current packaging because they are revision
>>>> control friendly.  E.g. you can put the logic into .inc and follow its
>>>> history with 'git log' which is not possible when there are only the
>>>> versioned .bb files.
>>> You can follow changes to the .inc but not anything that went in and
>>> out of the .bb, but I do concede that git not tracking the renames
>>> directly does mean some histories are harder to track (although simple
>>> to follow as the commit where the history stops will tell you where to
>>> pick it up again).
>>
>> git log --follow foo_1.2.bb handles 90% of this:
>
> it's not only 'git log'; it is 'git blame' too and because git does not
> support renaming of files natively, the 'git log --follow' method is
> error prone and might compare the wrong files resp. fail completely when
> there are too much changes.
>
Did you ever use 'git blame' for few lines most recipes have?

Andreas

