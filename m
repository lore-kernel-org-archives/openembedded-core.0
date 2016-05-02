Return-Path: <alejandro.delcastillo@ni.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0148.outbound.protection.outlook.com [157.56.110.148])
	by mail.openembedded.org (Postfix) with ESMTP id BE80B6012C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rGICRqZjyRC4g4c7RIpeTTwJcSqwimBmndCtu0QgNHs=;
	b=NhmoB9qypAsrLjhP7Ay3iDp7Ssw2gauwsd85V1cNaqDtsFKl4SrJZpBpylNNGidMTD4yZldWJIjbC66QkRYbTh7XL4k31bofMq30W9sGZEEx1u44JdC/N3GCq9qr+BnI/KzzjkmRCeWJ4peJJ6rSAbav0UaCS9NgdnpLehKCyWw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=ni.com;
Received: from [10.2.33.36] (130.164.62.82) by
	BY2PR04MB845.namprd04.prod.outlook.com (10.242.38.140) with Microsoft
	SMTP Server (TLS) id 15.1.485.9; Mon, 2 May 2016 16:15:42 +0000
Message-ID: <57277D25.2080309@ni.com>
Date: Mon, 2 May 2016 11:15:33 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Patrick Ohly <patrick.ohly@intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1461333082.31320.121.camel@linuxfoundation.org>
	<1462196370.30857.70.camel@intel.com>
In-Reply-To: <1462196370.30857.70.camel@intel.com>
X-Originating-IP: [130.164.62.82]
X-ClientProxiedBy: BLUPR13CA0080.namprd13.prod.outlook.com (10.160.82.51) To
	BY2PR04MB845.namprd04.prod.outlook.com (10.242.38.140)
X-MS-Office365-Filtering-Correlation-Id: 177451e9-f312-404c-815c-08d372a50294
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB845;
	2:sUcJ4igGOuSXKAoIN5075jwbKBBZpAg6ge6XRqr3AMtvm6V9z2j7EtY2etmkQRLhMUICdsKUkuMaRIy9AgIlATbMCqsG76QOF7CtD3EBKB4BQK+tMJce9xZL5b6rAW3+ixDZvZKFqH5AG6Qmkqonlp6/XM+FPLIgl8/lR0tuo4HL/qzY/nsrmgmI6jfaCJpn;
	3:1aZKRkCqhmsNpxP1Wp3naiiGcSAzbCmUnFFF8bp9Rrf5J8TJS+IGF9JcCRW+pXVJQpn893So0zv04CE/c8M7ps9kAlfKeG0iacJRFC5CeYUD5onoPai+mSvCOx1uJmFR;
	25:Varqxj60lkIh+QPhEpdi4RTBvhXs10vBVvN2q90qFoNIt8le8MZvil5PNo8zO6uuGmqAJoudfCaU2bFqdTT4B6OcDnTS+/ZwKAQ3ChwGIQXrOd3Rpcc7ILNgKQRdbX4m5R6B3JBOX9htGhCnrIn0ZXfWmjHwLxKmzxCsGgXPDLyeyG5bzJ+GvFw5dL1GromdWDe+gWfUIfLVr2KrW/J7blk5wlEsxbDjMQ78uXeFvpn5cyCmFj1B8kv/dnVJSZIRAKSeFNkx1QR6MEn2LsDzSNcFmVFZYnugdMtb065N2BNQw1fvo2JrQ1569I7QdqI0Vlg7DFyZw9Wp2rOhF/KIcRzJR60I2lBCrAPFPdumSioW8s1c9iImHfsoNDluJJkjGZDCpraFe5k7sEpeF1xmCfVpVPqijUnoXn7quvNMS+FmlCl2r5C8oqFbnUILaN/T
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR04MB845;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB845;
	20:y20qY4RFUc0/6lKxqL7sC/Scfvrc8DTRGCn2H2N5R0PwD7MdW0VuRcZr/QmHPeytNsN4Z+KK9Npj2CD89uCAGP2WQX5xE4ak80nFU9EFecG185rV9BbYvcCjYoyTPYC4CGkEdQJjmyk/emG9uLMAHWlUgL/h18V/rzelsU8pqkrf/Gu98V8JgsQJmdKAMSWrNYJNrJmyN8SGWB8Qi0Tkq6sSR2lCrRYFJUZXQGAMbV/qsYJHHli2ORbOAmnzd58NJlfE/ldKciNC+q1bwenpuOik0ZMf1N/Ah2XoXvhjL3WcRvfTpl2X2TLD3cnEc5twNq06jYPustPHpCKoedg/qFMvQnZpupXoPsseXK5WVk48fhZ2JHja76ZZm0By0Ak560TnXgcU0J9xVwHxNuBUFZx+8mvPhFS5s0TvkxQInWYuPhdjUg4YYCGSyYx26wdKw4BebXe3GTFJnTFUxtiz2S+YHuJ3tDgZTY47b13W36GjIdM+hLTdkmUeCHR+U1gz+3BAAcwCTprO9bj50fTrVBnmT9qEtR2qPDL+gIKUr2tLPEJGIadyX8HVCL1MykMP0SwPMC+ezvuio2aWsUTQGBCsxXczk7Da/3tybTGgDeA=
X-Microsoft-Antispam-PRVS: <BY2PR04MB84591D73271054CA48637D886790@BY2PR04MB845.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(9101521095)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:BY2PR04MB845; BCL:0; PCL:0; RULEID:; SRVR:BY2PR04MB845; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB845;
	4:0Y6sNcPnZQ6a6TaE0Jmk3Ws4yvnP4i84ucbf9zoANnTc6lCSth4FYGw2fgBD3WH5p32QdIJ/VlZhWaXS67JmlQcwW/2b+Q+ZJDLq+oP0OaaAL1yN2BvH7CUA6yQYPQLrHyxriiVZ9LDKyGAPF3R1Bm9k+HJuk4883CYg/1wfXcTqYegZ7KFvbUBsY4g6BBgKrPwrUocDT0BCy0dIHOGRUAvEQSJoyDL3FwFCSaQNqc4nR1hjVQHmLRcuiJ4qxhsrbHRVIrawe2y69qfchMSlKQimeB3cvufv5PdDlom/sg15WKvi+KLXF5NRvFhQyJQbpFOGixDyZ6o37HRbhskwWnmVIARDxE1UtLKrzMapdQrP0/9dw34r1E5sPgJ57zyum+IFhQl312++Cb8zstZrPA==
X-Forefront-PRVS: 0930AAFAD9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(6009001)(377454003)(377424004)(24454002)(86362001)(1096002)(33656002)(2950100001)(59896002)(2906002)(23746002)(83506001)(47776003)(586003)(4001350100001)(230700001)(3846002)(5001770100001)(6116002)(42186005)(50466002)(92566002)(4326007)(50986999)(54356999)(76176999)(65816999)(189998001)(87266999)(5008740100001)(77096005)(80316001)(81166005)(19580395003)(36756003)(66066001)(65956001)(5004730100002)(65806001)(64126003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR04MB845; H:[10.2.33.36];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BY2PR04MB845;
	23:EKarLYmRneHy/C1ZAP7Hvf0sTO7JEywIy2xQrZ?=
	=?Windows-1252?Q?hnb2TyYZfv/p4E/y9nR/KbGzaB+O2ZObOX1oQxqh7RbwU/bJS4lyWPgM?=
	=?Windows-1252?Q?KKcxmhuqJbdgqp//vNsPBDUkq8a8+6GyEx7wUfh+3er1RTYU+X4aKk1U?=
	=?Windows-1252?Q?mv++ZoyIJ+xMxj/5h84BODDw1C/5ZoZCzHCa9HqJZ0vECiCZo2WLJD/A?=
	=?Windows-1252?Q?95dw6aD6mpMGfn4nz8w/0CYbfbxl2oijuEkPb6i00dvPvcxixj59hYlZ?=
	=?Windows-1252?Q?eJ+Ipd1GjhCC/x7B8BkX73b5OXzROii2eI/j8IX1DviJ55txWZcbETcM?=
	=?Windows-1252?Q?MiEj5mPhmrWiMH9m7DHtb1gSJnP/cvuJMKKGqzebjxrawGl05sVE3HCr?=
	=?Windows-1252?Q?vdO7kQcL3p4BOEUp5WM7HkdAp+8wRpQxZIfKOqD7rPIWspYX0BIVq6ZQ?=
	=?Windows-1252?Q?NJeBksDdkfcUXlDHrBCqRxxmTEnjfui5w+Iiz4mB1pJpQRTwumQ0Jsjh?=
	=?Windows-1252?Q?NG16j5a1M5aL0aNNBXsDqfQTUbirB2M6OG0vUCbgwzJzZMbBcznl9OyS?=
	=?Windows-1252?Q?hFypPhNIIXYccXjo0t9RfrSrzbpi2P/aW3grPxl0gIxCU2pdHEAT9sZ9?=
	=?Windows-1252?Q?mqPLOZXPz4UaAFgQwC+/CJdYGGp3zyickaZky7n7uZ2Ra7egzc7wGElM?=
	=?Windows-1252?Q?/tPqd2ItRkHKBUjUP5lrAih/skiEqnfdT3VfVldR01LATZnd3ggvnT+G?=
	=?Windows-1252?Q?q3CvGnql8HLQTB2K1sWszKzzuqxIYQ+rVom8S/svDsYnQwKsdpSkOcNJ?=
	=?Windows-1252?Q?753TLmeQEIqRrcFCG2Je4U/Lu3dOamqkMmBcxz2N80md1EjYaBtVISju?=
	=?Windows-1252?Q?fEms2h1VsNQwTF2upOWFTtq6FShQsZUGIP/2GEiFijcORkVyPDpxu50+?=
	=?Windows-1252?Q?5nHJZNgXGygYjBCC7/7aO/g/ac8ulT4i8hEdHY4xGMtHappAjhejpBq6?=
	=?Windows-1252?Q?gtfYPJcCLxtBhnh+wzOFfkJ6ac9KBKXleP9SvOvwgxiF9ZWZLa58DvNS?=
	=?Windows-1252?Q?c5FMlZTqVZfHzEpsUIxgZaVUdYHPZPzcExHJOekjyUbqoqntm54GGYVO?=
	=?Windows-1252?Q?VKqCpHGSqtWedonpQt1HWdN77uALa/8m6IiTFyn3478EPkVsF7St1wuj?=
	=?Windows-1252?Q?c0wwZvZD2nqOAzw7L5jfLA307oRh8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB845;
	5:1tZ8asy7rJtDdN/5gQqgGbMcquUIYqgbYSV+ZHLTcImRaXEhV1eOAETId5z7WewjozV2aBjZXCOf7sLYIfApv+OvPZY91VQkPasYtbnKuceNrYWZTE17X0BERNy+MOtBuErAlIHzymcuWg3Tz/yMKw==;
	24:BEkB8s3IlS8ItCzmBnPL/iFqd6ZUNyOPYnH5iPZAvdJIcyAGdosxzjAwh5dIsSu054bqL4o+SmpbjDFnMOUVKtlRrjUrVhpcHACa+iDEG88=;
	7:nR81GyznN+f2xuPET3tFiDw7v+PMEc9QNgskwaA/p/vp5S/usapNmQj2a926pLf5Jp0o14+KL5oamneeiP7porD+361SItPk0HKI0lCafbqriEUgsRj+/wNRdYbxBrXjwbhgLHl1x2JatBRhVfaTkYiaEU1Xxxr68w9tbDRqsImFMj041yBC/kW/9pDanjnb
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2016 16:15:42.2360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR04MB845
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/rootfs: Fix DEBUGFS generation when using opkg
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
X-List-Received-Date: Mon, 02 May 2016 16:15:44 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 05/02/2016 08:39 AM, Patrick Ohly wrote:
> On Fri, 2016-04-22 at 14:51 +0100, Richard Purdie wrote:
>> When enabling extra DEBUGFS image generation with opkg, errors are seen like:
>>
>> ERROR: core-image-minimal-1.0-r0 do_rootfs: Cannot get the installed packages list. Command '/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg -f /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/opkg.conf -o /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs  --force_postinstall --prefer-arch-to-version   status' returned 0 and stderr:
>> Collected errors:
>>  * file_md5sum_alloc: Failed to open
>> file /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/syslog-startup.conf.busybox: No such file or directory.
>>  * file_md5sum_alloc: Failed to open
>> file /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/fstab: No such file or directory.
>>
>> basically for all CONFFILES in the image. This is due to the file
>> rearranging
>> the rootfs generation code does. If we preserve the /etc directory,
>> the avoids the problem.
> 
> It avoids the problem, but it does not address the root cause (IMHO).
> Should opkg really complain about missing configuration files? It is
> perhaps an edge case, but besides editing a configuration file
> *removing* it entirely may also be a valid user modification.
> 
> The usage of opkg here is during image building, but the operation
> itself (opkg status) is not specific to image creation and thus should
> be able to handle arbitrary states of /etc and the config files in
> general.

Opkg status is supposed to give you the state of all your installed packages.
Currently is pretty rough data: it dumps into stdout the internal metadata that
tracks package info and promotes to error any inconsistency, like conffiles not
being present.

Looking at pacakge_manager.py, opkg status is being called on OpkgPkgsList.
Seems to me that if the purpose is to get all installed packages, then "opkg
list-installed" is the correct command. Looking at dpkg (DpkgPkgsList),
"dpkg-query -W" is being called, which I think maps to opkg list-installed, not
to opkg status.

-- 
Cheers,

Alejandro

