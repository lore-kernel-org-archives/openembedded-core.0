Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RBUIo-0002R1-V6
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 18:26:39 +0200
Received: by ggnq1 with SMTP id q1so860947ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 09:21:03 -0700 (PDT)
Received: by 10.236.157.161 with SMTP id o21mr14836172yhk.72.1317831662645;
	Wed, 05 Oct 2011 09:21:02 -0700 (PDT)
Received: from [10.224.150.243] (m7b0f36d0.tmodns.net. [208.54.15.123])
	by mx.google.com with ESMTPS id s77sm2989257yhe.22.2011.10.05.09.20.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Oct 2011 09:21:00 -0700 (PDT)
References: <4E8B6564.4090002@balister.org> <4E8B67C5.8050602@intel.com>
	<4E8B6C17.80509@balister.org> <4E8B6D47.9000600@intel.com>
	<4E8B8C05.5050508@windriver.com> <4E8C662B.4090300@balister.org>
In-Reply-To: <4E8C662B.4090300@balister.org>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <1763F0CC-3233-4C5B-A933-7A00805D7CF4@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 5 Oct 2011 11:20:53 -0500
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bringing an image from OE to OE-Core
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
X-List-Received-Date: Wed, 05 Oct 2011 16:26:39 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 5 okt. 2011 om 09:14 heeft Philip Balister <philip@balister.org> het volg=
ende geschreven:

> On 10/04/2011 06:43 PM, Mark Hatle wrote:
>> On 10/4/11 3:32 PM, Saul Wold wrote:
>>> On 10/04/2011 01:27 PM, Philip Balister wrote:
>>>> On 10/04/2011 04:08 PM, Saul Wold wrote:
>>>>> On 10/04/2011 12:58 PM, Philip Balister wrote:
>>>>>> I'm about to start bringing some images I use from OE to OE-core. The=

>>>>>> first issue I saw is there is no task-proper-tools in oe-core (where
>>>>>> oe-core means the set of layers created by the Angstrom setup scripts=
).
>>>>>>=20
>>>>> Philip,
>>>>>=20
>>>>> Have you looked at task-core-basic, it is supposed to be more of a
>>>>> desktop like set of tools, the idea being it's heavier weight than cor=
e,
>>>>> will move to supporting the non-graphical part of LSB.
>>>>>=20
>>>>> Another caveat for task-core-basic is that it's the largetest non-gplv=
3
>>>>> task that is used by core-image-basic.
>>>>>=20
>>>>> Does this task approach what you are looking for?
>>>>=20
>>>> It looks like a start, but I notice it brings in rpm. I'm not sure if I=

>>>> want that. I would have thought that the package manager would be a
>>>> distro decision.
>>>>=20
>>> That's a bug that I would certainly take a patch for, unless rpm is
>>> required as part of LSB, that will need to be verified.
>>=20
>> The ability to install RPM packages is required by the LSB.  The LSB does=
 not
>> require RPM however.  (yes I know, odd requirement, but with things like a=
lien
>> it's doable on debian systems.)
>>=20
>> But yes, RPM is included to satisfy that requirement.
>=20
> This is beginning to look like a trickier problem than I would like. Betwe=
en oe-core and meta-angstrom, there are a number of tasks/images to start fr=
om, but they each have something I don't like:
>=20
> 1) I do not want rpm in the image. This would confuse my customer base.
> 2) I am tired of dropbear, I want openssh only.

fwiw 0.53 fixed most of my problems (e.g x11 forwarding), does it fix your i=
ssues as well?





> 3) I need the full versions of tools, not the busybox ones.
> 4) I am not limited to gpv2 software.
>=20
> Richard, it looks to me like we should add an item for the next Yocto deve=
lopment cycle to review how images are built and try to make the base stuff i=
n oe-core more usable by everyone. We need to define what choices are made b=
y distros. For example opkg, rpm, no package management in image. Images may=
 want dropbear or openssh.
>=20
> Short term, I think I'll copy the tasks/images into my bsp and get some st=
uff together for testing. I'd like a better long term solution though.
>=20
> Philip
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


