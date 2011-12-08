Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RYaxT-0002SG-C9
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 11:12:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Dec 2011 02:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93883753"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2011 02:05:16 -0800
Received: from pgsmsx101.gar.corp.intel.com (10.221.44.78) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 8 Dec 2011 18:05:15 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Thu, 8 Dec 2011 18:05:15 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Thu, 8 Dec 2011
	18:05:14 +0800
From: "Mei, Lei" <lei.mei@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2011 18:05:13 +0800
Thread-Topic: [OE-core] [PATCH 0/1]Fix inappropriate default protocal in
	distrodata.bbclass
Thread-Index: Acy0IyopkZqCuO+wRke232MykBhTygBbVvtw
Message-ID: <749B9D3DBF0F054390025D9EAFF47F2212D60348EE@shsmsx501.ccr.corp.intel.com>
References: <cover.1323162150.git.lei.mei@intel.com>
	<1323181630.19363.3.camel@ted>
In-Reply-To: <1323181630.19363.3.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 0/1]Fix inappropriate default protocal in distrodata.bbclass
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
X-List-Received-Date: Thu, 08 Dec 2011 10:12:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: openembedded-core-bounces@lists.openembedded.org
>[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>Richard Purdie
>Sent: Tuesday, December 06, 2011 10:27 PM
>To: Patches and discussions about the oe-core layer
>Subject: Re: [OE-core] [PATCH 0/1]Fix inappropriate default protocal in
>distrodata.bbclass
>
>On Tue, 2011-12-06 at 17:09 +0800, Mei Lei wrote:
>> Hi all,
>> 	Some git repo recipes use rsync protocal as their default protocal, thi=
s will
>lead errors when checking upstreawm version.
>> 	Change default protocal from rsync to git for those git recipes.
>>
>> Thanks,
>> Lei
>>
>> The following changes since commit
>0a7a8597be05c8def8af58eecab49d963dc9d757:
>>   Richard Purdie (1):
>>         libsdl: Disable pulseaudio explicitly
>>
>> are available in the git repository at:
>>
>>   git://git.pokylinux.org/poky-contrib lmei3/fix-protocal
>>
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dlmei3/fix-protoc
>> al
>>
>> Mei Lei (1):
>>   distrodata.bbclass:Fix some recipes upstream version check issue.
>
>Merged to master, thanks.
>
>I believe I have previously asked we look at getting fetcher like function=
ality
>merged into the fetchers and I'd like to mention this again and ensure its=
 not
>forgotten. Perhaps we need to file an enhancement bug in the bugzilla for =
this?

Yes, I also think so, I filed a new bug for this enhancement:
http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1813


Thanks,
Lei

>
>Cheers,
>
>Richard
>
>
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


