Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.66])
 by mx.groups.io with SMTP id smtpd.web11.4640.1594327220465530238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 13:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=XHSaO3eW;
 spf=pass (domain: outlook.com, ip: 40.92.91.66, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jd9T/lSsI5cp3aO5h5VlX8nohM1928y6jxu1yG+M7geWzMC4Gx6MQhXaUsQSGTHvy1nGxRN49Am7a9cgnIf+vDv7GbdjSug9xuIkg9yclOqCaat4ps26Gk6hdoDJTQ+/rOsUMRjyT1AL6+192yVnbfNPY+Z2y3NRTnx7YKREoRiVYGE8U3FkkCO4hnQKU1zca9XwA9zNz28mQkI2FkUw90ZwLgOX7KDRb4Lq+FVsnw95+L6KvnLyuQhiVXD1H+VahPsiCo/0ySyPInAT21Wc9JjsCbBmKEHiFwFUfy58kZ+rgAjXxtY8wNX6TuDKt1n8aDmX1LUPrxOGsYUIw+8RlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3er7Xj+Hvl/D3fyWn+8RGNUwBk09moLIn98AlSeow0Y=;
 b=j1uB4Y9QmvGjRhtbIjys8FaZFn2Q0mVyXJ1tVXD8/f18gDx08TePdggIymN8wKhqyAPGjYEQO2UME9pPydHWTW4rzYgwGPzpYkNsqf4Q4BsWlOInb4gCOATGOlxOOEOL4isWK7j8/5M7rybxS8ByNSx3tY+prSP36SBUB1ZctqE30VBY5xc1fORRch2ZGQFRqgLCVcHFEv84QHITk5LpXsgMMfqYUv0YJyBQZx7oDQ3brWR6/0sLeHioABaSCjDi+FmoZpSU6ZuuM77GphYZzb/J6Kve68O/vdfHgTtHkg2U4jORVy8mi5CLo861l+OEiOwwjrlHqixXsNRijzQzGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3er7Xj+Hvl/D3fyWn+8RGNUwBk09moLIn98AlSeow0Y=;
 b=XHSaO3eWgDHP22LL8OPu16h6ZBFf6Hg3PdkmAj42WiaTxjRn4Deu2xByS5TGTRh92yp6jnsDGZvWXEdsx4dFHAub2UsVneWMp1UnFhVka8P/Z8FYIJ6nevGTzyQzOXTB3av0PVVgqHx6y/Q+NpzY+a9aaSNLALtR+wjSEKLMa6rKsFwPLzKFtaD7o1SpBnBEu/Y5ewCkhmOh18Oja+lI6OVqQRIgVolopBHV/tLkSjMsKgHg6/8Ocvzg2c4TaC8o05IiFRaYcgGBSyVAGhpp6coN1glGYa+tp2L0r6qWLUsA/3OnYLXWDBvXA7vbvAWINQ0y9GXHZI8keigvYyA13Q==
Received: from VI1EUR05FT060.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::40) by
 VI1EUR05HT154.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::90)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 20:40:18 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::47) by VI1EUR05FT060.mail.protection.outlook.com
 (2a01:111:e400:fc12::87) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Thu, 9 Jul 2020 20:40:18 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:26887061BC1C10FDC48396B1459E5BD0592AC43F6ED80ECE810DDB371E2E6370;UpperCasedChecksum:AD7C635FDE3D58FC3461BF5B8B8967F4883E0E4B566DCF37EF5FF149C5C93383;SizeAsReceived:9031;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3174.021; Thu, 9 Jul 2020
 20:40:18 +0000
Subject: Re: [OE-core] [PATCH v2] rootfs-post: remove trailing blanks from tasks
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: Alex Kiernan <alex.kiernan@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <AM7PR05MB6881E512124C27A177984016A8640@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <CAO5Uq5TimYvfuX=M4-4ms=4C_yHyo0pKsMfZXhSoopA7J1FhMA@mail.gmail.com>
 <1620159A4B64F2D7.18307@lists.openembedded.org>
Message-ID: <AM7PR05MB688144A495410B97E92F3EF3A8640@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Thu, 9 Jul 2020 22:40:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1620159A4B64F2D7.18307@lists.openembedded.org>
X-ClientProxiedBy: AM6PR08CA0011.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::23) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <89f76d16-10d1-00d9-fcfb-b987ff3cdea8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.150.35.214) by AM6PR08CA0011.eurprd08.prod.outlook.com (2603:10a6:20b:b2::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 20:40:18 +0000
X-Microsoft-Original-Message-ID: <89f76d16-10d1-00d9-fcfb-b987ff3cdea8@outlook.com>
X-TMN: [OLPXUiDzXzROXlRS060n/wSfVkUgJxM2]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1950b889-ba76-40aa-e653-08d824484ab9
X-MS-TrafficTypeDiagnostic: VI1EUR05HT154:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bdte/YP82bWenwqE6BC7p0FefrqV0l1Nwbd9CJ+A9MT9819klOo1SnU8M5iO9TuuNJeJSQIMd2St/zZEPsHGDrMR8LkEWc5ewbVNLw7bxGsS+YB5FLCS028xD1c44cvUN4Udl63AKwoc/jTkX7UfAEsUoswTKW7Hb0zqPV5HAYP4lsbnL+defLGWh13r1zss85ErFUEk9ph6PaygmZ8W0KkNkWxMlikH8AkYRO9erHHrpJURnDA83SAA9ppi75hF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	jFC3YvRz8mkkZgqHw8ANyO6ys7IeU0Gb60NMVuBu729LJrai/t2w4IktsfeCuodG8DdSk0ETGinhkpVgcx4fAXmUrRJXLGzw7+8atxHmR8ZHoRhCVstjWowDJhTfFpTaYxs6o+084mpPsjzXu1I0BQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1950b889-ba76-40aa-e653-08d824484ab9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 20:40:18.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR05FT060.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT154
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I narrowed it down to be in the PLY state machine of=20
bitbake/lib/bb/pysh/pyshyacc.py.
I'm not really familiar with PLY but to me it seems that the transition=20
from "empty > separator_op" or "separator_op separator_op" isn't=20
designed in.
Still I hope this helps and somebody could fix that, as I consider the=20
rest of the code to be safe in terms of executing the resulting script.

On 09.07.20 14:33, Konrad Weihmann wrote:
> Yep, I suspect the resulting empty shell statement to cause problems -=
=20
> if I'll find some time later, I can take a deeper look into it
>=20
> On 09.07.20 13:57, Alex Kiernan wrote:
>> On Thu, Jul 9, 2020 at 8:19 AM Konrad Weihmann <kweihmann@outlook.com>=
=20
>> wrote:
>>>
>>> remove the trailing blanks before the ;-delimiter, so one could use
>>> "_remove" to avoid running tasks like 'rootfs_update_timestamp',
>>> which are currently hardcoded and not bound to any
>>> configurable feature flag
>>>
>>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>>> ---
>>
>> I think this duplicates a change I submitted:
>>
>> https://patchwork.openembedded.org/patch/168931/
>>
>> Comment from @Richard Purdie at the time was "This does sound like
>> you're working around a bug in shlex :/", which I started to dig into,
>> but failed to figure it out.
>>
>>
>>
>>
>>
>>> =C2=A0 meta/classes/rootfs-postcommands.bbclass | 6 +++---
>>> =C2=A0 meta/classes/rootfsdebugfiles.bbclass=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0 2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/classes/rootfs-postcommands.bbclass=20
>>> b/meta/classes/rootfs-postcommands.bbclass
>>> index c43b9a9823..984730ebe8 100644
>>> --- a/meta/classes/rootfs-postcommands.bbclass
>>> +++ b/meta/classes/rootfs-postcommands.bbclass
>>> @@ -1,6 +1,6 @@
>>>
>>> =C2=A0 # Zap the root password if debug-tweaks feature is not enabled
>>> -ROOTFS_POSTPROCESS_COMMAND +=3D=20
>>> '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks',=20
>>> 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
>>> +ROOTFS_POSTPROCESS_COMMAND +=3D=20
>>> '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks',=20
>>> 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
>>>
>>> =C2=A0 # Allow dropbear/openssh to accept logins from accounts with an=
=
=20
>>> empty password string if debug-tweaks or allow-empty-password is enabl=
ed
>>> =C2=A0 ROOTFS_POSTPROCESS_COMMAND +=3D=20
>>> '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks',=20
>>> 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
>>> @@ -12,7 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND +=3D=20
>>> '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>>> =C2=A0 ROOTFS_POSTPROCESS_COMMAND +=3D=20
>>> '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks',=20
>>> 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
>>>
>>> =C2=A0 # Create /etc/timestamp during image construction to give a=20
>>> reasonably sane default time setting
>>> -ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp ; "
>>> +ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp; "
>>>
>>> =C2=A0 # Tweak the mount options for rootfs in /etc/fstab if=20
>>> read-only-rootfs is enabled
>>> =C2=A0 ROOTFS_POSTPROCESS_COMMAND +=3D=20
>>> '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",=20
>>> "read_only_rootfs_hook; ", "",d)}'
>>> @@ -26,7 +26,7 @@ ROOTFS_POSTPROCESS_COMMAND +=3D=20
>>> '${@bb.utils.contains("IMAGE_FEATURES", "read-only
>>> =C2=A0 APPEND_append =3D '${@bb.utils.contains("IMAGE_FEATURES",=20
>>> "read-only-rootfs", " ro", "", d)}'
>>>
>>> =C2=A0 # Generates test data file with data store variables expanded i=
n=20
>>> json format
>>> -ROOTFS_POSTPROCESS_COMMAND +=3D "write_image_test_data ; "
>>> +ROOTFS_POSTPROCESS_COMMAND +=3D "write_image_test_data; "
>>>
>>> =C2=A0 # Write manifest
>>> =C2=A0 IMAGE_MANIFEST =3D=20
>>> "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
>>> diff --git a/meta/classes/rootfsdebugfiles.bbclass=20
>>> b/meta/classes/rootfsdebugfiles.bbclass
>>> index e2ba4e3647..85c7ec7434 100644
>>> --- a/meta/classes/rootfsdebugfiles.bbclass
>>> +++ b/meta/classes/rootfsdebugfiles.bbclass
>>> @@ -28,7 +28,7 @@
>>> =C2=A0 ROOTFS_DEBUG_FILES ?=3D ""
>>> =C2=A0 ROOTFS_DEBUG_FILES[doc] =3D "Lists additional files or director=
ies to=20
>>> be installed with 'cp -a' in the format 'source1 target1;source2=20
>>> target2;...'"
>>>
>>> -ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_debug_files ;"
>>> +ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_debug_files;"
>>> =C2=A0 rootfs_debug_files () {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 #!/bin/sh -e
>>> =C2=A0=C2=A0=C2=A0=C2=A0 echo "${ROOTFS_DEBUG_FILES}" | sed -e 's/;/\n=
/g' | while read=20
>>> source target mode; do
>>> --=20
>>> 2.20.1
>>>
>>>
>>
>>
>>
>> --=20
>> Alex Kiernan
>>
>=20
>=20
>=20
