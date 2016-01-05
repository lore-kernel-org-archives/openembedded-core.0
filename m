Return-Path: <ian.ray@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7D0731D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 14:04:18 +0000 (UTC)
Received: from pps.filterd (m0047961.ppops.net [127.0.0.1])
	by m0047961.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	u05DwTIe047805 for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jan 2016 09:04:19 -0500
Received: from alpmlip13.e2k.ad.ge.com (n165-156-000-000.static.ge.com
	[165.156.5.1] (may be forged))
	by m0047961.ppops.net-00176a03. with ESMTP id 208e48r1x9-1
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 09:04:19 -0500
Received: from unknown (HELO ALPMBHT03.e2k.ad.ge.com) ([3.159.19.196])
	by alpmlip13.e2k.ad.ge.com with ESMTP/TLS/AES128-SHA;
	05 Jan 2016 09:04:15 -0500
Received: from BUDURBPA12.e2k.ad.ge.com (3.159.54.54) by
	ALPMBHT03.e2k.ad.ge.com (3.159.19.196) with Microsoft SMTP Server (TLS)
	id 14.3.266.1; Tue, 5 Jan 2016 09:04:14 -0500
Received: from BUDURBPA09.e2k.ad.ge.com ([169.254.3.15]) by
	BUDURBPA12.e2k.ad.ge.com ([169.254.6.14]) with mapi id 14.03.0266.001;
	Tue, 5 Jan 2016 15:04:12 +0100
From: "Ray, Ian (GE Healthcare)" <ian.ray@ge.com>
To: Matthias Schiffer <mschiffer@universe-factory.net>, Mark Hatle
	<mark.hatle@windriver.com>
Thread-Topic: [OE-core] [PATCH 1/1] linux-firmware: remove hard-coded paths
Thread-Index: AQHRRwqpojAWm2uRoE6spmZIIJY9MZ7rfCGAgABi4YCAAAhlAIAAEPyAgAAIpICAABBBgIAAt8pQ
Date: Tue, 5 Jan 2016 14:04:11 +0000
Message-ID: <30E719D66AEA914CBB7DAB303B1C722DB4A8F9@BUDURBPA09.e2k.ad.ge.com>
References: <cover.1451912446.git.ian.ray@ge.com>
	<4e736dcbaf5c32f9d7728990ad4ac0ca975dfd6d.1451912446.git.ian.ray@ge.com>
	<568A99CD.9000800@universe-factory.net>	<568A9E97.2050909@windriver.com>
	<568AF189.5010801@universe-factory.net>	<568AF894.1010405@windriver.com>
	<568B06D3.7030205@universe-factory.net>	<568B0E13.6090108@windriver.com>
	<568B1BB5.7060303@universe-factory.net>
In-Reply-To: <568B1BB5.7060303@universe-factory.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [3.159.17.85]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-05_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1507310008
	definitions=main-1601050233
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-firmware: remove hard-coded paths
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
X-List-Received-Date: Tue, 05 Jan 2016 14:04:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 01/05/2016 03:26 AM, Matthias Schiffer wrote:=0A=
> On 01/05/2016 01:28 AM, Mark Hatle wrote:=0A=
>> On 1/4/16 5:57 PM, Matthias Schiffer wrote:=0A=
>>> On 01/04/2016 11:56 PM, Mark Hatle wrote:=0A=
>>>> On 1/4/16 4:26 PM, Matthias Schiffer wrote:=0A=
>>>>> On 01/04/2016 05:32 PM, Mark Hatle wrote:=0A=
>>>>>> On 1/4/16 10:11 AM, Matthias Schiffer wrote:=0A=
>>>>>>> On 01/04/2016 02:14 PM, Ian Ray wrote:=0A=
>>>>>>>> The recipe uses hard-coded paths (specifically /lib) in do_install=
=0A=
>>>>>>>> and in FILES, however on a merged /usr system this directory might=
=0A=
>>>>>>>> not exist. Prefer base_libdir.=0A=
>>>>>>>>=0A=
>>>>>>>> Signed-off-by: Ian Ray <ian.ray@ge.com>=0A=
>>>>>>>> ---=0A=
>>>>>>>=0A=
>>>>>>> This should use nonarch_base_libdir, base_libdir defaults to /lib64=
 on=0A=
>>>>>>> ppc64, which is not where the firmware is expected.=0A=
>>>>>>>=0A=
>>>>>>=0A=
>>>>>> At a minimum, I would agree nonarch_base_libdir, however..=0A=
>>>>>>=0A=
>>>>>> I believe that the kernel loader/modules/tools themselves actually h=
ave '/lib'=0A=
>>>>>> hard coded into them.  This is the reason why /lib/firmware was used=
 and not one=0A=
>>>>>> of the variables.=0A=
>>>>>>=0A=
>>>>>> This is one of the cases were /lib is actually correct, since that i=
s what the=0A=
>>>>>> system is expecting.  We can make some kind of accommodation for sys=
tems where=0A=
>>>>>> /lib -> /usr/lib... but that should be done inside of the filesystem=
 setup=0A=
>>>>>> processing and not the package itself.  (I'm referring to the=0A=
>>>>>> 'meta/files/fs-perms.txt' file.=0A=
>>>>>>=0A=
>>>>>> --Mark=0A=
=0A=
Ah, that makes sense.=0A=
=0A=
<snip>=0A=
=0A=
>> You conditionalize it by providing different default fs-perms files -- O=
R since=0A=
>> more then one file can be loaded -- additional fs-perms with the permuta=
tions=0A=
>> you desire.=0A=
>>=0A=
>> I could easily see having an files/fs-perms-usr-only.txt and an=0A=
>> files/fs-perms-no-usr.txt=0A=
>>=0A=
>> Where the first would be something like:=0A=
>>=0A=
>> # Define symlinks from base directories to their prefix versions=0A=
>> /bin	link ${bindir}=0A=
>> /sbin	link ${sbindir}=0A=
>> ...=0A=
=0A=
This is very interesting -- thank you.=0A=
=0A=
I tried patching our additional fs-perms file as Mark suggested. This resul=
ted in=0A=
a build failure during packaging of a recipe. The package directory looks o=
dd:=0A=
=0A=
ls -l /home/ian/myproduct/build/tmp/work/myproduct-linux-gnueabi/=0A=
myrecipe/4.3-r0/package=0A=
total 4=0A=
drwxr-xr-x. 2 ian ian 4096 Jan  5 11:30 boot=0A=
drwxr-xr-x. 4 ian ian   56 Jan  5 11:30 etc=0A=
lrwxrwxrwx. 1 ian ian    8 Jan  5 11:33 lib -> /usr/lib=0A=
drwxr-xr-x. 3 ian ian   16 Jan  5 11:33 usr=0A=
=0A=
This can be fixed by teaching classes/package.bbclass to _not_ use the lead=
ing=0A=
slash when making the link. Not sure if that is unacceptably hacky? But it =
must=0A=
be better than leaking to host filesystem.=0A=
=0A=
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass=0A=
index a86b680..59ef447 100644=0A=
--- a/meta/classes/package.bbclass=0A=
+++ b/meta/classes/package.bbclass=0A=
@@ -774,6 +774,7 @@ python fixup_perms () {=0A=
         link =3D fs_perms_table[dir].link=0A=
         if link[0] =3D=3D "/":=0A=
             target =3D dvar + link=0A=
+            link =3D link[1:]=0A=
             ptarget =3D link=0A=
         else:=0A=
             target =3D os.path.join(os.path.dirname(origin), link)=0A=
=0A=
Once past that problem there is a QA problem since do_package now installs=
=0A=
to /usr/lib (because of fs-perms) instead of /lib which is mentioned in FIL=
ES.=0A=
=0A=
Joshua's patches for merged /usr touched FILES in _some_ cases (for example=
=0A=
73a6fe958f47642d18ba0098cfd45c3520d53560) but linux-firmware would require=
=0A=
considerably more effort. Is that an argument in favour of nonarch_base_lib=
dir=0A=
instead of literal "/lib" or is there some other technique to address this?=
=0A=
=0A=
Ian=0A=

