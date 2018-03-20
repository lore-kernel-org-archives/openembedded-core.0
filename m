Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A7AC878915
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 21:08:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2018 14:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,337,1517904000"; d="scan'208";a="29759078"
Received: from ttorling-mac01.jf.intel.com ([10.24.14.171])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2018 14:08:15 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <a73785d4-f3fb-374d-3a54-3ea97e85b41f@linux.intel.com>
Date: Tue, 20 Mar 2018 14:08:15 -0700
Message-Id: <655551A1-982B-4AF5-BA38-E122543A0DB0@linux.intel.com>
References: <CY4PR11MB17663B664B1ED6ADE96BC48AC7D40@CY4PR11MB1766.namprd11.prod.outlook.com>
	<dd055b01-fe83-d706-bce1-5a2aea3103fe@gmail.com>
	<CAJTo0LbxDGNrJH8tDiCgMKoSHUsK8Q17BUH=UVkY8zDBAm70+g@mail.gmail.com>
	<833712e4-00aa-1e05-8df5-a0f9a18d4e29@linux.intel.com>
	<CAJTo0LadpoW1BCCbfhsEac7PBV2qNxuiWrnRk6MZeV2DVWiDEA@mail.gmail.com>
	<61d1ecb9-e4a6-8d26-9bcc-76c7c42abb7f@linux.intel.com>
	<1521561579.25754.202.camel@linuxfoundation.org>
	<a73785d4-f3fb-374d-3a54-3ea97e85b41f@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IFt5b2N0b10gWW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxMuKAmTE4?=
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
X-List-Received-Date: Tue, 20 Mar 2018 21:08:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Mar 20, 2018, at 11:00 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 03/20/2018 05:59 PM, Richard Purdie wrote:
>>>> How long does a single run take, and why not run it every month?
>>> Just a bit longer than a day, maybe 30 hours, if it needs to update
>>> the
>>> typical amount of 100-150 packages. I'll shift it to monthly then.
>> Personally I'm leaning to every couple of weeks...
>=20
> My worry is that shorter AUH periods will lead to reminder fatigue. =
Also the period between submitting the updates, and having them show up =
in master is sometimes less than ideal, even when the freeze is not in =
effect.
>=20

I agree with both of you. I guess that makes me a transistor that =
can=E2=80=99t decide which path to choose :)

For meta-perl and meta-python, I am striving to run once a week, but =
that isn=E2=80=99t intended to send email out to any maintainers, it is =
just for my own accounting. It gets very messy with in-flight patches, =
which I hope to fix by using git-pw to not include packages that already =
have an upgrade in review. It is also optimistic for me to personally =
fix the 20+ packages that need updates at any given moment. This is why =
I need run time testing to give me better confidence in auto-upgraded =
recipes. Working on it :)

> Alex
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


