Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDExX-0003qP-Mw
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 14:27:55 +0200
Received: by bke11 with SMTP id 11so8447831bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 05:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=vEGD8/L1Pkvv2F0QcFhICPQFSpoLivVpG4AuWkzI9DI=;
	b=cf5WK7UprRyOI/ZFR4ErnfrlL2hIRVitIDmncWNBIk0drzSfPwXq74lNDph6S4P9bK
	MDR6PH8FESMSbW8otewdlaF+SdNPQaVaYx3GpigPAaaiZlxJl+OSLzDDQBWhPqaszj1r
	vRYAki1uRyoPkqM33dKRFZo8Qh5ClWcOwvEY4=
MIME-Version: 1.0
Received: by 10.204.140.27 with SMTP id g27mr6179823bku.72.1318249335219; Mon,
	10 Oct 2011 05:22:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.138.72 with HTTP; Mon, 10 Oct 2011 05:22:15 -0700 (PDT)
In-Reply-To: <B6820E11-C598-4B0A-92E0-664DF20CB727@dominion.thruhere.net>
References: <1318154801-28945-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKoiKeOMs1bJLcmOQeSR4XDL8Wi_oa=a7jANS78Ouwx-Bw@mail.gmail.com>
	<B6820E11-C598-4B0A-92E0-664DF20CB727@dominion.thruhere.net>
Date: Mon, 10 Oct 2011 09:22:15 -0300
X-Google-Sender-Auth: 2M4pWvXCQeNeJRT9Jk59_K0VXkk
Message-ID: <CAP9ODKoH9iUGTuXWsqiZ-uR85CUxZuVU5au6kFh3WN9Mrcb3zQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 10 Oct 2011 12:27:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2011 at 04:27, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> Op 10 okt. 2011, om 03:03 heeft Otavio Salvador het volgende geschreven:
>> On Sun, Oct 9, 2011 at 07:06, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>>> Update: move to latest SRCREV, use non-kernel.org URI
>>> Merge: wl12xx symlink + packaging, install all firmwares
>>> Fix: * all entries in PACKAGES are in PROVIDES already
>>> =A0 =A0 * A package always RPROVIDES itself
>>> =A0 =A0 * A file can only get packaged *once* so only one rtlwifi packa=
ge will get the license
>>
>> I dislike the idea of one single package with all firmwares. I prefer
>> to have many small packages but one meta that depends on it.
>
> I'm not going to make a patch to subpackage *all* the firmwares. If you c=
an give me a list of the ones you use I'll make a patch to split those out.

Leave the ones that exist now and move the rest to ${PN}-others so
people can test using it and split from it  when need.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


