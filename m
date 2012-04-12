Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SINSq-0002ZQ-4q
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 19:05:44 +0200
Received: by lbky2 with SMTP id y2so1649224lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 09:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=PbR7KiU2ykmg4chu2MdzS9ohKNFEBrpTJRwNb9QcEio=;
	b=gYTYHPqgWRqleH2b7vrjl7AyLZWHDVABw7k0xl/yytUP+0AfXWRI9jVr0rK/UPu8gh
	aQRSauX1LxzMXuTVpGC8Wi6LaXFEUtPZ9teiNiCNiEYnIPS4oMW/AuLnupRnYqMz6Y2N
	oDKzWtTBx4Ks/Z/OD4SSzovRthwrL4Go81QGGRGb00oxMv8KrK0OoQS/5VV95qvM0n6C
	Cfuyq62YtnhwJ9C/j4wQ2Ifa1Yc14QPDF9B0olah18Td3jPFXko7btHz74hQV3co3/+N
	GTh6YhTDnTFS+UHoJSYaPYlYm6haVRkX/6nfxA5M+ZiqQGiS/UyfMiJ65iNfKuuXxfKH
	WM+w==
Received: by 10.152.113.229 with SMTP id jb5mr2787273lab.45.1334249783620;
	Thu, 12 Apr 2012 09:56:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 12 Apr 2012 09:55:53 -0700 (PDT)
In-Reply-To: <4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Apr 2012 09:55:53 -0700
Message-ID: <CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 17:05:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 2:29 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 12 apr. 2012, om 11:02 heeft Richard Purdie het volgende geschreven:
>
>> On Wed, 2012-04-11 at 01:51 +0100, Julian Pidancet wrote:
>>> On 04/09/12 19:01, Liu, Song wrote:
>>>> Hi all,
>>>>
>>>> This is to restate and clarify the schedule for Yocto Project 1.2 M4 (=
milestone 4). If you are concerned or have patches you would like to merge,=
 please see the following dates:
>>>>
>>>> 1. RC3 official patch cut-off time: 12:00AM April 8th, 2012, PDT
>>>> 2. RC3 build: April 11th, 2012, PDT
>>>> 3. RC4 official patch cut-off time: 12:00AM April 15th, 2012, PDT
>>>> 4. RC4 build: April 18th, 2012, PDT
>>>> 5. YP 1.2 release: April 27th, 2012, PDT
>>>>
>>>> You can also check out the schedule here: https://www.google.com/calen=
dar/embed?height=3D600&wkst=3D1&bgcolor=3D%23FFFFFF&src=3Dmg0m150m30gs891eq=
qhtfu5jgg%40group.calendar.google.com&color=3D%238C500B&src=3Dsc7rov4ck552t=
2f0pav120t7r0%40group.calendar.google.com&color=3D%23528800&src=3Dtheyoctop=
roject%40gmail.com&color=3D%23182C57&ctz=3DAmerica%2FLos_Angeles
>>>>
>>>> Please feel free to let me and Beth know if you have any concerns or q=
uestions.
>>>>
>>>> Thanks!
>>>> Song
>>>> PM, Yocto Project
>>>
>>> Hi,
>>>
>>> I don't see any commits tagged for these milestones in
>>> git.openembedded.org/openembedded-core at the moment. Will there be a
>>> release tag or a release branch created on the git repository when YP
>>> 1.2 comes out, to indicate people that there's a "stable" version of
>>> oe-core they can use ?
>>
>> Yes, there will be a branch created on OE-Core.
>>
>> At this point the actual branch naming/tagging is a little in flux.
>> There was some discussion about this at collaboration summit and the BSP
>> summit but there was no conclusion.
>>
>> I've tried to write an email on the subject and it basically goes around
>> in circles. Ideally we need a scheme which can be used in all the layers
>> which doesn't contain numbers as these may conflict with various layer
>> schemes. The poky release names at least do that. Ideally people also
>> want something sortable with more context such as the year. Doing this
>> without numbers is harder.
>
> I'm still a big fan of using 'yoctoproject-1.2' as substring for tags and=
 branches. The objections I heard to that didn't make sense to me, but I se=
e this as a purely technical matter where others see it as something differ=
ent :)
>

I think that string is fine as long as its just for yocto but I think
for OE-Core we are going to do a General release
so tagging that with something yocto project will be very confusing
unless we plan to do different releases of OE-Core for general
availability
and yocto project. I dont think we have bandwidth for that. And since
poky repository makes a copy of OE-Core metadata it can be tagged in
yoctoproject specific tags

since OE-Core is at center of all layers I would propose that other
layers when tagged contain OE-Core's release tag in their own tags
name

so something like <layer-tag>-<OE-Core-tag its targetting>

>> I'm reluctant to change the numbering/branch scheme at this point in a
>> release as its unfair to release engineering and the documentation
>> maintainers.


Lets keep it as we have it. Its quite generic.


>
>
> "it's only software" :p
>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


