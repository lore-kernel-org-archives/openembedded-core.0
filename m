Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.92.70.44])
 by mx.groups.io with SMTP id smtpd.web11.25973.1595754930395817407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 02:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=JFm/XGzP;
 spf=pass (domain: outlook.com, ip: 40.92.70.44, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MExksyx1FxiCCSxUkk5LHKWieCI8gtn3UTBsaWpEWVnccmk1WLYhhXDsb9tI8oniv0QiMa4+Z1Kl5HudjefU40SFGvrqnpwsaPzRgARmX0obBqckVlcepXfuJFCvNc2W27Kc8KXikg0LcvHvevafd3AQx+dZGPtlOBidskSv5ovFMOQMinA7Lb1oBtFw+sdxUgBcJAHe15J1ByzYdFMwf+ctZahZsblqjiFtg7vay2p2gbtusg2bggXsmEwHmxvhcjcL9yyfoKN1UEKZGyoA4qnBDEZ5rPDApj3w0qIrh9o2Pmz02M8mGcMGQioQr6uEao2CE5dZ45yaDQctlZtqow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWyohMojBd/ncX9vYSNnmWmUopWuXzzClHJJUw7mCIo=;
 b=coK64QnZjuO+sX8193eY8rwDLBGYs54Y/IKXQ2AIY6IQ0tVkoajqprpJonPWCo6naKY9IM+OICoICp5+ytMtp7M4u5zjd9rKYZ2BWDaKiUSknM/42i0HKkjpXoClMNo1K8xtq+05EIrJoDc83cIDSmeGSDLV+iJGaJYPrUGwZ+x4Mn7h8psPyU4Hy2zwNTP7HpkdjUMuLBOnPcmCNWZesULOqIv+XpUHYaOSM4082D+ZIhdlI94wzReT2BdCnSn9ihXBUnBX9fcqlQSGmd8iun49VNZVsu45BwaKkEkWGHwB+4UE86BqLpapafwX/yIWZxXuoYaOpEtz6oFDf3P5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWyohMojBd/ncX9vYSNnmWmUopWuXzzClHJJUw7mCIo=;
 b=JFm/XGzPJPs+g9ftgIBYxh4HWPtWwHvgOJX97l99jurXb1UVsljgmHhH/SNZyLWo/51w6G2rrSprvCDXgwx9089X4c1QCyskg1n0ihi4WbspQ5UZ4GX5E5x/4OOVStl6tQoZk0FopQEgy1rwTZOWXm9bURPB6vFUKiCJ7wn6dz8M3jC8Adjl33qWeSVw7ln72aKUgOic7nNWb1r6n38Kgs24G7C9yZKEZcuAuCdT1RjutySs8OaV1EYjWXATpwF46FGH0dpcB/ud3RVHMnGj/zwCv2a6BT0vh15o3FpOn72XkBYZ1BcjtiKdnkjd7oIBFaeXOuYHWqpLngEABoga7A==
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e09::49) by
 VE1EUR03HT146.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e09::348)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.10; Sun, 26 Jul
 2020 09:15:28 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e09::4f) by VE1EUR03FT043.mail.protection.outlook.com
 (2a01:111:e400:7e09::378) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.10 via Frontend
 Transport; Sun, 26 Jul 2020 09:15:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:56614DA1052CB199B4797C4AD6FC26385B7F199B4284B43E306E0CA2DCB99C1B;UpperCasedChecksum:ED50DA1901EEFFC21BEC391BA3C16910FDDD4AA23BBFAC3B08427FD80D3C7759;SizeAsReceived:8830;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3216.031; Sun, 26 Jul 2020
 09:15:28 +0000
Subject: Re: [OE-core] cve-check breaks on zeus
To: akuster808 <akuster808@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <AM7PR05MB6881998FE5ADEC576D81902CA8740@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <f1b775ff-0fbb-2444-ec91-5efea2f75868@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM7PR05MB6881A6CBED002C3B1C1C69E7A8750@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Sun, 26 Jul 2020 11:15:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f1b775ff-0fbb-2444-ec91-5efea2f75868@gmail.com>
X-ClientProxiedBy: AM6PR10CA0060.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::37) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <a1ac0f81-bd2d-37f6-d87a-fbe4235034c7@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.87.220) by AM6PR10CA0060.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend Transport; Sun, 26 Jul 2020 09:15:27 +0000
X-Microsoft-Original-Message-ID: <a1ac0f81-bd2d-37f6-d87a-fbe4235034c7@outlook.com>
X-TMN: [UWyt95HqQZ7RFUxcmEy5+oKApvm5RuKK]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 112e53dd-948f-4c4b-f62b-08d831446fd1
X-MS-TrafficTypeDiagnostic: VE1EUR03HT146:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kD9XMufYVUEpm4jkPiEKvFVqs4qIG6b0iCOqVbnPxPIq0XhPWpwAb1bcmfu1NNUwGtkjaY4Lczeh36O6UFEcwsyv5eHu+/zlg/rjyhWsMMtXDCRDQgLF6LA+6E3V8CuyRnq6cxEs4ljZr+eFeiXPtygiStBFbpCfMg3STujc5+EnMY/zm81rM2UsgogpwYP/hcYDS3V25clvMC+9OLkIm+tB6hs2UYLoy4VEnaKy3OkhwYxh6/0r2bcnhoq7Hx7r
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	uSCeAovE78GM0bXbcVu14fTIeB5sCyMeZraeZtuqF5yLGm48Wa69yJLnun5YOuPOPbO8lQcuqVbkSnJXkJ0RsovCpnCs2vWm9u5C9FhbvZ0flE6zmJVD+IeyWfnijXWyYJBVOdkOBNma1eswyogc8w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112e53dd-948f-4c4b-f62b-08d831446fd1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2020 09:15:28.0904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR03HT146
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

since last night it affects all branches I tested.
But it doesn't seem to be a format change, rather baseMetricV2 is=20
optional for some entries

e.g.

{
     "cve": {
         "data_type": "CVE",
         "data_format": "MITRE",
         "data_version": "4.0",
         "CVE_data_meta": {
             "ID": "CVE-2020-14725",
             "ASSIGNER": "cve@mitre.org"
         },
         "problemtype": {
             "problemtype_data": [
                 {
                     "description": []
                 }
             ]
         },
         "references": {
             "reference_data": [
                 {
                     "url":=20
"https://www.oracle.com/security-alerts/cpujul2020.html",
                     "name":=20
"https://www.oracle.com/security-alerts/cpujul2020.html",
                     "refsource": "MISC",
                     "tags": []
                 }
             ]
         },
         "description": {
             "description_data": [
                 {
                     "lang": "en",
                     "value": "..."
                 }
             ]
         }
     },
     "configurations": {
         "CVE_data_version": "4.0",
         "nodes": []
     },
     "impact": {
         "baseMetricV3": {
             "cvssV3": {
                 "version": "3.1",
                 "vectorString":=20
"CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:N/A:H",
                 "attackVector": "NETWORK",
                 "attackComplexity": "LOW",
                 "privilegesRequired": "HIGH",
                 "userInteraction": "NONE",
                 "scope": "UNCHANGED",
                 "confidentialityImpact": "NONE",
                 "integrityImpact": "NONE",
                 "availabilityImpact": "HIGH",
                 "baseScore": 4.9,
                 "baseSeverity": "MEDIUM"
             },
             "exploitabilityScore": 1.2,
             "impactScore": 3.6
         }
     },
     "publishedDate": "2020-07-24T20:15Z",
     "lastModifiedDate": "2020-07-25T02:01Z"
}

I guess it should be treated like baseMetricV3 - lets see if I can craft=
=20
a patch for that

BR
Konrad

On 25.07.20 16:52, akuster808 wrote:
>=20
>=20
> On 7/25/20 4:13 AM, Konrad Weihmann wrote:
>> Hi all,
>>
>> I'm just too lazy to check if that has been fixed in master already,=20
>> but since yesterday cve-check breaks on zeus for me with the following
>=20
> I think I just saw this on master. We need to check if NVD changed their=
=
=20
> format again.
>=20
> -armin
>=20
>>
>> File:=20
>> '/opt/build/poky/meta/recipes-core/meta/cve-update-db-native.bb',=20
>> lineno: 91, function: do_populate_cve_db
>> =C2=A0=C2=A0=C2=A0=C2=A0 0087:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Update db with current year json file
>> =C2=A0=C2=A0=C2=A0=C2=A0 0088:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
>> =C2=A0=C2=A0=C2=A0=C2=A0 0089:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 response =3D urllib.re=
quest.urlopen(json_url)
>> =C2=A0=C2=A0=C2=A0=C2=A0 0090:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if response:
>> =C2=A0*** 0091:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 update_db(c,=
=20
>> gzip.decompress(response.read()).decode('utf-8'))
>> =C2=A0=C2=A0=C2=A0=C2=A0 0092:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c.execute("insert or r=
eplace into META=20
>> values (?, ?)", [year, last_modified])
>> =C2=A0=C2=A0=C2=A0=C2=A0 0093:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 except urllib.error.URLError as e:
>> =C2=A0=C2=A0=C2=A0=C2=A0 0094:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cve_f.write('Warning: =
CVE db update error,=20
>> CVE data is outdated.\n\n')
>> =C2=A0=C2=A0=C2=A0=C2=A0 0095:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn("Cannot parse =
CVE data (%s), update=20
>> failed" % e.reason)
>> File:=20
>> '/opt/build/poky/meta/recipes-core/meta/cve-update-db-native.bb',=20
>> lineno: 173, function: update_db
>> =C2=A0=C2=A0=C2=A0=C2=A0 0169:
>> =C2=A0=C2=A0=C2=A0=C2=A0 0170:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cveId =3D elt['cve']['CVE_data_meta']['ID']
>> =C2=A0=C2=A0=C2=A0=C2=A0 0171:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cveDesc =3D=20
>> elt['cve']['description']['description_data'][0]['value']
>> =C2=A0=C2=A0=C2=A0=C2=A0 0172:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 date =3D elt['lastModifiedDate']
>> =C2=A0*** 0173:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accessVector =
=
=3D=20
>> elt['impact']['baseMetricV2']['cvssV2']['accessVector']
>> =C2=A0=C2=A0=C2=A0=C2=A0 0174:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cvssv2 =3D=20
>> elt['impact']['baseMetricV2']['cvssV2']['baseScore']
>> =C2=A0=C2=A0=C2=A0=C2=A0 0175:
>> =C2=A0=C2=A0=C2=A0=C2=A0 0176:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 try:
>> =C2=A0=C2=A0=C2=A0=C2=A0 0177:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 cvssv3 =3D=20
>> elt['impact']['baseMetricV3']['cvssV3']['baseScore']
>> Exception: KeyError: 'baseMetricV2'
>>
>> Cheers
>> Konrad
>>
>>=20
>=20
