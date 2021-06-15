Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.902.1623790787065379689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 13:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nviLsTZm;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1800a28d07=tony.tascioglu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15FKsFfG018261
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 13:59:45 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
	by mx0a-0064b401.pphosted.com with ESMTP id 39728b01w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 13:59:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2gIbwwP8MPyOSX0IrSkq3JXB7dOGUWUmlsFaXfEkKN8NdnRi3YxUs5rc6NlE0ZyUA8NWWWl6TfN96/nuV1b7hlEj+u+D6nUk3m2/Nrb1LXl/bWqlcjDAHCCdty4ABGzgAZunJKWOGghoDeLYujNyCrfHtMyJKWagDr84AH+MpQQwxn4B0ekuq84xAHS0oCmRtjXzNKAmJkSQDECBCszFL+Pa/LaYDF/VwTQ4SkWXZ65nWaA29F0e9GflJ0O7bu/ExQ2UuNB6+VzIznOADj0dLvWPmPBJZWq5pljboPUlRqZNwrN0lcM0lzp8aTtPv8LvutstCzeW529UMn5BxKTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgdmgFuPjTEY4/2x391YhSnuw8HN11+qEn6RaLhfEQs=;
 b=kwR3nTg2QbvNTj+Os11o1KPgvFfHzK7sa1Vi03m6mxUwX7F95wcPQDVdMOEWWEPCiZGLjpBcTQFO5TnnUSB7Jv36Y67rwrxBNClJhm5neWiBYPKmzKxc59ZFfK9oIz9YoQ83h3lFowq388ZtR5ZTyHQ/HE/o5EUfdhfHG27E4EXtp8uXIWRACo52TBgIxIWFweRlMZE88bFqt0YAAt/be8KS90Ur+Jmndbt2tnPfbedw3WGj+4eUzzPBm++3hGcJ79kkE66Zx9TKz7Ume1y605NIhdbfKCTDX3pkJhDazYwDfMokOTX2JTcII/yHyn0m2k1f6p9Z4Xe6EZPufO7XeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgdmgFuPjTEY4/2x391YhSnuw8HN11+qEn6RaLhfEQs=;
 b=nviLsTZmeQVkyK+NO+gA3aMH+uglCpvP9pqzhO3dHJ6cPL8Lx/+gQq2ISJJVabJWNi3TftpWNMSKVoIuciVOyu7dtoLBmFb1WPVU1FAYtWzJMEH/O7O/bZmZrNiDR4qtq5aWcuqm7X9RuYJSWY0KKDf8RZtvXZMYKi2+lb+jd9g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1272.namprd11.prod.outlook.com (2603:10b6:903:29::9)
 by CY4PR1101MB2311.namprd11.prod.outlook.com (2603:10b6:910:23::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 20:59:41 +0000
Received: from CY4PR11MB1272.namprd11.prod.outlook.com
 ([fe80::de0:c938:1273:7eea]) by CY4PR11MB1272.namprd11.prod.outlook.com
 ([fe80::de0:c938:1273:7eea%4]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 20:59:41 +0000
To: openembedded-core@lists.openembedded.org
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
Subject: FFmpeg CVE's to be patched
Message-ID: <768395cc-9b66-d390-aeee-9cb9c27acad1@windriver.com>
Date: Tue, 15 Jun 2021 16:59:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-Originating-IP: [5.25.141.178]
X-ClientProxiedBy: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To CY4PR11MB1272.namprd11.prod.outlook.com (2603:10b6:903:29::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.111] (5.25.141.178) by YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend Transport; Tue, 15 Jun 2021 20:59:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4301e6b-98c1-45f9-86bd-08d930407ea5
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2311:
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB231149A4CDE3246B766A1ADD84309@CY4PR1101MB2311.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8pG0wOenWwRDL/8KMWL0yhroRZAq+VWvz/8YM79XwHOHI/ewX09b5+myeJQg8ftsFgDs9AQ6Fvxm45Bvo4HUs2BVaoRhr1XHxTJdCanVGjGdBdnNqWaoOZ3DGhg5J+vyxMvTL3iZSv3+IuXfJh4mtDXVD8Ond6ctnqUrdCvzoqkjDHm/VuzglanhCZIVApIqlhaajsAUjPluZWmjkWgXOodYGzUf7y7Bc3L8pwM3Jf2Tm0T+ctSHOtPCHYZ7Zq66scBGEZb0c2RdXJrfuuCFXPAuk559QYXMk8vXwW1qO/NlEfhTsDMjML9s/6hJMa6EZ+0XddCQZxD/WhjPCaM4PTpMXzLTNDa0G3igZ7B+W3t1j3YzdW9qA+Y6zxVZlj3vNRimZ5jxVFqn2KlpjQdWbEU40jLixGQTUBVz3uyt8Ui/oPqHAp8V8IGqj9wFJ2lNB+YfYPmVPd+OfaiIMLY2quvVmkuxp62ZrDESys93sunA3WUr3mFpDWtApvrbiAgw6VVBm5p7XiXEv0za2xvCLLMQOIiAWTTsc/Jx+QzqClV2ISm/2ir4KEXrfpm03eH4MHsu8B7RjxgrUzZ1oJSzvhv5pk4yfQC8071zWL28l41hHiQ/0WakY1tG4dIIvTZJm0INBFSHwMsUwRUtbhHRLms7jpj0FvpPMg75Y7IPlorx/G2Rp1AGcHzsE8nY74++xuP4ttGuiiwBTjkQScLlFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1272.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(396003)(366004)(376002)(38100700002)(38350700002)(235185007)(16576012)(31696002)(33964004)(26005)(86362001)(316002)(5660300002)(52116002)(6916009)(36756003)(2616005)(66616009)(956004)(66946007)(66476007)(8676002)(21480400003)(2906002)(66556008)(44832011)(186003)(31686004)(478600001)(16526019)(6486002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUtZMnNIa1U2dUF6RzNpTWJzdzNZNGFJM0xtNUMyTGVXZnlFQ1UzdEZSKzJ4?=
 =?utf-8?B?eElGeHBBRTZiQjZEbENNY3hZaElzYVNJOFJWU0lBTEdJZStaM0Y0TTg0Q1M0?=
 =?utf-8?B?STQ0SnBJaXhPbFYrMW5PVEg0ZFdpUGdYc0hDYnJ6UHVlTk9rVk5vYjJXQVhQ?=
 =?utf-8?B?RU1tT0IyMG82L1ZqZHBIV0pPVmMxaDFtSWhTMVRWL1d4T3gzei9CMjIzRUc4?=
 =?utf-8?B?dnNoSkZhUDZ5a3RZNzdYOW5DSHY4dkZHZEsxSXoxWVl1WXpsa2Q1alVQOVJt?=
 =?utf-8?B?Z1VtcUpxL2Nia0NMSEFZbjZJVS94SGxySUJDcG1pWEVMcWpJSldMbkFNcE5L?=
 =?utf-8?B?K3ZRaG1mbzY5L3dhcGpzQlpHOU84empCSkRGcHY3SHkySDdKcjdvUHBzUkpS?=
 =?utf-8?B?My9ZM1k1WFRWc3Z5T0Q3MlZLWU9JSVNvcWxSVjV3bW1wUVRDaFFTc2FGL0lD?=
 =?utf-8?B?ei84cENqVXRVTzFJWW5mWndRZjcwNjA5TjNrMG1Yelk4RnV6WW1ZZXhEeWdw?=
 =?utf-8?B?QjZ4VkJrR2R6WmpSVnBLRmtEdWtIRzh3aC9JK3lEem1VMnJkVEE2OGRYdXdE?=
 =?utf-8?B?ckJ1NHhsTjliQnN0QVdQZnVzdnRXUjlicmV3N3QvY3pkek5iL3RGTGJsYi9m?=
 =?utf-8?B?QVdiNkM0eGhqWTI3Rmh0dU1VQ1BqSXhvMzV0OEMyV1RhaStDcytvZWJ2eVla?=
 =?utf-8?B?YUwwMjlPVHI2dzdDRnNVazFxai9qLzZ6WUUxams0K3NsWjBXL016S2huVm01?=
 =?utf-8?B?UVllajJ4bFdNOU5xckRQaDk5aTUyVER0L1FqTlZRbE5Qb1JMUGJJNzZBdFhj?=
 =?utf-8?B?S1V3TjVtODBzT2xkcHlmMFcrSExySE41dkdYNFYyeFBoTWxtcitjQVpPR0Ur?=
 =?utf-8?B?eGV4TUprRzNleStUUHB4amZjY20zZFhvVlJ3dDMzc28zR2dZcTRjNnFjNThl?=
 =?utf-8?B?VmpTQ2lUb0Q1YnlXdDZSWmYxd2lrMmRNUW90RFJEdWRELytJV21aZUVMMnNz?=
 =?utf-8?B?Z052RllaZXV2WFdiNXY4NE5XdDQ5OE1IZEJQR2hzck9YcS8yVUw5VzJJd0pQ?=
 =?utf-8?B?RmV0eTdwRzRrVWsxcnZrN3hUdDgyMG40Ui9DQkFjY3NVMXZoS3l0YlU4S1BC?=
 =?utf-8?B?UzJjUjZuUUp3Y0J3eU5XOVhlbVA4TnRETlhXaWZaMnFqUDFGdGdwa2FrQlJ6?=
 =?utf-8?B?cnBLOE9NVElIRzhKSUFqeWVPUFB0RkNXdnpZZW5HZHU3NDFqSGRKb2dqYU1a?=
 =?utf-8?B?Zk8wczZCam5IRWxCYSs1YTY0TnRQSjFoMXR0UCtGMTBsWFNQc1lSWG5GcW80?=
 =?utf-8?B?MzdwaEQyTng5R2dtZE9pbkQ5NzF5M3U5YXFnQVExS211YnVnK0NSeEU0TDNq?=
 =?utf-8?B?anM0Z1VUdlI4RW1OT0ZIQTg2clRJdmdsRHdLY2FZcGlLdmJSNkorYk44TGxa?=
 =?utf-8?B?NHFXWW0yL3VFb3lpVkxPU3E1UURvR0w3WVgxcXg4UVhnNDl6Q0llVkpMb3Ni?=
 =?utf-8?B?L1BKUldyYUI0cW5yZXJKZVkrRlZRS2cxTnhzam80TG9Fd092M0lXUlRQOG1s?=
 =?utf-8?B?Y0g1NlR2ZktmZE9udE1acUV3VTNqYzQvb1J6NjB4Skp3ZEtzT0oxeVQzVmg3?=
 =?utf-8?B?QW1TbGFwamMvQmtkNVovQ21KRWFzUElmZUJVWWZZeUlYRDNoRnNQY0xZMUNh?=
 =?utf-8?B?aG5XbThZVkNtek8xbHFzV0FKS2taYlJrdkNBMmVhblNNeTJYQ29pYTg0cERQ?=
 =?utf-8?Q?Sk1AjZjWPFez47f8nHQx8bWi/RGzQmdxwdMVzyK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4301e6b-98c1-45f9-86bd-08d930407ea5
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1272.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 20:59:41.3771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zA+PNI1cKb3hBp4on0ofzzLka4wfeFW3EXDyUsYdCNLTiz0LmhlkY2NLb1q0H6jQCs10Ut7eh59c6dUKE5WGiHYQl78wvYxL+9y9lMorFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2311
X-Proofpoint-ORIG-GUID: 8FNFuqXE8X4iIdIPQJkDB8mp3hMuVz5q
X-Proofpoint-GUID: 8FNFuqXE8X4iIdIPQJkDB8mp3hMuVz5q
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-15_07:2021-06-15,2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 impostorscore=0 mlxlogscore=634 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150128
X-Groupsio-MsgNum: 152999
Content-Type: multipart/mixed;
 boundary="------------5A584E9A35D9AB94942314A7"
Content-Language: en-US

--------------5A584E9A35D9AB94942314A7
Content-Type: multipart/alternative;
 boundary="------------124D516000ED3320A2EE722A"

--------------124D516000ED3320A2EE722A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I am working on back-porting some of the CVE fixes for FFmpeg to oe-core.

As there are 36 CVEs to patch (6 patches for master and hardknott and an 
additional 5 for hardknott), I have attached a list of recent CVEs in 
FFmpeg so we can avoid duplicating work.

I have also included the patch/fix commit hashes for the patching 
commits and branches/tags that are safe.

Please reply here if you are going to work on any of these ffmpeg CVEs.

Thanks, Tony


--------------124D516000ED3320A2EE722A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-text-flowed" style="font-family: -moz-fixed;
      font-size: 12px;" lang="x-unicode">Hello,<br>
      <br>
      I am working on back-porting some of the CVE fixes for FFmpeg to
      oe-core.<br>
      <br>
      As there are 36 CVEs to patch (6 patches for master and hardknott
      and an additional 5 for hardknott), I have attached a list of
      recent CVEs in FFmpeg so we can avoid duplicating work.<br>
      <br>
      I have also included the patch/fix commit hashes for the patching
      commits and branches/tags that are safe.<br>
    </div>
    <div class="moz-text-flowed" style="font-family: -moz-fixed;
      font-size: 12px;" lang="x-unicode"><br>
    </div>
    <div class="moz-text-flowed" style="font-family: -moz-fixed;
      font-size: 12px;" lang="x-unicode">Please reply here if you are
      going to work on any of these ffmpeg CVEs.</div>
    <div class="moz-text-flowed" style="font-family: -moz-fixed;
      font-size: 12px;" lang="x-unicode">
      <br>
      Thanks, Tony<br>
      <br>
    </div>
  </body>
</html>

--------------124D516000ED3320A2EE722A--

--------------5A584E9A35D9AB94942314A7
Content-Type: text/csv; charset=UTF-8;
 name="ffmpeg-git-cve-list.csv"
Content-Disposition: attachment;
 filename="ffmpeg-git-cve-list.csv"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15FKsFfG018261

Summary,Ticket,Fix/patch commit,Fixed in branches,Fixed in tags,Vulnerable =
versions
Security Advisory - ffmpeg - CVE-2020-22021,https://trac.ffmpeg.org/ticket/=
8240,7971f62120a55c141ec437aa3f0bacc1c1a3526b,  remotes/origin/master,NONE,=
all
Security Advisory - ffmpeg - CVE-2020-22024,https://trac.ffmpeg.org/ticket/=
8310,723d69f99cd26db9687ed2d24d06afaff624daf3,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-20448,https://trac.ffmpeg.org/ticket/=
7990,8802e329c8317ca5ceb929df48a23eb0f9e852b2,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22022,https://trac.ffmpeg.org/ticket/=
8264,07050d7bdc32d82e53ee5bb727f5882323d00dba,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22033,"Duplicate of CVE-2020-22019
https://trac.ffmpeg.org/ticket/8246",82ad1b76751bcfad5005440db48c46a4de5d6f=
02,  remotes/origin/master ,NONE,all
Security Advisory - ffmpeg - CVE-2020-22035,https://trac.ffmpeg.org/ticket/=
8262,0749082eb93ea02fa4b770da86597450cec84054,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22034,https://trac.ffmpeg.org/ticket/=
8236,1331e001796c656a4a3c770a16121c15ec1db2ac,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22044,https://trac.ffmpeg.org/ticket/=
8295,1d479300cbe0522c233b7d51148aea2b29bd29ad,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-20445,"https://trac.ffmpeg.org/ticket=
/7996

Closed as duplicate of:=20
https://trac.ffmpeg.org/ticket/7980","E4fdeb3fcefeb98f2225f7ccded156fb17595=
9c5
def04022f4a7058f99e669bfd978d431d79aec18
ea56af88956061d700043c5c4b026ac57834b0c8","  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22036,https://trac.ffmpeg.org/ticket/=
8261,8c3166e1c302c3ba80d9742ae46161c0fa8e2606,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-20453,https://trac.ffmpeg.org/ticket/=
8003,a7a7f32c8ad0179a1a85d0a8cff35924e6d90be8,  remotes/origin/master,NONE,=
all
Security Advisory - ffmpeg - CVE-2020-20450,https://trac.ffmpeg.org/ticket/=
7993,5400e4a50c61e53e1bc50b3e77201649bbe9c510,"  remotes/origin/master
  remotes/origin/release/4.4","n4.4
n4.5-dev",4.3 and below
Security Advisory - ffmpeg - CVE-2020-22037,https://trac.ffmpeg.org/ticket/=
8281,open,,,
Security Advisory - ffmpeg - CVE-2020-21041,https://trac.ffmpeg.org/ticket/=
7989,5d9f44da460f781a1604d537d0555b78e29438ba,"  remotes/origin/master
  remotes/origin/release/4.4","n4.4
n4.5-dev",4.3 and below
Security Advisory - ffmpeg - CVE-2020-22042,https://trac.ffmpeg.org/ticket/=
8267,426c16d61a9b5056a157a1a2a057a4e4d13eef84,"  remotes/origin/master
  remotes/origin/release/4.4","n4.4
n4.5-dev",4.3 and below
Security Advisory - ffmpeg - CVE-2020-22030,https://trac.ffmpeg.org/ticket/=
8276,e1b89c76f66343d1b495165664647317c66764bb,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22016,https://trac.ffmpeg.org/ticket/=
8183,58aa0ed8f10753ee90f4a4a1f4f3da803cf7c145,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22031,https://trac.ffmpeg.org/ticket/=
8243,0e68e8c93f9068596484ec8ba725586860e06fc8,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22041,https://trac.ffmpeg.org/ticket/=
8296,3488e0977c671568731afa12b811adce9d4d807f,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22039,https://trac.ffmpeg.org/ticket/=
8302,a581bb66ea5eb981e2e498ca301df7d1ef15a6a3,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22023,https://trac.ffmpeg.org/ticket/=
8244,0b567238741854b41f84f7457686b044eadfe29c,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22026,https://trac.ffmpeg.org/ticket/=
8317,58bb9d3a3a6ede1c6cfb82bf671a5f138e6b2144,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22019,"Duplicate of CVE-2020-22033
https://trac.ffmpeg.org/ticket/8241",82ad1b76751bcfad5005440db48c46a4de5d6f=
02,  remotes/origin/master ,NONE,all
Security Advisory - ffmpeg - CVE-2020-20446,https://trac.ffmpeg.org/ticket/=
7995,223b5e8ac9f6461bb13ed365419ec485c5b2b002,  remotes/origin/master,NONE,=
all
Security Advisory - ffmpeg - CVE-2020-20451,https://trac.ffmpeg.org/ticket/=
8094,21265f42ecb265debe9fec1dbfd0cb7de5a8aefb,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22017,https://trac.ffmpeg.org/ticket/=
8309,d4d6b7b0355f3597cad3b8d12911790c73b5f96d,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22020,https://trac.ffmpeg.org/ticket/=
8239,ce5274c1385d55892a692998923802023526b765,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22038,https://trac.ffmpeg.org/ticket/=
8285,7c32e9cf93b712f8463573a59ed4e98fd10fa013,"  remotes/origin/master
  remotes/origin/release/4.4","n4.4
n4.5-dev",4.3 and below
Security Advisory - ffmpeg - CVE-2020-22028,https://trac.ffmpeg.org/ticket/=
8274,f069a9c2a65bc20c3462127623127df6dfd06c5b,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22043,https://trac.ffmpeg.org/ticket/=
8284,b288a7eb3d963a175e177b6219c8271076ee8590,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22029,https://trac.ffmpeg.org/ticket/=
8250,a7fd1279703683ebb548ef7baa2f1519994496ae,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-24020,https://trac.ffmpeg.org/ticket/=
8718,584f396132aa19d21bb1e38ad9a5d428869290cb,"  remotes/origin/master
  remotes/origin/release/4.4","n4.4
n4.5-dev",4.3 and below
Security Advisory - ffmpeg - CVE-2020-22040,https://trac.ffmpeg.org/ticket/=
8283,1a0c584abc9709b1d11dbafef05d22e0937d7d19,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg - CVE-2020-22015,https://trac.ffmpeg.org/ticket/=
8190,4c1afa292520329eecd1cc7631bc59a8cca95c46,  remotes/origin/master,NONE,=
all
Security Advisory - ffmpeg - CVE-2020-22032,https://trac.ffmpeg.org/ticket/=
8275,de598f82f8c3f8000e1948548e8088148e2b1f44,"  remotes/origin/master
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below
Security Advisory - ffmpeg =E2=80=93 CVE-2020-22027,https://trac.ffmpeg.org=
/ticket/8242,e787f8fd7ee99ba0c3e0f086ce2ce59eea7ed86c,"  remotes/origin/mas=
ter
  remotes/origin/release/4.3
  remotes/origin/release/4.4","n4.3
n4.3.1
n4.3.2
n4.4
n4.4-dev
n4.5-dev",4.2 and below

--------------5A584E9A35D9AB94942314A7--
