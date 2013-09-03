Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id C29DB6BE31
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 16:43:46 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id tp5so6380411ieb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 09:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Z1zBFCYByh5Zy+opeZ8jeCNlZNq642RVbC36DN/3Xkk=;
	b=EXL/kEzYIanf/WLJbNlK9vWh34nWDr8hX9nOZMGkjKWhBSfzNctMLMBxF8c91DjHu+
	JiUwv0Nv/hXa2lzU/06d63onfqW2C5CUfhAy6tAL7L3WkM0mT+neLvsmAjJpiKKZvKc8
	acbQ0xMawP0KlXmwcAR0LMqKt4oSFURSxCbOMzEEDbNoDLq6WZa125mtgNAQ3+hdCGAy
	xxf/0Bevs25IVsZOVKM4A0ph2ewt5P/UrWH6J3jxZKMgde+ByRox3LOVNz6BODSjYYu0
	bTCaGKYINIEUkeUn7WZglIBxvQsRDROyjpZqmNocT0hv22Ys8ucYdCQdXJh1rMcy0tK2
	s7wA==
X-Received: by 10.42.130.10 with SMTP id t10mr183820ics.92.1378226627428; Tue,
	03 Sep 2013 09:43:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Tue, 3 Sep 2013 09:43:17 -0700 (PDT)
In-Reply-To: <CAJTo0LYOH6_QV_R2Y=BLKE-NLMEdPpU4T9kxCc4BPvJWwia34Q@mail.gmail.com>
References: <1377672247-16456-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYOH6_QV_R2Y=BLKE-NLMEdPpU4T9kxCc4BPvJWwia34Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Sep 2013 09:43:17 -0700
Message-ID: <CAMKF1soXMvEFx+QFndWPaFymTRve4LCcJRgjz2O5o64t++mTDg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Cover for udev-systemd
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
X-List-Received-Date: Tue, 03 Sep 2013 16:43:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 3, 2013 at 3:20 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 28 August 2013 07:44, Khem Raj <raj.khem@gmail.com> wrote:
>> meta-systemd currently has a bbappend which provides just a cover
>> for udev-systemd, if we move this to the recipe proper then the
>> bbappend can be removed from that layer
>
> If we do this for systemd we should do it for all recipes that were
> part of meta-systemd.  I thought we'd previously agreed that
> meta-systemd would contain the "compatibility" provides for people
> that had previously used meta-systemd, not oe-core.

yes thats fine.

>
> Ross

