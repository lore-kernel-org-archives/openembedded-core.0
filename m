Return-Path: <jrey@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC517F844
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 16:28:32 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xAKGDIIG087522 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:28:33 -0500
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2wd5gc949m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:28:33 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAKGE1O7090910
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:28:32 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
	[169.55.85.253])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2wd5gc9491-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 20 Nov 2019 11:28:32 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	xAKGGH30012845; Wed, 20 Nov 2019 16:28:36 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
	(b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma01wdc.us.ibm.com with ESMTP id 2wa8r6ebmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 20 Nov 2019 16:28:36 +0000
Received: from b03ledav004.gho.boulder.ibm.com
	(b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id xAKGSUTE61407562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 20 Nov 2019 16:28:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85F997805E;
	Wed, 20 Nov 2019 16:28:30 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B68378060;
	Wed, 20 Nov 2019 16:28:29 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.80.219.76])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Wed, 20 Nov 2019 16:28:29 +0000 (GMT)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
	<bb5c3045-8131-095a-f7bc-0ff91f36af5a@linux.ibm.com>
	<CANNYZj8LNhF26TLHuLMPh6K40dXe8V5pgEvv8N3MAEFVy+vveg@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <ff1f3800-1721-b181-73fd-65e96bd1b1f4@linux.ibm.com>
Date: Wed, 20 Nov 2019 10:28:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8LNhF26TLHuLMPh6K40dXe8V5pgEvv8N3MAEFVy+vveg@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-20_04:2019-11-20,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	phishscore=0
	priorityscore=1501 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0
	lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0
	mlxlogscore=999
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1910280000 definitions=main-1911200142
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to add build date?
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
X-List-Received-Date: Wed, 20 Nov 2019 16:28:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 11/17/19 3:19 PM, Alexander Kanavin wrote:
> I'd write the date into the file at image creation, via 
> ROOTFS_POSTPROCESS_COMMAND.
>
> Having it in a recipe means that you either force the recipe to not be 
> a part of sstate cache, always rebuilding it and its dependencies (bad 
> idea), or accept that the date comes from a previously built cache 
> object, which means it will mismatch the actual image creation date.

Got it, thanks. I was unaware of ROOTFS_POSTPROCESS_COMMAND.


>
> A bit of context would help: why would you want that info in 
> os-release? Who would use that information and how?

I don't fully understand the use case for adding a build date to the image.  I don't have a use for it, but this question keeps coming up in the OpenBMC community, so I want to address it.  I am imagining a naive continuous delivery process where the build date is used as a substitute for a software version.  That is easier than keeping track of software versions, but (as I mentioned before) does not meet my needs.

I've re-asked the question to the original poster in the OpenBMC email list:
https://lists.ozlabs.org/pipermail/openbmc/2019-November/019493.html

The response so far is: I just want to show the compile time of firmware to the user. If  only show the version, it can't correspond to the time. When both are displayed at the same time, the information will be clearer.

I'll continue the conversation in that email thread.  Thanks for your help!

  - Joseph


>
> Alex
>
> On Sat, 16 Nov 2019 at 23:14, Joseph Reynolds <jrey@linux.ibm.com 
> <mailto:jrey@linux.ibm.com>> wrote:
>
>
>     Is there a best practice for folks who want to put the build date
>     into
>     their generated os-release file?  I've seen this question come up at
>     least 3 times in my brief involvement with OE.  I could perhaps add
>     comment to the OpenBMC os-release.bbappend file to provide the proper
>     guidance.  I would like to hear your ideas.
>
>     - Joseph
>
>
>     -------- Forwarded Message --------
>     Subject:        Re: how to solve the error that basehash value
>     changed from
>     'xxx' to 'aaaa' ?
>     Date:   Sat, 16 Nov 2019 15:50:38 -0600
>     From:   Joseph Reynolds <jrey@linux.ibm.com
>     <mailto:jrey@linux.ibm.com>>
>     To:     www <ouyangxuan10@163.com <mailto:ouyangxuan10@163.com>>,
>     openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>     <openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>>
>
>
>
>     Byron,
>
>     What modification did you put into the os-release recipe?  It
>     would help
>     us help you if you put that in your email.
>
>
>     Are you adding the build date to the generated os-release file? If
>     so,
>     be aware that might cause the issues with the shared state cache
>     you are
>     experiencing.  Also be aware this practice wrecks reproducible builds.
>
>     A better way to get the same effect might be to create a git tag with
>     the information you want to appear in the generated os-release file.
>     When you buld with this tag is then picked up by the OpenBMC
>     meta-phosphor os-release.bbappend (via `git describe`) and
>     included in
>     the genersted os-release file as the BUILD_ID. See:
>     https://github.com/ibm-openbmc/openbmc/blob/d1c59b7a36c10c18838c07af10b18080174cd61d/meta-phosphor/recipes-core/os-release/os-release.bbappend
>     (But I have not tried that.)
>
>     A way to work around the hash change is to add a line to your recipe
>     like: PR[vardepsxeclude]="DATETIME"
>     As suggested by:
>     https://forums.openpli.org/topic/41447-how-to-get-rid-of-taskhash-mismatch/
>
>
>     My apologies for top posting -- my email reader was not quoting the
>     message properly, so I cut/pasted it below.
>
>     - Joseph
>
>
>     On 11/13/19 1:38 AM, www wrote:
>
>     When I modify the os-release file in my yocto project, it appear some
>     error, and how can I solve it ? Who can give me some help or advice?
>     Thank you！
>     I execute the recommended command on the console and it didn't work.
>
>     ERROR: os-release-1.0-r0 do_compile: Taskhash mismatch
>     ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201
>     versus
>     7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f
>     for  /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile
>     ERROR: Taskhash mismatch
>     ce133f0458608e03aa55224df28156e523e54903115efbbcd62946f84a867201
>     versus
>     7269881f0eb1759ed420a2db4c04fb477cd8c1288bc5f82df5c8161bb926ea1f
>     for /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile
>     ERROR: When reparsing
>     /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile, the
>
>     basehash value changed from
>     99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to
>     4f3288a8763e2e1af78e4b3cdd9c0c0ccb3b0d5c78a3073c188b22200df2a9b0. The
>     metadata is not deterministic and this needs to be fixed.
>     ERROR: The following commands may help:
>     ERROR: $ bitbake os-release -cdo_compile -Snone
>     ERROR: Then:
>     ERROR: $ bitbake os-release -cdo_compile -Sprintdiff
>
>     ERROR: When
>     reparsing /home/temp/xxx/wsp/obmc-source/entity_xxx/meta/recipes-core/os-release/os-release.bb.do_compile, the
>
>     basehash value changed from
>     99a42a1a3b1a151de604267b159558ecaf1031a3bec8917df132c81302e729a5 to
>     47c30012daa6aa77be09a93fe21e66995361ef26b4487111005617db8cb4de59. The
>     metadata is not deterministic and this needs to be fixed.
>     ERROR: The following commands may help:
>     ERROR: $ bitbake os-release -cdo_compile -Snone
>     ERROR: Then:
>     ERROR: $ bitbake os-release -cdo_compile -Sprintdiff
>
>     thanks,
>     Byron
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


