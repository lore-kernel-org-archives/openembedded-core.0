Return-Path: <mirza.krak@endian.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0095.outbound.protection.outlook.com [104.47.2.95])
	by mail.openembedded.org (Postfix) with ESMTP id 8338371B04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 06:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=endiantech.onmicrosoft.com; s=selector1-endian-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3CgHIGJHt1tawnNeInHMO0/f55cgaeMpvAtV5cdGPuE=;
	b=SlVG3Wjagqww8kYr1vXTqvObySmau65cIPlA8kYDABCnUci2M44+cDRf+g71x84Gz1NsGLkfYTjuiu16APENxALWPKZYoHayQDirwTsNawVf6QEsMQMdUx5tTcnqC7gt/qpE63cHg7ZEOSeeAYabVu/c8JBh25XqPMZUYRV2L2k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=endian.se;
Received: from mail-qk0-f177.google.com (209.85.220.177) by
	VI1PR0601MB2285.eurprd06.prod.outlook.com (10.173.82.16) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Tue, 16 May 2017 06:31:01 +0000
Received: by mail-qk0-f177.google.com with SMTP id y201so118426439qka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 23:31:01 -0700 (PDT)
X-Gm-Message-State: AODbwcDN18nZwbCPm0S76PLbA998x+4YOjCJ48+6cSMMRk19+zIFWGia
	N77uiVocQoWKrCcMbGvuk/6cqgEwVw==
X-Received: by 10.55.147.3 with SMTP id v3mr8240551qkd.165.1494916247128; Mon,
	15 May 2017 23:30:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.34.174 with HTTP; Mon, 15 May 2017 23:30:46 -0700 (PDT)
In-Reply-To: <5665197.7sMgVyMVFb@peggleto-mobl.ger.corp.intel.com>
References: <20170510093705.12171-1-mirza.krak@endian.se>
	<20170510113147.26292.19160@do.openembedded.org>
	<CALw8SCUNKZ039BjF6fHAq8JCtsH-OptJrf+KhPUUsY9LG9vQ6g@mail.gmail.com>
	<5665197.7sMgVyMVFb@peggleto-mobl.ger.corp.intel.com>
From: Mirza Krak <mirza.krak@endian.se>
Date: Tue, 16 May 2017 08:30:46 +0200
X-Gmail-Original-Message-ID: <CALw8SCUKAL2cE9OKcueQr91JAMmNxyE4sGHsphdjAEc=Rvj44w@mail.gmail.com>
Message-ID: <CALw8SCUKAL2cE9OKcueQr91JAMmNxyE4sGHsphdjAEc=Rvj44w@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Originating-IP: [209.85.220.177]
X-ClientProxiedBy: CO2PR04CA0120.namprd04.prod.outlook.com (10.165.95.22) To
	VI1PR0601MB2285.eurprd06.prod.outlook.com (10.173.82.16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fbcacb6-2b58-44ab-bae0-08d49c251f4e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:VI1PR0601MB2285; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2285;
	3:RDwDQadcF3JQU0vKYEDq8VtCKGvH/WJ4b4K4FBqF6LtRfb/T3VcD2H/4gvNuZoDbEZdw7LWu+pMcgdqTstYGnTiSWcge2UDisY1D7SXHxmNWgJVYJmn4/V3YteeO/sh0T6v/uY878bGRcrp3EXRyJswSucPTr2BClnpl023qICFGxPg6VkaJiIVSoroVrxAXyBiib3hgBTVpJQA2Hcyrn2sH6OzpJzg7lzV6qDi5upUTp0ODJWp+/SpQrYgpGVEB8ak1kN1HX+8EFKmfyS6AjaZm9GHOF1sJWkR6tdFHISI=;
	25:R9San4KeamILnxmgK+SFveri4wrt3NtEywCCE2OzlezQGSbrgx2uiytyWXOcWwyvpNIEvn/uZdssFXCW9ahU8tAG7k+yy1nsg8sQLf4B9C0DkkJ450bIRtRlHHn26b67J+P3NwRoRVw6fXzMpJv/vJLvTKLiwjiqyRyYegzVr8pDBxlAQXcA9blegpVAGlhoMiLt1shbO9oqVUYjWbeOUe4t86A5aoEh2bjVecMydrCZx/8eTVtOeoNz1/LIXYsy2mozyuaSzzVnqgILFoL0WU7EqOBcqyVQKSppXhIltuYsGwZosb2H8eubYuQe+7k39GG1lSrzzPCtuUqW7c+PQqu6Bq8YsBfddGzq2ANho/vApDzCdFuQcUCSJ5KcF24u7k2kBYHplt5pzqw1ubP0LCTOzZJmVLRZV8SLG5YRTO2DwhoaQw62kAMaelFPOXIWtL7P6kAmDAxKL+gCx+Sv7DYhkYlAB4AISWs02/EZ6GM=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2285;
	31:ZMuiNv+QI0wVKpIvIBWdccJY8Hci7xdH7n6/C8nr+7Sl7/+NsPunuQytbknCa1U1pc4XW1SpgPg8iLMCQh7k1OGkWBzzZx9IEa+jqFT7ugpUeO0TRmWNQEh6sJDzBR50KzwFk1vf0wbuSA9c+Ytnctuqe0CBFt/0Iw1N8suHJilg2QGoq9PDpJICxoeiqP5IRTCKbDklcXa7q5DBMjabZ4fNxt0QPEP55qI2BD/zrRsc7gkRivSByozLjKbuvJc1YgiltA5ssDXhlV1NMRVU5g==
X-Microsoft-Antispam-PRVS: <VI1PR0601MB2285E549E3127E3819DEE0989BE60@VI1PR0601MB2285.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(2016111802025)(20161123562025)(20161123558100)(20161123564025)(6072148)(6043046);
	SRVR:VI1PR0601MB2285; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0601MB2285; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2285;
	4:oaMWfsQhPqvfKfEeE0H+0ksWvrUH/H77NVoi+7AIR/89S1Du/opMxRP88gMR+K1J46EhyPqe3SPtVnsk4+KdyZDtkXLVpUDkcZIny0Rr3cyT1dDjOoEeKXbdLzmLmUrn7E1l6kmOO7imPYAe773SKcMdziEHhIHlNe21Cpz+7paFzeAsE/xnbzbiKuU3kjpaW9FGdmZUB/5yQNIAD6hjLsrtly494c2WfSQHUGvnEFTGeUJgESgoFbCJHBogQ4r8Y0BknhEv4th7AwSugmbsM3KbWpqqj9fYz/LTmmEiO/ftXTTypQ8fvZCOZh+YFxloG9va573/7nDYo9fPbjrFDoP+Fc4YpHoafp93AsMjQl42BUiVl7LUDjnoZPsyrT9yVm9G79GVkKt6EgWCCuMANVL/6gDR/BwoGXiMekcT/v+1IPECHsr0rMAXHAcXLiT7aa2sjvQE+h+kegOtmdWTBFiCOe7kEUEsZIZiKKJPMmikgxLJwuR+hK1wCgnaTtYNpF6kevx/JEctJN/yAGad+eVSbTCHQVco0PLp5YXi9aFgsvp9BjVJh/fAsLDuRs+d5ZuXG5LkwRLHCwboEFn31fkH8jriJlc9u1m3Ptf92VbI7Z/kKKFQ1f9oMFzv3iiBK8/CfTTXVCTQgjmdKUJt0OaQJErizcI/MlCaF7AoRyjfomzrWcWS1gl9lwLCbm+RZlvgQIun97MVmyhiCJPloexIkwkTcFtjMQVpiBvJFLjoJ6fQ9zK0ElUrQeTbbITlt4NoAyt4VEZeoWVI8QC+9uGAxlHtIfxrHA3wiS4ReA0+9/Pn509q4w42asrMu5COlhc5YaKkO7XOTWm+1ivPS9t8fc8xbqCuPoWq4wCtq4fU0pDuZYNLWNddUKvLQZmiVFn3cR9d2dDxXS4gKRH/tnwr+HGRv2LUHYFAWpLPWTQ=
X-Forefront-PRVS: 03094A4065
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(39450400003)(39830400002)(39410400002)(39400400002)(24454002)(377454003)(377424004)(252514010)(74482002)(5820100001)(59536001)(50466002)(93886004)(5660300001)(42186005)(189998001)(966005)(305945005)(2906002)(76176999)(50986999)(7736002)(61266001)(54356999)(66066001)(8746002)(98316002)(478600001)(23676002)(110136004)(498394004)(107886003)(86362001)(6862004)(54906002)(6246003)(81166006)(55446002)(38730400002)(93516999)(122856001)(15974865002)(4326008)(9896002)(53936002)(61726006)(6116002)(6306002)(9686003)(2950100002)(3846002)(229853002)(142933001)(55456009)(18886075002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0601MB2285;
	H:mail-qk0-f177.google.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA2MDFNQjIyODU7MjM6YWphZzgyWDNHelM0OG5Ed3l4WUM4UjF6?=
	=?utf-8?B?YkoyOFhiOEh4VDVSWWRFc2RTelJYbEFhRHRiL0FxRUVYYmZXUEhSSW9KUldZ?=
	=?utf-8?B?UGxXS3V2eXIyWHB1blE5dUFUVEZiK0cyWDA2ZGlqdlhSQ2JjOEV2TitMU3VM?=
	=?utf-8?B?Rmp2d3FqcklzWFpENHpoa09tbnhsUW9VaGthT1FZRmwxQmppbUxXdEorOGhD?=
	=?utf-8?B?Ylp0Uy8xTjNqVDRrVU81dERrOENKdHN5Tm9vdXdQd2twaWtqS1laVGxudXdh?=
	=?utf-8?B?bmZEV1R4MWVDaGY0dzhFNjZweW9jTmdZckdWTlkyQmFlL3A0QUgzV0VuZXEx?=
	=?utf-8?B?eWZYVk9SbE1HNmRFVXpqdEs4bHJjbVV2RDZGaFIyOU9zdXVOVjNpMjExTUtY?=
	=?utf-8?B?VHMybmpDUjFGUmtNT1JGejlxMjVYV0hqNGI0VFBqK0dTb09VSXpUdFhQRzhq?=
	=?utf-8?B?aUlUMXQyVXYvN3JxaThZQWZuZkx2MkpVZmdkbVNYY04ra3IyM1doNWNXWmJs?=
	=?utf-8?B?MHk0YVVUWUt2OTlXbGYxNHNzSlZIdU5qbmdESkNselRVSjRBbCtRUkFSZW55?=
	=?utf-8?B?K2JMMEptNmtHL0Q2K29oNVBHUkM2Tm0xS2QxeHBnRk5PTGRlTFlsWDFDdGh2?=
	=?utf-8?B?MC81dmVOakxxYnFSVVhUUDlDTDI2c2NlWEowbWFWMk1JVVFWYTZuMzNkUnNW?=
	=?utf-8?B?dmMyRHI1bGhZY3FIcVh4cVEwL2RGY1lWdmYwdE9DMkVLTTNtMlF4UGZRYzdo?=
	=?utf-8?B?RGEwTXBQd0Z2YzQ0WnE5Y1M2QnRtTC9rNGZiMmYrS1JZS1hQaXhXendCOTA1?=
	=?utf-8?B?VCtBdW5NblJ2VW1NQ1RFZEJMQ0w3N1F0OEhpNnlxZUc0MFlQelVPQTdnUE5r?=
	=?utf-8?B?ZWJJRUMyOWtKUlBqblh2SE1xaWh6NE1INkhWOXNrMHV0blQ2bFRST2VWWFpl?=
	=?utf-8?B?eHEwMEUwQjZLZzN0WnpYV1I3MGNqYXU5SkdlYTEwNkV4WkpXVUpOaWpSV0dE?=
	=?utf-8?B?M2NUKzhCdFhTWkZrOVR5WXUxUkFvdndzem90TXZEQ0RxNFdEN0ZBSjZjWFVN?=
	=?utf-8?B?a0FlQXdTcFNaeGsxZkVva0dWMFl6aHBaZXRXWFRPcUtpd25KSWdVWWRzWFBO?=
	=?utf-8?B?VExuYmM3Z0hjMkNMbkhTYko1T0xTVk0wUFlMTjlsNEtLODNJSWdTMFNnSWZn?=
	=?utf-8?B?ZXBXSXJLQmI3NGlkY0tOY3ZpQXlWNUhhZWNvMFU2Q2RIeXNzV1ZQQmpsUFFQ?=
	=?utf-8?B?VFJTbEx6MmNaTEQ5WFVCS21iS2I1a3ZNbHhrSkNpRDQ2VFI4THFlK09kWjRo?=
	=?utf-8?B?Q0o4M29YY21aU1piQVQ4bld5VjRUZzRZNU94YUNwTnBoSTNFbDhOcm12ZmV5?=
	=?utf-8?B?R05lVDFvVGNIMUZvREJKd1RhVmlDbTJRUXdtMGZRaW1tY3lqSzVQazkvNnhy?=
	=?utf-8?B?Tk5qb0pnais3Qit0SUZCRkVkWHBIbmNrRWoyc1FKcHRQQ0drM3JaejhUN3J1?=
	=?utf-8?B?dGp3VmNtempCUERhbnppbnUvcURmRjFEOTg4VmZVeUQyU3A1dnorN0huWmpP?=
	=?utf-8?B?MCtjbExlckt1TFhBU3V3UWJFQnpoT0ZGYlg3UDN2Q29JUFJqOVZmSkJtS1dq?=
	=?utf-8?B?ZldxNEMxU0FpWkhSTFFHa1VYYm5NTU05OSt6dUt3QXZ4OThrVVl4WjZwbGtW?=
	=?utf-8?B?OW1DejRhN1Q3RXB4U09nYXFHanlyK2tVWTA3dERHb1VDODJ2elI2SkV1dHND?=
	=?utf-8?B?UzF6NDJIQ0Z2MGxES09iaEtZL3NRUVdTeG8xMFBqZUd0Z2pqRm1SWXYxMTFm?=
	=?utf-8?B?QmR3a1oyRENIeTRWWTF5Um9MeEJVbHY0K204VWg2aG1BZDFMZDR6ZlhLWjVi?=
	=?utf-8?Q?tvUoetspTbDlCAlaES1MCTZ3vo9zFb0Lg4?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2285;
	6:6gG7Pu6rzz3Kt/tmuJnMq4RqgS5yYpt6tG+qqgy5LK+vivxMkfy1PdnM2HJRbgK+l8P3///ApbBAFbp5JhUk8IT2T7TPER7y7VLDhUvRiVuQjvrRVxM6m44l0/gVTBkalk/lEyJ2TFaG1hmuay623+GvJwPVcZHEOGuJFg2qTBODhTti4w6ZI+la1wbK9G4SRnzu++xAmqVnJYsxI93dkLMcGAa9xFFs6mNWu/vxrPa6o5MYR0sB6gTu8XfKzVdpXVAxkIeepp4qWkENdQQDBEJevZCWMRfalb/EeNX+hldJoQRLj/4vVSjVBJjvIrY8ZVfzAn6MANhFBrac1uUDYky6pwIjO/2r4vgc2nGAt5wWk4AthQTFRmkU6BwQPB6KtYTjHgkMD20uOHl7CwiJgTFBaZHPn6+lBl6pt44ZSGKRXR8VljRz5yNUAfTCmsffsKoWZj34xzx919CXo8EAtfkX5e8sQfEGT1G077ajA0rEXGszIX7+CvF/TMD7CqtBImEPejaB7oUItq0BII9Kkw==;
	5:PZUjDIlE7NIDY/opwVPMQsCmrfNqXz/Vu4+mF6wsEvhxaUh5KA/nHzc5dJWvsxDtSH80QQKkVswQ+BPSVo6Mu2yaT7OAZJGZVtjoqVpD9C2L/A4JUbYBcKTgqgkJrbXa9I2Z1ipGr+fow8a7lqORBw==;
	24:jpIDZT+tUTOGoOe0X41fPPLCSsTBsNIlgOU3eo6hHJtP4zRjBuxnv5gmuqMA7t8E94mU5gA51CveUJP87HdZ6oUI6Q0ufb+rX661n9r2lrQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2285;
	7:mL4W29FocqsJ0oTGUALB72inRgneen6u6GVJpnEqAkxmm9tbRzadF5brgcFdSOiM9YqnsAuWKEGxAgEPPwn0pvhHSuzJ0TyUJZNB6sWZqeUyv/x9vea2mYc0kRsnzYrqovsrRaoLiHYvQwoR/3ydKyMagqqce2+rCTxI/4YLkqUukrXQp+Qd4nrRB/wiJ3BcLU30NM4doiyhvab7mNGtBwxktX9kWriD7y9kXnxLibnoF4x0G039SwyTeGg/mVEmaS+fIppegjHeCvw1ikHV3nseF71stElIMO9eg43q68Ij0IlBOJBUmGp6uu9IRItQRuBkEKS6l5DioXoMoHIzLA==
X-OriginatorOrg: endian.se
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2017 06:31:01.9038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0601MB2285
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFttZXRhLW9lLG1vcnR5LDEvMV0gb3BlbnNzbC1uYXRpdmU6IENvbXBpbGUgd2l0aCAtZlBJQw==?=
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
X-List-Received-Date: Tue, 16 May 2017 06:31:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul.

2017-05-16 5:42 GMT+02:00 Paul Eggleton <paul.eggleton@linux.intel.com>:
> Hi Mirza,
>
> On Monday, 15 May 2017 7:05:23 PM NZST Mirza Krak wrote:
>> 2017-05-10 13:31 GMT+02:00 Patchwork <patchwork@patchwork.openembedded.o=
rg>:
>> > =3D=3D Series Details =3D=3D
>> >
>> > Series: [meta-oe,morty,1/1] openssl-native: Compile with -fPIC
>> > Revision: 1
>> > URL   : https://patchwork.openembedded.org/series/6671/
>> > State : failure
>>
>> I seem to have messed up here.
>>
>> Why does the testing framework think that I was targeting master? Was
>> my subject prefix wrong?
>
> It probably doesn't understand "," as a separator and thus didn't see "mo=
rty"
> as a branch name and assumed master as the default - if that's the case w=
e
> should probably fix that.

I actually did not use "," as seperatator. Do not know where this came
from. My patch is [1].

I guess my error here was adding "meta-oe" as subject prefix in
oe-core mailing list, and I probably triggered some weird behavior in
patchwork with this?

[1]. http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136=
489.html


--=20
Med V=C3=A4nliga H=C3=A4lsningar / Best Regards

Mirza Krak
Senior Embedded Engineer

Endian Technologies AB
Fl=C3=B6jelbergsgatan 11
SE-431 37 M=C3=B6lndal, Sweden
mobile: +46 730 28 06 22
email: mirza.krak@endian.se
www.endian.se

