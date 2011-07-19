Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qj4zz-0004gJ-1X
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 09:45:47 +0200
Received: by wwi18 with SMTP id 18so3219813wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 00:41:42 -0700 (PDT)
Received: by 10.216.187.65 with SMTP id x43mr6144403wem.62.1311061302024;
	Tue, 19 Jul 2011 00:41:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n21sm2825369wed.43.2011.07.19.00.41.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jul 2011 00:41:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6DF8A02@shsmsx501.ccr.corp.intel.com>
Date: Tue, 19 Jul 2011 09:41:34 +0200
Message-Id: <85C1F582-84B3-438E-BC95-B25C2659DF18@dominion.thruhere.net>
References: <cover.1310969462.git.dongxiao.xu@intel.com>
	<c4ca6242b49eddc218fa3c0f58d172efc1601c84.1310969462.git.dongxiao.xu@intel.com>
	<FE823AAC-2695-4FB2-9E90-BCD2ED38771B@dominion.thruhere.net>
	<281DBDA2-688D-4559-8191-276A44DEDF70@dominion.thruhere.net>
	<4E245054.4000303@windriver.com> <4E245163.4000809@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6DF8A02@shsmsx501.ccr.corp.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 3/4] udev: Change hard coded /usr/lib to	support multilib
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
X-List-Received-Date: Tue, 19 Jul 2011 07:45:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 jul 2011, om 02:30 heeft Xu, Dongxiao het volgende geschreven:

>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf =
Of
>> Mark Hatle
>> Sent: Monday, July 18, 2011 11:30 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 3/4] udev: Change hard coded /usr/lib =
to support
>> multilib
>>=20
>> Replying to myself.. sorry, I misunderstood the concern.. see below =
for a new
>> explanation..
>>=20
>> On 7/18/11 10:25 AM, Mark Hatle wrote:
>>> On 7/18/11 7:32 AM, Koen Kooi wrote:
>>>>=20
>>>> Op 18 jul 2011, om 09:08 heeft Koen Kooi het volgende geschreven:
>>>>=20
>>>>>=20
>>>>> Op 18 jul 2011, om 08:13 heeft Dongxiao Xu het volgende =
geschreven:
>>>>>=20
>>>>>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>>>>>> ---
>>>>>> meta/recipes-core/udev/udev-164/makefile.patch |   16
>> ++++++++++++++++
>>>>>> meta/recipes-core/udev/udev-new.inc            |    1 +
>>>>>> meta/recipes-core/udev/udev_164.bb             |    2 +-
>>>>>> 3 files changed, 18 insertions(+), 1 deletions(-) create mode
>>>>>> 100644 meta/recipes-core/udev/udev-164/makefile.patch
>>>>>>=20
>>>>>> diff --git a/meta/recipes-core/udev/udev-164/makefile.patch
>>>>>> b/meta/recipes-core/udev/udev-164/makefile.patch
>>>>>> new file mode 100644
>>>>>> index 0000000..c46ff4b
>>>>>> --- /dev/null
>>>>>> +++ b/meta/recipes-core/udev/udev-164/makefile.patch
>>>>>> @@ -0,0 +1,16 @@
>>>>>> +Upstream-Status: Inappropriate [configuration]
>>>>>=20
>>>>> Could you explain why it's inappropriate for upstream but why we =
do need it
>> here?
>>>>=20
>>>> I asked the udev maintainer:
>>>>=20
>>>> 14:25 < koen> kay: the udev Makefile.am has 'ln -sf =
$(libexecdir)/udev-acl
>> $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d/udev-acl.ck', any =
reason for not
>> using ${libdir} over ${prefix}/lib ?
>>>> 14:29 < kay> koen: libdir is /usr/lib64 here, can't use that
>>>>=20
>>>> So upstream is aware of multilib, but wants to put these scripts in =
a
>> non-multilib dir. Since I don't have any experience with the =
fedora/opensuse
>> way of multilib nor the new oe-core one, could you please explain why =
oe-core
>> needs this patch, but fedora/opensuse don't?
>>>=20
>>> This is likely a problem with the multilib fix.  "libexecdir" is =
often
>>> /usr/lib on many distribuions.. however as your other email
>>> mentioned.. setting it to
>>> /usr/lib64 is a mistake.  It should be /usr/libexec or /usr/lib64.
>>> All of the associated multilib packages should work correctly and no
>>> conflicts introduced with this package (file contents should be
>>> identical.)
>>>=20
>>> It should be permissible for libexecdir to be changed in the
>>> configuration if someone really wants it to be.  By default (in =
bitbake.conf) it
>> is:
>>>=20
>>> export libexecdir =3D "${exec_prefix}/libexec"
>>=20
>>> +-	mkdir -p $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d
>>> +-	ln -sf $(libexecdir)/udev-acl
>> $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d/udev-acl.ck
>>> ++	mkdir -p $(DESTDIR)$(libdir)/ConsoleKit/run-seat.d
>>> ++	ln -sf $(libexecdir)/udev-acl
>>> ++$(DESTDIR)$(libdir)/ConsoleKit/run-seat.d/udev-acl.ck
>>=20
>> I see libexecdir CAN be changed.. so the above is already possible..
>>=20
>> The part they had hard coded is "/usr/lib/ConsoleKit"...  There is =
only one
>> location in the system for ConsoleKit configuration files/scripts.. =
and that is
>> distro specific.  Assuming the oe based distributions use
>> $(PREFIX)/lib/ConsoleKit.. then the previous was correct.
>>=20
>> The point being it doesn't matter if it's 32-bit, 64-bit or 24-bit... =
 only one
>> ConsoleKit per system should exist.  (There are potentially other =
files on the
>> system like this.  I know a recent RPM patch went in that separated
>> /usr/lib/rpm and /usr/lib64/rpm..  this is also a similar mistake, I =
just haven't
>> had time to get a patch out to revert that chunk.)
>=20
> So for multilib system, we have /usr/lib32 and /usr/lib64 to contain =
only *.so files, while there is still /usr/lib directory which contains =
other types of files, right?

That's how I read it, but again, I'm no (multi)lib expert :)=


