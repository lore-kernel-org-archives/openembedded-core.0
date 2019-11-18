Return-Path: <jrey@linux.ibm.com>
X-Greylist: delayed 3545 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Nov 2019 17:14:26 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3697E7F8B9;
	Mon, 18 Nov 2019 17:14:26 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xAIGD981037864; Mon, 18 Nov 2019 11:15:22 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
	[169.55.85.253])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2way69xavb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 18 Nov 2019 11:15:18 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	xAIGCfUF027486; Mon, 18 Nov 2019 16:14:08 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
	[9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 2wa8r5urye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 18 Nov 2019 16:14:08 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
	[9.57.199.111])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	xAIGE4n451380554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 18 Nov 2019 16:14:04 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C8CEAC05F;
	Mon, 18 Nov 2019 16:14:04 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB5C4AC05B;
	Mon, 18 Nov 2019 16:14:03 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Mon, 18 Nov 2019 16:14:03 +0000 (GMT)
To: openembedded-core@lists.openembedded.org,
	openembedded-core-request@lists.openembedded.org
References: <mailman.25796.1574025583.1670.openembedded-core@lists.openembedded.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <7453df6e-d3bc-9b1c-97c2-92885a533fde@linux.ibm.com>
Date: Mon, 18 Nov 2019 10:14:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <mailman.25796.1574025583.1670.openembedded-core@lists.openembedded.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-18_04:2019-11-15,2019-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0 phishscore=0
	impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
	adultscore=0
	lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
	bulkscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1910280000 definitions=main-1911180147
Subject: Re: Openembedded-core Digest, Vol 106, Issue 126
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
X-List-Received-Date: Mon, 18 Nov 2019 17:14:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/17/19 3:19 PM, openembedded-core-request@lists.openembedded.org wrote:

 >Message: 4 >Date: Sun, 17 Nov 2019 22:19:32 +0100 >From: Alexander 
Kanavin <alex.kanavin@gmail.com> >To: Joseph Reynolds 
<jrey@linux.ibm.com> >Cc: OE-core 
<openembedded-core@lists.openembedded.org> >Subject: Re: [OE-core] How 
to add build date? (was: ... basehash value > changed...) >Message-ID: > 
<CANNYZj8LNhF26TLHuLMPh6K40dXe8V5pgEvv8N3MAEFVy+vveg@mail.gmail.com> 
 >Content-Type: text/plain; charset="utf-8" > >I'd write the date into 
the file at image creation, via >ROOTFS_POSTPROCESS_COMMAND. Got it, 
thanks. I was unaware of ROOTFS_POSTPROCESS_COMMAND. >Having it in a 
recipe means that you either force the recipe to not be a >part of 
sstate cache, always rebuilding it and its dependencies (bad idea), >or 
accept that the date comes from a previously built cache object, which 
 >means it will mismatch the actual image creation date. > >A bit of 
context would help: why would you want that info in os-release? >Who 
would use that information and how? I don't fully understand the use 
case. I think the build date is being used as a substitute for a 
software version. I've re-asked the question to the original poster in 
the OpenBMC email list: 
https://lists.ozlabs.org/pipermail/openbmc/2019-November/019493.html - 
Joseph >Alex >On Sat, 16 Nov 2019 at 23:14, Joseph Reynolds 
<jrey@linux.ibm.com> wrote:

> Is there a best practice for folks who want to put the build date into
> their generated os-release file?  I've seen this question come up at
> least 3 times in my brief involvement with OE.  I could perhaps add
> comment to the OpenBMC os-release.bbappend file to provide the proper
> guidance.  I would like to hear your ideas.
>
> - Joseph
>
>
> -------- Forwarded Message --------
> Subject:        Re: how to solve the error that basehash value changed
> from
> 'xxx' to 'aaaa' ?
> Date:   Sat, 16 Nov 2019 15:50:38 -0600
> From:   Joseph Reynolds<jrey@linux.ibm.com>
> To:     www<ouyangxuan10@163.com>,openbmc@lists.ozlabs.org
> <openbmc@lists.ozlabs.org>
>
>
>
> Byron,
>
> What modification did you put into the os-release recipe?  It would help
> us help you if you put that in your email.
>
>
> Are you adding the build date to the generated os-release file? If so,
> be aware that might cause the issues with the shared state cache you are
> experiencing.  Also be aware this practice wrecks reproducible builds.
>
> A better way to get the same effect might be to create a git tag with
> the information you want to appear in the generated os-release file.
> When you buld with this tag is then picked up by the OpenBMC
> meta-phosphor os-release.bbappend (via `git describe`) and included in
> the genersted os-release file as the BUILD_ID. See:
>
> https://github.com/ibm-openbmc/openbmc/blob/d1c59b7a36c10c18838c07af10b18080174cd61d/meta-phosphor/recipes-core/os-release/os-release.bbappend
> (But I have not tried that.)
>
> A way to work around the hash change is to add a line to your recipe
> like: PR[vardepsxeclude]="DATETIME"
> As suggested by:
> https://forums.openpli.org/topic/41447-how-to-get-rid-of-taskhash-mismatch/
>
>
> My apologies for top posting -- my email reader was not quoting the
> message properly, so I cut/pasted it below.
>
> - Joseph
>
>
> On 11/13/19 1:38 AM, www wrote:
>
> When I modify the os-release file in my yocto project, it appear some
> error, and how can I solve it ? Who can give me some help or advice?
> Thank you?
> I execute the recommended command on the console and it didn't work.

