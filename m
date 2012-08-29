Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1T6bqN-0000YM-Ra
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 08:33:40 +0200
Received: by iaky10 with SMTP id y10so452967iak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 23:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9wtBVQbkGLJljIkVjNziG4tTzX/ikXD7fKBBEmgxTVM=;
	b=cLCSTL9Unv78jSZwfHgBcTJbuLGRSqAkxW2DULVkXbrmSdoxQGmwt92xed/1uxBsU0
	/TA7/qAL2b3PBUe4g9BcvarrEjSZdXzKv/6is/w4GZBGbAKp4I5P4R+FC9Mc8DPVHU+W
	n7qeos/RuWiYUsRX+yIGkPo+H4OArUwi5GJPjneXnN3SjT1mv0EKdG4cYDKtxTTJ4+pN
	70eB7qKgoyRXv0GWkh7v3uLHIWpfgVGRkMxJVl9C2Ne1NKLgij7r/HT9KrYPoYdn7h3m
	CUfuJkXuPb0oWX2TvD+7hHygeUNZPKJXUcCsyTZqGFxKoII9Lffu+cmwJ37FuYO0Jcdt
	UAtA==
MIME-Version: 1.0
Received: by 10.50.195.194 with SMTP id ig2mr16360671igc.24.1346221285644;
	Tue, 28 Aug 2012 23:21:25 -0700 (PDT)
Received: by 10.64.49.45 with HTTP; Tue, 28 Aug 2012 23:21:25 -0700 (PDT)
In-Reply-To: <CAGiJk9eNZ05-Ai9+bGVBCzxsBBLRMW_JLYrJoBECiyBd74Y=sA@mail.gmail.com>
References: <CAGiJk9dvZ=_eSZwcXRnsfwo+h0x9fWJnCapuSCVz_HftgJAw6g@mail.gmail.com>
	<1485327.Nf27BjiNnc@helios>
	<CAGiJk9dU3=Z+iTe0=v5rpQbFRsnBwQEJ_4Ywz0h+CaSR+xaZ=A@mail.gmail.com>
	<CAMKF1sp5PQiCyMRUD8_PG_cA8Ougu2jOmUwW9Hg2Hpv+2HChxw@mail.gmail.com>
	<CAGiJk9eNZ05-Ai9+bGVBCzxsBBLRMW_JLYrJoBECiyBd74Y=sA@mail.gmail.com>
Date: Wed, 29 Aug 2012 08:21:25 +0200
Message-ID: <CAGiJk9fbY2Yhsc=rCft38oXy8VaS0pbHcFMig_8zamFtHPbyRA@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Aug 2012 06:33:40 -0000
Content-Type: text/plain; charset=UTF-8

2012/8/29 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> 2012/8/28 Khem Raj <raj.khem@gmail.com>:
>> On Tue, Aug 28, 2012 at 1:28 AM, Samuel Stirtzel
>> <s.stirtzel@googlemail.com> wrote:
>>> 2012/8/28 Paul Eggleton <paul.eggleton@linux.intel.com>:
>>>> On Tuesday 28 August 2012 09:37:53 Samuel Stirtzel wrote:
>>>>> after switching from the Denzil branch to next it seems that the
>>>>> package order has been changed.
>>>>
>>>> You say "next", do you mean denzil-next or master?
>>> master
>>>
>>> Meant the next branch of the setup-scripts:
>>> https://github.com/Angstrom-distribution/setup-scripts/blob/next/sources/layers.txt
>>>
>>>
>>
>> thats angstrom-next I believe then the question is more relevant to
>> angstrom-distro ml
>>
>
> The package re-ordering happened in OE-Core and _not in Angstrom_ how
> is this Angstrom related?

To be more specific
this commit:
commit 66c36bcb7d9368718453265e58bd5e3c854c786a
Author: Saul Wold <sgw@linux.intel.com>
Date:   Tue Jun 5 04:52:21 2012 -0700

    bitbake.conf: reorder PACKAGES list

    This change re-orders the PACKAGES list to move PN to the end of the list
    this will ensure that base package gets the final bits since the packaging
    is greedy. We can then have -dev and other package get bits first.

    Signed-off-by: Saul Wold <sgw@linux.intel.com>



-- 
Regards
Samuel


