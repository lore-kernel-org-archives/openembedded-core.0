Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.12])
 by mx.groups.io with SMTP id smtpd.web11.5902.1589007331004409359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 23:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=IJpgc96p;
 spf=pass (domain: outlook.com, ip: 40.92.64.12, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUNqhmtEa893hNKmt/jgd7fxkcMYsSgX8H1uOlEeLbNT2aTc44Vti6DquT/3KLHZXoSxNC4cboB0JkXScq57OyIM8Kzka8BBGP9RuPkTolaD4vifU8BQVFD2oCOejzDLhLBpwwqynNvVISTLQQn7CjIf2naCmYR2iz381J3ZV4qQp5CK+MHQ9aAQqrUM9QmXx3jEmhOrxUtKdwshRXPosmXlgCR0+dgeRK1nOgNXl+bX8tZB+FjEUtWfQ5WzNn3h5LHnOqB2KiSZnGk2czJCo40JZMkFeghzrQa3UtDTXFiR4E8+AAmc2V4yQNAdLzvo1xA1BYQEGgdnu/7gAbebMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivXoDk96wpT6W+zXsswxROEVDybQYZB6cjJwLggJl9c=;
 b=T7+XBWz9aY4BI04lxQ9jvBCHH8Nhkg2uZhXxTEI81p/w4YO3ELQgVNXq3zAfmvsP9FaA3zdD7WGuSlud28imu0zlfpwvVRLquE2XejWw+aoAbP115zEFbfzmpCT6+Mj7EGi+96RiFF7fD1AKigCsL43G+gK2WM9q2uXvIOekr7QRI7wLhxGw486dILEypKd8XSqVCGlEegY92m0Pgw/AolJg5vU6OqC3GTOhRXiJYBLe/2yzajcWgLTqJBSZ+qKAHyfOWN9SxwbmFUFRdCDFYIbEFLUtUhO0G76WEQLyOxLDsqebFHiyr01Kfa4jQxXpe38npPWiCKmOfjUDi6OIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivXoDk96wpT6W+zXsswxROEVDybQYZB6cjJwLggJl9c=;
 b=IJpgc96p85APE3xwdXPqqRI50ifr3VnavwBvJsvmXY6KFqai0b/J1ZTBD4+x/9q5LsxE5RGtitzxseAAtG07vGDXJPJzp37LA9ICHUBiA8JFBDQu8K/m45M7+YiUQry6XDEAj3c8qfIwBe6eYA3qCe+c+bJZObzPabACSiZO7W19v6VC7YQWgCSRYmtw31scyXEw9n/WGqiNWwBrsPDJ1K8ZwZ048tzd7yWhZHdOmSiP09C3Dlm/tJyZe/vWeO+bP31xLozYKfeT/HTSIG6CtmA6tSy/XNIwk8qYdpWPRFTSRSNKWN2knGbQBzCc93t3Y/YqFuWswsQDrpVq73rY1A==
Received: from DB5EUR01FT007.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::51) by
 DB5EUR01HT053.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::457)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Sat, 9 May
 2020 06:55:28 +0000
Received: from PR3PR05MB6890.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1a::52) by DB5EUR01FT007.mail.protection.outlook.com
 (2a01:111:e400:7e1a::107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sat, 9 May 2020 06:55:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:2DE79A08D77CB5C8BF68314D061D0F734750066C79F590085C0D3C580569062B;UpperCasedChecksum:D081B806AA3EF9DB83D374AAB5520C5446A55B7E8D06F6ADF931C13C6C69D3BA;SizeAsReceived:8929;Count:50
Received: from PR3PR05MB6890.eurprd05.prod.outlook.com
 ([fe80::24da:f065:2c41:d7f2]) by PR3PR05MB6890.eurprd05.prod.outlook.com
 ([fe80::24da:f065:2c41:d7f2%5]) with mapi id 15.20.2979.033; Sat, 9 May 2020
 06:55:28 +0000
Subject: Re: [OE-core] [PATCH] pypi.bbclass: mind package suffix on version check
To: Tim Orling <ticotimo@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <AM7PR05MB6881F29B1FAD006F027D07FEA8A20@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <CANx9H-CQXEyXOU4o4x=Y_Hn-BgeK95C5cSAm4kJT59gYfSfK5g@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <PR3PR05MB6890A8531A904349FDA2EDD5A8A30@PR3PR05MB6890.eurprd05.prod.outlook.com>
Date: Sat, 9 May 2020 08:55:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CANx9H-CQXEyXOU4o4x=Y_Hn-BgeK95C5cSAm4kJT59gYfSfK5g@mail.gmail.com>
X-ClientProxiedBy: AM6P192CA0081.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::22) To PR3PR05MB6890.eurprd05.prod.outlook.com
 (2603:10a6:102:63::10)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <b448640a-893a-9a34-9514-b2f89215ce71@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (79.215.15.16) by AM6P192CA0081.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend Transport; Sat, 9 May 2020 06:55:25 +0000
X-Microsoft-Original-Message-ID: <b448640a-893a-9a34-9514-b2f89215ce71@outlook.com>
X-TMN: [7H8nafXY/4wPs6lOeOmsdNHi+/GtBDqz]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 12ec0a81-d877-419c-08e9-08d7f3e5f3af
X-MS-TrafficTypeDiagnostic: DB5EUR01HT053:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ei22zSLnXXCCvo4LEvi9j49SMQ7jmg1uTqsfNSSUzC/MKVKyugoFRk/DVB0Gbi+SbjafhW/HlNTg2eRKYRqwcS/hmGjsJXgDMEAdLQ5oQeQwGQtN4zkKiYlRetU9+t7JAKLhIHvaGJo4KrKMWDRDk/KVbLYTxTSVDW4wswMNVXzj61Lcn2/T6QukgmIWobPipS7T40kGYuUdtAcPg0K3MgVX2RdZYPDsEofBlgI/i9pymxcMhIoMdscVriyGl4l4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR05MB6890.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	iLzcoZZaQWC/qQhz8RVUzj2H0Ywfoyr+mXN7rMJkjdVfODiWB7oxEd2tMLbNlvd0roXs9sZjrY9mnY7MmCBcfh0Rk0WeP1Qx9flikSOehGwAvcnHbcgBMKTgNqXkMKm6J++28TcvNOdXbvY92jYMAg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ec0a81-d877-419c-08e9-08d7f3e5f3af
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 06:55:28.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT053
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Fully support that, it's same for me.
But then the regex is also not a 100% correct, as it will issue a=20
notification via "devtool check-upgrade-status", even for an alpha or=20
beta or dev release - and most important without the suffix, so it's=20
extra hard to identify if one should take action or not.

And even when using the "devtool upgrade" patch it will run a build=20
attempt, which will immediately fail, as the reported version is=20
present, due to the suffix being trimmed during the process.

What I could imagine is to ignore those releases by default using an=20
inverted group like (?P<pver>(\d+[\.\-_]*)+(?![a-z0-9]+)*) to filter out=
=20
those kind of releases.

What do you think?

On 09.05.20 06:56, Tim Orling wrote:
> We should only be updating to releases, not dev or alpha or any other=20
> non-released state. That is why the regex is they way it is.
>=20
> On Fri, May 8, 2020 at 4:37 AM Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>     Some pypi packages do have suffixes like dev, or a0 or b1.
>     When doing a version check on these, the version will get falsely
>     trimmed down to a version without the suffix.
>=20
>     E.g. 3.8.0a1 will become 3.8.0 which then also means that
>     a version upgrade from 3.8.0a1 to 3.8.0a2 will not be detected.
>=20
>     Fix that by inserting an optional suffix group with alphanumeric
>     charset.
>=20
>     Signed-off-by: Konrad Weihmann <kweihmann@outlook.com
>     <mailto:kweihmann@outlook.com>>
>     ---
>      =C2=A0meta/classes/pypi.bbclass | 2 +-
>      =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>     diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
>     index e5d7ab3ce1..7d0f367a02 100644
>     --- a/meta/classes/pypi.bbclass
>     +++ b/meta/classes/pypi.bbclass
>     @@ -23,4 +23,4 @@ SRC_URI +=3D "${PYPI_SRC_URI}"
>      =C2=A0S =3D "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>=20
>      =C2=A0UPSTREAM_CHECK_URI ?=3D
>     "https://pypi.python.org/pypi/${PYPI_PACKAGE}/
>     <https://pypi.python.org/pypi/$%7BPYPI_PACKAGE%7D/>"
>     -UPSTREAM_CHECK_REGEX ?=3D "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+=
)"
>     +UPSTREAM_CHECK_REGEX ?=3D
>     "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+[a-z0-9]*)"
>     --=20
>     2.20.1
>=20
>    =20
>=20
