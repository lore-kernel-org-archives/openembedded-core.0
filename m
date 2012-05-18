Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SVI9O-0001eN-JT
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 10:03:02 +0200
Received: by wgbdr1 with SMTP id dr1so2238698wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 00:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=JqlrKX90U9grvTthCyQ4JsjUnl0mUzJUdiaYg8PIv44=;
	b=du/sKvUHWnYath4byoX+UbIZQgdnLc7Bwnreu7pLRHgyuxg0u4ysUXEMMG9DLnRE/k
	4z7Lrl2lrzy8S0XlYRVeQRhVaAaco9P7rFE7NHZ8B0XpZ4+kSosv+sTr49l+PeP3wVVG
	R4VgnzWgz98QcvIKTLSFAHsUopgvU6Ho8vTOCImODldfxpdj2ZAPjnDkgjD8SJWGd/Wt
	mAhepDfsNUdVQ3SyUNodIAHZT4cli542/pLmuxtysyXf1akMEnzmTcnVoUJUNtuJ/++H
	3IrFVtbtQgGSKqmObbEz8aKKqhZVNg3Gzygbw2UfBVkZjMB+9TEsfLF9EkKaZvGshkZK
	moOA==
Received: by 10.180.24.103 with SMTP id t7mr58563895wif.16.1337327579252;
	Fri, 18 May 2012 00:52:59 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id g10sm54128000wiw.0.2012.05.18.00.52.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 00:52:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1337288563.7473.24.camel@ted>
Date: Fri, 18 May 2012 09:52:55 +0200
Message-Id: <73807C59-D904-44D4-89D6-50B9C268B911@dominion.thruhere.net>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1srxyZkjFe+aypM_X+Wgyd-8b1X664Y8jWQuPF=xijeg+w@mail.gmail.com>
	<1337286572.7473.10.camel@ted>
	<0FEE2025-8E84-4CBB-8568-483A55233BD7@dominion.thruhere.net>
	<1337288563.7473.24.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlRHClo6TwBaaKZLnwmbPUAA+TB1OFXtfa/Us4n4HKe98Km4J86NrzluHfnQA6qFevfKEQm
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
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
X-List-Received-Date: Fri, 18 May 2012 08:03:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2012, om 23:02 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-05-17 at 22:44 +0200, Koen Kooi wrote:
>> Op 17 mei 2012 om 22:29 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>=20
>>> On Tue, 2012-05-15 at 13:54 -0700, Khem Raj wrote:
>>>> On Tue, May 15, 2012 at 2:32 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>> The commit breaks pkgconfig and after discussing it with the kmod =
and udev maintainers the conclusion was reached that putting the =
libraries in /lib instead of /usr/lib is not supported.
>>>>>=20
>>>>> This reverts commit 6b74f2461735272bd950a4f060dab6e778a36f92.
>>>>=20
>>>> while this is what I had initially it doesn't go well with kmod =
living in
>>>> /sbin and accessing libraries from /usr due to our QA checks =
although
>>>> I am all for simplifying it where we don't make this check at all.
>>>=20
>>> I've had requests for it along with a commitment to fix it and =
patches.
>>> If we decide we don't want this, fine and that will be the case if
>>> patches are not forthcoming to fix the QA issues. I don't think =
we've
>>> reached that point at this with that yet.
>>>=20
>>> I've decided to accept this patch and "unbreak" meta-oe/udev at the
>>> expense of screwing up OE-Core. I am however still deeply unhappy =
people
>>> are trying to bypass OE-Core this way and then "blackmail" OE-Core =
using
>>> breaking meta-oe as a reason. The whole systemd thing has been badly
>>> handled and needs to get fixed properly.
>>=20
>> What does systemd have to do with this?
>=20
> Why does meta-oe has its own udev recipe? Is systemd related to that =
at
> all?
>=20
>> This is about a broken commit breaking udev 182 for over a week.
>=20
> OE-Core worked fine and the commit fixes QA warnings which are now =
back.
>=20
>> If you have issues with systemd, send patches to meta-oe to fix it. =
Or
>> at least bug reports that are more than the insinuations above.=20
>=20
> I looked in the README and followed that to other README files but
> couldn't find any indication about what to do with bugs other than =
write
> patches which I obviously don't have.
>=20
> When will you be sending the patch to fix the QA warning your revert =
has
> introduced? Yes this is a rhetorical question since I've seen your =
view
> on this problem previously.

Those QA checks are a joke. I can fix the QA warnings by moving all kmod =
binaries to $bindir or $sbindir since binaries in /usr/bin and /usr/bin =
are exempt from the checks. That would break the split /usr case as =
well.  These checks are global as well when they only should apply to =
recipes needed to get /usr mounted.

That's why I consider the current checks misguided and harmfull. As seen =
from the breakage it allows people to break pkgconfig, which didn't get =
picked up by QA checks. And then it turns out that you an fix the QA =
warnings in such a way that it breaks the intent of the warnings.

But this is all a false dillemma, you could have merged Otavio's patch =
(which I Ack'ed) which supports split /usr and puts the pkgconfig in the =
right place.=


