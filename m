Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDcic-0006uW-3x
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 15:50:07 +0200
Received: by bke11 with SMTP id 11so9896579bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wFuUeyJcAETDtstRHBkQlUax3/7g91S4imfz1ZcVnP0=;
	b=fyQVww7PY2D0lv4ccADKH5Bgr9lut0C/Utlfrh44I3EcLEaJl10Z1M6jHM1qRqS4c8
	CjbImiijVHyHXRyLwZkkdwuiQEKPFzLBOcs6ALTLyRZ8fa9mqkETBnYN6Ut9SdCO1NdB
	E5HKnIUoY7UrmWo4gYeHXFVNvhABh+hm68Bd8=
MIME-Version: 1.0
Received: by 10.204.154.209 with SMTP id p17mr9857473bkw.20.1318340661187;
	Tue, 11 Oct 2011 06:44:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.138.72 with HTTP; Tue, 11 Oct 2011 06:44:21 -0700 (PDT)
In-Reply-To: <AC5B37A6-EC5E-45F8-8CC2-550DF17DC725@dominion.thruhere.net>
References: <1318154801-28945-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKoiKeOMs1bJLcmOQeSR4XDL8Wi_oa=a7jANS78Ouwx-Bw@mail.gmail.com>
	<B6820E11-C598-4B0A-92E0-664DF20CB727@dominion.thruhere.net>
	<CAP9ODKoH9iUGTuXWsqiZ-uR85CUxZuVU5au6kFh3WN9Mrcb3zQ@mail.gmail.com>
	<B6E098D1-2EC4-4C23-A169-ABD07D96C980@dominion.thruhere.net>
	<CAP9ODKo88-WnBWtMMYRLJOyZREjQTwoB7Y+nsAYX_YHFMrcRgQ@mail.gmail.com>
	<195E44C8-6115-4137-88AF-ACE08B7DE7C6@dominion.thruhere.net>
	<CAP9ODKpEN3aNj+8MmJnX540Fm9sf3eLb5Y0t=fChH4D5CCsFeg@mail.gmail.com>
	<AC5B37A6-EC5E-45F8-8CC2-550DF17DC725@dominion.thruhere.net>
Date: Tue, 11 Oct 2011 10:44:21 -0300
X-Google-Sender-Auth: tyRX2xMDxQ1kw6fiLGVOC_N_Ous
Message-ID: <CAP9ODKostUW6DKFZ7ata4nLozOfJdhzFqVUV0WzBXqGrUhQs+g@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2011 13:50:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 10:33, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> Op 11 okt. 2011, om 15:14 heeft Otavio Salvador het volgende geschreven:
>> On Tue, Oct 11, 2011 at 05:33, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>>> Op 10 okt. 2011, om 14:35 heeft Otavio Salvador het volgende geschreven=
:
>>>> On Mon, Oct 10, 2011 at 09:26, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>>> Op 10 okt. 2011, om 14:22 heeft Otavio Salvador het volgende geschrev=
en:
>>>>>> On Mon, Oct 10, 2011 at 04:27, Koen Kooi <koen@dominion.thruhere.net=
> wrote:
>>>>>>> Op 10 okt. 2011, om 03:03 heeft Otavio Salvador het volgende geschr=
even:
>>>>>>>> On Sun, Oct 9, 2011 at 07:06, Koen Kooi <koen@dominion.thruhere.ne=
t> wrote:
>>>>>>>>> Update: move to latest SRCREV, use non-kernel.org URI
>>>>>>>>> Merge: wl12xx symlink + packaging, install all firmwares
>>>>>>>>> Fix: * all entries in PACKAGES are in PROVIDES already
>>>>>>>>> =A0 =A0 * A package always RPROVIDES itself
>>>>>>>>> =A0 =A0 * A file can only get packaged *once* so only one rtlwifi=
 package will get the license
>>>>>>>>
>>>>>>>> I dislike the idea of one single package with all firmwares. I pre=
fer
>>>>>>>> to have many small packages but one meta that depends on it.
>>>>>>>
>>>>>>> I'm not going to make a patch to subpackage *all* the firmwares. If=
 you can give me a list of the ones you use I'll make a patch to split thos=
e out.
>>>>>>
>>>>>> Leave the ones that exist now and move the rest to ${PN}-others so
>>>>>> people can test using it and split from it =A0when need.
>>>>>
>>>>> I don't see the value of naming the unsplit firmwares something else =
as ${PN} at this point, OE classic doesn't have it either.
>>>>
>>>> This make clear that useing the others package is a workaround and
>>>> thus people can submit patches to add a specific package and move out
>>>> to it. Using PN would make it to easy to forgot.
>>>
>>> It would also break existing users for linux-firmware, so I propose to =
let this patch go in as-is and have people with strong opinion on package s=
plitting send a follow up patch.
>>
>> You merged packages, they were split already.
>
> This commit doesn't merge subpackages, it splits off the wilink ones and =
packages previously unpackaged firmwares into ${PN}

I'd prefer to have it all splitted and a package with what is not
included so people would be easily aware of the missing ones and with
an easy way to test.

My 2c. only; I don't decide about the patch going in or not.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


