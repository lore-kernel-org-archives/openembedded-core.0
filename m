Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id BF1AE6A619;
	Tue, 11 Jun 2013 04:13:16 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id 17so18851440iea.31
	for <multiple recipients>; Mon, 10 Jun 2013 21:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aMiLFyGvsYvHEBBH/dkSBCwlu7kC2zBnC2eQpCzZsig=;
	b=j/xGHYQp9/1YLk2JTWXASky9vvP2c8rPZtsx6LBAJW3Pc4XWFsHOr3PIFyVgouA1xt
	NjdXa4R6PqtsT0Y70a+JlAsWCum2vkQh6HyMeIZ0yMiEt7e31EIDs8gwfX7bdEt1cyOH
	eQ9uCwvDTH73LCfFaMvVCvzez5YtMqNRT+07KZtfO0o02jtwVKIEY2petZxo57HcyEXF
	1OjI/NgIZW+BCwpVSdvqTyPXkPYBsNfdtCsenhzrcgEagQxKhfI3jsgDVX8LondhMZi1
	HyFwKOaDfcNzR8QyLoOFAAa8UhnuT8Bkt5bISck7wlaPDoBn94Wm3OfBYq+0L6q1H4Zf
	Dn9w==
X-Received: by 10.50.111.38 with SMTP id if6mr25055igb.74.1370923997453; Mon,
	10 Jun 2013 21:13:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Mon, 10 Jun 2013 21:12:47 -0700 (PDT)
In-Reply-To: <20130610155044.GS17357@timesys.com>
References: <20130607154357.606025038F@opal> <20130608091020.GO22710@jama>
	<20130608091556.GP22710@jama> <20130610155044.GS17357@timesys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jun 2013 21:12:47 -0700
Message-ID: <CAMKF1spvVOLu5uKFWXC=yqzHV73N61sOqUwj=gg1ZUVK=uN7OQ@mail.gmail.com>
To: Andy Voltz <andy.voltz@timesys.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Andy Voltz : tune-cortexa.inc: create a common include for cortex-a armv7a tuning
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
X-List-Received-Date: Tue, 11 Jun 2013 04:13:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 10, 2013 at 8:50 AM, Andy Voltz <andy.voltz@timesys.com> wrote:
>> > ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
>> >     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>> >     Following is the list of potential problems / advisories:
>> >
>> >     Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (${ARMPKGARCH_tune-cortexa8t-neon}).Toolchain tunings invalid:
>> > Tuning 'cortexa8t-neon' has no defined features, and cannot be used.
>> >
>> > ERROR: Execution of event handler 'check_sanity_eventhandler' failed
>> >
>> > Please use tests like
>> > http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune2-test
>> > to check that all tunes are still valid after such change.
>>
>
> I was not aware of this test. I'll look into this.

This patch is not going to work. How did you test it ?
Its trying to substitute into overrides which then are not expanded
before being treated as overrides.
as a result overrides variable themselves are wrong.
We have to revert this patch please and I conur with Martin it did not
seem like a significant improvement either.

