Return-Path: <jrey@linux.ibm.com>
X-Greylist: delayed 1060 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 16 Nov 2019 22:14:20 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7477D270
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 22:14:20 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xAGLsE3S085164; Sat, 16 Nov 2019 16:56:40 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
	[169.47.144.27])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2waeg9f04v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 16 Nov 2019 16:56:40 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	xAGLpleo007446; Sat, 16 Nov 2019 21:56:39 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
	(b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma05wdc.us.ibm.com with ESMTP id 2wa8r5nu48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 16 Nov 2019 21:56:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com
	(b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id xAGLucNW30015928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sat, 16 Nov 2019 21:56:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A0D77805E;
	Sat, 16 Nov 2019 21:56:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0EBB7805C;
	Sat, 16 Nov 2019 21:56:37 +0000 (GMT)
Received: from demeter.local (unknown [9.80.205.29])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Sat, 16 Nov 2019 21:56:37 +0000 (GMT)
References: <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
To: openembedded-core@lists.openembedded.org
From: Joseph Reynolds <jrey@linux.ibm.com>
X-Forwarded-Message-Id: <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
Message-ID: <bb5c3045-8131-095a-f7bc-0ff91f36af5a@linux.ibm.com>
Date: Sat, 16 Nov 2019 15:56:36 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-16_08:2019-11-15,2019-11-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0 mlxscore=0
	spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
	suspectscore=0
	phishscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1910280000 definitions=main-1911160204
Subject: How to add build date? (was: ... basehash value changed...)
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
X-List-Received-Date: Sat, 16 Nov 2019 22:14:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Is there a best practice for folks who want to put the build date into 
their generated os-release file?  I've seen this question come up at 
least 3 times in my brief involvement with OE.  I could perhaps add 
comment to the OpenBMC os-release.bbappend file to provide the proper 
guidance.  I would like to hear your ideas.

- Joseph


-------- Forwarded Message --------
Subject: 	Re: how to solve the error that basehash value changed from 
'xxx' to 'aaaa' ?
Date: 	Sat, 16 Nov 2019 15:50:38 -0600
From: 	Joseph Reynolds <jrey@linux.ibm.com>
To: 	www <ouyangxuan10@163.com>, openbmc@lists.ozlabs.org 
<openbmc@lists.ozlabs.org>



Byron,

What modification did you put into the os-release recipe?  It would help 
us help you if you put that in your email.


Are you adding the build date to the generated os-release file? If so, 
be aware that might cause the issues with the shared state cache you are 
experiencing.  Also be aware this practice wrecks reproducible builds.

A better way to get the same effect might be to create a git tag with 
the information you want to appear in the generated os-release file.  
When you buld with this tag is then picked up by the OpenBMC 
meta-phosphor os-release.bbappend (via `git describe`) and included in 
the genersted os-release file as the BUILD_ID. See:
https://github.com/ibm-openbmc/openbmc/blob/d1c59b7a36c10c18838c07af10b18080174cd61d/meta-phosphor/recipes-core/os-release/os-release.bbappend
(But I have not tried that.)

A way to work around the hash change is to add a line to your recipe 
like: PR[vardepsxeclude]="DATETIME"
As suggested by: 
https://forums.openpli.org/topic/41447-how-to-get-rid-of-taskhash-mismatch/


My apologies for top posting -- my email reader was not quoting the 
message properly, so I cut/pasted it below.

- Joseph


On 11/13/19 1:38 AM, www wrote:

When I modify the os-release file in my yocto project, it appear some 
error, and how can I solve it ? Who can give me some help or advice? 
Thank you！
I execute the recommended command on the console and it didn't work.

ERROR: os-release-1.0-r0 do_compile: Taskhash mismatch 
ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201 versus 
7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f 
for  /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile
ERROR: Taskhash mismatch 
ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201 versus 
7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f 
for /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile
ERROR: When reparsing 
/home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile, the 
basehash value changed from 
99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to 
4f3288a8763e2e1af78e4b3cdd9c0c0ccb3b0d5c78a3073c188b22200df2a9b0. The 
metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake os-release -cdo_compile -Snone
ERROR: Then:
ERROR: $ bitbake os-release -cdo_compile -Sprintdiff

ERROR: When 
reparsing /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile, the 
basehash value changed from 
99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to 
47c30012daa6aa77be09a93fe21e66995361ef26b4487111005617db8cb4de59. The 
metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake os-release -cdo_compile -Snone
ERROR: Then:
ERROR: $ bitbake os-release -cdo_compile -Sprintdiff

thanks,
Byron


