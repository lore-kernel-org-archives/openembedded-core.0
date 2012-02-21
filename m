Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rzx1K-0007E3-Hj
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:13:10 +0100
Received: by werc1 with SMTP id c1so4317691wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 13:04:51 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.86.134 as permitted sender)
	client-ip=10.180.86.134; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.86.134 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.86.134])
	by 10.180.86.134 with SMTP id p6mr28893279wiz.0.1329858291198 (num_hops
	= 1); Tue, 21 Feb 2012 13:04:51 -0800 (PST)
Received: by 10.180.86.134 with SMTP id p6mr24071346wiz.0.1329858290911;
	Tue, 21 Feb 2012 13:04:50 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y1sm60808425wiw.6.2012.02.21.13.04.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 13:04:50 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F43F9EE.5080608@linux.intel.com>
Date: Tue, 21 Feb 2012 22:04:51 +0100
Message-Id: <74D28F4B-214B-498E-AD37-B28DAE732D06@dominion.thruhere.net>
References: <cover.1329456260.git.yi.zhao@windriver.com>
	<ea7342b8cdd7a0f9c49253f9e063ab7577f04038.1329456260.git.yi.zhao@windriver.com>
	<4F43F9EE.5080608@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlvUshqVZrSuUnt8zA0DTqJLDO0iQ6tqoPb8cAep10oXyTVGfY5bL9sR/1XlV6e6YYScD0M
Subject: Re: [PATCH 1/3] lsbtest: Add recipe for LSB tests and automate test
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
X-List-Received-Date: Tue, 21 Feb 2012 21:13:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 feb. 2012, om 21:09 heeft Saul Wold het volgende geschreven:

> On 02/16/2012 10:02 PM, Yi Zhao wrote:
>> The recipe is used for LSB tests. The script LSB_Test.sh does the
>> following things:
>> - setup LSB testing environment
>> - download LSB rpm packages with list file packages_list from remote
>> - install the packages
>> - execute LSB testing with profile file session
>> - collect the results
>>=20
>> Install packages_list and session files into ${D}/opt/lsb-test.
>>=20
>> [YOCTO #1567]
>> ---
>>  meta/recipes-extended/lsb/lsbtest/LSB_Test.sh   |  493 =
+++++++++++++++++++++++
>>  meta/recipes-extended/lsb/lsbtest/packages_list |   50 +++
>>  meta/recipes-extended/lsb/lsbtest/session       |  194 +++++++++
>>  meta/recipes-extended/lsb/lsbtest_1.0.bb        |   36 ++
>>  4 files changed, 773 insertions(+), 0 deletions(-)
>>  create mode 100644 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
>>  create mode 100644 meta/recipes-extended/lsb/lsbtest/packages_list
>>  create mode 100644 meta/recipes-extended/lsb/lsbtest/session
>>  create mode 100644 meta/recipes-extended/lsb/lsbtest_1.0.bb
>=20
> I think you need to have a RDEPENDS on at a minimum for this lsbtest =
recipe since it relies on RPM to install the packages.
>=20
> RDEPENDS =3D "rpm"

RDEPENDS_${PN} =3D ..

regards,

koen=


