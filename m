Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RsSbJ-000824-7V
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 06:19:21 +0100
Received: by bke17 with SMTP id 17so737337bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 21:11:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.205.132.1 with SMTP id hs1mr11777787bkc.45.1328069806220; Tue,
	31 Jan 2012 20:16:46 -0800 (PST)
Received: by 10.204.15.80 with HTTP; Tue, 31 Jan 2012 20:16:46 -0800 (PST)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <4F2840F5.9080908@linux.intel.com>
References: <1327943665-16402-1-git-send-email-steve@sakoman.com>
	<CAOSpxdbF6t5z+GYirR4u3oa41Pd=UrFyQRKT1QSw1dLBRPBeEg@mail.gmail.com>
	<4F2840F5.9080908@linux.intel.com>
Date: Tue, 31 Jan 2012 20:16:46 -0800
Message-ID: <CAOSpxdYr19UF+P-hUAVMe0Q6=UrMujSmLWS4QV3xMkPCP17SNA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 0/3] *** SUBJECT HERE ***
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
X-List-Received-Date: Wed, 01 Feb 2012 05:19:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 11:28 AM, Darren Hart <dvhart@linux.intel.com> wrot=
e:
> Did you send this using the send-pull-request script? I assume not as
> this was to oe-core and not yocto, but if you did, I want to know as it
> should protect against -ENOCOFFEEYET errors such as these.

No, I used git send-email.

I'm not familiar with the send-pull-request script.  I wouldn't have
guessed from the name that it is a mailing list patch submission
script.  Is it hardwired to the yocto list?

> For whatever it's worth, I use this script for all my projects now to
> help avoid situations like this which I have fallen into more times than
> I care to admit :-)

Indeed, I very often catch myself forgetting to add the subject to the
cover letter!  I'll have to investigate using the send-pull-request
script.

Steve

> On 01/30/2012 09:17 AM, Steve Sakoman wrote:
>> Sigh, my morning for screw-ups. =A0Time for another cup of coffee . . .
>>
>> The subject should be: 'zypper: support signed repositories' rather
>> than '***SUBJECT HERE***' :-)
>>
>> Steve
>>
>> On Mon, Jan 30, 2012 at 9:14 AM, Steve Sakoman <steve@sakoman.com> wrote=
:
>>> The current zypper implementation does not work with signed repositorie=
s.
>>> This patch series adds recipes for the required packages as well as the
>>> necessary runtime dependencies to zypper.
>>>
>>> Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled an=
d
>>> a systemd based console image.
>>>
>>> Version 3 incorporates feedback from Koen Kooi and Saul Wold
>>> =A0- adds runtime dependencies to existing RDEPENDS_${PN}
>>> =A0- removes duplicate recipe for libassuan
>>> =A0- moves recipes for gnupg and libksba to recipes-support
>>>
>>> Steve Sakoman (3):
>>> =A0libksba: add recipe for 1.2.0
>>> =A0gnupg: add recipe for 2.0.18
>>> =A0zypper: add missing runtime dependences on gzip and gnupg
>>>
>>> =A0meta/recipes-extended/zypper/zypper_git.bb =A0 =A0| =A0 =A04 ++--
>>> =A0meta/recipes-support/gnupg/gnupg_2.0.18.bb =A0 =A0| =A0 24 +++++++++=
+++++++++++++++
>>> =A0meta/recipes-support/libksba/libksba_1.2.0.bb | =A0 10 ++++++++++
>>> =A03 files changed, 36 insertions(+), 2 deletions(-)
>>> =A0create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb
>>> =A0create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel


