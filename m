Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWQCt-0004iE-AE
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 11:46:47 +0200
Received: by wwb17 with SMTP id 17so4758656wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 02:43:19 -0700 (PDT)
Received: by 10.227.201.142 with SMTP id fa14mr6195603wbb.48.1308044599095;
	Tue, 14 Jun 2011 02:43:19 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb6sm4888196wbb.34.2011.06.14.02.43.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 02:43:18 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308043725.25285.232.camel@phil-desktop>
Date: Tue, 14 Jun 2011 11:43:17 +0200
Message-Id: <FD93DE23-D82A-4F97-9761-B27B4C86175B@dominion.thruhere.net>
References: <cover.1307937636.git.raj.khem@gmail.com>
	<1307955075.6879.11.camel@lenovo.internal.reciva.com>
	<BANLkTikbba0xTCB=eLZamP7LY6wJ8_Nkhw@mail.gmail.com>
	<1308043725.25285.232.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/1] Upgrade gcc 4.6.0 to latest on FSF 4.6 branch
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
X-List-Received-Date: Tue, 14 Jun 2011 09:46:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jun 2011, om 11:28 heeft Phil Blundell het volgende geschreven:

> On Mon, 2011-06-13 at 10:12 -0700, Khem Raj wrote:
>> On Mon, Jun 13, 2011 at 1:51 AM, Phil Blundell <pb@pbcl.net> wrote:
>>> On Sun, 2011-06-12 at 21:03 -0700, Khem Raj wrote:
>>>> This patch brings in new patches from gcc 4.6 FSF branch
>>>> And refreshes the headers of existing backported patches
>>>> to not have git patch numbers in comments
>>>>=20
>>>> I am not sending the patch itself to mailing list due to its
>>>> large size so please review it on the contrib tree itself
>>>>=20
>>>=20
>>> Would we not be better off just pulling the tip of the 4.6 branch =
from
>>> FSF SVN, rather than having to keep all these patches in git?
>>>=20
>>=20
>> there is dislike for this approach in oe-core. As the release point =
is preferred
>> I suggested to drop the minor release number and call the recipes 4.6
>> and use SVN
>> REVs to track the recipe updates but it did not fly :)
>=20
> Where does that dislike come from?  Koen did make a comment about =
having
> liked svn checkouts for 4.5 "very, very much" but I couldn't quite
> figure out whether he was being sarcastic or not and, if so, what
> exactly his objection was.

I wasn't being sarcastic, I really like it very, very much.=


