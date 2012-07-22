Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1SsvAL-000133-ON
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 14:21:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6MCAFXj008910
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 05:10:15 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.236]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.01.0255.000;
	Sun, 22 Jul 2012 05:10:15 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] useradd.bbclass: use locking of bb.utils
	to avoid lock race issue of useradd/groupadd
Thread-Index: AQHNZ9asg7sAMWIwoECJxat90ybqYpc1b/eA///FA14=
Date: Sun, 22 Jul 2012 12:10:14 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA575F4CD3@ALA-MBA.corp.ad.wrs.com>
References: <cover.1342939738.git.jackie.huang@windriver.com>
	<9c2d0c1746a945290b6c64551fc6ca2e5e043028.1342939738.git.jackie.huang@windriver.com>,
	<1342946215.21788.53.camel@ted>
In-Reply-To: <1342946215.21788.53.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.16.96]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] useradd.bbclass: use locking of bb.utils to avoid lock race issue of useradd/groupadd
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
X-List-Received-Date: Sun, 22 Jul 2012 12:21:42 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
=0A=
>On Sun, 2012-07-22 at 14:53 +0800, jackie.huang@windriver.com wrote:=0A=
>> From: Jackie Huang <jackie.huang@windriver.com>=0A=
>>=0A=
>> A race condition can occur when adding users and groups to the=0A=
>>passwd and group files, in [YOCTO #1794], 10 times retry added=0A=
>> but it is not fixed completely.=0A=
>>=0A=
>> This fix re-writes the useradd_preinst and useradd_sysroot with=0A=
>> python and use locking of bb.utils to lock the passwd and group=0A=
>> files before executing useradd/groupadd commands to avoid the=0A=
>> lock race themselves.=0A=
>>=0A=
>> [YOCTO #2779]=0A=
>>=0A=
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>=0A=
>> ---=0A=
>>  meta/classes/useradd.bbclass |  284 ++++++++++++++++++-----------------=
-------=0A=
>>  1 files changed, 124 insertions(+), 160 deletions(-)=0A=
>=0A=
>Please resend this with the whitespace issues resolved. Its near=0A=
>impossible to review as it stands :(=0A=
=0A=
Re-sent, sorry about that.=0A=
=0A=
Thanks,=0A=
Jackie=0A=
=0A=
>=0A=
>Cheers,=0A=
>=0A=
>Richard=0A=
=0A=
=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=0A=


