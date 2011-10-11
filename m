Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDcY9-0006hV-3W
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 15:39:17 +0200
Received: by eyd9 with SMTP id 9so2031434eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 06:33:35 -0700 (PDT)
Received: by 10.223.17.3 with SMTP id q3mr15510126faa.28.1318340015164;
	Tue, 11 Oct 2011 06:33:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id r16sm6542085fam.8.2011.10.11.06.33.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 06:33:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKpEN3aNj+8MmJnX540Fm9sf3eLb5Y0t=fChH4D5CCsFeg@mail.gmail.com>
Date: Tue, 11 Oct 2011 15:33:32 +0200
Message-Id: <AC5B37A6-EC5E-45F8-8CC2-550DF17DC725@dominion.thruhere.net>
References: <1318154801-28945-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKoiKeOMs1bJLcmOQeSR4XDL8Wi_oa=a7jANS78Ouwx-Bw@mail.gmail.com>
	<B6820E11-C598-4B0A-92E0-664DF20CB727@dominion.thruhere.net>
	<CAP9ODKoH9iUGTuXWsqiZ-uR85CUxZuVU5au6kFh3WN9Mrcb3zQ@mail.gmail.com>
	<B6E098D1-2EC4-4C23-A169-ABD07D96C980@dominion.thruhere.net>
	<CAP9ODKo88-WnBWtMMYRLJOyZREjQTwoB7Y+nsAYX_YHFMrcRgQ@mail.gmail.com>
	<195E44C8-6115-4137-88AF-ACE08B7DE7C6@dominion.thruhere.net>
	<CAP9ODKpEN3aNj+8MmJnX540Fm9sf3eLb5Y0t=fChH4D5CCsFeg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [RFC][PATCH] linux-firmware: update, merge in OE classic updates, fix packaging
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
X-List-Received-Date: Tue, 11 Oct 2011 13:39:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 11 okt. 2011, om 15:14 heeft Otavio Salvador het volgende geschreven:

> On Tue, Oct 11, 2011 at 05:33, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> Op 10 okt. 2011, om 14:35 heeft Otavio Salvador het volgende =
geschreven:
>>> On Mon, Oct 10, 2011 at 09:26, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>> Op 10 okt. 2011, om 14:22 heeft Otavio Salvador het volgende =
geschreven:
>>>>> On Mon, Oct 10, 2011 at 04:27, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>>> Op 10 okt. 2011, om 03:03 heeft Otavio Salvador het volgende =
geschreven:
>>>>>>> On Sun, Oct 9, 2011 at 07:06, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>>>>> Update: move to latest SRCREV, use non-kernel.org URI
>>>>>>>> Merge: wl12xx symlink + packaging, install all firmwares
>>>>>>>> Fix: * all entries in PACKAGES are in PROVIDES already
>>>>>>>>     * A package always RPROVIDES itself
>>>>>>>>     * A file can only get packaged *once* so only one rtlwifi =
package will get the license
>>>>>>>=20
>>>>>>> I dislike the idea of one single package with all firmwares. I =
prefer
>>>>>>> to have many small packages but one meta that depends on it.
>>>>>>=20
>>>>>> I'm not going to make a patch to subpackage *all* the firmwares. =
If you can give me a list of the ones you use I'll make a patch to split =
those out.
>>>>>=20
>>>>> Leave the ones that exist now and move the rest to ${PN}-others so
>>>>> people can test using it and split from it  when need.
>>>>=20
>>>> I don't see the value of naming the unsplit firmwares something =
else as ${PN} at this point, OE classic doesn't have it either.
>>>=20
>>> This make clear that useing the others package is a workaround and
>>> thus people can submit patches to add a specific package and move =
out
>>> to it. Using PN would make it to easy to forgot.
>>=20
>> It would also break existing users for linux-firmware, so I propose =
to let this patch go in as-is and have people with strong opinion on =
package splitting send a follow up patch.
>=20
> You merged packages, they were split already.

This commit doesn't merge subpackages, it splits off the wilink ones and =
packages previously unpackaged firmwares into ${PN}=


