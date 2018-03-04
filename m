Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6B49978A9B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 22:55:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 14:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,425,1515484800"; d="scan'208";a="208768003"
Received: from smuskula-mobl.amr.corp.intel.com ([10.255.72.214])
	by fmsmga005.fm.intel.com with ESMTP; 04 Mar 2018 14:55:53 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <1520184284.3436.73.camel@linuxfoundation.org>
Date: Sun, 4 Mar 2018 14:55:55 -0800
Message-Id: <40C301D0-3E30-45AA-9C74-188159EA08B8@linux.intel.com>
References: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
	<33ac1c7b856b09d1f12d7bbf13dd9343cf27a867.1520166347.git.timothy.t.orling@linux.intel.com>
	<1520184284.3436.73.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] libtest-needs-perl: add 0.002005
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
X-List-Received-Date: Sun, 04 Mar 2018 22:55:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Mar 4, 2018, at 9:24 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Sun, 2018-03-04 at 04:41 -0800, Tim Orling wrote:
>> Skip tests when modules not available
>>=20
>> * Dependency for ptest of liburi-perl
>>=20
>> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>> ---
>>  .../perl/libtest-needs-perl_0.002005.bb            | 29
>> ++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 meta/recipes-devtools/perl/libtest-needs-
>> perl_0.002005.bb
>=20
> Can you send a patch to fix:
>=20
> https://autobuilder.yocto.io/builders/nightly-oe-
> selftest/builds/878/steps/Running%20oe-selftest/logs/stdio
>=20
> i.e.=20
>=20
> oe-selftest -r distrodata.Distrodata.test_maintainers
>=20
> please? (missing maintainers entry for libtest-needs-perl)
>=20

That=E2=80=99s what I get for submitting at 5 am. Details. Yes, I will =
send a patch to self-assign libtest-needs-perl and take over =
maintainership of all the libfoo-perl in oe-core (if there are no =
objections).

> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20


