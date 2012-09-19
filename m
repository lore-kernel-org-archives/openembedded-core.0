Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TEL96-0001jO-Lf
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 16:20:56 +0200
Received: by eekb57 with SMTP id b57so385647eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 07:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=nmKF+G+xF1rbeXTXFo0s+iCpNndn2MgWCaKapLeHwQE=;
	b=lUsRUXlUjvNSKveFRaJitfdD3nKIWH4cnXb3pY4yz8q46iR8WjqFRwZeM2nBCItca7
	t2vvZ92hbhLp5PYMvDIno0G5QYt4N1lwXFniFlrNNE389cAozjuyKjIWbaOw27J2mx0K
	YZI85kjS5lCecueOibbxhL/TWN1f0vaX6IHoDqIt6UssA1Y6NATTd5q/hH5yAwVwhmpH
	9dJI3KcaDsBT2uRIb0N9V2MTqGk+xJtU5yMOEE0xp0vTK8vGZZyPK3fOstRyWzK1SJzu
	1jOyhpGLrDiCx2VbgFYhSfrHQLUtgp4EtGHbi8ErBgxWKf5lmTUrFiTVaHeoQIK7vVoY
	uA4w==
Received: by 10.14.202.71 with SMTP id c47mr3643720eeo.42.1348061880077; Wed,
	19 Sep 2012 06:38:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 19 Sep 2012 06:37:29 -0700 (PDT)
In-Reply-To: <3089732.XYZjcTqTr7@helios>
References: <70CC66F5C30A414DADDA6973E4CA391A68BAF6@039-SN1MPN1-001.039d.mgd.msft.net>
	<224680354.d9icDWC9tY@helios>
	<CAMKF1srg0a1GhHPqY9dS_AjTJRXS7wSNzH1-UBMUJEuaXfuidw@mail.gmail.com>
	<3089732.XYZjcTqTr7@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Sep 2012 06:37:29 -0700
Message-ID: <CAMKF1sq=+EBibPSO68d3K+TbhHp+fZk=f4WDq23APxn5M9oPkQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: multilib errors
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
X-List-Received-Date: Wed, 19 Sep 2012 14:20:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 19, 2012 at 6:31 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 19 September 2012 06:26:31 Khem Raj wrote:
>> On Wed, Sep 19, 2012 at 4:03 AM, Paul Eggleton
>>
>> <paul.eggleton@linux.intel.com> wrote:
>> > I have seen these errors as well. It definitely should be doing these
>> > checks - the warnings occur during the file checksum code but more
>> > broadly they indicate the system will fail to find these files should you
>> > try to build the targets mentioned. Looking more closely, I could be
>> > wrong but it looks to me that BPN is not correct at least in the case of
>> > lib64-build-appliance-image - I think it ought to be
>> > "build-appliance-image"  but instead it is "lib64-build-
>> > appliance-image", which means that it can't find the files referred to in
>> > SRC_URI anymore given that they are located in a directory named "build-
>> > appliance-image".
>>
>> IMO when we inherit multilib bbclass then it should also add new
>> ${BPN} based dirs to FILESPATH
>
> BPN-based dirs are already in FILESPATH - that's the issue, BPN itself is not
> the expected value.
>

Thats what I meant with 'new BPN'

> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


