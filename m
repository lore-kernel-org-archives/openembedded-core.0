Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.92.72.23])
 by mx.groups.io with SMTP id smtpd.web11.7895.1595675619903915800
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2020 04:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Mzkkhvcw;
 spf=pass (domain: outlook.com, ip: 40.92.72.23, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qmb4bVQwLfmN9oTT8rlYRu3kEqfuoMQc4Qe4dM1oyK68o/dY4eDV2hBbsS+uK9hNza/fmzSnJNP1LCFpUEcJz+VyMhus/FiBJccKoMmKSLfx20QOftBsdqb7aY9bNmWKbWahAPCj52JqrVZCzo0vMbT7Kc+0qLxLo95x5HBUuydwZrp3juc/XjiTOWEU8+cOgAHntfawq7xDznXS7sa5ToGv5ySCtu45jzuSu8koYRz/ELhVb+J8mLuo0UlnmhCA6YePUxml3D3PUluGLvlwbQi6aJQi6BGbHW+s41rBywXAgnMs2+I+c5gA23hl09inN10sgoGPpm0yRnQSwQAY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AWzkPMrFf6ZHekdzhhhymk9TFJS/9Bpsf+P+QDeMdg=;
 b=DpNS16R58lrWaaH7sPf4DcZtfpUaPYUOU6uxZ65Jlz9muvPcz0Vmbl5XTdROOiVlfkSJ7+y4nHtBB804ACDpcXNTCCTwB/Y2onLOga/AXQNlTK+v0B+vbLhhq2gh5Vv3QTtF37UfNESF688uiIezLZvVqeIbHGpcygZ9B3WSI8VtEyts2pDkXAKQwxctVhb2hTgKsRG76jF0hFgZZldYeWLMDRZllRBChKQ+GkxU04Jy/f6TwZQZbUrhri+2kq0RB7kQkA/FgSvv6qE9liA9snylp+07pfugcZzE9uvgEQ5DZa/zhO14xb0Dq885ij2Wf3kiEgQQokWfzpx4SePJcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AWzkPMrFf6ZHekdzhhhymk9TFJS/9Bpsf+P+QDeMdg=;
 b=MzkkhvcwcY4YUgMMjA/zlljXUSMGQ5bk2vSXxs2rJllQLyffm0BqrGmS3bmy+3trePshHX2oikCgaOXBnWauxKwEClXBdEyZxKR0651Y3Ow00Ik8wGCIpSjqud/36ntn44Pd44Qz9N9PS6itGcTiRWcIxKISkFnCpCT6ph0RuE6fW+ZD5Vt8S+MaG6tjjqrdAXXKh6jhn48AwL7H20fJ0NzrMN/gGoV5ChiJ/ea3i1xtlnelMJi/9bhLk/ycflxlvQVpdYFB0fxG+v+rNzbX4C8qAp40MBPysLo5P6IUVr+UYpCOAxvyez75+Hz603Y+J8ErkB1ytbCw8aDPmBTHiQ==
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e0a::47) by
 DB5EUR03HT243.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e0a::337)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.10; Sat, 25 Jul
 2020 11:13:37 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0a::48) by DB5EUR03FT042.mail.protection.outlook.com
 (2a01:111:e400:7e0a::379) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.10 via Frontend
 Transport; Sat, 25 Jul 2020 11:13:37 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:F8EEE3EB647B3E47228AD22C961D52684E3DC796A656B711A3E8C1B0F2604C37;UpperCasedChecksum:DDC82E8A6D1207BEBD84FE53BB36B2E7B61F9D98829D560A737DF4A742A7DC3B;SizeAsReceived:8571;Count:46
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3216.027; Sat, 25 Jul 2020
 11:13:37 +0000
To: OE-core <openembedded-core@lists.openembedded.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Subject: cve-check breaks on zeus
Message-ID: 
 <AM7PR05MB6881998FE5ADEC576D81902CA8740@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Sat, 25 Jul 2020 13:13:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-ClientProxiedBy: AM6PR05CA0036.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::49) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <e6b1bba0-07f0-8741-de4a-c2c456dc8908@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.80.175) by AM6PR05CA0036.eurprd05.prod.outlook.com (2603:10a6:20b:2e::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend Transport; Sat, 25 Jul 2020 11:13:37 +0000
X-Microsoft-Original-Message-ID: 
 <e6b1bba0-07f0-8741-de4a-c2c456dc8908@outlook.com>
X-TMN: [XVzyvuIJYEyEPRaQRgOUnuK4HpQLcV/4]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2511f6d1-5e30-46fe-16cf-08d8308bc713
X-MS-TrafficTypeDiagnostic: DB5EUR03HT243:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4zYnuvcl81iKg9FcVvRmca7VuC++KZtygGNIWPkssmsYFTxT76CdySCjnzLAAubwvueps3kRtjaLHcNcOz9J0TM7mYuFPbEsFN/83g+H+bJKgZbotZFo3uT3cHmunowb2DusAYGosZgRv1929RsdqO1h9f8Mt4bJ3M1DcxIE+GqNPBsedNF+DC6jpk2emGCSwKDQUdvIzJhub57wliDsnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	PaPEGRghUWERtjgBoP57mmayS1S1K8bQ8GXaHY9As4uDmsQgvT7vioX9tjg9Od7K2yYRR4UGgDHXW4GqZ4AuuXyNapCgwo3eiwmTaZsD7lOtRag8TVmxBf6Y3w7/WENyeQDe8mJ2zJE7VSIknwr5jg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2511f6d1-5e30-46fe-16cf-08d8308bc713
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2020 11:13:37.6686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT243
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

I'm just too lazy to check if that has been fixed in master already, but 
since yesterday cve-check breaks on zeus for me with the following

File: '/opt/build/poky/meta/recipes-core/meta/cve-update-db-native.bb', 
lineno: 91, function: do_populate_cve_db
      0087:            # Update db with current year json file
      0088:            try:
      0089:                response = urllib.request.urlopen(json_url)
      0090:                if response:
  *** 0091:                    update_db(c, 
gzip.decompress(response.read()).decode('utf-8'))
      0092:                c.execute("insert or replace into META values 
(?, ?)", [year, last_modified])
      0093:            except urllib.error.URLError as e:
      0094:                cve_f.write('Warning: CVE db update error, 
CVE data is outdated.\n\n')
      0095:                bb.warn("Cannot parse CVE data (%s), update 
failed" % e.reason)
File: '/opt/build/poky/meta/recipes-core/meta/cve-update-db-native.bb', 
lineno: 173, function: update_db
      0169:
      0170:        cveId = elt['cve']['CVE_data_meta']['ID']
      0171:        cveDesc = 
elt['cve']['description']['description_data'][0]['value']
      0172:        date = elt['lastModifiedDate']
  *** 0173:        accessVector = 
elt['impact']['baseMetricV2']['cvssV2']['accessVector']
      0174:        cvssv2 = 
elt['impact']['baseMetricV2']['cvssV2']['baseScore']
      0175:
      0176:        try:
      0177:            cvssv3 = 
elt['impact']['baseMetricV3']['cvssV3']['baseScore']
Exception: KeyError: 'baseMetricV2'

Cheers
Konrad
