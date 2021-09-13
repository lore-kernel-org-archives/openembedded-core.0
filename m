Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.44])
 by mx.groups.io with SMTP id smtpd.web11.31341.1631547138424001184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 08:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=NSsQhd/P;
 spf=pass (domain: kpit.com, ip: 40.107.138.44, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APnKc/is3mS+gsnBsEIKAhjoJ6gVQVxgoXKFqzlbjHmqgEfNRwuz/rEjtTgHg7LzD47w1WfIkDTFCZPAzJZsg6n5N9InkldLIzBiBbwJ28SbgkWHZw8xDaq/MxpxKOqy2YASeCB8haVZvp1+8gelgpMw/qtF7YI7xcL1Sw5iIveyx/5BJp9y26jCiBLPikkGbDTmjaQHt3Crnt62TEnRN9yPfgMXwHGKWQAB0cNz8tThbESM9e7wmVSoxSLVctDRO/fh3i0naaw7HjJJsYs5UbN/Wu4HmV8DZC2Y63aZPOMJBwBL9exkTFToUJ0vMzc1+2lToKOWMOfIrHYR3BZ5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Kmiehf0LWT3Ry9ExmdITMeAdLZ1th/hP/ln2sJVesTg=;
 b=mqdKAZEf9NwX7V43W3cqjIjCJhWjuV3sC+osnHH1FmQnzkH5DtJ1GrkwN263qLlrO3e51XPV7kKF04ASmJDDggm4dLcqPR4l55Fl9JvRXFBi1qA+pnC0SRn7zB3XhMx4mO8XxH/b+7xTsSj7hdbIKoGqJxKnMc9Il3GMQr8H3bSXRAOVNx3ne22EKjS1f4Per0BYV/UdCxdssBXZPNY9NFvIa45BaNTnHbq4jXvZOjFpPNNSxnAUPbjcuWlpcdAc9CucsoeLV5NF3N0NDcjPieq9SQl0HDtEy05RonMtILSfq+oLTguWvVS9onSiIb7OV/tG4CO4K46MvCTMgdrZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kmiehf0LWT3Ry9ExmdITMeAdLZ1th/hP/ln2sJVesTg=;
 b=NSsQhd/P9UGZggQxGnkta18XBGLAahxmBozxhZzmKrJzBf4ZCXHG6X3uI7I+x7ymEimdVx4uzhyJIcRKapSIipPsHb/FFBMn/r22YKBq9XNzyunuq9+jsRYdf27JzsJiPbkviA28jJYDqOxFHZ/ivwD5vG8Yfhsf3xwLPWMr6o4=
Received: from MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:78::11)
 by MA1PR01MB2619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:47::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 15:32:06 +0000
Received: from MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::fc3b:ff99:fe79:70d4]) by MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::fc3b:ff99:fe79:70d4%4]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 15:32:06 +0000
From: "saloni" <saloni.jain@kpit.com>
To: Steve Sakoman <steve@sakoman.com>, "akuster808@gmail.com"
	<akuster808@gmail.com>
CC: Saloni Jain <jainsaloni0918@gmail.com>, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj
	<raj.khem@gmail.com>, Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] db: Whitelist CVEs
Thread-Topic: [OE-core] [poky][dunfell][PATCH] db: Whitelist CVEs
Thread-Index: AQHXqJ1NCBsjTHEITU+ENZ7Odqy9H6uiD7oGgAAGU3g=
Date: Mon, 13 Sep 2021 15:32:06 +0000
Message-ID: 
 <MA1PR01MB41085A3DCEFB4468FA67297387D99@MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM>
References: <20210913124526.26861-1-jainsaloni0918@gmail.com>
 <16A46989BBD4976A.22787@lists.openembedded.org>
 <CAOSpxdZt_mGQr5X_v1B1dAnYL6kyJod_1L7HU2B4yaNWM2f_7w@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdZt_mGQr5X_v1B1dAnYL6kyJod_1L7HU2B4yaNWM2f_7w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 3ce97663-dff7-7555-4355-6028c6a8e389
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbc82e0c-8ca4-4db6-62c7-08d976cba507
x-ms-traffictypediagnostic: MA1PR01MB2619:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <MA1PR01MB261991AF63632D7D2A3B534D87D99@MA1PR01MB2619.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YNpBFfDyNNloBT2fI2UW+MXUNqTf+fOi1UYxCCPxeRg0Er2H8eyRTn+jzW2+GyroAgV65kVHvc73U5DDYZcEybDgQDzejwQ/jYKdRvDG29IZTttJv55jX8dszpdBEYS7sL1Smdvnr3DJayaOrklqY412JcOiBVSSWXMQ3aCk58mfk6KwsqOJKdJBs6MQOdTJSEjbPupCWRI77n7vaIr/ShGXpAvCE929TS4BFA7m0qUSgGhSLWZuh57P7papUZV4nNBX4LuG5APEuwMeFBz3/FfpMPCOULRYI1QrP6LVUEk5VrdIv2+8VuECtfuRgoZRFXqd2oZRcyR2cB3LbyFhnAtNbIfm+kW5GNxtid8OcSarT7uXwl0zhOMznp0W0l53HmZQHLTGLKCi5x2aslbLzlay98AkoEuIwmWVFV9WhDj4n5dFKOG8wa9+IQIipQK73LhyMzUk0gwKzjMzk9LfgNPrPTztXGn5fD8xyBwCFgcYur1EVVMss99Mzc+BnlcbJAJmJLzXFBUqR6Sf3eMo9iedYNDg0G3x9V3ipVxwdXU1ztS+c38n1ToYl8ECzbLnQWZ21nzcxtiFx+dm5/yzCjYtidWEkSPxoxlZMTGttEzSUZiPzD9uFwQeHQ39QA/WkQce7rZb0KgDDq4XXaN4EqSjV39FFAJ/wjR5Lue2T2JB2OlVlLaC8lMaO+Z6qST7Z7EUCu96LkvsoHoaLd6mHcD2bPpE7yOzlU6LHojFqNWm8w1LDvcyulYFHRDAw6TOgW2UvxT6INBvTTY+Mm/jz/CKNVano6BLo2qovNZ6huc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(122000001)(38100700002)(19627405001)(5660300002)(66556008)(64756008)(45080400002)(478600001)(8936002)(966005)(71200400001)(2906002)(83380400001)(110136005)(166002)(186003)(52536014)(53546011)(7696005)(55016002)(9686003)(8676002)(30864003)(76116006)(316002)(91956017)(66574015)(66476007)(66946007)(6506007)(4326008)(66446008)(86362001)(33656002)(38070700005)(54906003)(107886003)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ul2fIMrrtb+zpMVghHF+nie4qsw1SdC8vutceS5dsz4G5gRmcKVTTwcJVHux?=
 =?us-ascii?Q?yGzgWXy9qDN54crltHLz6MSdxjoPNlirStGwom0g3+Jgrwwnq+WSdroX1qaS?=
 =?us-ascii?Q?zbrBILrxHNzNdkqWPhUog511E9UJnxNrtFWKUGWvsiD7l6b/QYXDhXKrOSOD?=
 =?us-ascii?Q?Vw+rg69hHILJVt9gGr0Na7NWnYqodMB+tzQ+cHIEpSFTg49UcdWFcixMiKWx?=
 =?us-ascii?Q?P5qaJYv2anUvSJDLBcv1rgJ0I5mXrZo/EC4YkjvXSS/OXUL6lDAmuBk+dS9G?=
 =?us-ascii?Q?draL436XCajroRqFwz7lZtNIsCavzvH9CwH/6pg+efoL7XQJCzVSTWO2cG5/?=
 =?us-ascii?Q?id1IfFXtPspnWI8FEwoaVA6zYWmCGp4+mhwDFqNvY8X0TlGB+a2KuRnAQon5?=
 =?us-ascii?Q?yr8mpdbVef8P4Q7Ng/kxL7nz4IPW1aIGLok+BxIafBfu4AcDqSZ7L7HRO2Ad?=
 =?us-ascii?Q?sIpANotrs8uH3sYM6iclSytgtuxSrL6+p/Qvc7ptACF9CnXoIeRpZ8ogggaS?=
 =?us-ascii?Q?dxJKFpYpTotFkpchAJMCi8hCAscbnRlM4Wg29LORbjkqX0mTgIJ9fKVG5QZ0?=
 =?us-ascii?Q?/AW1+eWjCWNVjkvGKWzsYlaYfBbLxFjQQwxvw2Qod6DnWpqec+NMh07mz4fD?=
 =?us-ascii?Q?6Obeg2YzWiwkH/xatwix8Wjnr9LcsRgpCCslgBcLLu2X6EPsOaj+mxmF0vvo?=
 =?us-ascii?Q?XIV5as7j/oFXVdtiHj3OI9S6upgYvsWPdKy6rH5fHl0jkGVIYQGC5K9LkW1s?=
 =?us-ascii?Q?ieTTgVMTKMThhYCDSrcUZ9NbJYOmcutK+J1uN+lQGX1OrnkbJRTeT60Pe0Cm?=
 =?us-ascii?Q?1VhByFuUgbDP0taWYSKuZ46GBrCWZnM9DDDI5duKxH0xpS7SX0OF/taeqON2?=
 =?us-ascii?Q?7b4Isw5qWO9PL1Ct05ku6znTr9Q7D9iNVBrdJoJwiPTbyPnMU4UgoNZc2OOX?=
 =?us-ascii?Q?ZX3vmubupWJFaWG4iyldp/W1yEEHcvvoyEeQbPq4agiTbstUZ+TqOZU5BzWI?=
 =?us-ascii?Q?yY6l1cBxWzdCqhQ3rz7YI+UauNYyqCgqBiz2y4zLxbTOoFUG9cnLz2lY7nfb?=
 =?us-ascii?Q?Q+73u/SlDOw+9gfHQUUXSMhJldhj6eC9HZHvGV9lWdape6YJ4DvTF4gGWSVR?=
 =?us-ascii?Q?ImGEC1h42DXFfIkoXRs3LRYq+LdBXfo2qM++kIbmVmc/WUvnVg/9ZuM8mQKW?=
 =?us-ascii?Q?KF/g7Rfjlg5cM7oI5KMEvCiIPkmioiD+GG3IBDV9WUkbHP5D0CkaO11oDX+R?=
 =?us-ascii?Q?+6OxYmKv4VG4GdMVIJoKJUal+ul2QOH//k12o/zS6By1VaTK+FyWDPCFyqb2?=
 =?us-ascii?Q?8L+RtPjuFuUhhoD1377oZkWhcsGykzc7h2b1VS8B75Pyytuz5cd2OJ2T8pY6?=
 =?us-ascii?Q?BwIlncaCiHIhuJxziM+0m93UHGQg?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc82e0c-8ca4-4db6-62c7-08d976cba507
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 15:32:06.6450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +u0ZFP91SX1zJtpZpJ3pSZfikvR/EzHxgBOe2rOwpGoUfzlAVA07a+GuLkPC5IE9fPnI58O2/0YMCDaKwanydQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB2619
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB41085A3DCEFB4468FA67297387D99MA1PR01MB4108INDP_"

--_000_MA1PR01MB41085A3DCEFB4468FA67297387D99MA1PR01MB4108INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Armin, Steve,

Thankyou for the review!
I am triggering a test run after reverting the changes, would update once I=
 have the results ?

Thanks & Regards,
Saloni Jain
________________________________
From: Steve Sakoman <steve@sakoman.com>
Sent: Monday, September 13, 2021 8:32 PM
To: Steve Sakoman <steve@sakoman.com>
Cc: Saloni Jain <jainsaloni0918@gmail.com>; Patches and discussions about t=
he oe-core layer <openembedded-core@lists.openembedded.org>; Khem Raj <raj.=
khem@gmail.com>; Nisha Parrakat <Nisha.Parrakat@kpit.com>; Saloni Jain <Sal=
oni.Jain@kpit.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] db: Whitelist CVEs

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

On Mon, Sep 13, 2021 at 4:56 AM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> On Mon, Sep 13, 2021 at 2:45 AM Saloni Jain <jainsaloni0918@gmail.com> wr=
ote:
> >
> > From: Saloni Jain <salonij@kpit.com>
> >
> > Below CVE affects only Oracle Berkeley DB as per upstream.
> > Hence, whitelisted them.
>
> I suspect that a cleaner solution might be to revert:
>
> db: update CVE_PRODUCT
> (https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.=
openembedded.org%2Fopenembedded-core%2Fcommit%2F%3Fid%3Dad799b109716ccd2f44=
dcf7a6a4cfcbd622ea661&amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50b=
e2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6376=
71421956436940%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DQMCJw%2FfFm82vPD%2BpDaSck=
5W7hUutTs39r%2FJKxCUk9U8%3D&amp;reserved=3D0)
>
> which adds berkeley_db to CVE_PRODUCT
>
> I did a quick test and this eliminates all of the CVE's below. And of
> course it makes sense to only check for oracle_berkeley_db since that
> is the source code we are using.
>
> Also, this same issue is present in master, so any fix would need to
> go there first and I will cherry-pick.
>
> Could you confirm that this approach works for you too?

And for those who are wondering why the db CVE's don't show up in the
weekly reports, it is because the script that Ross provided me many
moons ago whitelisted db and db-native.

I figured he had a good reason for that, so I left it in for
consistency with the reports he had run :-)

db and db-native are the only whitelisted packages for those who might
be wondering.

Steve

> > 1. CVE-2015-2583
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2583&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DfSTScw44lUI4qycejRW2jLlbjqQvYZKUQhytyXGlNbQ%3D&amp;reserved=3D0
> > 2. CVE-2015-2624
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2624&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DxW4VT6muPbocpKxehCFMF4ojU8akMPyWnbxRduTNs6Q%3D&amp;reserved=3D0
> > 3. CVE-2015-2626
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2626&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DyO8cLnIGCFvWzcw%2B2H0oG5900jInxy%2BgjU9tQox6RIc%3D&amp;reserved=
=3D0
> > 4. CVE-2015-2640
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2640&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3Do4N90heboZE7XV5uHDijGTXZkg6XchKW8H1ZzM34rGc%3D&amp;reserved=3D0
> > 5. CVE-2015-2654
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2654&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DX1cVGqk6PCSeMU9EBMGsuXro4WcZUTUjF3a4HF7g6nM%3D&amp;reserved=3D0
> > 6. CVE-2015-2656
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2656&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DoFOQcHH4nlSdBQ4HvGDSwWuRp%2BLswX0J9pa6F%2FyIBRI%3D&amp;reserved=
=3D0
> > 7. CVE-2015-4754
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4754&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DCw4zdD%2FJPFzjxCCSP5RgPj%2FAox%2BN%2FGEzCHlZtlGbZQ8%3D&amp;reserv=
ed=3D0
> > 8. CVE-2015-4764
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4764&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DLGOEPqGAa3ifKXxZW%2FVO5TmCHgdCmyt%2BN7ZA%2FQ8rguk%3D&amp;reserved=
=3D0
> > 9. CVE-2015-4774
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4774&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3Di3MQaM9xd0ZgmpHsV8aYGycRbYaZvlPQxHveQyr4UYY%3D&amp;reserved=3D0
> > 10. CVE-2015-4775
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4775&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DVnzYPX3J24diVtyedP81biRmwxdavDXK7pBjIWv6kd8%3D&amp;reserved=3D0
> > 11. CVE-2015-4776
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4776&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DSzL3t6rsdE4h1kU%2FA6%2Bb%2Bf%2Fjqpgb0dlMdc4zlYrj1o8%3D&amp;reserv=
ed=3D0
> > 12. CVE-2015-4777
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4777&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3Dt3UohudchaM8ZJZV4oYvj4IJ38Bduh0oB1lHKUCewSg%3D&amp;reserved=3D0
> > 13. CVE-2015-4778
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4778&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DmXwzFlWfd%2FG6%2F4d5t2NomyEo03fOlDBcDL1DDczlzZU%3D&amp;reserved=
=3D0
> > 14. CVE-2015-4779
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4779&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3D5YucvGHDQkQAvElBlCwKZujJ6%2FG6qQw08cQ0k8u8sZA%3D&amp;reserved=3D0
> > 15. CVE-2015-4780
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4780&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3D4UD6W4UiY7wiQqYTl%2B2CEeccElryBEqaNDlOcQ9mSvA%3D&amp;reserved=3D0
> > 16. CVE-2015-4781
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4781&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DCBCSzSRLtN%2FBzl7gLmkvuhGfMTUP135%2B1ZPSQiz2D08%3D&amp;reserved=
=3D0
> > 17. CVE-2015-4782
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4782&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DFKY1KcwEvkD4BEy6jQ7sbVZH1OBGMLztkDj4drnsBIA%3D&amp;reserved=3D0
> > 18. CVE-2015-4783
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4783&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3Dd0wt3ZJ9UT92HENr1%2BYIsrlq7MlB3LX5z9lfW0nDtco%3D&amp;reserved=3D0
> > 19. CVE-2015-4784
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4784&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3D7o5gRYxijUhG2D5boMYe1OD76%2FQ8klyVja%2BNjJ2%2Fkg8%3D&amp;reserved=
=3D0
> > 20. CVE-2015-4785
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4785&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DkIWv8xwCxETVe1JmQlR04rP65hJzZ1CKZhsdSnj9jHg%3D&amp;reserved=3D0
> > 21. CVE-2015-4786
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4786&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DXgIihTf1yiXRL6olzZoCV%2BUgMM8ixLGE0AYs4qw5Ww8%3D&amp;reserved=3D0
> > 22. CVE-2015-4787
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4787&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3D8oxzgSAyO2tev8BExeNuM07mfEtfg4DyC0IHv5PKU04%3D&amp;reserved=3D0
> > 23. CVE-2015-4788
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4788&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DkXnkpBnx8S39wEwc27YF0nd6OivYK38gBbsTvsvjH7c%3D&amp;reserved=3D0
> > 24. CVE-2015-4789
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4789&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DJCTC5XPdev3VaHt9PA0eExnT5B90EcwGVtqBHj1pqRg%3D&amp;reserved=3D0
> > 25. CVE-2015-4790
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4790&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DROkJAKPAsVmzWbhUyABgaoELODz5%2Be3h8Csc9iBBPVk%3D&amp;reserved=3D0
> > 26. CVE-2016-0682
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0682&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DKFPlP8B1g1L6RrkuYgH7tPnskayAhb3E9LGez5PWUBw%3D&amp;reserved=3D0
> > 27. CVE-2016-0689
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0689&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DbWQe2GU072%2BDpA7w8Yh%2FM5B27iHH7g19lJH9SFNIDsA%3D&amp;reserved=
=3D0
> > 28. CVE-2016-0692
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0692&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3Dv8T8c955i4zY0QKC%2FsCGmI6MxmdeKBsuT4YqPeR9v80%3D&amp;reserved=3D0
> > 29. CVE-2016-0694
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0694&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3Dkb8X0QDr%2BH239JXs%2FKUxwIlGz%2BA2SPFwe1EDCkB0Mns%3D&amp;reserved=
=3D0
> > 30. CVE-2016-3418
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-3418&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3D2jNdn5Ei%2F5%2BocXpopgUNlioCMGvee8ps1r9WvRIw%2BBs%3D&amp;reserved=
=3D0
> > 31. CVE-2017-3604
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3604&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DNd8t%2BJJ%2FYn%2ByiV3CN3wa7%2B1YZVNT2%2By%2BJrWV7d4Wc%2FM%3D&amp;=
reserved=3D0
> > 32. CVE-2017-3605
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3605&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DGExxG9UOd9F1AEkZ%2FHYaI42s4fPvsGU2NPNly9VoC8w%3D&amp;reserved=3D0
> > 33. CVE-2017-3606
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3606&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DSmwLj0q4CXfufByOslu3Ex3tA6%2BMy%2BsSnDqWA3WJJao%3D&amp;reserved=
=3D0
> > 34. CVE-2017-3607
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3607&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3Dx%2BofQvZBVvcFCayuopxhBC3ow81fXBSbNUSVFV0f2Ss%3D&amp;reserved=3D0
> > 35. CVE-2017-3608
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3608&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DwZSH49pD%2Bw%2BhqZrPfGi%2BzK%2B4y66w5ea8nFut7ZthqHM%3D&amp;reserv=
ed=3D0
> > 36. CVE-2017-3609
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3609&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DkOgCwCIKRRccp%2FilFi1KlVGyve%2BLOnaH1OacUqd%2Fl6w%3D&amp;reserved=
=3D0
> > 37. CVE-2017-3610
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3610&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DZCDEQ1%2B2RQqUrwtru7Z1p1cYfNplNTx6iBoG70yB9d4%3D&amp;reserved=3D0
> > 38. CVE-2017-3611
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3611&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3D%2F1qT%2BVz8YlvB0OYolO2skqnL0gldW2CARgVqViDmbJE%3D&amp;reserved=
=3D0
> > 39. CVE-2017-3612
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3612&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DO7yjSBYHBed7kL9ZUlBLDcB9Mb3mMzBFp4vcg5RUX4Y%3D&amp;reserved=3D0
> > 40. CVE-2017-3613
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3613&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DMx5LWkNdzMvyRrmJY7Se5my%2B6E9dYXY1Twbl1tQv39s%3D&amp;reserved=3D0
> > 41. CVE-2017-3614
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3614&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DPpdDjvTxr3uAsl2spHZMpn81X3puECgncJD28%2By76mQ%3D&amp;reserved=3D0
> > 42. CVE-2017-3615
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3615&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DRt7KrbK76tTP8Ujz0pWhkMNWN3KdcJNfApuixIIAgrQ%3D&amp;reserved=3D0
> > 43. CVE-2017-3616
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3616&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DWMOxG6LvJ5oDW3onPdUudoOGhR1ydmm%2FNM22p4knfrY%3D&amp;reserved=3D0
> > 44. CVE-2017-3617
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3617&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DBxOhS4rBYTPJaBbD4oB8s%2B1GmnYZ7r%2FMcgq6UGMIopc%3D&amp;reserved=
=3D0
> > 45. CVE-2020-2981
> > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-2981&amp;data=3D04%7C01=
%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DNAo7A0M9DfJCg4Ayz0hKetVs7vU6owOO%2Bg6iDTgxMJM%3D&amp;reserved=3D0
> >
> > Signed-off-by: Saloni <jainsaloni0918@gmail.com>
> > ---
> >  meta/recipes-support/db/db_5.3.28.bb | 92 ++++++++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >
> > diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-suppor=
t/db/db_5.3.28.bb
> > index b2ae98f05c..000e9ef468 100644
> > --- a/meta/recipes-support/db/db_5.3.28.bb
> > +++ b/meta/recipes-support/db/db_5.3.28.bb
> > @@ -39,6 +39,98 @@ SRC_URI[sha256sum] =3D "e0a992d740709892e81f9d93f06d=
af305cf73fb81b545afe7247804317
> >
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ded1158e31437f4f87cdd4ab2b86=
13955"
> >
> > +# Below CVEs affects only Oracle Berkeley DB as per upstream.
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-2583&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Dqfs66cBsbBauNX8iC%2F9Ii2Oq35s12T9EYc415eJzbAQ%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2583"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-2624&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DjXXNq74r4MFYvx30viObvu7c5F6S6WXUDAklwCeEhuo%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2624"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-2626&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DOMKc6RkLzlSpE%2BMeNW7MYTt8xnAcxs65u7lVNaAm0M4%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2626"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-2640&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DD%2BxdYSDrv%2BXV7hBhY73aeu8%2BhNn5qweWDUv8Yy6Bqow%3D&amp;reserved=3D=
0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2640"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-2654&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3D691iFpIxrO8mhrP2OzZSGdFAG6f%2BPli4iy61VIieaxg%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2654"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-2656&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DlaiW9gSHlQBl8DpGSM5i56RGE8li5bib25vBRpf56UQ%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2656"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4754&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Dyl28kS0qy5I0fAGlIRe2IvF73qVd%2FVi4XWhLHJVFv0c%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4754"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4764&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Dyf5HunyI7%2Fd0gQw1lk%2FC5oQmGTwGFuREMkSJB%2BoRT1g%3D&amp;reserved=3D=
0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4764"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4774&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3D8iOL7TJs0WSIpDubsmCyPUq%2F%2F4figBq3gCP6Gm7vKj0%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4774"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4775&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Dp1df2rDNtaPc%2BOkhabyRTMpDxI1ZhOIdcrf4QtulOmY%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4775"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4776&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DiICHEmfynDGXtoK%2FF7PNIXCiOn6rOLvRvd5hQSHqLTg%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4776"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4777&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3D2tRQSJmqg48Y8Ifr43FEAqOhQ97HJ4z5zItGkUj0tXM%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4777"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4778&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DuHnx0Vc%2BvZuwr4envYA1hOfdOHtPJn49gze1yBWFxo0%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4778"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4779&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DGmVsx%2FnDu8U3dd4xF5lPUbTsedaCDDwJ5GSf4ctIZfA%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4779"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4780&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DhOHXVNaUXRUAsIbsussTJJJeBb5T%2ByUCt%2BKt0iZBEAI%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4780"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4781&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3D%2F7qozIiOGzvZt4BXGtNaSxVlK3poteQGgSgBVJ%2BmF6g%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4781"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4782&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3D%2FNYUlRPOFTnV0E69%2FleienOYTjTzUlUjKua1leNv9MQ%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4782"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4783&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Di0nQuzdT5PRaFxQvWJxK%2FOhoDGgUKH0hjZI0B1Tg47w%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4783"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4784&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Dd96RPRCv%2FebxsPAqLGV%2FtYRmUtqW9%2BdkGzjtoVf9avg%3D&amp;reserved=3D=
0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4784"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4785&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DhE%2FDqgq2YnThAi%2B5aPHDazMfYbu9AhIAEPUa3jVeZLg%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4785"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4786&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DGtBnlO8chf45RHFjcGZ5e8GuLg%2B3BUADi283bRW%2BLDA%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4786"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4787&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Dcx4Dh6nHU8AsP%2BHhfzVFVh4cmdXFNjKM%2FYPdC%2Ff9Os4%3D&amp;reserved=3D=
0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4787"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4788&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DgPVRvYk2K8bP4Iq%2BlzwoEXI9Sq0FdIeRG0jMxQ3WoyU%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4788"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4789&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3D%2Faqxgw%2BzrkdZF22IqNlfCtOytxdGUlHxBdrD63wGmwY%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4789"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-4790&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Dyx4LmiWmmSJsauVeGAboNAFTEq3eLXwwLppy3le7Sk4%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4790"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2016-0682&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DGlpW%2BxkAayQz5bt%2FDzZ4fqB6HvbAlhph%2FLwcnkKlPeo%3D&amp;reserved=3D=
0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2016-0682"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2016-0689&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Ds7id2zjKiYECNybaLgx57ZkFXETtcbACJsKPqds4XC4%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2016-0689"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2016-0692&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DziBoqN8lkMsYyzlBPd0DjLfUW9lFC5%2BM5YyeopPdrVM%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2016-0692"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2016-0694&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Dl0K3eeT4sfU0cDEib8%2BT3FTGqKhQx6V2qmcAbocnGAA%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2016-0694"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2016-3418&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Da9iUyPv%2FV6su%2FYpfb5uiqXkzCkRXhmG4WB3qSzpZZ%2Bw%3D&amp;reserved=3D=
0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2016-3418"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3604&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DRLM7HsHLAnJJ2oDMngOg9VslALP24bZasqZsmuRSuwY%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3604"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3605&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DlTX2UqWgRQH6XqUQ3hpzXgD1Cffpb4ystmu8VIjKslg%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3605"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3606&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DsTo3BMNf%2BDXPdLhSqfROCha6HiFZu2K%2BBOpWkoQImko%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3606"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3607&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3D07mPl1AkFjBMKTgcEwkX%2FUZsESTKfwj2dYZxo6v2mas%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3607"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3608&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3D6S7Qh5kgXhiKWCKlhqAEX3lBrPMo0%2Buqm3UK3r%2BJdCE%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3608"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3609&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DxM209vJ5hYrzko7xVEv%2FAToGI4VfJJYBXGrl6sNRMio%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3609"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3610&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DlLQpJgJhvnnKE%2FUpPcuFwfz%2BX1tG8tkn%2Byq0oDD2XHY%3D&amp;reserved=3D=
0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3610"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3611&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DUkuqVmbT0olqjuQxHxk2n65LJQjIAv%2B2N1I3thqTkQQ%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3611"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3612&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DccrTxlAbNJ5IDd1h2nmFw%2FaQ1hHXpxO1VBCjah8ZWvQ%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3612"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3613&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DW%2BT3TMDHZZgbuFHhiBUHt%2BG0B9EWGXd8QzGjnxAn93Y%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3613"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3614&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DZBQd4BtFG5xJPf4XhgAXaOT7%2BNGC92c8QRa%2FPuCzFDo%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3614"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3615&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DAIveZqlackZdBo%2Bk0OAyax79uIaI9abJ5vYIJovt2%2Fk%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3615"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3616&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DMYu07%2FXam457qEhuiCBPy%2FNX9llHyLVb628WXJvnwJc%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3616"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2017-3617&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DyqZ0FQqRl8G4H7nxS%2B4g%2BQXJ7iGO7qWem7d8mjZ5KqU%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3617"
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2020-2981&amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Dguy1TMaaiYsbZDs6tlMIrQnvj80mKChvvukqWSlbRaw%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2020-2981"
> > +
> >  inherit autotools
> >
> >  # The executables go in a separate package - typically there
> > --
> > 2.17.1
> >
> >
> >
> >
>
>=20
>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MA1PR01MB41085A3DCEFB4468FA67297387D99MA1PR01MB4108INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>Hello Armin, Steve,</div>
<div><br>
</div>
<div>Thankyou for the review!<br>
</div>
<div>I am triggering a test run after reverting the changes, would update o=
nce I have the results
<span id=3D"&#55357;&#56898;">&#55357;&#56898;</span><br>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><br>
</div>
<div>Thanks &amp; Regards,</div>
<div>Saloni Jain<br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Steve Sakoman &lt;ste=
ve@sakoman.com&gt;<br>
<b>Sent:</b> Monday, September 13, 2021 8:32 PM<br>
<b>To:</b> Steve Sakoman &lt;steve@sakoman.com&gt;<br>
<b>Cc:</b> Saloni Jain &lt;jainsaloni0918@gmail.com&gt;; Patches and discus=
sions about the oe-core layer &lt;openembedded-core@lists.openembedded.org&=
gt;; Khem Raj &lt;raj.khem@gmail.com&gt;; Nisha Parrakat &lt;Nisha.Parrakat=
@kpit.com&gt;; Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [poky][dunfell][PATCH] db: Whitelist CVEs</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
On Mon, Sep 13, 2021 at 4:56 AM Steve Sakoman via<br>
lists.openembedded.org &lt;steve=3Dsakoman.com@lists.openembedded.org&gt;<b=
r>
wrote:<br>
&gt;<br>
&gt; On Mon, Sep 13, 2021 at 2:45 AM Saloni Jain &lt;jainsaloni0918@gmail.c=
om&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Saloni Jain &lt;salonij@kpit.com&gt;<br>
&gt; &gt;<br>
&gt; &gt; Below CVE affects only Oracle Berkeley DB as per upstream.<br>
&gt; &gt; Hence, whitelisted them.<br>
&gt;<br>
&gt; I suspect that a cleaner solution might be to revert:<br>
&gt;<br>
&gt; db: update CVE_PRODUCT<br>
&gt; (<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fgit.openembedded.org%2Fopenembedded-core%2Fcommit%2F%3Fid%3Dad799=
b109716ccd2f44dcf7a6a4cfcbd622ea661&amp;amp;data=3D04%7C01%7CSaloni.Jain%40=
kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DQMC=
Jw%2FfFm82vPD%2BpDaSck5W7hUutTs39r%2FJKxCUk9U8%3D&amp;amp;reserved=3D0">htt=
ps://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.openem=
bedded.org%2Fopenembedded-core%2Fcommit%2F%3Fid%3Dad799b109716ccd2f44dcf7a6=
a4cfcbd622ea661&amp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2=
a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671=
421956436940%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DQMCJw%2FfFm82vPD%2BpDaS=
ck5W7hUutTs39r%2FJKxCUk9U8%3D&amp;amp;reserved=3D0</a>)<br>
&gt;<br>
&gt; which adds berkeley_db to CVE_PRODUCT<br>
&gt;<br>
&gt; I did a quick test and this eliminates all of the CVE's below. And of<=
br>
&gt; course it makes sense to only check for oracle_berkeley_db since that<=
br>
&gt; is the source code we are using.<br>
&gt;<br>
&gt; Also, this same issue is present in master, so any fix would need to<b=
r>
&gt; go there first and I will cherry-pick.<br>
&gt;<br>
&gt; Could you confirm that this approach works for you too?<br>
<br>
And for those who are wondering why the db CVE's don't show up in the<br>
weekly reports, it is because the script that Ross provided me many<br>
moons ago whitelisted db and db-native.<br>
<br>
I figured he had a good reason for that, so I left it in for<br>
consistency with the reports he had run :-)<br>
<br>
db and db-native are the only whitelisted packages for those who might<br>
be wondering.<br>
<br>
Steve<br>
<br>
&gt; &gt; 1. CVE-2015-2583<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2583&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DfSTScw44lUI4qycejRW2jLlbjqQvYZKUQhytyXGl=
NbQ%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2583&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DfSTScw44lUI4qycejRW2jLlbjqQvYZKUQhytyXGlNbQ%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 2. CVE-2015-2624<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2624&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DxW4VT6muPbocpKxehCFMF4ojU8akMPyWnbxRduTN=
s6Q%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2624&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DxW4VT6muPbocpKxehCFMF4ojU8akMPyWnbxRduTNs6Q%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 3. CVE-2015-2626<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2626&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DyO8cLnIGCFvWzcw%2B2H0oG5900jInxy%2BgjU9t=
Qox6RIc%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2626&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DyO8cLnIGCFvWzcw%2B2H0oG5900jInxy%2BgjU9tQox6RIc%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 4. CVE-2015-2640<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2640&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3Do4N90heboZE7XV5uHDijGTXZkg6XchKW8H1ZzM34=
rGc%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2640&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Do4N90heboZE7XV5uHDijGTXZkg6XchKW8H1ZzM34rGc%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 5. CVE-2015-2654<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2654&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DX1cVGqk6PCSeMU9EBMGsuXro4WcZUTUjF3a4HF7g=
6nM%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2654&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DX1cVGqk6PCSeMU9EBMGsuXro4WcZUTUjF3a4HF7g6nM%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 6. CVE-2015-2656<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2656&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DoFOQcHH4nlSdBQ4HvGDSwWuRp%2BLswX0J9pa6F%=
2FyIBRI%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2656&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DoFOQcHH4nlSdBQ4HvGDSwWuRp%2BLswX0J9pa6F%2FyIBRI%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 7. CVE-2015-4754<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4754&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DCw4zdD%2FJPFzjxCCSP5RgPj%2FAox%2BN%2FGEz=
CHlZtlGbZQ8%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4754&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DCw4zdD%2FJPFzjxCCSP5RgPj%2FAox%2BN%2FGEzCHlZtlGbZQ8%3D&amp;amp;rese=
rved=3D0</a><br>
&gt; &gt; 8. CVE-2015-4764<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4764&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DLGOEPqGAa3ifKXxZW%2FVO5TmCHgdCmyt%2BN7ZA=
%2FQ8rguk%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4764&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DLGOEPqGAa3ifKXxZW%2FVO5TmCHgdCmyt%2BN7ZA%2FQ8rguk%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; 9. CVE-2015-4774<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4774&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3Di3MQaM9xd0ZgmpHsV8aYGycRbYaZvlPQxHveQyr4=
UYY%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4774&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Di3MQaM9xd0ZgmpHsV8aYGycRbYaZvlPQxHveQyr4UYY%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 10. CVE-2015-4775<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4775&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DVnzYPX3J24diVtyedP81biRmwxdavDXK7pBjIWv6=
kd8%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4775&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DVnzYPX3J24diVtyedP81biRmwxdavDXK7pBjIWv6kd8%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 11. CVE-2015-4776<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4776&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DSzL3t6rsdE4h1kU%2FA6%2Bb%2Bf%2Fjqpgb0dlM=
dc4zlYrj1o8%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4776&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DSzL3t6rsdE4h1kU%2FA6%2Bb%2Bf%2Fjqpgb0dlMdc4zlYrj1o8%3D&amp;amp;rese=
rved=3D0</a><br>
&gt; &gt; 12. CVE-2015-4777<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4777&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dt3UohudchaM8ZJZV4oYvj4IJ38Bduh0oB1lHKUCe=
wSg%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4777&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dt3UohudchaM8ZJZV4oYvj4IJ38Bduh0oB1lHKUCewSg%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 13. CVE-2015-4778<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4778&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DmXwzFlWfd%2FG6%2F4d5t2NomyEo03fOlDBcDL1D=
DczlzZU%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4778&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DmXwzFlWfd%2FG6%2F4d5t2NomyEo03fOlDBcDL1DDczlzZU%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 14. CVE-2015-4779<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4779&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3D5YucvGHDQkQAvElBlCwKZujJ6%2FG6qQw08cQ0k8=
u8sZA%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4779&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D5YucvGHDQkQAvElBlCwKZujJ6%2FG6qQw08cQ0k8u8sZA%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 15. CVE-2015-4780<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4780&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3D4UD6W4UiY7wiQqYTl%2B2CEeccElryBEqaNDlOcQ=
9mSvA%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4780&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D4UD6W4UiY7wiQqYTl%2B2CEeccElryBEqaNDlOcQ9mSvA%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 16. CVE-2015-4781<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4781&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DCBCSzSRLtN%2FBzl7gLmkvuhGfMTUP135%2B1ZPS=
Qiz2D08%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4781&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DCBCSzSRLtN%2FBzl7gLmkvuhGfMTUP135%2B1ZPSQiz2D08%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 17. CVE-2015-4782<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4782&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DFKY1KcwEvkD4BEy6jQ7sbVZH1OBGMLztkDj4drns=
BIA%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4782&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DFKY1KcwEvkD4BEy6jQ7sbVZH1OBGMLztkDj4drnsBIA%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 18. CVE-2015-4783<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4783&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dd0wt3ZJ9UT92HENr1%2BYIsrlq7MlB3LX5z9lfW0=
nDtco%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4783&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dd0wt3ZJ9UT92HENr1%2BYIsrlq7MlB3LX5z9lfW0nDtco%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 19. CVE-2015-4784<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4784&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3D7o5gRYxijUhG2D5boMYe1OD76%2FQ8klyVja%2BN=
jJ2%2Fkg8%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4784&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D7o5gRYxijUhG2D5boMYe1OD76%2FQ8klyVja%2BNjJ2%2Fkg8%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; 20. CVE-2015-4785<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4785&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DkIWv8xwCxETVe1JmQlR04rP65hJzZ1CKZhsdSnj9=
jHg%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4785&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DkIWv8xwCxETVe1JmQlR04rP65hJzZ1CKZhsdSnj9jHg%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 21. CVE-2015-4786<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4786&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DXgIihTf1yiXRL6olzZoCV%2BUgMM8ixLGE0AYs4q=
w5Ww8%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4786&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DXgIihTf1yiXRL6olzZoCV%2BUgMM8ixLGE0AYs4qw5Ww8%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 22. CVE-2015-4787<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4787&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3D8oxzgSAyO2tev8BExeNuM07mfEtfg4DyC0IHv5PK=
U04%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4787&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D8oxzgSAyO2tev8BExeNuM07mfEtfg4DyC0IHv5PKU04%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 23. CVE-2015-4788<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4788&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DkXnkpBnx8S39wEwc27YF0nd6OivYK38gBbsTvsvj=
H7c%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4788&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DkXnkpBnx8S39wEwc27YF0nd6OivYK38gBbsTvsvjH7c%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 24. CVE-2015-4789<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4789&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DJCTC5XPdev3VaHt9PA0eExnT5B90EcwGVtqBHj1p=
qRg%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4789&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DJCTC5XPdev3VaHt9PA0eExnT5B90EcwGVtqBHj1pqRg%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 25. CVE-2015-4790<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4790&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DROkJAKPAsVmzWbhUyABgaoELODz5%2Be3h8Csc9i=
BBPVk%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4790&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DROkJAKPAsVmzWbhUyABgaoELODz5%2Be3h8Csc9iBBPVk%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 26. CVE-2016-0682<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0682&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DKFPlP8B1g1L6RrkuYgH7tPnskayAhb3E9LGez5PW=
UBw%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2016-0682&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DKFPlP8B1g1L6RrkuYgH7tPnskayAhb3E9LGez5PWUBw%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 27. CVE-2016-0689<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0689&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DbWQe2GU072%2BDpA7w8Yh%2FM5B27iHH7g19lJH9=
SFNIDsA%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2016-0689&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DbWQe2GU072%2BDpA7w8Yh%2FM5B27iHH7g19lJH9SFNIDsA%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 28. CVE-2016-0692<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0692&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dv8T8c955i4zY0QKC%2FsCGmI6MxmdeKBsuT4YqPe=
R9v80%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2016-0692&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dv8T8c955i4zY0QKC%2FsCGmI6MxmdeKBsuT4YqPeR9v80%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 29. CVE-2016-0694<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0694&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dkb8X0QDr%2BH239JXs%2FKUxwIlGz%2BA2SPFwe1=
EDCkB0Mns%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2016-0694&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dkb8X0QDr%2BH239JXs%2FKUxwIlGz%2BA2SPFwe1EDCkB0Mns%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; 30. CVE-2016-3418<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-3418&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3D2jNdn5Ei%2F5%2BocXpopgUNlioCMGvee8ps1r9W=
vRIw%2BBs%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2016-3418&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D2jNdn5Ei%2F5%2BocXpopgUNlioCMGvee8ps1r9WvRIw%2BBs%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; 31. CVE-2017-3604<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3604&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DNd8t%2BJJ%2FYn%2ByiV3CN3wa7%2B1YZVNT2%2B=
y%2BJrWV7d4Wc%2FM%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3604&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DNd8t%2BJJ%2FYn%2ByiV3CN3wa7%2B1YZVNT2%2By%2BJrWV7d4Wc%2FM%3D&amp;am=
p;reserved=3D0</a><br>
&gt; &gt; 32. CVE-2017-3605<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3605&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DGExxG9UOd9F1AEkZ%2FHYaI42s4fPvsGU2NPNly9=
VoC8w%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3605&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DGExxG9UOd9F1AEkZ%2FHYaI42s4fPvsGU2NPNly9VoC8w%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 33. CVE-2017-3606<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3606&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DSmwLj0q4CXfufByOslu3Ex3tA6%2BMy%2BsSnDqW=
A3WJJao%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3606&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DSmwLj0q4CXfufByOslu3Ex3tA6%2BMy%2BsSnDqWA3WJJao%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 34. CVE-2017-3607<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3607&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dx%2BofQvZBVvcFCayuopxhBC3ow81fXBSbNUSVFV=
0f2Ss%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3607&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dx%2BofQvZBVvcFCayuopxhBC3ow81fXBSbNUSVFV0f2Ss%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 35. CVE-2017-3608<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3608&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DwZSH49pD%2Bw%2BhqZrPfGi%2BzK%2B4y66w5ea8=
nFut7ZthqHM%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3608&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DwZSH49pD%2Bw%2BhqZrPfGi%2BzK%2B4y66w5ea8nFut7ZthqHM%3D&amp;amp;rese=
rved=3D0</a><br>
&gt; &gt; 36. CVE-2017-3609<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3609&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DkOgCwCIKRRccp%2FilFi1KlVGyve%2BLOnaH1Oac=
Uqd%2Fl6w%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3609&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DkOgCwCIKRRccp%2FilFi1KlVGyve%2BLOnaH1OacUqd%2Fl6w%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; 37. CVE-2017-3610<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3610&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DZCDEQ1%2B2RQqUrwtru7Z1p1cYfNplNTx6iBoG70=
yB9d4%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3610&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DZCDEQ1%2B2RQqUrwtru7Z1p1cYfNplNTx6iBoG70yB9d4%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 38. CVE-2017-3611<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3611&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3D%2F1qT%2BVz8YlvB0OYolO2skqnL0gldW2CARgVq=
ViDmbJE%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3611&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D%2F1qT%2BVz8YlvB0OYolO2skqnL0gldW2CARgVqViDmbJE%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 39. CVE-2017-3612<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3612&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DO7yjSBYHBed7kL9ZUlBLDcB9Mb3mMzBFp4vcg5RU=
X4Y%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3612&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DO7yjSBYHBed7kL9ZUlBLDcB9Mb3mMzBFp4vcg5RUX4Y%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 40. CVE-2017-3613<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3613&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DMx5LWkNdzMvyRrmJY7Se5my%2B6E9dYXY1Twbl1t=
Qv39s%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3613&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DMx5LWkNdzMvyRrmJY7Se5my%2B6E9dYXY1Twbl1tQv39s%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 41. CVE-2017-3614<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3614&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DPpdDjvTxr3uAsl2spHZMpn81X3puECgncJD28%2B=
y76mQ%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3614&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DPpdDjvTxr3uAsl2spHZMpn81X3puECgncJD28%2By76mQ%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 42. CVE-2017-3615<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3615&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DRt7KrbK76tTP8Ujz0pWhkMNWN3KdcJNfApuixIIA=
grQ%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3615&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DRt7KrbK76tTP8Ujz0pWhkMNWN3KdcJNfApuixIIAgrQ%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; 43. CVE-2017-3616<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3616&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DWMOxG6LvJ5oDW3onPdUudoOGhR1ydmm%2FNM22p4=
knfrY%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3616&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DWMOxG6LvJ5oDW3onPdUudoOGhR1ydmm%2FNM22p4knfrY%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 44. CVE-2017-3617<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3617&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DBxOhS4rBYTPJaBbD4oB8s%2B1GmnYZ7r%2FMcgq6=
UGMIopc%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3617&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DBxOhS4rBYTPJaBbD4oB8s%2B1GmnYZ7r%2FMcgq6UGMIopc%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; 45. CVE-2020-2981<br>
&gt; &gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-2981&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976=
c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DNAo7A0M9DfJCg4Ayz0hKetVs7vU6owOO%2Bg6iDT=
gxMJM%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2020-2981&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DNAo7A0M9DfJCg4Ayz0hKetVs7vU6owOO%2Bg6iDTgxMJM%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Saloni &lt;jainsaloni0918@gmail.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta/recipes-support/db/db_5.3.28.bb | 92 +++++++++++++++++=
+++++++++++<br>
&gt; &gt;&nbsp; 1 file changed, 92 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-=
support/db/db_5.3.28.bb<br>
&gt; &gt; index b2ae98f05c..000e9ef468 100644<br>
&gt; &gt; --- a/meta/recipes-support/db/db_5.3.28.bb<br>
&gt; &gt; +++ b/meta/recipes-support/db/db_5.3.28.bb<br>
&gt; &gt; @@ -39,6 +39,98 @@ SRC_URI[sha256sum] =3D &quot;e0a992d740709892e=
81f9d93f06daf305cf73fb81b545afe7247804317<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3D=
ed1158e31437f4f87cdd4ab2b8613955">file://LICENSE;md5=3Ded1158e31437f4f87cdd=
4ab2b8613955</a>&quot;<br>
&gt; &gt;<br>
&gt; &gt; +# Below CVEs affects only Oracle Berkeley DB as per upstream.<br=
>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2583&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Dqfs66cBsbBauNX8iC%2F9Ii2Oq35s12T9EYc415eJzb=
AQ%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2583&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dqfs66cBsbBauNX8iC%2F9Ii2Oq35s12T9EYc415eJzbAQ%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-2583&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2624&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DjXXNq74r4MFYvx30viObvu7c5F6S6WXUDAklwCeEhuo=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2624&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DjXXNq74r4MFYvx30viObvu7c5F6S6WXUDAklwCeEhuo%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-2624&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2626&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DOMKc6RkLzlSpE%2BMeNW7MYTt8xnAcxs65u7lVNaAm0=
M4%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2626&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DOMKc6RkLzlSpE%2BMeNW7MYTt8xnAcxs65u7lVNaAm0M4%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-2626&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2640&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DD%2BxdYSDrv%2BXV7hBhY73aeu8%2BhNn5qweWDUv8Y=
y6Bqow%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2640&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DD%2BxdYSDrv%2BXV7hBhY73aeu8%2BhNn5qweWDUv8Yy6Bqow%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-2640&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2654&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3D691iFpIxrO8mhrP2OzZSGdFAG6f%2BPli4iy61VIiea=
xg%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2654&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D691iFpIxrO8mhrP2OzZSGdFAG6f%2BPli4iy61VIieaxg%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-2654&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2656&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DlaiW9gSHlQBl8DpGSM5i56RGE8li5bib25vBRpf56UQ=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-2656&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DlaiW9gSHlQBl8DpGSM5i56RGE8li5bib25vBRpf56UQ%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-2656&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4754&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Dyl28kS0qy5I0fAGlIRe2IvF73qVd%2FVi4XWhLHJVFv=
0c%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4754&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dyl28kS0qy5I0fAGlIRe2IvF73qVd%2FVi4XWhLHJVFv0c%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4754&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4764&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Dyf5HunyI7%2Fd0gQw1lk%2FC5oQmGTwGFuREMkSJB%2=
BoRT1g%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4764&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dyf5HunyI7%2Fd0gQw1lk%2FC5oQmGTwGFuREMkSJB%2BoRT1g%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4764&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4774&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3D8iOL7TJs0WSIpDubsmCyPUq%2F%2F4figBq3gCP6Gm7=
vKj0%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4774&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D8iOL7TJs0WSIpDubsmCyPUq%2F%2F4figBq3gCP6Gm7vKj0%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4774&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4775&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Dp1df2rDNtaPc%2BOkhabyRTMpDxI1ZhOIdcrf4QtulO=
mY%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4775&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dp1df2rDNtaPc%2BOkhabyRTMpDxI1ZhOIdcrf4QtulOmY%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4775&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4776&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DiICHEmfynDGXtoK%2FF7PNIXCiOn6rOLvRvd5hQSHqL=
Tg%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4776&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DiICHEmfynDGXtoK%2FF7PNIXCiOn6rOLvRvd5hQSHqLTg%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4776&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4777&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3D2tRQSJmqg48Y8Ifr43FEAqOhQ97HJ4z5zItGkUj0tXM=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4777&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D2tRQSJmqg48Y8Ifr43FEAqOhQ97HJ4z5zItGkUj0tXM%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4777&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4778&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DuHnx0Vc%2BvZuwr4envYA1hOfdOHtPJn49gze1yBWFx=
o0%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4778&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DuHnx0Vc%2BvZuwr4envYA1hOfdOHtPJn49gze1yBWFxo0%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4778&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4779&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DGmVsx%2FnDu8U3dd4xF5lPUbTsedaCDDwJ5GSf4ctIZ=
fA%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4779&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DGmVsx%2FnDu8U3dd4xF5lPUbTsedaCDDwJ5GSf4ctIZfA%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4779&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4780&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DhOHXVNaUXRUAsIbsussTJJJeBb5T%2ByUCt%2BKt0iZ=
BEAI%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4780&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DhOHXVNaUXRUAsIbsussTJJJeBb5T%2ByUCt%2BKt0iZBEAI%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4780&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4781&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3D%2F7qozIiOGzvZt4BXGtNaSxVlK3poteQGgSgBVJ%2B=
mF6g%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4781&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D%2F7qozIiOGzvZt4BXGtNaSxVlK3poteQGgSgBVJ%2BmF6g%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4781&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4782&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3D%2FNYUlRPOFTnV0E69%2FleienOYTjTzUlUjKua1leN=
v9MQ%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4782&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D%2FNYUlRPOFTnV0E69%2FleienOYTjTzUlUjKua1leNv9MQ%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4782&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4783&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb4">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4783&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4</a>6e4a=
26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
amp;sdata=3Di0nQuzdT5PRaFxQvWJxK%2FOhoDGgUKH0hjZI0B1Tg47w%3D&amp;amp;reserv=
ed=3D0<br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4783&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4784&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Dd96RPRCv%2FebxsPAqLGV%2FtYRmUtqW9%2BdkGzjto=
Vf9avg%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4784&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dd96RPRCv%2FebxsPAqLGV%2FtYRmUtqW9%2BdkGzjtoVf9avg%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4784&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4785&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DhE%2FDqgq2YnThAi%2B5aPHDazMfYbu9AhIAEPUa3jV=
eZLg%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4785&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DhE%2FDqgq2YnThAi%2B5aPHDazMfYbu9AhIAEPUa3jVeZLg%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4785&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4786&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DGtBnlO8chf45RHFjcGZ5e8GuLg%2B3BUADi283bRW%2=
BLDA%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4786&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DGtBnlO8chf45RHFjcGZ5e8GuLg%2B3BUADi283bRW%2BLDA%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4786&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4787&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Dcx4Dh6nHU8AsP%2BHhfzVFVh4cmdXFNjKM%2FYPdC%2=
Ff9Os4%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4787&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dcx4Dh6nHU8AsP%2BHhfzVFVh4cmdXFNjKM%2FYPdC%2Ff9Os4%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4787&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4788&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DgPVRvYk2K8bP4Iq%2BlzwoEXI9Sq0FdIeRG0jMxQ3Wo=
yU%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4788&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DgPVRvYk2K8bP4Iq%2BlzwoEXI9Sq0FdIeRG0jMxQ3WoyU%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4788&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4789&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3D%2Faqxgw%2BzrkdZF22IqNlfCtOytxdGUlHxBdrD63w=
GmwY%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4789&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D%2Faqxgw%2BzrkdZF22IqNlfCtOytxdGUlHxBdrD63wGmwY%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4789&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4790&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Dyx4LmiWmmSJsauVeGAboNAFTEq3eLXwwLppy3le7Sk4=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-4790&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dyx4LmiWmmSJsauVeGAboNAFTEq3eLXwwLppy3le7Sk4%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-4790&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0682&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DGlpW%2BxkAayQz5bt%2FDzZ4fqB6HvbAlhph%2FLwcn=
kKlPeo%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2016-0682&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DGlpW%2BxkAayQz5bt%2FDzZ4fqB6HvbAlhph%2FLwcnkKlPeo%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2016-0682&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0689&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Ds7id2zjKiYECNybaLgx57ZkFXETtcbACJsKPqds4XC4=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2016-0689&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Ds7id2zjKiYECNybaLgx57ZkFXETtcbACJsKPqds4XC4%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2016-0689&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0692&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DziBoqN8lkMsYyzlBPd0DjLfUW9lFC5%2BM5YyeopPdr=
VM%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2016-0692&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DziBoqN8lkMsYyzlBPd0DjLfUW9lFC5%2BM5YyeopPdrVM%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2016-0692&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0694&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Dl0K3eeT4sfU0cDEib8%2BT3FTGqKhQx6V2qmcAbocnG=
AA%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2016-0694&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dl0K3eeT4sfU0cDEib8%2BT3FTGqKhQx6V2qmcAbocnGAA%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2016-0694&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-3418&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Da9iUyPv%2FV6su%2FYpfb5uiqXkzCkRXhmG4WB3qSzp=
ZZ%2Bw%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2016-3418&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Da9iUyPv%2FV6su%2FYpfb5uiqXkzCkRXhmG4WB3qSzpZZ%2Bw%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2016-3418&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3604&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DRLM7HsHLAnJJ2oDMngOg9VslALP24bZasqZsmuRSuwY=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3604&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DRLM7HsHLAnJJ2oDMngOg9VslALP24bZasqZsmuRSuwY%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3604&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3605&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DlTX2UqWgRQH6XqUQ3hpzXgD1Cffpb4ystmu8VIjKslg=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3605&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DlTX2UqWgRQH6XqUQ3hpzXgD1Cffpb4ystmu8VIjKslg%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3605&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3606&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DsTo3BMNf%2BDXPdLhSqfROCha6HiFZu2K%2BBOpWkoQ=
Imko%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3606&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DsTo3BMNf%2BDXPdLhSqfROCha6HiFZu2K%2BBOpWkoQImko%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3606&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3607&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3D07mPl1AkFjBMKTgcEwkX%2FUZsESTKfwj2dYZxo6v2m=
as%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3607&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D07mPl1AkFjBMKTgcEwkX%2FUZsESTKfwj2dYZxo6v2mas%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3607&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3608&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3D6S7Qh5kgXhiKWCKlhqAEX3lBrPMo0%2Buqm3UK3r%2B=
JdCE%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3608&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3D6S7Qh5kgXhiKWCKlhqAEX3lBrPMo0%2Buqm3UK3r%2BJdCE%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3608&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3609&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DxM209vJ5hYrzko7xVEv%2FAToGI4VfJJYBXGrl6sNRM=
io%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3609&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DxM209vJ5hYrzko7xVEv%2FAToGI4VfJJYBXGrl6sNRMio%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3609&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3610&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DlLQpJgJhvnnKE%2FUpPcuFwfz%2BX1tG8tkn%2Byq0o=
DD2XHY%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3610&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DlLQpJgJhvnnKE%2FUpPcuFwfz%2BX1tG8tkn%2Byq0oDD2XHY%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3610&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3611&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DUkuqVmbT0olqjuQxHxk2n65LJQjIAv%2B2N1I3thqTk=
QQ%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3611&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DUkuqVmbT0olqjuQxHxk2n65LJQjIAv%2B2N1I3thqTkQQ%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3611&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3612&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DccrTxlAbNJ5IDd1h2nmFw%2FaQ1hHXpxO1VBCjah8ZW=
vQ%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3612&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DccrTxlAbNJ5IDd1h2nmFw%2FaQ1hHXpxO1VBCjah8ZWvQ%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3612&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3613&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DW%2BT3TMDHZZgbuFHhiBUHt%2BG0B9EWGXd8QzGjnxA=
n93Y%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3613&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DW%2BT3TMDHZZgbuFHhiBUHt%2BG0B9EWGXd8QzGjnxAn93Y%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3613&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3614&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DZBQd4BtFG5xJPf4XhgAXaOT7%2BNGC92c8QRa%2FPuC=
zFDo%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3614&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DZBQd4BtFG5xJPf4XhgAXaOT7%2BNGC92c8QRa%2FPuCzFDo%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3614&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3615&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DAIveZqlackZdBo%2Bk0OAyax79uIaI9abJ5vYIJovt2=
%2Fk%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3615&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DAIveZqlackZdBo%2Bk0OAyax79uIaI9abJ5vYIJovt2%2Fk%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3615&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3616&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DMYu07%2FXam457qEhuiCBPy%2FNX9llHyLVb628WXJv=
nwJc%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3616&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DMYu07%2FXam457qEhuiCBPy%2FNX9llHyLVb628WXJvnwJc%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3616&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3617&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DyqZ0FQqRl8G4H7nxS%2B4g%2BQXJ7iGO7qWem7d8mjZ=
5KqU%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2017-3617&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DyqZ0FQqRl8G4H7nxS%2B4g%2BQXJ7iGO7qWem7d8mjZ5KqU%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2017-3617&quot;<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-2981&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79=
ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Dguy1TMaaiYsbZDs6tlMIrQnvj80mKChvvukqWSlbRaw=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2020-2981&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dguy1TMaaiYsbZDs6tlMIrQnvj80mKChvvukqWSlbRaw%3D&amp;amp;reserved=3D0=
</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-2981&quot;<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp; inherit autotools<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; # The executables go in a separate package - typically ther=
e<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MA1PR01MB41085A3DCEFB4468FA67297387D99MA1PR01MB4108INDP_--
