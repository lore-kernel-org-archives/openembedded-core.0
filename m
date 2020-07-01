Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.4784.1593630752194891157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 12:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@nio365.onmicrosoft.com header.s=selector2-nio365-onmicrosoft-com header.b=G5LkKziW;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=0451d8e630=alejandro.delcastillo@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 061J6BPe029634;
	Wed, 1 Jul 2020 14:12:26 -0500
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-00010702.pphosted.com with ESMTP id 31x3mue7bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2020 14:12:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYXQ2e8439zGn+Atw1ZakubAhyUMa12nbJVtVA8FrbT1Dwo9VvkF9TSAjob9rvUCDdtSHKUzTvmnPLaS3wuz2dhTVlPRR9stdSBFqZ9nwp1IzAM21N8GCj2AfQTipLvcynVsLbvZly3Tx906C/btUQ/RmF5BzUWAqGgp0GhNPMwOMkhBN2pQt0Fw6qksuQdMgCO1weLZdsiG9HR4SAKjLYzB1ac/b68rtVhGNg9w2Lr6gfgp62eLKnqLaqRv5YuKR5lXORi97xt0q4oLYw+pEzVfhfXp81Qw9E6u7pDebfW/kf0qst3XND15NTWmRuwGhBxQgw2+Hivg4Imt92Wn2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHjcs8Kam8brMQX9HjNLEqLlrtNKjGafralxnitxUXM=;
 b=Xnhzd8hhQKTuqNAOcbzKvXhbufpB0srwJNISPnpMHws++w1Fr1XWGmmNmjSWCRu+aOSrBbCN310snkHYlCkg55iH4oc4dPf+QwaLDUYauDxYD+hSm8eB8KwJ958bjRUaX8d1i9CONTk4yKux0nqPBADP3RVWcrJs+lrnAiTslg7HrrXNaAoVBQzjii3OWebMyRi7/a0TQKtjAGdi3CrDkJwteLNIyQVr2G3XGMhIpcUjHJgyiZWDhX/1ar2VjdOUuBTt6sK62UyhUtguyZRuYr+gdkKPYRVfSlUe/lsQMuPi8wHfbKMdR6W5suiDgWXkrXwn3izVeftUotqIdM/80Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHjcs8Kam8brMQX9HjNLEqLlrtNKjGafralxnitxUXM=;
 b=G5LkKziWL4RuX3cw4z+WCRj8RRs99zXE/SM81pdUflOY+5f8LX6nIx8Z+CvZqz8C590HRJctUJH0r0dQWKKtREMacrxk242CG3h6c60uRL8DI7pZfLFi5PmWEMNUxi8GccPXcIZYrU3RyK1FIdZtlK2tEg+SZmwDW3hoTtsGCxA=
Authentication-Results: ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=none action=none header.from=ni.com;
Received: from DM5PR04MB1069.namprd04.prod.outlook.com (2603:10b6:4:40::26) by
 DM6PR04MB7097.namprd04.prod.outlook.com (2603:10b6:5:242::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.23; Wed, 1 Jul 2020 19:12:25 +0000
Received: from DM5PR04MB1069.namprd04.prod.outlook.com
 ([fe80::d513:fb8b:cb1:953e]) by DM5PR04MB1069.namprd04.prod.outlook.com
 ([fe80::d513:fb8b:cb1:953e%3]) with mapi id 15.20.3131.028; Wed, 1 Jul 2020
 19:12:25 +0000
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>,
        Martin Jansa <martin.jansa@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
        OE-core <openembedded-core@lists.openembedded.org>,
        tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>,
        Alex Stewart <alex.stewart@ni.com>
References: <20200625101413.2783-1-fredrigu@axis.com>
 <CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
 <1593543683295.70380@axis.com> <20200630215424.u77jq5frrnpwztfc@jama>
 <1593555173884.3272@axis.com>
From: "Alejandro del Castillo" <alejandro.delcastillo@ni.com>
Message-ID: <62b5227c-5472-a8eb-bac5-8c597520acf3@ni.com>
Date: Wed, 1 Jul 2020 14:12:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <1593555173884.3272@axis.com>
X-ClientProxiedBy: SN2PR01CA0048.prod.exchangelabs.com (2603:10b6:800::16) To
 DM5PR04MB1069.namprd04.prod.outlook.com (2603:10b6:4:40::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2605:6000:101c:3b5:c255:6326:5d60:1a29] (2605:6000:101c:3b5:c255:6326:5d60:1a29) by SN2PR01CA0048.prod.exchangelabs.com (2603:10b6:800::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Wed, 1 Jul 2020 19:12:24 +0000
X-Originating-IP: [2605:6000:101c:3b5:c255:6326:5d60:1a29]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9b1cb34-5e7f-45ae-a160-08d81df2b050
X-MS-TrafficTypeDiagnostic: DM6PR04MB7097:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR04MB70972382E1DE7897D69EDE65866C0@DM6PR04MB7097.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	STF2+fC7tZqe4qE/jWDEAypebyzY/alLp0iMu2sijxiUOIhSQ6FUsiLkPDAyYAkxW7+eJuE2bxac0LF/8McP5ZAvqlP+3ePJWG7nSRiJCt24oZSrIXzHKHUggBzOTQUlGy4ol17ZB+C4H+hHAs0LxMDGgGD2YDY433wNMbDuppQjOW0MOr9wWQ4EGQozEJk3jGkXrT+kM6YGf0KsMFQL/MYN1KtUVd7DrFq5AGZXeDMeVLZwwMCvdqdNKsMiHLNq1a37IdSsDM3t+YIcemrHwo3up6ZUjB3mk/jm8qqAN1fIn73wpMr7hjXQTcbWDj/4nky6F24Alq/QG74DtZgKk0o8SmL4GXn3ELuYHh2CefgZFoYYP4jiwiA3b0qKFejTCfuSRe0BAYZtHN7vcU+XLCAx8zT4eWXYAgYOYGjYZ6GToOfcWyQsbPD9pK223U6nGASviiUq4dd9feCzw/cIow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR04MB1069.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(36756003)(186003)(66556008)(2906002)(66476007)(16526019)(8936002)(966005)(66946007)(478600001)(31686004)(4326008)(52116002)(31696002)(83380400001)(54906003)(8676002)(5660300002)(53546011)(2616005)(86362001)(6486002)(316002)(110136005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	Ye8nDATn0s9qg4ALs28kioeHEYRCoFGGQJokWEZGQh2ihwJR8Enycww/ZsQ28mEBnwe6jyvL4eRoYWMjKazyMI8sO79fOwDjwXK0YmOzxGx1gV9W5LGdCYBvbp3LVtABoT4hvtNhADiSEx4v919eZWhdzNf+qxTu+nYAi2gWQ/Q4ljmEBU8vJsVbyyauyGu/Uoa81N4QXx85zhahQKuYyjdcRsNdLL31oSTiYgnanibMoHipuw7Oy1SLWUHcQnFQ4OE77G+sjORrZieKQdRMwBEijqoFXy8VgmWWe/PLRaC17rQ6DjSM1Vf1BRIHcY+OSgQ7b0r2ha0TbizDRmlkNRYAiCovfQLdmC+a5YHQysdWLHkFAvKerOPk0l1+2X2KKfkwyUTizp8PQ3nChHtk0Skve1HtBNE3uCRE7zIwFlYMgzdlz/LDpx5q/pqfoT1oJtMvc6TMFsKHDnp0wcgEKu4L7h0x1CueIM7LDxLpEOUaT6IkjEGQfpZHabV+M97ycMjHw5lNZ1gKF8Yx7JOM0LZKNQ2nNQMMiyUkmXYav9IVQRbLDM6lAtAnQPc4t4Os
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b1cb34-5e7f-45ae-a160-08d81df2b050
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB1069.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 19:12:25.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oL4Y7N7RUO2Oms9neGZQonsaEYRLGnvanvqIyOG+MH+HIitG6mggGJ95QdqHZ05qJfxSJ1TgokUi9mPPOsn/vF6W5SWMj7suTEUcnQIYPbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7097
Subject: Re: [OE-core] Add package managers as a plugin
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-01_10:2020-07-01,2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 cotscore=-2147483648 phishscore=0
 impostorscore=0 clxscore=1011 bulkscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007010133
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

Hi all,

Catching up on the conversation...impressive results coming out of apk. 
Haven't used apk enough to have an educated opinion, but by quickly 
glancing at the code, I believe it uses an ad hoc solver, which might 
struggle with corner cases (same issues we had with opkg, before 
switching to libsolv). For building images without package managers, its 
likely that this isn't a serious concern.

Regarding opkg, I haven't focus on build time so I get the feeling there 
might be some low hanging fruit. I plan to spend some time investigating 
and will report back. The mechanism used by apk (1 read, 1 write) can be 
added to opkg too...in general the idea with opkg is that you set it up 
with the trade off that make sense for you. So I can envision having a 
config option that enables apk-like behavior.

Regardless, its exciting to see changes that expand the ecosystem!

Cheers,

Alejandro


On 6/30/20 5:12 PM, Fredrik Gustafsson wrote:
> Hi Martin, apk is quite different compared to other package managers.
> A traditional package manager download a package, saves it to a local
> cache, verifies it and then extract it. That's at least 3 reads and 2
> writes of the data. Apk does this on the fly, so 1 read and 1 write
> of the data. I believe that it's a so fundamental design choice that
> opkg would have it very hard to compete for speed. The speed
> advantage is even bigger when installing over network since the
> extraction and verification is done wile the network is waiting for
> data. That means that apk has usually installed the package when an
> ordinary package manager just has downloaded it and should start to
> verify and install it.
> 
> So there's no secret sauce or awesome optimizations, it's "just" an
> other architectural design.
> 
> With that said, there's still some low hanging fruit for apk, for
> example package generation (my patch is doing 2 reads and 2 writes of
> all data) and index generation (duplicate reads and one extraction
> too much) that could have significant speedup. But let's make it
> possible to use apk at all before starting to tune it.
> 
> More information: 
> https://urldefense.com/v3/__https://www.youtube.com/watch?v=sIG2P9k6EjA__;!!FbZ0ZwI3Qg!4qK6Dao4S2RQqjMvNiVBB04AmB8DTgW7Ccfr39CwxKWkSMA8DjszgWpvvj5RVMCfLL158w$
>
> 
> 
> BR Fredrik ________________________________________ From: Martin
> Jansa <martin.jansa@gmail.com> Sent: Tuesday, June 30, 2020 11:54 PM 
> To: Fredrik Gustafsson Cc: Ross Burton; OE-core;
> tools-cfpbuild-internal Subject: Re: [OE-core] Add package managers
> as a plugin
> 
> On Tue, Jun 30, 2020 at 07:01:23PM +0000, Fredrik Gustafsson wrote:
>> Hi Ross, those 5 seconds will increase to minutes for my use case
>> and we build a lot hence I hope this will save us a lot of computer
>> power and engineering time. For example I've sent numbers on
>> building a bigger image (core-image-sato-sdk-ptest) to Alex and
>> Alex: out.apk.1: 1:13.35 out.apk.2: 1:13.51 out.apk.3: 1:13.23 
>> out.apk.4: 1:14.07 out.apk.5: 1:13.00 out.deb.1: 3:49.37 out.deb.2:
>> 3:50.77 out.deb.3: 3:51.39 out.deb.4: 3:53.40 out.deb.5: 3:53.99 
>> out.ipk.1: 2:38.99 out.ipk.2: 2:39.07 out.ipk.3: 2:35.34 out.ipk.4:
>> 2:36.15 out.ipk.5: 2:34.55 out.rpm.1: 1:58.61 out.rpm.2: 1:59.42 
>> out.rpm.3: 1:59.70 out.rpm.4: 1:58.96 out.rpm.5: 1:58.11
>> 
>> Also consider that if we've a target without python with limited
>> space, rpm is out of the question. So the real comparison would be
>> between ipk and apk. Let's say we can save 80 seconds in each
>> build. Now multiply that with the number of builds, and we do a lot
>> (I guess we might approach 100 000 builds/week in the next year).
>> Then this will save 92.5 days build time each week.
> 
> This is impressive.
> 
> Have you tried to profile where opkg spends most of the time compared
> to apk? It would be nice to know if there is something fundamentally 
> different in how they handle packages or if apk is just better 
> optimized.
> 
> Now with opkg better maintained (thanks Alejandro!) there might be
> some relatively low hanging optimalizations which could be
> implemented there as well (for people who didn't implement the rest
> to switch to apk yet :)).
> 
> I know at LGE we have some patches (some related to performance as
> well) which unfortunately weren't ever upstreamed :/, some are at: 
> https://urldefense.com/v3/__https://github.com/webosose/meta-webosose/tree/master/meta-webos/recipes-devtools/opkg/opkg__;!!FbZ0ZwI3Qg!4qK6Dao4S2RQqjMvNiVBB04AmB8DTgW7Ccfr39CwxKWkSMA8DjszgWpvvj5RVMDh3PHxpA$
>
>  Cheers,
> 
> 
> 
> 

-- 
Cheers,

Alejandro
