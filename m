Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A8A0D772AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:19:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Feb 2016 12:19:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="896568504"
Received: from rravin1x-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.111])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2016 12:19:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Fri, 05 Feb 2016 09:19:16 +1300
Message-ID: <4933227.rYH5s4XHH6@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.4-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <56B3B0B8.3010600@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
	<2011452.Q9kTNeH3mx@peggleto-mobl.ger.corp.intel.com>
	<56B3B0B8.3010600@linux.intel.com>
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
X-List-Received-Date: Thu, 04 Feb 2016 20:19:21 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thu, 04 Feb 2016 14:12:40 An=EDbal Lim=F3n wrote:
> On 02/04/2016 12:34 PM, Paul Eggleton wrote:
> > On Tue, 02 Feb 2016 18:30:35 An=EDbal Lim=F3n wrote:
> >> This reverts commit 303985d3f402013c7c4a3355f19d48b1cef1c12f.
> >>=20
> >> As discussion with Paul Eggleton, he don't want to have env variab=
les
> >> to change the behaviour of what the env script needs to print,
> >> i'll redirect the output in oeSDK.run() method.
> >>=20
> >> I didn't agree because it can hides another messages like error on=
es
> >> and with the variable you can control what prints or not.
> >>=20
> >> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> >=20
> > We don't want to add this and revert it in the same series.
>=20
> Ok, then i'll send another series without this commit and this revert=
 in
> another commit.

If you mean without both the commit and the revert, then yes.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

