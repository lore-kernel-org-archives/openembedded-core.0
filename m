Return-Path: <prvs=01002816c1=mike.looijmans@topicproducts.com>
X-Greylist: delayed 1149 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Oct 2016 14:22:44 UTC
Received: from mx18-05.smtp.antispamcloud.com (mx18-05.smtp.antispamcloud.com
	[207.244.64.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3F903719C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 14:22:44 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1bwrRV-0002C5-7V; Wed, 19 Oct 2016 16:03:31 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 19 Oct 2016 16:02:02 +0200
To: "Burton, Ross" <ross.burton@intel.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <cover.1476469708.git.jussi.kukkonen@intel.com>
	<0464acab-69a2-715d-5a3d-61e3961e8ccb@windriver.com>
	<1570516.F2oa9eZtAN@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZ=q+030y70h7=sq9c-9_mOm5K6sNRcV7xhBO1PEYAhow@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <c80b8055-3c0c-4047-ebfd-4c94f41f95ba@topic.nl>
Date: Wed, 19 Oct 2016 16:02:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ=q+030y70h7=sq9c-9_mOm5K6sNRcV7xhBO1PEYAhow@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarwy3Yf5i+byKl6pUyknU7g+6rXMBzn0F1oDrD0qksn30/zxAJCKXfBevAF/4N7O8thBkB
	nZsK1acKJZ7HOzksFqOGyUIczeD4TAWGto2EA1jFMgby/raZUz8oZkzEwVDiGrv32EeInn7+IwbG
	dVcXhj3Rm3gO5BAOIQiIjL9+eNDA9PZlU7+BA933uHC1AGujjOn8X9tKbWO/lhy9VTF4P51K/30t
	WvKPDP13s1LmDQmfIbtf63VNbf0lrvssY+k7AMMIjXBIa3olXKSl/hGyroktU7juyZhYo0PLD0vP
	9NfRpFUADJFjIldLC6lkryfSaFYFvf25LVONYbYifH5OzZAZ4rPy+USX8ZISIKfFzoCtKaRrAMb1
	2o1FxRtxWCz2BqrRWcGYMZHP4SnNnmTTef4RFZ4oobg8BBg3Jq+ntzj0tKbf5t0ThbzOzJM63N33
	IIIHzgrL8il3sV0dVRVXzjqRVYKU9W9tbmVXJBqdHHDmlFyaiSgCQQ1OadeU0o3KJDNLKZUH8kQv
	CzH7IKj6sa+/C1cmIkpmMu2y/KVVPaNVmWxgBaaPt9++LWwpCu5NcWltkIEyb31pMCMMB0fkaiUf
	hLP+ssd9qBrF2bUx9HvvbK7Dzzob/RpwUTFjHB8piRgD/FVEY7v4laIdTJ8d+KCo47PshRC2mHFY
	hRsz6XJxjFEcE6algxqtVm5extMvuw==
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Re-add piglit to sdk images
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
X-List-Received-Date: Wed, 19 Oct 2016 14:22:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 19-10-16 14:53, Burton, Ross wrote:
>
> On 18 October 2016 at 22:21, Paul Eggleton <paul.eggleton@linux.intel.com
> <mailto:paul.eggleton@linux.intel.com>> wrote:
>
>     > > Q: Do I need to declare a runtime dependency that typically comes
>     > > from busybox (tar)?
>     >
>     > Yes, because some people try to eliminate busybox from their image.
>
>     How would one express such a dependency though, given that it could c=
ome from
>     tar or busybox? "Virtual" runtime dependencies aren't allowed except =
through
>     our somewhat awkward VIRTUAL-RUNTIME convention, but that probably is=
n't
>     warranted here.
>
> busybox could RRPOVIDE tar?

If we go down that road, we'd end up with a busybox that RPROVIDES a hundre=
d=20
and one utilities. I doubt anyone will be happy with that...


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






