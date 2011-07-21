Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QjoAl-0001g7-C8
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 09:59:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jul 2011 00:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="32891161"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2011 00:55:46 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 21 Jul 2011 15:54:10 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 21 Jul 2011 15:54:09 +0800
From: "Mei, Lei" <lei.mei@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jul 2011 15:54:09 +0800
Thread-Topic: [OE-core] [PATCH 2/2] perl-dynloader.patch: Fix libdir issue
	for multilib
Thread-Index: AcxG6j6jy+hEofZ1SYefPNV6jyt4FAAkKSDw
Message-ID: <749B9D3DBF0F054390025D9EAFF47F2212D0EAC182@shsmsx501.ccr.corp.intel.com>
References: <cover.1311151283.git.lei.mei@intel.com>
	<93848d65e679794e5aa41e548ee275378518d071.1311151283.git.lei.mei@intel.com>
	<1311172466.2344.43.camel@rex>
In-Reply-To: <1311172466.2344.43.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] perl-dynloader.patch: Fix libdir issue for multilib
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
X-List-Received-Date: Thu, 21 Jul 2011 07:59:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: openembedded-core-bounces@lists.openembedded.org
>[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>Richard Purdie
>Sent: Wednesday, July 20, 2011 10:34 PM
>To: Patches and discussions about the oe-core layer
>Subject: Re: [OE-core] [PATCH 2/2] perl-dynloader.patch: Fix libdir issue =
for
>multilib
>
>On Wed, 2011-07-20 at 16:48 +0800, Mei Lei wrote:
>> The perl-dynloader.patch can't support /usr/lib64, change the regular
>expression to support multilib.
>>
>> Signed-off-by: Mei Lei <lei.mei@intel.com>
>> ---
>>  .../perl/perl-5.12.3/perl-dynloader.patch          |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
>b/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
>> index d5ea00f..a45af91 100644
>> --- a/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
>> +++ b/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
>> @@ -19,7 +19,7 @@ Update by Nitin A Kamble <nitin.a.kamble@intel.com>
>2011/04/21
>>  +    {
>>  +        my $hostlib =3D $ENV{PERLHOSTLIB};
>>  +        print STDERR "*** Module name IN: $modlibname\n";
>> -+        ($p1, $p2, $p3, $p4, $p5) =3D $modlibname =3D~
>m/(^(.*lib\/)?)((perl\/[0-9\.]*\/)?)(.*)$/;
>> ++        ($p1, $p2, $p3, $p4, $p5) =3D $modlibname =3D~
>m/(^(.*lib[0-9]*\/)?)((perl\/[0-9\.]*\/)?)(.*)$/;
>>  +        print STDERR "*** p1: $p1  p3: $p3  p5: $p5\n";
>>  +        if ( $p1 ne "" ) {
>>  +            $modlibname =3D $hostlib.$p5;
>
>We might need to relax this a little further since we might want things
>like libx32 to work in future?

Hi Nitin,
	I am not sure what is the perl work style under libx32, can you supply som=
e information about it?

Thanks
Lei


>
>Cheers,
>
>Richard
>
>
>
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


