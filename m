Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1T6bkr-0000Tx-3W
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 08:27:57 +0200
Received: by iaky10 with SMTP id y10so446507iak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 23:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/qygQQ3vndKMBhcN8fuGYWcgoEeJZSOfb5nsJHBULUY=;
	b=XMNsKAmm/JD5e3kCbvIcoefoPCwuuzEEa9QinaB76hQmLb8xEsz/qrm/O2Or3pD0uv
	maasQO/PmF78ixwMZ3IX+bOQxzoA+t4LSWKbkMfeNd817QMJT9eblv0Gxu/S+r0oSRAx
	NofCZeftFf1bvqZh0tc6aBrED4lUNdWNQNRSvEs2JGl6j5n9QIXeazwssqXYRc2lKxJv
	LeJeFpRekQhV3iCheWTIazBci3TuRWzj58MtFy6TCdpHeLg27AQlvvL2WbycLeQ1sAca
	s/8IHusDlUWJAxvrzFk0wBEGaCEEX10adVToyjc/t4JI1DyIp+CG84DXMGSb0sL0VhF9
	fPIw==
MIME-Version: 1.0
Received: by 10.50.242.71 with SMTP id wo7mr443565igc.55.1346220942934; Tue,
	28 Aug 2012 23:15:42 -0700 (PDT)
Received: by 10.64.49.45 with HTTP; Tue, 28 Aug 2012 23:15:42 -0700 (PDT)
In-Reply-To: <CAMKF1sp5PQiCyMRUD8_PG_cA8Ougu2jOmUwW9Hg2Hpv+2HChxw@mail.gmail.com>
References: <CAGiJk9dvZ=_eSZwcXRnsfwo+h0x9fWJnCapuSCVz_HftgJAw6g@mail.gmail.com>
	<1485327.Nf27BjiNnc@helios>
	<CAGiJk9dU3=Z+iTe0=v5rpQbFRsnBwQEJ_4Ywz0h+CaSR+xaZ=A@mail.gmail.com>
	<CAMKF1sp5PQiCyMRUD8_PG_cA8Ougu2jOmUwW9Hg2Hpv+2HChxw@mail.gmail.com>
Date: Wed, 29 Aug 2012 08:15:42 +0200
Message-ID: <CAGiJk9eNZ05-Ai9+bGVBCzxsBBLRMW_JLYrJoBECiyBd74Y=sA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Package re-order fallouts?
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
X-List-Received-Date: Wed, 29 Aug 2012 06:27:57 -0000
Content-Type: text/plain; charset=UTF-8

2012/8/28 Khem Raj <raj.khem@gmail.com>:
> On Tue, Aug 28, 2012 at 1:28 AM, Samuel Stirtzel
> <s.stirtzel@googlemail.com> wrote:
>> 2012/8/28 Paul Eggleton <paul.eggleton@linux.intel.com>:
>>> On Tuesday 28 August 2012 09:37:53 Samuel Stirtzel wrote:
>>>> after switching from the Denzil branch to next it seems that the
>>>> package order has been changed.
>>>
>>> You say "next", do you mean denzil-next or master?
>> master
>>
>> Meant the next branch of the setup-scripts:
>> https://github.com/Angstrom-distribution/setup-scripts/blob/next/sources/layers.txt
>>
>>
>
> thats angstrom-next I believe then the question is more relevant to
> angstrom-distro ml
>

The package re-ordering happened in OE-Core and _not in Angstrom_ how
is this Angstrom related?



-- 
Regards
Samuel


