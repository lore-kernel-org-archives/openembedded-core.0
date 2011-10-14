Received: from mail-dy0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REkho-0002Kh-H9
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:33:56 +0200
Received: by dyk17 with SMTP id 17so157275dyk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 09:28:10 -0700 (PDT)
Received: by 10.223.92.144 with SMTP id r16mr4995640fam.23.1318609687935;
	Fri, 14 Oct 2011 09:28:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id m26sm4546039fac.6.2011.10.14.09.28.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 09:28:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E986233.8020505@linux.intel.com>
Date: Fri, 14 Oct 2011 18:28:04 +0200
Message-Id: <3C978CB0-754A-4835-9A02-DC29A5AC882B@dominion.thruhere.net>
References: <f63c9c5991312f05bffee750086a0c7398770f8a>
	<1316787194-17442-1-git-send-email-dima_ch@emcraft.com>
	<4E810B74.7010001@linux.intel.com>
	<1318605488.23340.580.camel@vladimir.emcraft.com>
	<4E986233.8020505@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] qt4: Added support for QtMobility 1.2
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
X-List-Received-Date: Fri, 14 Oct 2011 16:33:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 okt. 2011, om 18:24 heeft Saul Wold het volgende geschreven:

> On 10/14/2011 08:18 AM, Dmitry Cherukhin wrote:
>> On Mon, 2011-09-26 at 16:32 -0700, Saul Wold wrote:
>>> On 09/23/2011 07:13 AM, Dmitry Cherukhin wrote:
>>>> This patch is indented to add new functionality,
>>>> specifically, the patch adds support for
>>>> the QtMobility 1.2 package.
>>>>=20
>>>> Added two recipes:
>>>> 1) qt-mobility-x11 builds the QtMobility 1.2 package
>>>>     on the basis of qt4-x11-free;
>>>> 2) qt-mobility-embedded builds the QtMobility 1.2 package
>>>>     on the basis of qt4-embedded.
>>>>=20
>>>> Signed-off-by: Dmitry Cherukhin<dima_ch@emcraft.com>
>>>> ---
>>>>   meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch |   28 =
+++++++++++
>>>>   meta/recipes-qt/qt4/files/qtme_gstreamer_pro.patch |   16 ++++++
>>>>   meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb  |   13 +++++
>>>>   meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb       |   11 ++++
>>>>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |   51 =
++++++++++++++++++++
>>>>   5 files changed, 119 insertions(+), 0 deletions(-)
>>>>   create mode 100644 =
meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch
>>>>   create mode 100644 =
meta/recipes-qt/qt4/files/qtme_gstreamer_pro.patch
>>>>   create mode 100644 =
meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
>>>>   create mode 100644 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
>>>>   create mode 100644 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>>>>=20
>>>> diff --git a/meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch =
b/meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch
>>>> new file mode 100644
>>>> index 0000000..689c224
>>>> --- /dev/null
>>>> +++ b/meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch
>>>> @@ -0,0 +1,28 @@
>>>> +This patch fixes the following issue at the configure stage:
>>>> +   Project ERROR: Qt Mobility requires Qt 4.6 or higher. Qt was =
found.
>>>> +The version of Qt is already 4.7.3, so this is misconfiguration =
problem.
>>>> +
>>>> +The origin of this patch is:
>>>> +   =
http://neophysis.git.sourceforge.net/git/gitweb.cgi?p=3Dneophysis/openembe=
dded;
>>>> +   =
a=3Dblob;f=3Drecipes/neophysis/qt-mobility-1.0.0/qtmobility_pro.patch;
>>>> +   =
h=3Dfc5e1691aed47bc50d87e5c33497354182cacda4;hb=3Drefs/heads/neophysis-tes=
ting-0.3
>>>> +Upstream-Status: not-appropriate
>>>=20
>>> Please refer to wiki page on www.openembedded.org for the corrcet
>>> formating of the Upstream-Status field.  You are also missing a
>>> Signed-off-by: line for each patch file.
>>>=20
>>> (I would give the exact page, but the site appears to be having =
problems)
>>>=20
>>=20
>> Thanks!
>> I removed all .patch files, new version of the patch is here:
>> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/8708
>>=20
> That's great, but that reader seems to mangle emails in a way that I =
can't use them for patching, it would be great if you could just send =
the v2 to this mailing list.

The reader is just a view into the mail archive, so if you scroll back 8 =
days in your oe-core folder, you should see the patch :)




