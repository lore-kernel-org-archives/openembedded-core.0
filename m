Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7513A6E667
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 17:22:01 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id w143so14400828oiw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r8iMmk6d+/dM/Qbdub/+iWM/jg0bxRJ1Tylm/XnHP7M=;
	b=BvjqDbFtk6EsNWkwJ7WSICu1CRDW+TYozf7BpVEADXWzx+DMmWU7XnWeA3Cr2KABzL
	G1JX2axJNEKHib0UNxKwaS1UP87rJgSUJXKx51g/RIG8lWrUF9Ej4o2plSdGiyzpBtgk
	eFXNt2k7s7ktvby7ffraHVF5Eoc+kyuDVVB7SaGx+A5JhrpHczYRbSgFLCNQvbYY6NEy
	vT1H5261l5/soj0dhy69YJwwtQtg7bY+K6e2QuxZsvjM9UHNUGtKyPOOfQtphXX9tWad
	eccGT2j+aVAz3ivUWeaYvj9sC1DkMJvHEbyg8yGks7k3RD8fuFQSctyjWw7P4+QXZtS4
	3Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r8iMmk6d+/dM/Qbdub/+iWM/jg0bxRJ1Tylm/XnHP7M=;
	b=WIIM9e9gHyFn099If429kt6TqjuYRH7EN8fU3PHrKr3RKSBRVI8nKdbAqnPzVQrEdW
	6GxXNI6jKtwFzYJOO1Y+zvNPWdLkvCX5MDCOIzFMODcAMJDFRlJnzGy2qfkFtCEi3RdL
	LHbG4U7LO30vqCTdow/MKh+QQxTi1vnWOnJaSaM4oIl8Y6g5J8CbIqTpnFBNQVV3W/L4
	uUiVou4+YjKOffXlHWVvp36j00QwOzsFKZdjFlCWUPy/OY/oz6TIaNwEIlvTsyfz6nPj
	cbmxNtywkYaQ7UgisyQ1L4XkuG4oERLCPN7MTTtd+tZlnihhWIDcbVLIV1utSJFJ2LqD
	mi6Q==
X-Gm-Message-State: AEkoouvVmiFJiRFFerJs0YLFaXcyvyjBEqYuFJxvj9Is6U3p8lCC3Iv69Yxt14kaHZxj50RpSe2uUHVcPteoMg==
X-Received: by 10.202.253.149 with SMTP id b143mr35291486oii.34.1470072121766; 
	Mon, 01 Aug 2016 10:22:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.248.164 with HTTP; Mon, 1 Aug 2016 10:22:01 -0700 (PDT)
In-Reply-To: <CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
	<CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Mon, 1 Aug 2016 10:22:01 -0700
Message-ID: <CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Fan Xin <fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Mon, 01 Aug 2016 17:22:01 -0000
Content-Type: text/plain; charset=UTF-8

That's actually not a bad idea, but I need to crank out another
abstract today (the deadline for special session snuck up on me).  We
kinda needed this for a project, but I think a tiny print server is
always useful.  What's your plan?

Steve

On Mon, Aug 1, 2016 at 10:16 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi,
>
> On 1 August 2016 at 18:13, Stephen Arnold <stephen.arnold42@gmail.com>
> wrote:
>>
>> Thanks, our timing is great (since I just did the same thing on
>> Saturday but didn't send anything to the list yet).  Still have some
>> testing to do to see if it actually works; recipes are here:
>>
>> https://github.com/sarnold/meta-small-arm-extra/commits/master
>
>
> Literally ten minutes ago I was wondering if there was any interest in
> ripping the obviously broken CUPS/ghostscript/etc out of oe-core and into a
> meta-printing layer that someone could actually maintain.  Would you be
> interested in that?
>
> Ross

