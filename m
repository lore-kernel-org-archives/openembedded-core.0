Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDF1v-0003x5-J7
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 14:32:27 +0200
Received: by gyg8 with SMTP id 8so5324471gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 05:26:46 -0700 (PDT)
Received: by 10.223.85.139 with SMTP id o11mr32168338fal.0.1318249606228;
	Mon, 10 Oct 2011 05:26:46 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h16sm31336496fab.19.2011.10.10.05.26.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 05:26:45 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKoH9iUGTuXWsqiZ-uR85CUxZuVU5au6kFh3WN9Mrcb3zQ@mail.gmail.com>
Date: Mon, 10 Oct 2011 14:26:43 +0200
Message-Id: <B6E098D1-2EC4-4C23-A169-ABD07D96C980@dominion.thruhere.net>
References: <1318154801-28945-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKoiKeOMs1bJLcmOQeSR4XDL8Wi_oa=a7jANS78Ouwx-Bw@mail.gmail.com>
	<B6820E11-C598-4B0A-92E0-664DF20CB727@dominion.thruhere.net>
	<CAP9ODKoH9iUGTuXWsqiZ-uR85CUxZuVU5au6kFh3WN9Mrcb3zQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Oct 2011 12:32:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 10 okt. 2011, om 14:22 heeft Otavio Salvador het volgende geschreven:

> On Mon, Oct 10, 2011 at 04:27, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> Op 10 okt. 2011, om 03:03 heeft Otavio Salvador het volgende =
geschreven:
>>> On Sun, Oct 9, 2011 at 07:06, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>> Update: move to latest SRCREV, use non-kernel.org URI
>>>> Merge: wl12xx symlink + packaging, install all firmwares
>>>> Fix: * all entries in PACKAGES are in PROVIDES already
>>>>     * A package always RPROVIDES itself
>>>>     * A file can only get packaged *once* so only one rtlwifi =
package will get the license
>>>=20
>>> I dislike the idea of one single package with all firmwares. I =
prefer
>>> to have many small packages but one meta that depends on it.
>>=20
>> I'm not going to make a patch to subpackage *all* the firmwares. If =
you can give me a list of the ones you use I'll make a patch to split =
those out.
>=20
> Leave the ones that exist now and move the rest to ${PN}-others so
> people can test using it and split from it  when need.

I don't see the value of naming the unsplit firmwares something else as =
${PN} at this point, OE classic doesn't have it either.=


