Return-Path: <mirza.krak@endian.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0093.outbound.protection.outlook.com [104.47.2.93])
	by mail.openembedded.org (Postfix) with ESMTP id CEBC771AFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=endiantech.onmicrosoft.com; s=selector1-endian-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hch9vYayAhvbmzj8apYMsBgs/BcZOgaxPjeMs6WVG24=;
	b=ZzWycw5GYuS9H+Sf6cBY2QJ6KFpAKiuLerw5cCCj7IRfXHmzmhPx+6x+/kuerccWpQJDRiweBrTOcw/+QVQXJpH8Q8VCp8ISq/VtqwnLFDvwGoWiVNR5p8U9BZydNS2c4Mlu80cTuWM3dFxMWG+vw338jhwK4sqUadk82O8gdIs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=endian.se;
Received: from mail-qt0-f182.google.com (209.85.216.182) by
	AM5PR0601MB2274.eurprd06.prod.outlook.com (10.173.90.137) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Tue, 16 May 2017 06:27:39 +0000
Received: by mail-qt0-f182.google.com with SMTP id v27so96217252qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 23:27:39 -0700 (PDT)
X-Gm-Message-State: AODbwcB7EJfcmdchsVImUMW/TlpidiaDgFWosxBGniM2QtqqJ+0FmzmD
	lWezT7S9i7GRz3z6A1GRUiO+JjD6bw==
X-Received: by 10.200.52.4 with SMTP id u4mr8606394qtb.268.1494916029155; Mon,
	15 May 2017 23:27:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.34.174 with HTTP; Mon, 15 May 2017 23:27:08 -0700 (PDT)
In-Reply-To: <20170515221028.GL28053@denix.org>
References: <20170510093705.12171-1-mirza.krak@endian.se>
	<20170510113147.26292.19160@do.openembedded.org>
	<CALw8SCUNKZ039BjF6fHAq8JCtsH-OptJrf+KhPUUsY9LG9vQ6g@mail.gmail.com>
	<20170515221028.GL28053@denix.org>
From: Mirza Krak <mirza.krak@endian.se>
Date: Tue, 16 May 2017 08:27:08 +0200
X-Gmail-Original-Message-ID: <CALw8SCXuongs8L0JL8Xjw9jEoDLGSmBGcX49akiA6uP3UbTECQ@mail.gmail.com>
Message-ID: <CALw8SCXuongs8L0JL8Xjw9jEoDLGSmBGcX49akiA6uP3UbTECQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Originating-IP: [209.85.216.182]
X-ClientProxiedBy: CY4PR1601CA0013.namprd16.prod.outlook.com (10.171.251.26)
	To AM5PR0601MB2274.eurprd06.prod.outlook.com (10.173.90.137)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bac2a08-137c-43ed-9f42-08d49c24a6a7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:AM5PR0601MB2274; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2274;
	3:nucfVmhk8vLSNa2qFIOhSXvY7mTLQKKbQc2ZfPEUe2mOvoHFWv6DM8e89VcJG2HkGBh56OoSEATC5thH6qnpLmlMbQMjPdfQyBNnZA+p7E2ywbtLXKxnGPBrwtqyXpw+TmMj5iUMgfWfgZ4AKCjcCjmNdbpphY7EnbPVu3RcGBMp0wqTiHjsznt14Hrq1cPsIdVayIXOMZal8ilSEZQgWzQInUcwyspgMgLCxElST7wl7dBQL63ejzuw78FrlcXLqNPPZ3i9YwSMWwAKMv4lcl+95OnQ+W9HKiPOh3CxX7E=;
	25:Co900kVtWwM6cckDSHhULcIt8CWn55cEfqd/EycE0zXEHoGlUZg5/Jw/6ZYJqpth7liq6HBDooLsyP1rl8obG0U3MzVSX3hICPs/0BuvagpzppverSUuk6lSMWVssLzAtb3AP/ERhH84WOoXQ4zYQtSDcJiXjAG2N4PyzpD1p4Ft3/ATdXWZIhmAYEipuOnYZsIfzkBsytg5CCow6V/bZEcJ22z1em6PjtZCwvjLXYxG0le/jEXhdhmkE70ycVAVyUPM6eK1Zc7C48PbuCGtMO0835/25jnaPATMDoZbhZNT1dekfMruuBnf+2BhRMgTYj1qqbxQzhTm2NqWaRQTGGBNboBoTPR15qMCjbTjXuIB8xWrn28YfYTf4Hn5LxCnqE6JWljk9pdJEvvpWFKXqzxOgNRPJHmSp0mDoVPYiAOAI67Ls4jonZREOx5XL7M7JaouXAgrKYvu22tI/E6x5WQptMhQmA49zOuPRhjcV04=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2274;
	31:ct8kl1yH7Sz3XclYJZ8hda+5gC1GG/3Zcu37I5WYaA/K9MDEPGo8BHScnt8Gfb/eoHCwjKm7wX/T9oFDDFTE2M8sbt1x33SWjRq1nLgbOAUhAyd+Jv7nw5b9VzLSNvQVgB99Ldf+eXgBFxQFIK/nkh5q41iiaPW0QGZMji1g63cv8NwGRa2ykg3TO5HNi7NLUR4KTgEAl/sYJvwMb/8KcUD5MGE8PUQpQN2AClALPDmILyvsl82AkRS8Kf2//OcUsL83qf1WOBLY8BqOYjG9Jg==
X-Microsoft-Antispam-PRVS: <AM5PR0601MB2274DC54FFD2B13EB43230989BE60@AM5PR0601MB2274.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(6041248)(20161123555025)(20161123558100)(20161123560025)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(2016111802025)(6072148)(6043046);
	SRVR:AM5PR0601MB2274; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0601MB2274; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2274;
	4:mv5TygBy5tH0ERLZrNMHpUzRE2tY5KYfLqs7gnJpjo3/J0/vCEeEm2ivjCAg55Dk3EeBVg8SoAqY/xYLSg99ZZhKckjmOwwOG15E/4IWJWPkKQHyiO1w4vxC6xP96o61+JaCjZ3UTAA2TY96jN/VwTmU+FsWjnJzLGVvNAHjI6Pw/MctaP9JnuklUUPOc2m0RZTemre2D85LLBlRdhYerPShXb2jLkBdFzXQx4wKpdm+zB4OMdLm6dan4x+WbqOZKLhuQyYYSkj01o53kpRNJBOpx3wLbvnrwDSrS/O01Io3TrVcODWoDgmnIXajzfRdtQ4Yf1DRCfvZW7Mb9cOzV74u2Po1Idug2+CWCi/3JjG4iHN1rYmQj8d19lt5fn15fhCxeyPZMtlFut2Zgl+HmCVe+heAYio6NdzFJGE9Zeenf//6IhV8NJvlDa+5nIB40Bh/ZAUO+i7u6fPWsLwI47Qp1o60LUES4or4X307SHvKXCRyAFJZIosp0jrMXyH0aQgD/5zsXmWzeSSLaFnRrSAZrcLYqHrmZo9XP+W9xSRCa6FM1ONjVI2EKJHDNRSLmi69cJHDujDn9d2D4UZYeL0qzRfhzJ6C6xGmq0O8/KeH0oSpZFlRSLc2QEx+pDQPJan3yNppIpC/Zd5JML7YnHWsJyb/YzCnrx/k/GnosUR7ezuEArucwO/qer0QfzMpGk1zhuhPMBu8ukYjyhPu1G6a1n9iz53VmKwUl9Y/jY+kIYyqcrGuwYjuHAPjisahcA7Ui7E9t8Uws4PVKsOaDMg8fxdE6qbm6RY4p65O0O2K2+EpmzQQIBudD7ZPJlrOxqebPYo9CIbizJiBjI02nQ==
X-Forefront-PRVS: 03094A4065
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(39410400002)(39830400002)(39400400002)(39450400003)(252514010)(377424004)(24454002)(74482002)(189998001)(61726006)(6116002)(3846002)(42186005)(229853002)(5660300001)(6862004)(5820100001)(2950100002)(54206008)(86362001)(50466002)(305945005)(53936002)(15974865002)(6246003)(7736002)(110136004)(38730400002)(59536001)(9686003)(4326008)(23676002)(122856001)(498394004)(55446002)(93516999)(66066001)(2906002)(478600001)(93886004)(76176999)(50986999)(54356999)(9896002)(81166006)(61266001)(8746002)(966005)(6306002)(142933001)(55456009)(18886075002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0601MB2274;
	H:mail-qt0-f182.google.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTVQUjA2MDFNQjIyNzQ7MjM6UU1PeHE4ODVKOEJWTS9xT0VpVHlLK08w?=
	=?utf-8?B?M1BaeHZkbVJaRlJ1dlR3OFNyKzQvNzYxbEd1bTBMajNjdWdtVGwranNJRUpC?=
	=?utf-8?B?MVNDU2xoVU9PNUliaFMvOFMyMXhod2IvOWwwcmZkR1d2T1JEWDhVSi9zOFEx?=
	=?utf-8?B?U0kzOWE4TmlyZEVoSTBKMzNwVlp5eEdEWHV0VFl0bDRmd0lFc1hBajlzRW5B?=
	=?utf-8?B?R3BLYlplWC9OQzQxemdFL2dGUEZlTEVRTCtkbkNsa1ExMzZxOURzb1FDaGt4?=
	=?utf-8?B?Q1FMS3NXNTZvay93UFhzZkRtWlIwU2hYREo4dTdIbmtnNE9tV20xRG91TTZy?=
	=?utf-8?B?a0djRFJFT2FpNjg2RkMxYmpFcENkZ2oya0VLN3djTjlrbTAyT2NyK0drWVNO?=
	=?utf-8?B?b1MrcnhwNFFrUDE4OTM2Q3dSUmhFRkhzZTJ5TG5ZUm5sR0J2T1ErNjJpUmhY?=
	=?utf-8?B?U1hMMFRRK1YrL2FQS3hZU3F4enBINmNTU3lCUHZsWDZsSjZWM04wdzMzd0dm?=
	=?utf-8?B?OThEZmhCdXYxZjF4WFI5ZlJwU3ZwVzVScGlCVmV2ckJjVERISHNQTFlCSWxo?=
	=?utf-8?B?ZkZCVnYzSGE1ZG45ZU1rQWN4dGZjV0c3VDhqcThITzBGaE1DUDJETkl2OG1n?=
	=?utf-8?B?U2VTM3prSGxJUEd0ZmVQMnpvSFdrTFNjREZWNHBlRXR4ZWlXcE9pM2RxSFNr?=
	=?utf-8?B?TldmUUw3VW9GOTZGOE9Tb1lBeHRKVVVYVlhBcm1lcmdjd1AvNHlMVDdaMXNG?=
	=?utf-8?B?ZzY3RjVIakd6T3cxUWZWWWo3UzlSVzhGWVZvdnMrcFhFTVlaTVM4VG5nbU1l?=
	=?utf-8?B?azFqWHhPeGhmdUM1TWxRNEdpVlNyRVErQlllSjlGRCtxUGRRRDJWbUp5QTI2?=
	=?utf-8?B?eFl2eXF3dDlZMzFJekErODFXV1pGaGtpQmVzVWJ0bVdKZTFYSzdOdUYyS1Fi?=
	=?utf-8?B?eEJoU3U1TlVIUFN0bURkdWxQZzViWGFPKzdaK1hzR0FoZGluMTJad1ZRS3NJ?=
	=?utf-8?B?NEZ5WGhTVmwyemppVFZQYnYxdEZKL3k2WC8wUGkvTldNQ1k1QVU2NXNpdlMw?=
	=?utf-8?B?aXRsR0lEK3hPcFRwWVpCTHhnbXZUK1Z3RFgraXovWHhsQm55V2RnZ1QxeTdS?=
	=?utf-8?B?SnhFVG5sbnlhWi8wMGNnSU9ScUJnS0FwbXlBNnJqOWQ1R3dDOXF6VTdVNS9u?=
	=?utf-8?B?Y3AvL3RqdEhzMkJza2NtMGRrNHVvWXVTYkx0R2ZXZmd3Q09DSk4wNXVudFN0?=
	=?utf-8?B?OUdYM3VvUE90Ykp2Rmo0VVFMTWtxWmF2TmxqRjd0L3c3YS9JeWNvRWduQ0Uv?=
	=?utf-8?B?Ym43eTZhSEJpaWVJTEx1SXFHdjlpWjh3SFRNOHFRM05waS9hUG9GVXBZYlRT?=
	=?utf-8?B?VGk4RUxqLzNlKzhpNllmMVo4eXVVWHdFcVBpcmxFWFdQdHN0T0tqSE1YSldL?=
	=?utf-8?B?dzBJNTYvSXBISkFBYnFlLzBMK1V1eU95NzdTOGZxTXdOdTVvcnl4bGZFM2FX?=
	=?utf-8?B?bHhmM05MKytQWjZlK0QyNmdNYW45c3JDU1NNNEhLL0FIZ1ZPOFFDMERpZjha?=
	=?utf-8?B?OXNpSmxQZXhoQ1JOSlZLemhOcFNzT0Zzbkh6WDMrajFVakM2N0d6ZkZnQ2RK?=
	=?utf-8?B?UFhhOWtYY3poUm1UeGp5QU16Vzh6MzZuR0ZOTDRhbzB0N0pDWUF5My9IRDZ6?=
	=?utf-8?B?Q28yL3pNWndjbENzNm5CMC9GcVdlKzcwSUN6VlRvN3ZkOXo0a3JpOTlUTDc0?=
	=?utf-8?B?S1BUUE1xUlBkSjc1WXFCbU5QMWdQbEgwamtDQVNsYVVWdk4zOC82VkgwTitW?=
	=?utf-8?Q?Ndi8koHlHukDX/f?=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2274;
	6:3Dh3S8hdF1yJK/dQ6UKyLehDiplnmMGkEYpH6IRyaJdNviQDTsPjdr8xdCYr1Zrdedw/50fhqTGwXRZ7EXqIpc6GMAICQ1f+Mk9ElRYZe8XbDLX0hxlxkJmBcM/30vymzRhohyd3/3hSkkekbOIjthM6JmL7cwA3EfL5Xghl919MgoquRhJlOrfCGhdGu+9Wzyukaz5XaqeZIMO+COk6oB0i/br+ADjN+41Or77yHdVU3VHVPVIJQMQF+VhhQX7BqCTK5wfZKiwT5iv5IfmWn1TkxbtE9B1dxxY6+zW5+iJUDNrP+p+1kElcrPriheJvZUf+rmUxuZlC4dA+DtV+wZxCg82cXALfbVN1xXlMt1p3OIEndWWuYP9eT+03rGumC9JhOTbM66ZT/RTekAL1+6ppptfio7+C7w8Td4ELgKeHXc9ZHxb2ux/mycnQyW3Brini3GYp0fasqsElFepr9YqyYDoFZUufWCJVd9x97ma/VgHG8khPmssPvjDsYIpw9ZVHU5aplpA/Xxml0dZwBw==;
	5:EXI2uMBBJL+0ZLrDnSxgUb4/DlqFHQgkiZrbvc7Syz0/0D1hIiXb5Lh0IXutHkwHMfsu/WCI47bKka/y1qodvgYH63Ntx6AIKJd0fgB5RCiPo88pQ5Mx/dsU3LNmXws8OBFzpwsSyR0ZNUQQpBuEzw==;
	24:Dk/OUgx/8HdMvzcUEFAw+D+8ZzsRnl6kZy4FmKVyZO3fFAgutfR4bKxdNMUmvdAZY2SVM8gm7lRWPVS4GukJTH32GLIFnpY4G+NoXTz5G6I=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2274;
	7:dUTIFNzJRM6wkdfnd2bkyP2iKNTezT+ZoOXKikuufVMNvVAFZjxiv9T0oJsd3CgC2DdsV+xOcLH5poivGr8Py+Pf5f8M7D7TwcLicnCCoTIsVrjkBnH9CJ8vz0oBAdg4Zc+79pPSbkJ9pOXHqWRWpe/2IMw7eQjOyT8aSurCk0zfRQvbGnlo+kWaRiNs/eC45lSCkazX5BzBvCh4yGAm/914rZfryJJZazE19TjMp6OzwElU/0rGie4BnQ8sfeUSbVJjXDzv4Vyltz3Ndh+aantmpJgVOULe2SjdCKHNuewTbK+b3FL2WNBHt8ZoJ4iqkvbzS8ObfjM4Uni6n9X1Zg==
X-OriginatorOrg: endian.se
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2017 06:27:39.4831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0601MB2274
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
X-List-Received-Date: Tue, 16 May 2017 06:59:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2017-05-16 0:10 GMT+02:00 Denys Dmytriyenko <denis@denix.org>:
> On Mon, May 15, 2017 at 09:05:23AM +0200, Mirza Krak wrote:
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
> Why is there "meta-oe" in there? This is oe-core, not meta-oe...

Indeed that was an error on my end, using the wrong subject prefix.

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

