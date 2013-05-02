Received: from mail-ve0-f181.google.com ([209.85.128.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXwph-0007Uy-2q
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 18:58:13 +0200
Received: by mail-ve0-f181.google.com with SMTP id d10so690635vea.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=TwML+4tLYekGL3Ap5VqQ9RX/bm3o06VKoimcnCr8Mrg=;
	b=Qc8inkyitjBPly6Josvz2FB+MAGW0YlyB41AoJcG0HxVWx8w444JWJuCtJVN3KRbYB
	NysNswp9AYKiaaTodeLkKfmvJoWbiVOPtq0E/Fa4Pc6k17jmWYYg+EUd10xFmC0DNu/R
	aiPQneEquTBMbKW27Ux+TbGkVZaHugVAnLI33DEdAeVaocsm95N0gpqtiQ/9PtYsT3Qj
	4H8tymq/3Ts4oTWHLJJeS3hNfQ74yTKvTd/McCs8a8h3eRuOXRcAmpXNuX0bkC8aTeR9
	naUpVp1v3txGZwG8QsSBASpdDD4AahPpx7ttOs/3Q88R4AmcMnoujOS8AifZWx0H1lRX
	nq1A==
MIME-Version: 1.0
X-Received: by 10.220.77.2 with SMTP id e2mr2420218vck.63.1367512818867; Thu,
	02 May 2013 09:40:18 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Thu, 2 May 2013 09:40:18 -0700 (PDT)
In-Reply-To: <51828BDE.6050001@windriver.com>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<51826BBB.2090307@windriver.com> <1556536.BsQG791ajX@helios>
	<51827D4B.4070907@windriver.com>
	<CALbNGRRJfRF1qM2gm=SoSs=cjxqrFi7+7xp9SN9X=AMRPesPfw@mail.gmail.com>
	<518281A4.6040900@windriver.com>
	<CALbNGRS4FLKC+_k9iuEeoMCx0o=DsXM-uu1X7uahtcrp24R=oA@mail.gmail.com>
	<CALbNGRRm15aBQXAuqcJDEsvQ2UNC-VKj8_brbGPHj-bqxTaSKw@mail.gmail.com>
	<51828BDE.6050001@windriver.com>
Date: Thu, 2 May 2013 18:40:18 +0200
Message-ID: <CALbNGRQw8etC-WM8b0N4SS5ut1Nu=h4CyUAjapHRo4LbWk8S-g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: useradd.bbclass question
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
X-List-Received-Date: Thu, 02 May 2013 16:58:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2013 at 5:53 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 5/2/13 10:31 AM, Andreas M=C3=BCller wrote:
>>
>> On Thu, May 2, 2013 at 5:18 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>>
>>> On Thu, May 2, 2013 at 5:09 PM, Mark Hatle <mark.hatle@windriver.com>
>>> wrote:
>>>>
>>>> On 5/2/13 9:55 AM, Andreas M=C3=BCller wrote:
>>>>>
>>>>>
>>>>> On Thu, May 2, 2013 at 4:50 PM, Mark Hatle <mark.hatle@windriver.com>
>>>>> wrote:
>>>>>>
>>>>>>
>>>>>> On 5/2/13 9:34 AM, Paul Eggleton wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On Thursday 02 May 2013 08:35:55 Mark Hatle wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 5/2/13 2:49 AM, Andreas M=C3=BCller wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> on one of my build machines useradd.bbclass seem to use the UID/G=
ID
>>>>>>>>> of
>>>>>>>>> build host. On other machines useradd works correct.
>>>>>>>>>
>>>>>>>>> I have the follwing in gdm:
>>>>>>>>>
>>>>>>>>> <snip>
>>>>>>>>> do_install_append() {
>>>>>>>>>
>>>>>>>>>         ...
>>>>>>>>>         chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
>>>>>>>>>         chmod 0750 ${D}${localstatedir}/lib/gdm
>>>>>>>>>
>>>>>>>>> }
>>>>>>>>>
>>>>>>>>> ...
>>>>>>>>>
>>>>>>>>> USERADD_PACKAGES =3D "${PN}"
>>>>>>>>> USERADD_PARAM_${PN} =3D "--system --no-create-home --home
>>>>>>>>> ${localstatedir}/lib/gdm --user-group gdm"
>>>>>>>>> <snip/>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> I don't know how ipk and deb handle this.  But with the RPM system i=
t
>>>>>> captures the uname/gname (not uid/gid) and uses that when installing
>>>>>> the
>>>>>> file(s).  This way the USERADD is processed before the install and t=
he
>>>>>> right
>>>>>> value is used during the install.
>>>>>>
>>>>>> We may have a problem here where we need to also process the useradd
>>>>>> -before- the do_install runs so that it's available for pseudo to us=
e
>>>>>> for
>>>>>> deb/ipk.  (But if deb/ipk capture uid/gid vs uname/gname..  unless w=
e
>>>>>> set
>>>>>> a
>>>>>> static value we could still have a problem.)
>>>>>
>>>>>
>>>>> 1. gdm's log.do_install starts with so I assume the useradd stuff is
>>>>> performed before do_install.
>>>>>
>>>>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>>>>> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
>>>>> 'common']
>>>>> | DEBUG: Executing shell function useradd_sysroot
>>>>> | Running useradd commands...
>>>>> | DEBUG: Shell function useradd_sysroot finished
>>>>> | DEBUG: Executing shell function do_install
>>>>
>>>>
>>>>
>>>> Ahh yes, there it is.. I forgot as well.
>>>>
>>>> ok, so the obvious problems are resolved.  The only place I can sugges=
t
>>>> you
>>>> start looking would be in the sysroot's etc/passwd and etc/group files=
.
>>>> If
>>>> they are not correct -- then this indicates a failure in the easy case
>>>> and
>>>> could lead to incorrect values.
>>>
>>> These are OK and as mentioned above (cleansstate/rebuild) definitely
>>> prepared before do_install.
>>>>
>>>>
>>>> The other thing you can do is add debugging to your script and see wha=
t
>>>> uid
>>>> and such it's looking for.. Dumping out the environment variables that
>>>> start
>>>> with 'PSEUDO_' may help.  I believe the value is PSEUDO_PASSWD for the
>>>> path.
>>>> If it's not set it falls back to the chroot (which you won't be in) an=
d
>>>> then
>>>> back to the system file --- so if PSEUDO_PASSWD isn't set this could b=
e
>>>> a
>>>> clue as to the fault.
>>
>> [andreas@oe-core]$ bitbake -e gdm | grep ^PSEUDO_PASSWD
>> PSEUDO_PASSWD=3D"/home/andreas/tmp/oe-core-eglibc/sysroots/overo"
>
>
> Check that path contains 'etc/passwd' and 'etc/group'.  If not, that woul=
d
> be the issue.. if it does contain them -- then something else is happenin=
g.
Yes the path is correct and contains both files with correct IDs

> Hmm.. are either of the hosts 32-bit/64-bit multilib installs?  If so, yo=
u need to ensure that pseudo is enabled to build both
> a 32-bit and 64-bit wrapper, otherwise you can end up running native soft=
ware that won't be wrapper properly.  (It's fairly
> rare, but can occur.)

I think both are multilib - have /lib and /lib64 and found same libs
in both. How do I ensure that both wrappers are build?

Andreas


