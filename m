Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SqlQg-0001zG-VR
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 15:33:38 +0200
Received: by wibhm11 with SMTP id hm11so2395677wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 06:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=56RIehAkxqjI7P3PGvdCGi0IOCZmhBGVTuznqV0BKAw=;
	b=R1Xt8+oenQJu+JBgL+kWToGpd/vQCTu6OFh11BgL8t2W7k0yHcEQ1QCpV6/CrMEEO7
	WogvzE3KQfS7s3L8KBW/VGl3xEsWe9zqixLz6M2Sql28PkATIqPd7HzAloeEL10cGhVZ
	qc7hgrEks9fyAq8o96d9kotZ16Q8pmdmezKK01hG7LOwTit/xaG7Msv1OWj9e//KSg7A
	B/eXsf8nrJhPlLGDJCsq0SnzgN5S/kgJ37EYLHYFcGi0uForpvxHNTyn7gkiVwey14JC
	2cPPNYRNcAkpZzmenN3mtpXc9YkYP7HDT2JKcfHHlhOuBE3UgMvUEqdrhfHfxXD+DtXz
	mMdA==
Received: by 10.216.206.65 with SMTP id k43mr6193840weo.144.1342444940736;
	Mon, 16 Jul 2012 06:22:20 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id ef5sm31773443wib.3.2012.07.16.06.22.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 06:22:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrBnzOM7rfhRr5KC-L_EjuwZ73NkpHcyg1hiOxKXD+6Rg@mail.gmail.com>
Date: Mon, 16 Jul 2012 15:22:16 +0200
Message-Id: <E5F016E0-45BD-4F23-8B53-01E45EB25AFB@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
	<29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
	<CAP9ODKrBnzOM7rfhRr5KC-L_EjuwZ73NkpHcyg1hiOxKXD+6Rg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQm+ESG8if4Wkm0/V2Ue7JfFioDW4hwbow4tk1TA6+hyUP+p91vXEq4/66EM+LuXFjkbqEGO
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Mon, 16 Jul 2012 13:33:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 16 jul. 2012, om 14:28 heeft Otavio Salvador het volgende geschreven:

> On Mon, Jul 16, 2012 at 3:11 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 15 jul. 2012, om 23:25 heeft Otavio Salvador het volgende =
geschreven:
>>=20
>>> On Sat, Jul 14, 2012 at 6:59 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>> The recipe is autotools based now, the COPYING file was replaced =
with the complete GPLv2 license text.
>>>> No more 'lspci' needed ad runtime, but zlib and libnl are needed =
nowadays.
>>>> Add 2 patches, one to fix cross builds and one from Linaro to fix C =
state parsing on !x86.
>>>=20
>>> Please add proper Upstream-Status for the patches; it is nice to =
have
>>> those to track the pending patches.
>>=20
>> Isn't that field only used to put in "pending" and then backslap each =
other on doing such a good job?
>=20
> =46rom what I read, those are backports; so you can use Backport
> [applied in version X.Y]

No, they were pulled of the powertop mailinglist and git-am'ed :)=


