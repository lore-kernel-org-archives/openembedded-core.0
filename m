Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.84])
 by mx.groups.io with SMTP id smtpd.web11.27046.1590717473386958597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 18:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GFdwSO2R;
 spf=pass (domain: windriver.com, ip: 40.107.223.84, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAY55dKUEPEuTiBW1vfx33QOJbMXBRNBP4qkHjrp4bT5KCNHZu9zMqjnX40KsqkqOFkoNrtsaSpVTM8AnTbbN84Ir17futujO0u6Vc+hVXsWuhU6Z5XcYFJ6V/6ymdolSlV5ZolMA41Zg46pKUr2tPU+VIVUbQf+xRwi4PCIYmsUolYbKDWo/UOWbUgH78waBAAVZOsW3H0KR9cW212Ak1J3oaDLZ0dF8jzfsAclmDlgViHVBI377gyb+XUh0zejwOLtjI5RieMqfc9uB+kLSWIONOJiJ/PfLc/Ik7JM0i5N+vz9/besuz/7R1fepxxLDVyxpOpwZLJHawTgtndW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RjPR8zVgbvK7FxB0pOW/OmgaIkIjGjDTUOMu3zLZpM=;
 b=QF3SbCvRBVYPrvZ5d/7ALTMod18maYLDFsLNMepadPWoNOZNv0RcRS9juOf0+KdOJFaxZRXHDetmVZhCIKwchZk0NCglpqqH53Gla1y4k8SrEZRgeqDzLp2xYMrXZwtwZ7KrRkL92SM6/QoohM55RG6kmTPQcT3/chx6Tf4SrSy6YvTl/XMOcwzgEZJOIkFHm9ysqbPq7sZTt2SMUpUgvupUMJahKO4gLfUDC5XICtrDUOyYxXfHqNff/1Y/wJMRTzpUB6D36fZr3XUPcZ1xHEHXKVBM2YYqkUiNfWJMalFgckVZTdGa+VTGOiuB02kPayXffpLqjC1i1Yh+8nhgGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RjPR8zVgbvK7FxB0pOW/OmgaIkIjGjDTUOMu3zLZpM=;
 b=GFdwSO2RatJXnQznKyty3ElHjWleNQWh1odZRZ3ozaFlKPFa4Tr9Du4yc/3UStmEf1Qa6VwSrL6A43V3EJvTKpDP7yY438H0hobZ6g37lIzcdBaQb2IM3EKfr17wEaqxq0fb4N8sBDMmEVGFYyQMjMJj/PJQWEEo6nkLTQhpnDE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB3209.namprd11.prod.outlook.com (2603:10b6:5:55::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 01:57:51 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d%6]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 01:57:51 +0000
Subject: Re: [OE-core] [PATCH] initramfs-framework/udev: umount /run/media/XXX
From: "hongxu" <hongxu.jia@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200525030622.28426-1-hongxu.jia@windriver.com>
 <b86fb730228c5c66dc33111de6d9628ab88badfc.camel@linuxfoundation.org>
 <1612DC74B95B207F.28111@lists.openembedded.org>
Message-ID: <9353b8a2-d91c-f490-dac3-b96cf32a64be@windriver.com>
Date: Fri, 29 May 2020 09:57:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <1612DC74B95B207F.28111@lists.openembedded.org>
X-ClientProxiedBy: HK2PR02CA0195.apcprd02.prod.outlook.com
 (2603:1096:201:21::31) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.148] (60.247.85.82) by HK2PR02CA0195.apcprd02.prod.outlook.com (2603:1096:201:21::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27 via Frontend Transport; Fri, 29 May 2020 01:57:49 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fff895b-4a96-4624-4079-08d80373b13b
X-MS-TrafficTypeDiagnostic: DM6PR11MB3209:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB320909EE0823A53CE50644CE948F0@DM6PR11MB3209.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	34iWb1IFJEqBRLEklcXT0MhHk3sasj/iHHeWZXaZdZbk0PHKrVpEP9O+eMqBCETDq5nv624+Djw3aYSyjSZcilPLR5N6pCw9V/gWNssbJntJ0XKJPxcEYjAC+YMSD08sZT+PZxHPe4nSk/dggY9whFzI8YfF7Ms/+G8Jyuf7KqaQbN/vEK8f4BeIL8PSqMCQy3xV0qoQEQ8eIkYcl+cGL4uoas7xmmeLeTkNNLUPBs0aGn7m9dDMbsFG7GjDU1Wo5Cxccw4hsaHPoL74h/stNRdtDfgI0+Bb1/YDLydiz3rc8CLNloykq4xloLO2kSrRZM/Um8Y6gXcybx3Slb68BbWZJiLsWGht2E7N0qLDHLjjbjlm3YVOR+eORx/ojZzEVKj7L7h1wM7lVjaQ7ZnDv580+syFI3h0wzvbpiQKdzCfxBLONexdmCL7M+cp9Cbkazt7sd2xnbzm1L0mca1QAf5ikx1SSqrE1szh5ayo2Z9deqmZJRo2m0rtdCeHN8aH0tVj68Ee3KRAngDYxPS+bvSpyeRkmtNyTfmUszvCmpwgKkqYru7qceBNp+ZKXaZhzS5n43y58HnSybXLnHXtWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(396003)(376002)(136003)(346002)(5660300002)(83380400001)(36756003)(66946007)(31686004)(86362001)(31696002)(66556008)(66476007)(166002)(6706004)(6666004)(8676002)(2906002)(52116002)(8936002)(33964004)(186003)(44832011)(478600001)(2616005)(53546011)(26005)(316002)(16526019)(956004)(16576012)(6486002)(966005)(78286006)(13513002)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kGnxaLKLxXhMo0v9ZSkUKEhjLu/st6V5cSk1Mqbl39QmWeWBly2nKqfMZmZwHxAqJJT4w3Q7mOLOy1jPIUlhvLVxSBeKVSHafw7wXAmcR17zKDvbkCz1G6s6H6VQ04NeAagLxEZCkmYhlaW4vbKnU8NozON0l92zfA9kJow9rPIdIl6IZN83Vp4J8rAOdDbmlWQnAUAGDdiN2U8N21xyNzNDm+G1qbM3qbpyKL7snWc5BeLdSJGwznBsfUCaYuVm57b+zK0mcC0dW9EKUFJM0PbYe4cNO/8S7ErE9I7YqmuDpa5M5aRKGvYT4SJEG3HuOprK5FTYD0Pp/Q8LYg/9U1fVgvakfP5vxA3jLK/9IRiLuSckVQ0OmEVCnGp3220BcSC2j/G//9POjrPuIJxxVbEf4fj+oTqT4B82llELYTkO6RhZbES2ywIKNTVu3MXscss9ml1b5AAg0Lsgbufy9qS5r4fiDjXHVZTY1Z+OrEo=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fff895b-4a96-4624-4079-08d80373b13b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 01:57:51.0663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IudfvZfU/0tnNXY0H/OnxlpnK8PEf8qHP4VdRV6uwOcubsrHKm2AqqDsLG3eozLoc8HsCjn/EFC48HTB772cE1yL913OVim5Dpywmxt+08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3209
Content-Type: multipart/alternative;
 boundary="------------CCA761002E6961B7D51761BD"
Content-Language: en-US

--------------CCA761002E6961B7D51761BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/20 6:40 PM, hongxu wrote:
> On 5/27/20 5:52 PM, Richard Purdie wrote:
>> On Mon, 2020-05-25 at 11:06 +0800, hongxu wrote:
>>> In initramfs-framework, before swith_root rootfs, if udev have time
>>> to
>>> run (before being killed), it will invoke hook mount.sh (which is
>>> provided
>>> by udev-extraconf) to mount /run/media/XXX.
>>>
>>> Release the mounted disk after udev being killed.
>> This feels like a workaround. Would we be better off not installing the
>> mount scripts into the initramfs in the first place?
>
> Follow your suggestion, I just tested it to remove the script, and 
> everything works well,
>
> I will remove it in V2
>
Hi RP,

As the oe-selftest result, the mount scripts (/run/media/XXX) was used by

meta/recipes-core/initrdscripts/files/init-install.sh, we could not 
remove mount.sh in V2

How about this workaround V1

//Hongxu

> //Hongxu
>
>> Cheers,
>>
>> Richard
>>
>
>
> 



--------------CCA761002E6961B7D51761BD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/27/20 6:40 PM, hongxu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1612DC74B95B207F.28111@lists.openembedded.org">On
      5/27/20 5:52 PM, Richard Purdie wrote:
      <br>
      <blockquote type="cite">On Mon, 2020-05-25 at 11:06 &#43;0800, hongxu
        wrote:
        <br>
        <blockquote type="cite">In initramfs-framework, before
          swith_root rootfs, if udev have time
          <br>
          to
          <br>
          run (before being killed), it will invoke hook mount.sh (which
          is
          <br>
          provided
          <br>
          by udev-extraconf) to mount /run/media/XXX.
          <br>
          <br>
          Release the mounted disk after udev being killed.
          <br>
        </blockquote>
        This feels like a workaround. Would we be better off not
        installing the
        <br>
        mount scripts into the initramfs in the first place?
        <br>
      </blockquote>
      <br>
      Follow your suggestion, I just tested it to remove the script, and
      everything works well,
      <br>
      <br>
      I will remove it in V2
      <br>
      <br>
    </blockquote>
    <p>Hi RP,</p>
    <p>As the oe-selftest result, the mount scripts (/run/media/XXX) was
      used by</p>
    <p>meta/recipes-core/initrdscripts/files/init-install.sh, we could
      not remove mount.sh in V2<br>
    </p>
    <p>How about this workaround V1 <br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:1612DC74B95B207F.28111@lists.openembedded.org">//Hongxu
      <br>
      <br>
      <blockquote type="cite">Cheers,
        <br>
        <br>
        Richard
        <br>
        <br>
      </blockquote>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------CCA761002E6961B7D51761BD--
