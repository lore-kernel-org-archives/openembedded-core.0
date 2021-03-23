Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.81])
 by mx.groups.io with SMTP id smtpd.web11.3346.1616465723675584056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 19:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=faL6+95n;
 spf=pass (domain: windriver.com, ip: 40.107.237.81, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BN6ki9RFXcGXEoIw/G40KVgSkCMcB3vLoh+CVdeejnNA3uFNZdb0OdkkQGFIR+z9zSVGykE2zfdDd1+QfbRNaOAl/9LigH/jX2Drmd2ux4Ywlraa0nSNZYW/lhhBnYx9G8WGlGFu7q912EX8Qq4rxA7wXWfa+hQwxorFZJxMDFVp9BwqVSxQvCfUofCBlvdd9A1M4/AX/FBhOip50LaPAlmuekX/93n82vyJ1zvOE+2aihIa5W9FBxamT+uMMX4Wu81mPWaw/R2mG4524WavOlFY+4qavPMACTIj/N1skF2kXoRlnVzsaSOJKc4SnHDxWmqb8uLeOnW0FtZq+d0nhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CvkOY/x2RtF7GwiVfDHTldnXhiDieiUb3MVwcvoeDc=;
 b=Geo2TwJk/QEs7kMO+eS8Uvc8+siAGcsTdJvqncf5tMdDN8WTTulmJ92712CejIPttwifjmzH/oS2uL+K1LH0QkuR7Bm49njx5fUwtUs2FbkyaDMSKpXtq+QsgZasWVH0pHwt7DpXV9qIvfDSONV42+MPBA170Nqmdg1oaXUK2ASSOqSPS/467xG+UTZFCQDtClG108McaKFnjmRW+eNIXTbz6A1dM4P8lLnpr0fKxfIGUY7TcK3aKA6kdmlYF4AAnC/+K2FIt7xAbgEi2fC2KWARDzMwunCGTouD7ImoovPKunVn3nsC3/7muaWl028hyD7x/jjgwQVKH9DZkVOP5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CvkOY/x2RtF7GwiVfDHTldnXhiDieiUb3MVwcvoeDc=;
 b=faL6+95nHbVh6TVU2Sd3D+oOo0eokyOc20Z0mtIvaaHtAlufngHpH0/0Th7f+K1IpYAqNTL2ZmQULQhV85UkJMfGb1UsNW54M/P9vUPJ97QSpZuR78t6vIoEJGhTeJ9Q0Zf9V2kmnwXvXKUaHoGGHf6prP+cpVaryGsa5vKvp5c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3454.namprd11.prod.outlook.com (2603:10b6:805:c1::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 02:15:21 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::145d:e124:e9e8:e89b]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::145d:e124:e9e8:e89b%3]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 02:15:21 +0000
Subject: Re: [OE-core] [PATCH] go-helloworld: disable module-aware mode
To: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
References: <20210322032330.32959-1-changqing.li@windriver.com>
 <AM9PR09MB46427137B32F88645D61AE53A8659@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <42889d9a-d4b4-a392-5590-1135cf624499@windriver.com>
Date: Tue, 23 Mar 2021 10:15:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <AM9PR09MB46427137B32F88645D61AE53A8659@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by BY3PR03CA0029.namprd03.prod.outlook.com (2603:10b6:a03:39a::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 02:15:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc3ec923-2e6a-4382-704a-08d8eda18290
X-MS-TrafficTypeDiagnostic: SN6PR11MB3454:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3454F9BD950F9A6518A2D36E82649@SN6PR11MB3454.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Dxjaz2TN61CyQaBeUc9ItEvS1x0B2R7hWlIURppEpMiTO/TrYWj85+mKxuFxJDePwqK18y7cK3/qpHRJv4RO0VJE67SE4tT3ReENTG4O70L5QCkoiYE5T4GRY+a5/DmK7UUFbTxwLrO2dPt0VvDFTwhKhpj/JpcUBVGz6+jRquTOBcJYpZUapDTfpqD7xCE1F2GiPb2qRu3IU7XJHNF3Ms0wpI405xggOOMKl62cUkaRE8d1M5fiqw9eWhj9mIAnKGQvx3EN4lTUq6ONGSTfr8H5ftVaRd5A7r30FhE01smxi6nCP1QEONQK3EAz7Ank9eCnQg1qRZorgEM/vjkOCDAOvMi3uOnLqurw67/Uk+VUet3xWxPwCC5kPa3Hq4zLVOwJ21F4chhwZOLePF0ZSWF26kjL5tMcaM05cMELJBD/ziUWLdAaSnhDLKvY+TamgZnsbLHi5tTYTpdEr5rztqcIry6qhMuuolOcD+TiOhXo4cWuwk5IdvJXGVxsmlmye4qlA6xYE0FGxYIlMU8XVb45pE747xglSzAnrXdiXNRduV6YzAbRIM0RQtLma4H4tsFtkwTxpLbTeEtHNRrEAl59h0icVvPRcct7jM4j9O/TzVyGMWX3bvE0SIK/wO3WOA0Clx8OjtLsnABiVMi/ksiOyyyzcPy4vSNoiLs6/sk3bWRhILz/78fAtl9j3Vuh+OyiwWmfIStCRxSI3vH6QytE+QP/9Y8l4pJhacs+ia898ynmS3FPZQ9TNrwUHrYOP1kodghkYO4yUrrdsnR8PaFDlGdBj8nuU3DR1GtPQxadXI0nvvVgcWcfQ/x/1lR3P3qWDu7i1nlXc9alcfytG/JNLfqnDCt/P2dbgGLh7dQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39850400004)(66556008)(34580700001)(66946007)(44832011)(16576012)(8936002)(8676002)(316002)(83380400001)(2906002)(2616005)(166002)(86362001)(31686004)(956004)(66476007)(31696002)(6666004)(26005)(52116002)(186003)(478600001)(53546011)(5660300002)(16526019)(36756003)(6486002)(6706004)(33964004)(38100700001)(966005)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TnJTY2dvbFBURXVOM1E1Sno0dThhZ1BuTlhwbXhRQmZneWVkN25WcS93aUZR?=
 =?utf-8?B?d0RHRWRzQUZPOEdDUWc0anRldmV5VDB1ekx0NTR0MElTTzdLZzY1QVZyeFE5?=
 =?utf-8?B?UEVUR0RmcnlCWWxaNERjK1d4WjRyR1BSaVR5Wk01aDU5cVZJWnA5UktWKzVM?=
 =?utf-8?B?REhiWG4ra1JYMEg3ZmsrS0dqL0o3dUdlYWFibnRBVGp2Rkwwc2l1NVlQMVhw?=
 =?utf-8?B?OUgrU3B4RUVSVUVHTTltcTU2NzBRdUNoQlQzM2t1dldiSU05cWdxcVNMYVBh?=
 =?utf-8?B?ZE5Ib1JTLzdIY3B4YVNaSVVka21MYkF6QUVaN29TYVpWL2dVWkYxcm1nWjZQ?=
 =?utf-8?B?d3lyT3ovUGovT3dIUzBSS2tzQWkrTW1ZTE50RTZ6ZURQQW44OTBGUlh4Yzc1?=
 =?utf-8?B?dVBOWkxYR1Zkb05JdThERmtVTExIUzFmVjZZTzVrRFVETld1VElNeUsyYXd4?=
 =?utf-8?B?QVV1QTFDNmxDK29ocWxXWlZxQVZQSlZrZEh2SmxyUHc0Yzh4MFNTdjdpbmxU?=
 =?utf-8?B?QWlkazRrUnhJZU5CMkE0NTZ3cWlESXk1SDFBbGxhZThyN0sxN2RYSkpScVpO?=
 =?utf-8?B?czJPVXh4QTk0L3h3L3VoODNteUVtc0JIaXNvbXVyckN4U0xFeVIyQ1I1OEl2?=
 =?utf-8?B?bzhSZEVNWWNROE9YdG80Vm1OSytDMU9FUlhUb2FjYzkwVVl0NW1ocVBMbmlv?=
 =?utf-8?B?TzJjdGRDRmVBR21va3JQSFQ4NFdIUlZTREFLOExEOUhtcjAzWnFRVHJ5ZU5N?=
 =?utf-8?B?ZTRhR29KbHV3QTF5SHluanZCTlV4S0tndlNPdHZIazZqK0E0b0xrdkIrOUlY?=
 =?utf-8?B?QUl4TXBnM3llZitkTkh5cS9GOXJJVUZLTmZsaVdnd2hyajY2bHVuZk1aVlU1?=
 =?utf-8?B?S25VR3FQdnk3N0VaYytNMCtzOFlMNkxVczBFU0F4b0pCa0hnVG1Za0JBay9j?=
 =?utf-8?B?Ykh4UzI1TXdiVEpUTGRPOW1YdkRQanhYNzIyYjVkMUFzOVRucUtTbkZOZkw3?=
 =?utf-8?B?aTVPR2lTM2FOSjVzVDkycTdKRDFEa040QXVsQzJzR09nakNweVl1MklZV0t3?=
 =?utf-8?B?YkNYZE9BcUZZblVqbmlXdWlNSS95SU5hUDdlejNWV1JvV25hVTlaK3BwQ1N3?=
 =?utf-8?B?cXFSbVlGLzVNemY5c2dpZjRPUG00NE02N1REdTB0aFg4VXJqejRHSHF2ekZq?=
 =?utf-8?B?MnFtMXE3aXY0UGF6aHhEYkZGZ2RhQU9BdWdqR1ZxbHNvb0FuZVQvOTJNZEdT?=
 =?utf-8?B?end6VHZEaHYzV1FWUzM3M2UzSFNrajBnSGRGK3FjbUw2S3gyWmNYbWQyUFkw?=
 =?utf-8?B?anJUQXYyMytNMjRNdmdwYUVrU0l3YWJGUWNUMEhZK2k5N2RxV0J2TFJtOHgz?=
 =?utf-8?B?RUdPN0src1JXTVg3Y3M4RzhYS1BhQWZMaHFUaXA0R2hZamxMbGZSOU1aZHVq?=
 =?utf-8?B?WTQxN2J0b1NhWVdwN2txcEZaUkdoaUlLVDJuTUR6RGxCMmdhbHQveFR3VHdM?=
 =?utf-8?B?bWJpRGwzRXFrSkpheCthQTZxa3Y4UUxYNjExKzFQRFRFWHI3bnVXWThYZFVJ?=
 =?utf-8?B?eUMwWVVScnRISlpGWnM5Um9UN2tMckRWYWpMUEowK2lSQVBZVGd1UWJIc3Ix?=
 =?utf-8?B?dnFXekw1SFlTNGJwcHFMSmVINkx3Ykg1eHpoSVh5TzBYNUcwZXBXR3FWNzZM?=
 =?utf-8?B?SGIyL0UyR0VvSmJXOW1LaVRDSWlGN3pTZXhndUg4aWo1VThlRXhRdDFhK2ky?=
 =?utf-8?Q?o75qrLQPgNrz6Xei3/KhVEoB0vIN8lObqYNFGOo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3ec923-2e6a-4382-704a-08d8eda18290
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 02:15:21.1955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkuiVpt0CewZrzaZEW9qqWeDh6uuNY2nrauQ9yrBzPYP0Bv7JmWSlup4Mrm3jpPshZfcecruEnN+DwNOKNhOP1kTkAc2Ov0NWf2/dV1aWa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3454
Content-Type: multipart/alternative;
 boundary="------------A12F01BF66AA369E0BD2EF05"
Content-Language: en-US

--------------A12F01BF66AA369E0BD2EF05
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/23/21 1:17 AM, Konrad Weihmann wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 22.03.21 04:23, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>>  From go 1.16, module-aware mode is enabled by default, regardless of
>> whether a go.mod file is present in the current working directory or a
>> parent directory.
>>
>> Above change makes go-helloworld build fail when doing offline build or
>> proxy.golang.org is not accessible.
>
> I'm not a go expert, but I understood the changelog [1] differently and
> IMO export GO111MODULE="auto" would restore the same behavior as before
> the update to go 1.16.

when GO111MODULE="auto" , actually to use "off" mode (GPPATH mode) or

"on" mode(module-aware mode) is decided by existing of "go.mod".

after revert SRCREV, there is no go.mod.  so it works in off mode 
actually. so, set it directly to off here.

set to "auto" also works.

> And if not it would make the whole go-mod.bbclass somehow obsolete,
> right - so it should be removed, or at least a sanity check should be
> added, that the class is not safe to be used with BB_NO_NETWORK
>
> [1] https://blog.golang.org/go116-module-changes
>
>>
>> This fix is kind of workaround, as from go1.17, GOPATH mode will be
>> dropped, and GO111MODULE is ignored.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb 
>> b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
>> index d3f7525dc9..c51f163e9b 100644
>> --- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
>> +++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
>> @@ -6,14 +6,15 @@ LICENSE = "MIT"
>>   LIC_FILES_CHKSUM = 
>> "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>>
>>   SRC_URI = "git://${GO_IMPORT}"
>> -SRCREV = "bcf50bfd7dcd8020c90965747d857ae42802e0c5"
>> +SRCREV = "46695d81d1fae905a270fb7db8a4d11a334562fe"
>>   UPSTREAM_CHECK_COMMITS = "1"
>>
>>   GO_IMPORT = "github.com/golang/example"
>>   GO_INSTALL = "${GO_IMPORT}/hello"
>>   GO_WORKDIR = "${GO_INSTALL}"
>> +export GO111MODULE="off"
>>
>> -inherit go-mod
>> +inherit go
>>
>>   # This is just to make clear where this example is
>>   do_install_append() {
>>
>>
>>
>>
>>
>
> 
>

--------------A12F01BF66AA369E0BD2EF05
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/23/21 1:17 AM, Konrad Weihmann
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:AM9PR09MB46427137B32F88645D61AE53A8659@AM9PR09MB4642.eurprd09.prod.outlook.com">[Please
      note: This e-mail is from an EXTERNAL e-mail address]
      <br>
      <br>
      On 22.03.21 04:23, Changqing Li wrote:
      <br>
      <blockquote type="cite">From: Changqing Li
        <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
        <br>
        <br>
        &nbsp;From go 1.16, module-aware mode is enabled by default,
        regardless of
        <br>
        whether a go.mod file is present in the current working
        directory or a
        <br>
        parent directory.
        <br>
        <br>
        Above change makes go-helloworld build fail when doing offline
        build or
        <br>
        proxy.golang.org is not accessible.
        <br>
      </blockquote>
      <br>
      I'm not a go expert, but I understood the changelog [1]
      differently and
      <br>
      IMO export GO111MODULE=&quot;auto&quot; would restore the same behavior as
      before
      <br>
      the update to go 1.16.
      <br>
    </blockquote>
    <p>when GO111MODULE=&quot;auto&quot; , actually to use &quot;off&quot; mode (GPPATH
      mode) or <br>
    </p>
    <p>&quot;on&quot; mode(module-aware mode) is decided by existing of &quot;go.mod&quot;.<br>
    </p>
    <p>after revert SRCREV, there is no go.mod.&nbsp; so it works in off mode
      actually. so, set it directly to off here.</p>
    <p>set to &quot;auto&quot; also works.<br>
    </p>
    <blockquote type="cite" cite="mid:AM9PR09MB46427137B32F88645D61AE53A8659@AM9PR09MB4642.eurprd09.prod.outlook.com">And
      if not it would make the whole go-mod.bbclass somehow obsolete,
      <br>
      right - so it should be removed, or at least a sanity check should
      be
      <br>
      added, that the class is not safe to be used with BB_NO_NETWORK
      <br>
      <br>
      [1] <a class="moz-txt-link-freetext" href="https://blog.golang.org/go116-module-changes">https://blog.golang.org/go116-module-changes</a>
      <br>
      <br>
      <blockquote type="cite">
        <br>
        This fix is kind of workaround, as from go1.17, GOPATH mode will
        be
        <br>
        dropped, and GO111MODULE is ignored.
        <br>
        <br>
        Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 5
        +++--
        <br>
        &nbsp; 1 file changed, 3 insertions(+), 2 deletions(-)
        <br>
        <br>
        diff --git
        a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
        b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
        <br>
        index d3f7525dc9..c51f163e9b 100644
        <br>
        --- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
        <br>
        +++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
        <br>
        @@ -6,14 +6,15 @@ LICENSE = &quot;MIT&quot;
        <br>
        &nbsp; LIC_FILES_CHKSUM =
        <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302">&quot;file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302&quot;</a>
        <br>
        <br>
        &nbsp; SRC_URI = &quot;git://${GO_IMPORT}&quot;
        <br>
        -SRCREV = &quot;bcf50bfd7dcd8020c90965747d857ae42802e0c5&quot;
        <br>
        +SRCREV = &quot;46695d81d1fae905a270fb7db8a4d11a334562fe&quot;
        <br>
        &nbsp; UPSTREAM_CHECK_COMMITS = &quot;1&quot;
        <br>
        <br>
        &nbsp; GO_IMPORT = &quot;github.com/golang/example&quot;
        <br>
        &nbsp; GO_INSTALL = &quot;${GO_IMPORT}/hello&quot;
        <br>
        &nbsp; GO_WORKDIR = &quot;${GO_INSTALL}&quot;
        <br>
        +export GO111MODULE=&quot;off&quot;
        <br>
        <br>
        -inherit go-mod
        <br>
        +inherit go
        <br>
        <br>
        &nbsp; # This is just to make clear where this example is
        <br>
        &nbsp; do_install_append() {
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A12F01BF66AA369E0BD2EF05--
