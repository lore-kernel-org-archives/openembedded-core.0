Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sz4F8-0003Pl-H4
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 13:16:03 +0200
Received: by ghbz2 with SMTP id z2so553867ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 04:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=iyK7empfTToFcr8iquqAQImHCXHa9qLhThBqOPVg86I=;
	b=bG54n0wHnzC0Lh/Q20+9iKodf6SpOHG1DdyR4+KUp10ipR6TblShyZI6Y3GFgpTD66
	mxev4d5kCk4uIpghZZI7zGH0askUb0N6dGM9MzSBLjLly6wq4r9YYvbpWtsfmBYRmMOA
	WIzz/Wr4rAjoqKnUsm8D7LOVrtMLUiX5Odh5PIhbRK+6tTIQV0xaioya4TAV6rWFLTvg
	kaFpOYnJArrOLXsQ7xcqyherlAMr6n1XxLSNimzmAOmxfJW7xpsKI9Pl1ju8QG5GpJUS
	REqc7b5KPvEa8O2aIRdo8L/kLXorcx2Oeh6f7OPmLTuKG/KqZzgSE4s4bulfTm0tFAor
	IlAg==
MIME-Version: 1.0
Received: by 10.50.217.163 with SMTP id oz3mr519492igc.5.1344423854909; Wed,
	08 Aug 2012 04:04:14 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Wed, 8 Aug 2012 04:04:14 -0700 (PDT)
In-Reply-To: <5021FD2C.4030301@intel.com>
References: <1344258422-32173-1-git-send-email-radu.moisan@intel.com>
	<CALbNGRTBW1E6N5F0t3qaT+2BzGO9xeaXLLAFkFz6PE5dFy9=dw@mail.gmail.com>
	<CALbNGRS5mM4mTGsXUw1q+jVxtPZkPjHBGRQqpzaMfH0tx4=1gA@mail.gmail.com>
	<CALbNGRTnMpNr3RAVEWwSh2xM7d03GOd7M8e83RqaEHWZS=ZzLQ@mail.gmail.com>
	<5021FD2C.4030301@intel.com>
Date: Wed, 8 Aug 2012 13:04:14 +0200
Message-ID: <CALbNGRSm=6zfqGggyk0d-8OQciKG7xA7S9y2tSWoJ-WzRsCRAQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: upgrade to upstream stable 1.30.0
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
X-List-Received-Date: Wed, 08 Aug 2012 11:16:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 8, 2012 at 7:46 AM, Radu Moisan <radu.moisan@intel.com> wrote:
>
> On 08/07/2012 11:38 PM, Andreas M=FCller wrote:
>>
>> On Tue, Aug 7, 2012 at 4:21 PM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> wrote:
>>>
>>> On Tue, Aug 7, 2012 at 4:19 PM, Andreas M=FCller
>>> <schnitzeltony@googlemail.com> wrote:
>>>>
>>>> On Mon, Aug 6, 2012 at 3:07 PM, Radu Moisan <radu.moisan@intel.com>
>>>> wrote:
>>>>>
>>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>>> ---
>>>>>   .../pango/pango-1.28.4/noconst.patch               |  408
>>>>> --------------------
>>>>>   .../multilib-fix-clean.patch                       |    0
>>>>>   .../{pango-1.28.4 =3D> pango-1.30.0}/no-tests.patch  |   14 +-
>>>>>   .../pango/{pango_1.28.4.bb =3D> pango_1.30.0.bb}     |    9 +-
>>>>>   4 files changed, 10 insertions(+), 421 deletions(-)
>>>>>   delete mode 100644
>>>>> meta/recipes-graphics/pango/pango-1.28.4/noconst.patch
>>>>>   rename meta/recipes-graphics/pango/{pango-1.28.4 =3D>
>>>>> pango-1.30.0}/multilib-fix-clean.patch (100%)
>>>>>   rename meta/recipes-graphics/pango/{pango-1.28.4 =3D>
>>>>> pango-1.30.0}/no-tests.patch (33%)
>>>>>   rename meta/recipes-graphics/pango/{pango_1.28.4.bb =3D>
>>>>> pango_1.30.0.bb} (49%)
>>>>>
>>>> I don't know if it's supposed to, but it does not fix the pango module
>>>> issue for me {1].
>>>>
>>>> Andreas
>>>>
>>>> [1]
>>>> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/02691=
9.html
>>>
>>> Sorry - I am on the wrong machine forget my previous mail - will test i=
t
>>> here.
>>>
>> Still manual
>>
>> pango-querymodules > '/etc/pango/pango.modules'
>>
>> is required but I don't think it is a pango issue.
>
> I don't have much expertise with pango, but if your remark is not
> particularly related to pango upgrade, then we should have it handled in =
a
> separate thread, and raise a bug if appropriate.
>
> thanks,
> radu
>
Agreed it was just informational

Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>


