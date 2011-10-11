Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDcFR-0006EC-SC
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 15:19:57 +0200
Received: by bke11 with SMTP id 11so9860183bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tUNdJD+JQmmqmSldfkoudIF0qwbGuR+egFrYljtjSLE=;
	b=GYnkCFk7bnyCZMovIp/0Gk2ksnOiJ+eISdG6Cllm7k701MGRrHjovwV3hfrlJQ9QLc
	OajmcF3X0Rg6YHf+TGIiF8Bxki+anGMNKShlWD9y55gdJC37XE18MULrwqMQX9O1n6ox
	Y0f5VsaWH5OG4zDBBG8vrJ1VcXTzDlMkE9IHI=
MIME-Version: 1.0
Received: by 10.204.129.74 with SMTP id n10mr9678653bks.59.1318338852539; Tue,
	11 Oct 2011 06:14:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.138.72 with HTTP; Tue, 11 Oct 2011 06:14:12 -0700 (PDT)
In-Reply-To: <195E44C8-6115-4137-88AF-ACE08B7DE7C6@dominion.thruhere.net>
References: <1318154801-28945-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKoiKeOMs1bJLcmOQeSR4XDL8Wi_oa=a7jANS78Ouwx-Bw@mail.gmail.com>
	<B6820E11-C598-4B0A-92E0-664DF20CB727@dominion.thruhere.net>
	<CAP9ODKoH9iUGTuXWsqiZ-uR85CUxZuVU5au6kFh3WN9Mrcb3zQ@mail.gmail.com>
	<B6E098D1-2EC4-4C23-A169-ABD07D96C980@dominion.thruhere.net>
	<CAP9ODKo88-WnBWtMMYRLJOyZREjQTwoB7Y+nsAYX_YHFMrcRgQ@mail.gmail.com>
	<195E44C8-6115-4137-88AF-ACE08B7DE7C6@dominion.thruhere.net>
Date: Tue, 11 Oct 2011 10:14:12 -0300
X-Google-Sender-Auth: stPtKzXBLxaRW1VNNKiBjgsQh9o
Message-ID: <CAP9ODKpEN3aNj+8MmJnX540Fm9sf3eLb5Y0t=fChH4D5CCsFeg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 11 Oct 2011 13:19:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 05:33, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> Op 10 okt. 2011, om 14:35 heeft Otavio Salvador het volgende geschreven:
>> On Mon, Oct 10, 2011 at 09:26, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>>> Op 10 okt. 2011, om 14:22 heeft Otavio Salvador het volgende geschreven=
:
>>>> On Mon, Oct 10, 2011 at 04:27, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>>> Op 10 okt. 2011, om 03:03 heeft Otavio Salvador het volgende geschrev=
en:
>>>>>> On Sun, Oct 9, 2011 at 07:06, Koen Kooi <koen@dominion.thruhere.net>=
 wrote:
>>>>>>> Update: move to latest SRCREV, use non-kernel.org URI
>>>>>>> Merge: wl12xx symlink + packaging, install all firmwares
>>>>>>> Fix: * all entries in PACKAGES are in PROVIDES already
>>>>>>> =A0 =A0 * A package always RPROVIDES itself
>>>>>>> =A0 =A0 * A file can only get packaged *once* so only one rtlwifi p=
ackage will get the license
>>>>>>
>>>>>> I dislike the idea of one single package with all firmwares. I prefe=
r
>>>>>> to have many small packages but one meta that depends on it.
>>>>>
>>>>> I'm not going to make a patch to subpackage *all* the firmwares. If y=
ou can give me a list of the ones you use I'll make a patch to split those =
out.
>>>>
>>>> Leave the ones that exist now and move the rest to ${PN}-others so
>>>> people can test using it and split from it =A0when need.
>>>
>>> I don't see the value of naming the unsplit firmwares something else as=
 ${PN} at this point, OE classic doesn't have it either.
>>
>> This make clear that useing the others package is a workaround and
>> thus people can submit patches to add a specific package and move out
>> to it. Using PN would make it to easy to forgot.
>
> It would also break existing users for linux-firmware, so I propose to le=
t this patch go in as-is and have people with strong opinion on package spl=
itting send a follow up patch.

You merged packages, they were split already.

It might break for OE-classic users but hey ... you're moving to a new
OE and this can be change.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


