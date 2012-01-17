Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RnFM0-0003Xl-A9
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 21:10:00 +0100
Received: by qcsp14 with SMTP id p14so2139150qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 12:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4k4RhXFXp8cODjXabt5TyNagjBALOk/uyeAjaOBWEJQ=;
	b=LUsbxkVs2Fhl68tlcSPtRxxxkMfhwwraQmS//QOzY5JoBVjPwyPHm6l6YdyPN7M3mo
	5y7WirWvNUdS02eT3R6Xecol1ei2MRVgGxYiGqJG8hQtNcvbx5BmgDiaSTfqzipSmpNT
	IGBcumLKZnBeIcVLG9d+BXgAAu1+rC6yv8+0g=
MIME-Version: 1.0
Received: by 10.229.136.11 with SMTP id p11mr6871382qct.4.1326830542482; Tue,
	17 Jan 2012 12:02:22 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Tue, 17 Jan 2012 12:02:22 -0800 (PST)
In-Reply-To: <1412695.vvBBPeJL4B@helios>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<1322066940.26081.27.camel@phil-desktop>
	<1322068148.15626.15.camel@ted> <1412695.vvBBPeJL4B@helios>
Date: Tue, 17 Jan 2012 13:02:22 -0700
Message-ID: <CA+M6bXmAt2xBmCpiXBXxtEB-ykB_4qwtZqF9FrgXf3AD7ranpg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2012 20:10:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2011 at 5:55 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 23 November 2011 17:09:08 Richard Purdie wrote:
>> On Wed, 2011-11-23 at 16:48 +0000, Phil Blundell wrote:
>> > b) introduce some sort of concept of "feature epochs", where the DISTR=
O
>> > gets to declare what epoch it is expecting and the compatibility code
>> > then backfills DISTRO_FEATURES to take account of things that were
>> > enabled by default in past epochs but have since been removed. =A0This
>> > introduces a certain extra maintenance burden but it means that DISTRO=
s
>> > will no longer get unpleasant surprises
>>
>> I'm wondering if we can do something in the core like:
>>
>> DISTRO_FEATURES_BACKFILLOPTS =3D "pulseaudio"
>>
>> and have the distro set:
>>
>> DISTRO_FEATURES_BACKFILLCONSIDERED =3D ""
>>
>> and then add some code which looks for anything in
>> DISTRO_FEATURES_BACKFILLOPTS but not in
>> DISTRO_FEATURES_BACKFILLCONSIDERED and adds it to DISTRO_FEATURES.
>>
>> Distros can then opt out of a given feature by adding it to
>> DISTRO_FEATURES_BACKFILLCONSIDERED.
>>
>> This would let us maintain compatibility but also move forward and
>> create new settings with names that make sense.
>
> I'd like to try to move forward with this fix (although I prefer an alter=
native
> term to "backfill", perhaps "introduce" instead?) If this is what we want=
 to
> do, should it be implemented by:
>
> (a) modifying DISTRO_FEATURES directly (as I think Richard is suggesting)=
, or
>
> (b) a simple python call that the distro needs to add to their own
> DISTRO_FEATURES (i.e. "${@distro_features_introduce(d)}" ?
>
> Option (a) is a little tidier but (b) makes it obvious where any introduc=
ed
> items in DISTRO_FEATURES are coming from.

I'm terrible at naming things so I guess backfill is as good as any (I
agree with Phil about introduce).  Option a is clear so long as
there's a good comment, so lets go that way.

--=20
Tom


