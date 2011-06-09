Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QUfhU-0006OI-WB
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 15:55:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2011 06:51:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,341,1304319600"; d="scan'208";a="14125462"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2011 06:51:47 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 9 Jun 2011 21:51:47 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 9 Jun 2011 21:51:46 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Thu, 9 Jun 2011
	21:51:45 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jun 2011 21:51:44 +0800
Thread-Topic: [OE-core] [RFC v1 PATCH 00/16] populate perl-native into its
	own	directory
Thread-Index: AcwmfHUyj/kJXrrsT6OIY/OsBS32fQALjwHw
Message-ID: <1865303E0DED764181A9D882DEF65FB69810B00D86@shsmsx502.ccr.corp.intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<4DE67440.1020405@mentor.com> <1306950977.27470.461.camel@rex>
	<4DE69582.2090508@mentor.com>
	<1306958729.3119.3.camel@lenovo.internal.reciva.com>
	<4DE6A43A.3050401@mentor.com>
	<1306961135.3119.13.camel@lenovo.internal.reciva.com>
	<4DE6A836.3040004@mentor.com> <1307023591.27470.549.camel@rex>
	<4DE79D69.7080806@mentor.com> <1307025426.2529.209.camel@phil-desktop>
	<4DE7BA3F.4060600@mentor.com> <1307032545.27470.580.camel@rex>
	<4DE7C09F.9000104@mentor.com>  <1307606678.15712.130.camel@rex>
	<1307606884.15712.132.camel@rex>
In-Reply-To: <1307606884.15712.132.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
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
X-List-Received-Date: Thu, 09 Jun 2011 13:55:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Thu, 2011-06-09 at 09:04 +0100, Richard Purdie wrote:
>> On Thu, 2011-06-02 at 09:55 -0700, Tom Rini wrote:
>>> On 06/02/2011 09:35 AM, Richard Purdie wrote:
>>>> On Thu, 2011-06-02 at 09:28 -0700, Tom Rini wrote:
>>>>>   Even if we're using the sstate
>>>>> cache from /foo/oecore/tmp over in /bar/oecore/tmp (and
>>>>> /foo/oecore/tmp is rm -rf'd) ?  Since we've got a create_wrapper
>>>>> around perl and perl${PV} it should be I suppose (or is easily
>>>>> added there), but I'd feel a lot better with some testing of the
>>>>> above case (and the updates to cpan*bbclass).
>>>>=20
>>>> I only took the perl-native DEPENDS patch on the condition this
>>>> gets fixed properly. The patches that are there look to do that,
>>>> at least for OE-Core. If there are further issues we're going to
>>>> have to take them as they arise as I have an objection to
>>>> crippling the build dependencies because perl is broken. Really
>>>> this could use some TLC from someone with experience in the area...
>>>=20
>>> Well, I guess I'd boil down what I said above into a request like
>>> this for v3: - Modify cpan.bbclass to NOT set PERL_INC / PERL_LIB /
>>> PERL_ARCHLIB / PERLHOSTLIB.
>>=20
>> The first three of these are all about the *target* perl location
>> and I think we still need them due the mess that perl's build system
>> is. With the patch series in question they won't actually point at
>> perl-native in the target case and they are only really used for
>> cross compiling purposes.=20
>>=20
>> PERLHOSTLIB is used by the target perl when cross compiling to find
>> native .so files. perl-native will always be present at this point
>> and again, it seems like a valid use case.
>>=20
>> Summary is that I don't think perl-native is broken in any way but
>> we do need those variables.=20
>>=20
>>> - In /scratch/oecore/tmp0 build the images that were built for v1
>>> - In /scratch/oecore/tmp1 build perl-native's full sstate cache.
>>> - Keep the sstate cache from tmp1 and otherwise rm -rf tmp1.
>>> - In /scratch/oecore/tmp2 using the sstate from tmp1, build the same
>>> images that were built for tmp0.
>>=20
>> I'm confused by this test cycle. What do you mean by "build
>> perl-native's full sstate cache"?
>>=20
>> I suspect you've asking for some partial sstate cache to be shared
>> between two builds?=20
>>=20
>> Put simpler, you probably want:
>>=20
>> in tmp0 "bitbake perl-native"
>> in tmp1, different location to tmp0, "bitbake core-image-sato" but
>> sharing the same sstate cache
>=20
> I meant to add that tmp0 should be renamed before this second step so
> if there are hardcoded references in any of the sstate packages they
> couldn't find anything in tmp0 as it would no longer exist.
Actually this doesn't work even without my patch series?
i.e., without my patch series,
1) I "bitbake perl-native" in /poky.git/build/;
2) mv /poky.git/build /poky.git/build.bak;
3) in /poky.git/build2/, modify the conf/local.conf to set SSTATE_MIRRORS t=
o point to /poky.git/build.bak/sstate-cache/, and "bitbake sgmlspl-native" =
would fail in do_compile:
"Can't locate ExtUtils/Command.pm in @INC (@INC contains: /poky.git/build/t=
mp/sysroots/i686-linux/usr/lib/perl/5.12.3 /poky.git/build/tmp/sysroots/i68=
6-linux/usr/lib/perl/5.12.3 /poky.git/build/tmp/sysroots/i686-"linux/usr/li=
b/perl/5.12.3"
Is this an existing bug?=20

Thanks,
-- Dexuan=


