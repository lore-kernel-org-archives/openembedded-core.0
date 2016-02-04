Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7B21960746
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 18:34:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2016 10:34:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,396,1449561600"; d="scan'208";a="42543873"
Received: from rravin1x-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.111])
	by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2016 10:34:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Fri, 05 Feb 2016 07:34:01 +1300
Message-ID: <2011452.Q9kTNeH3mx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.4-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <4c3c25336a50cffb7579340eaa5d5bed61dc67ff.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
	<4c3c25336a50cffb7579340eaa5d5bed61dc67ff.1454459362.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 23/28] Revert "classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env variable"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Feb 2016 18:34:06 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tue, 02 Feb 2016 18:30:35 An=EDbal Lim=F3n wrote:
> This reverts commit 303985d3f402013c7c4a3355f19d48b1cef1c12f.
>=20
> As discussion with Paul Eggleton, he don't want to have env variables=

> to change the behaviour of what the env script needs to print,
> i'll redirect the output in oeSDK.run() method.
>=20
> I didn't agree because it can hides another messages like error ones
> and with the variable you can control what prints or not.
>=20
> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>

We don't want to add this and revert it in the same series.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

