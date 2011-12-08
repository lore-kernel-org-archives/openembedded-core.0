Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYkxB-0007Mn-Am
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 21:52:29 +0100
Received: by lahd3 with SMTP id d3so857768lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 12:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=y3lerZpmnlz7e9SlmVK9mk36L/XOWXKFqxhzJV9Eqbw=;
	b=LFbHmqHu9DE7a4Rlu7sT8er02U+5QCaM2x4OHx4ZhBi1e4XhMiQ1bx17Cz37I3o6A/
	hRzmaMEAY6s9gnb5vPKFBjWT/RnUZ9LWKGTTATXnbzCiLdzwFxgGPwHAQrfV2g9EeupM
	YGPajTipdNHDfTGuE+gI2njwkNMEmP0oz8jWU=
Received: by 10.152.104.103 with SMTP id gd7mr2974566lab.34.1323377135321;
	Thu, 08 Dec 2011 12:45:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Thu, 8 Dec 2011 12:45:04 -0800 (PST)
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E3FA7B5E@orsmsx504.amr.corp.intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
	<664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
	<7e5d0671426509d061abbe8b320f65f2cfb3a8a0.1323323130.git.nitin.a.kamble@intel.com>
	<CAMKF1spqOpuz-M7e-F5Cwgx_ufQ4m7MTfBv05StCCXE3e5zV4w@mail.gmail.com>
	<1323335282.971.11.camel@ted>
	<9DA5872FEF993D41B7173F58FCF6BE94E3FA7B5E@orsmsx504.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Dec 2011 12:45:04 -0800
Message-ID: <CAMKF1sobk3Yu2RjRLDBP58bQj+5nZjva9LQMicDLC+2xfQsC_g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "hjl.tools@gmail.com" <hjl.tools@gmail.com>
Subject: Re: [PATCH 05/11] findutils: Fix compilation for x32 toolchain
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
X-List-Received-Date: Thu, 08 Dec 2011 20:52:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 8, 2011 at 10:37 AM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Richard Purdie
>> Sent: Thursday, December 08, 2011 1:08 AM
>> To: Patches and discussions about the oe-core layer
>> Cc: hjl.tools@gmail.com
>> Subject: Re: [OE-core] [PATCH 05/11] findutils: Fix compilation for x32
>> toolchain
>>
>> On Wed, 2011-12-07 at 23:14 -0800, Khem Raj wrote:
>> > On Wed, Dec 7, 2011 at 9:48 PM, =C2=A0<nitin.a.kamble@intel.com> wrote=
:
>> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
>> > >
>> > > Work around gnulib time_t assumption in findutils for x32
>> >
>> > if its a workaround can it be applied only to x32 with help of
>> overrides please
>>
>> Its not a workaround, the patch looks like a generic reasonable fix to
>> correct assumptions made by the program that aren't true?
>
>
> Even though x32 caught the issue, the issue is not x32 specific. And also
> other arches are building fine with the change. So I think it is better
> to keep this patch in oecore.

OK then change the commit message its confusing.


