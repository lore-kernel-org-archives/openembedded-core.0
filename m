Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qc2Bc-0003bM-6X
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 23:20:40 +0200
Received: by wwi18 with SMTP id 18so1400257wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:16:57 -0700 (PDT)
Received: by 10.216.240.202 with SMTP id e52mr1978142wer.84.1309382217448;
	Wed, 29 Jun 2011 14:16:57 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w62sm841501wec.18.2011.06.29.14.16.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 14:16:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A167F0C726@shsmsx502.ccr.corp.intel.com>
Date: Wed, 29 Jun 2011 23:16:50 +0200
Message-Id: <762A9B7C-A32D-4FC0-9D3C-55EFE9BF1574@dominion.thruhere.net>
References: <cover.1309239001.git.dexuan.cui@intel.com>
	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
	<201106281207.23516.paul.eggleton@linux.intel.com>
	<4E0A794C.5060303@gmail.com>
	<1865303E0DED764181A9D882DEF65FB6A167F0C724@shsmsx502.ccr.corp.intel.com>
	<53FFBC7D-50F2-4307-B253-EAB8F86DFDAA@dominion.thruhere.net>
	<1865303E0DED764181A9D882DEF65FB6A167F0C726@shsmsx502.ccr.corp.intel.com>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Wed, 29 Jun 2011 21:20:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 jun 2011, om 18:44 heeft Cui, Dexuan het volgende geschreven:

> Koen Kooi wrote:
>> Op 29 jun 2011, om 18:14 heeft Cui, Dexuan het volgende geschreven:
>>=20
>>> Khem Raj wrote:
>>>> On 06/28/2011 04:07 AM, Paul Eggleton wrote:
>>>>> On Tuesday 28 June 2011 07:45:09 Koen Kooi wrote:
>>> BTW: meta and mete-yocto belong to the same git repo actually, so do
>>> you think showing them in one line like this=20
>>>=20
>>> meta,meta-yocto   =3D =
"master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
>>>=20
>>> is better than showing 2 lines like this:
>>>=20
>>> meta             =3D =
"master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
>>> meta-yocto    =3D "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
>>=20
>> That breaks with repos like meta-intel and meta-oe. Maybe something
> Could you please explain a bit more?

That will become very wide with meta-intel and meta-oe and friends. I =
know my terminals are >200 chars wide, but not everyone is weird that =
way :) Just look at the line below:

> =
meta-sugarbay,meta-crownbay,meta-emenlow,meta-fishriver,meta-jasperforest,=
meta-n450, =3D "master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db"


