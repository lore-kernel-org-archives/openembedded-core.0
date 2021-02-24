Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.88])
 by mx.groups.io with SMTP id smtpd.web11.4113.1614152813016004301
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 23:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bafCJ82s;
 spf=pass (domain: windriver.com, ip: 40.107.237.88, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHtUo5g4J9z2Kp6ZhQGJHYxiBQtHwdyExaD38sREgWIDsyNUXbnEiFUku+oR/DRxWxxEOlt9jCBVAM2SoIju8BkqYYt1P+IA1SnOjCkbal+zoddQpYAKuFb39q/nM7tDiA/3PYNiTzC/ION1uCcOHr3EXJwdvFwUBLq6m4/gErv39Btyx8OsMBYcjcuPBLEodTiJTsj1LD8Y/hMUMwPFJghBchea67wDybrA/amFm/TYwYLaklpwIAondq/KegJQGiZr3jKWwFbXqZ1dBOmmfd8HEThHIdFhfWnFqa6s1EGeYuc4M7eAHexlIiBDC0oYIhN96HeCOCr1HYpzwvs0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwhdyqIePrEMjAEhcD6YNdeDFDSLzzOjdAoVYw/MqhA=;
 b=mVFNjyOn89NxCgZAonPmBwYSLFnwuUC+hxjR8VqDKLx7qwvTPUyww3EsyUnZDdpgCPIWRLg2FmFpaEDVtBUNSNQdXchImhKFaA77zA0nyOn1mt4DH/kKFTl3xo1bSeuH+lwrozx99XWA5dNiKYNO3wf53LX8FIXF4xFEgMJwswCoxevx6iYYOe5S/IwOxWAHsq/hvFks7JqMO7A7/F6y8uCho4ANit+PL4Yn4+Ky0X34DHVm6hxeiXMpZGHztJPnf1Te+an3oXlWmD15wOY6jP2CD5AiaE09265TQF7hh/7BLf7LlPOdO5Ai+7QYpRAHbmLZ0h2pGsKUjLTI7rnrWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwhdyqIePrEMjAEhcD6YNdeDFDSLzzOjdAoVYw/MqhA=;
 b=bafCJ82svnqifoT3S4HZ4/6vaKvA6I6hLIT/c4oIsjp9MTRrInN8zTKynnufZ4sZjBGhojs93f2QHZT6JabrEI/zIbyz6iaKo7OMEuPmkhVn8qn3baJER6oPgYHXW4ZDuCUo11c4zOjF77FoSAYzN2nA0xvRqFut2xkw54eEKR4=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR11MB1702.namprd11.prod.outlook.com (2603:10b6:903:2e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 07:46:50 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484%4]) with mapi id 15.20.3890.019; Wed, 24 Feb 2021
 07:46:49 +0000
From: "kai" <kai.kang@windriver.com>
Subject: Re: [PATCH v2] cups: set rundir to /run/cups if systemd is used
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-core@lists.openembedded.org, steve@sakoman.com
References: <20210221204702.504297-1-open.source@oleksandr-kravchuk.com>
Message-ID: <3bfb79f3-dca7-1bd8-895a-745cda28f4c3@windriver.com>
Date: Wed, 24 Feb 2021 15:46:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210221204702.504297-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0028.apcprd03.prod.outlook.com
 (2603:1096:203:c9::15) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0028.apcprd03.prod.outlook.com (2603:1096:203:c9::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Wed, 24 Feb 2021 07:46:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6443a911-616a-454c-87c5-08d8d89857ea
X-MS-TrafficTypeDiagnostic: CY4PR11MB1702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB17024BB5968CB49DF32DD50B959F9@CY4PR11MB1702.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JZinT30kMnJ32TcntnlnZ4bvsuxmYkLJUSud4PvC+Z3cEnbm5m2/gQV+m4VUJ8P2XgpKDnWVltLm/48WEm2i6HJeCLl1Pd/GZ/j2T+MVNr061W+mxU1XUZFDLt07B+yEqa6sxYLZjDpfrdTOvgjuPpox52ejY1NdjUtmbn+HUlhlaAFvwYsV+G6SIZpXGHDwdAcx+I1mGCNnAJmp5hXA2JavdUkhhWTj9cOrZeNZ6nZF8xoN0lQK1B/Ae3msOA3c2dmSgtKuOEMov3PEyDOp/ebjQirQEf6/kz1Jmi+/byttxQVGnl5MGmJFo2HK317Fb249wwV25iXM4Cccg+2bSIBj/XzJsh8w3p6dYvyfWWur50WeMrv0mcfP7/ZTkPdHsrhtNqvdXf0CUQyLdWZAO4hjgd3cV2GcS58uKyTWlM++8T/y4UlBQ2NNh/qNskfqxE0g2mZlkkz+MmCZLARvhdb0PO7E+0/BzhRsbm8o3WYBLiyAf1v/D5QDD3myGFy5fTNMbulWA0pXZ8NYkLl65AtwYe6yudSSQN4lDALOB+U4kSI81I7Z1UzFPrGT/uexH6VAlmocuiTBOckHexcZe9uCD/19i7YcW6F/+QLCFxqcSrDv0iraStyz4X5LIJtpV0P69W08FXZOwt3pvXV0R8DTdZdYt5A+Dp38kIMDSnUBtXP2Z71ySpGtD3834UtB8TMsZBTkGxGXL/N/4Ojlmg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39850400004)(316002)(16576012)(31696002)(66476007)(66556008)(26005)(8936002)(8676002)(6706004)(52116002)(31686004)(53546011)(86362001)(186003)(16526019)(5660300002)(36756003)(83380400001)(6486002)(6666004)(2906002)(956004)(2616005)(478600001)(66946007)(966005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?XaHvhJxo/oA0pwDRvsHtcSJ6yopemXjbwFBOgVe1leFDfkv329kJ9dG4I+OP?=
 =?us-ascii?Q?dXzpFkybH6m4Kye/pjl98ZwMeyfZEyJSJlzcH4cBc00sKidj/DBUdiOw8u3N?=
 =?us-ascii?Q?M/tPAxlpX03eBfFqDn7+MY73TXentH+I39m7PMNp/jy/8NUh4wZLZs0/VcJP?=
 =?us-ascii?Q?hDDqPcxyiaCO3lgQXKyapc8IUaayrBJfnmyYVucgj4W18tga4ZTZtJUYfhZ+?=
 =?us-ascii?Q?Peu4D0telEpgGPxWvujHrTv3t3wFW1t7eIS2iz9IVO3fMcgYb+lK/QN1a7Q4?=
 =?us-ascii?Q?/xfzeQ1fs93ZGw22VKm2Akh04+ATwR7cleTy/riN6/T1jt/RObOkM5SH+ZiL?=
 =?us-ascii?Q?E86ReJryZSIIPuw1KVYbCUlMh3p6CXZFScAHGH96Hi/QLDIb+NJ3N+1FnDhI?=
 =?us-ascii?Q?SGI/5kAL7UkhasebTHt1oK48bt+BWqDefk4qophCPU7PHb4irk3bVBW5554M?=
 =?us-ascii?Q?a7Jca2lKviyo9xOkds7+q7xh0imp4u1mTRb7lTXiJk5U/qbB8/gQE9d4MLZQ?=
 =?us-ascii?Q?kgG6bl7Z+Ky6AwJ1nzZBS+OhuCtKPeRLjL14TnyiIeU5tISw447J4oWfOs/J?=
 =?us-ascii?Q?htx8nSZcWDiw3ahjj1EJyKbvejm2iZCwmJv5fE0btzPnIldRVnCXK7ikNH+l?=
 =?us-ascii?Q?oWAZuAFnI/rVe8taMKjC3vHJAuEJI4zBwcQCgAjJZbJv+yuHYypwRWU0DY7X?=
 =?us-ascii?Q?QGsyesbw5p0aH+4ralENfKH5bARA1tQ0Dwnix0OBUNDnUpzNOAtsAwrBCFad?=
 =?us-ascii?Q?8Hr03TZph2nqG5mwerMXO8++SbL0xhoWf9lrey9E0bWrldYCeVJ4rn0+fCo4?=
 =?us-ascii?Q?b9F+wMeU9zKwnmr4iV/RM+blj6ZUzYNOuo2dXyUnEJJaTj3rMx9rVIwGJRwP?=
 =?us-ascii?Q?4HNQOIcLa274M/RLgxJjbCnYbkrG2qsvUVy+yIXLgZml7nTO6tdsbLUpZjyA?=
 =?us-ascii?Q?P2yWvCQrr0CJXeztYVmbfULGnOZol2U3yr4WZZgm+8lS1qNTunDnwkRW6dC0?=
 =?us-ascii?Q?t+VzObukIynqfiKmXrAR76dmz5swZKsldNlA3euWSpOPUfffkSyzdb6R30xi?=
 =?us-ascii?Q?RavwPL/qep9OkRp309hepGj4nUunHBifij9/Nizgo5rIk+8FS8hGp+E3Imof?=
 =?us-ascii?Q?9JRjiqC+Gr5hMCl1wj1jrACTn8Cw81l0c7NTcBCszZSqH8wvaRJz39/txhn+?=
 =?us-ascii?Q?/cBQJ83HtoW4Q1NW5GxobHCvSog3ii6fFveODxFbRC0FYX8BxuDcXxk0L+Sq?=
 =?us-ascii?Q?Y7uYo6koPLpHNn4kLWjQB9x8XsaDNbgIRKaA48AK8z/4U/LwnE5jsRg2wmPg?=
 =?us-ascii?Q?b6F6k/7ExaNVibBdm8fxELfy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6443a911-616a-454c-87c5-08d8d89857ea
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 07:46:49.6740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8hvWXK6RhMqTQpbITEfA42TRQa58zX4mIiDY8WmIkkpbXiF0pJ7R8Z7Os7v3bno1lL9TO4EYvRW1q+/ztslRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1702
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/22/21 4:47 AM, Oleksandr Kravchuk wrote:
> When running under systemd, cups needs to be configured with
> '--with-rundir=3D/run/cups', as systemd takes an exception to the
> activation socket being under /var/run and relocates it.
>
> This leads to fd duplication in cupsd and an inadvertent closure of the
> activation socket when the daemon exits due to inactivity, so that the
> daemon cannot be activated again.
>
> [YOCTO #14152]

Hi Oleksandr,

Thanks for your work. But there is a fix in master alreay:

https://git.openembedded.org/openembedded-core/commit/meta/recipes-extended=
/cups?id=3D6c3f56020da7a26c2daea73e39c2f324f1f597db


commit a5b9fa3c450af3beac5f1b68797a1d044091fbbe
Author: Chen Qi <Qi.Chen@windriver.com>
Date:=C2=A0=C2=A0 Fri Oct 16 12:58:56 2020 +0800

 =C2=A0=C2=A0=C2=A0 cups: use /run instead /var/run in systemd's unit file

 =C2=A0=C2=A0=C2=A0 /var/run has been deprecated by systemd, so use /run in=
stead,
 =C2=A0=C2=A0=C2=A0 as suggested by systemd.

 =C2=A0=C2=A0=C2=A0 (From OE-Core rev: 6c3f56020da7a26c2daea73e39c2f324f1f5=
97db)

 =C2=A0=C2=A0=C2=A0 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 =C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie <richard.purdie@linuxfoun=
dation.org>


Hi Steve,

Would like to cherry pick that commit for dunfell please? It fixes YOCTO=20
#14152.

Thanks.

Kai

>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   meta/recipes-extended/cups/cups.inc | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
> index e7a704134c..ff1ab70be9 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -56,8 +56,11 @@ EXTRA_OECONF =3D " \
>                  --enable-libusb \
>                  --with-domainsocket=3D/run/cups/cups.sock \
>                  DSOFLAGS=3D'${LDFLAGS}' \
> +               ${EXTRA_OECONF_SYSTEMD} \
>                  "
>  =20
> +EXTRA_OECONF_SYSTEMD =3D "${@bb.utils.contains('DISTRO_FEATURES','system=
d','--with-rundir=3D/run/cups','',d)}"
> +
>   EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
>  =20
>   do_compile () {
> @@ -77,6 +80,7 @@ do_install () {
>  =20
>   	# Remove /var/run from package as cupsd will populate it on startup
>   	rm -fr ${D}/${localstatedir}/run
> +	rm -rf ${D}/run
>   	rm -fr ${D}/${localstatedir}/log
>   	rmdir ${D}/${libexecdir}/${BPN}/driver
>  =20
> @@ -97,6 +101,11 @@ do_install () {
>   	    install -m 0644 ${WORKDIR}/volatiles.99_cups \
>   		    ${D}${sysconfdir}/default/volatiles/99_cups
>   	fi
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
> +        install -d ${D}${sysconfdir}/tmpfiles.d
> +        echo "d /run/${BPN}/cert 0755 - - - -" > ${D}${sysconfdir}/tmpfi=
les.d/cups.conf
> +    fi
>   }
>  =20
>   PACKAGES =3D+ "${PN}-lib ${PN}-libimage"


--=20
Kai Kang
Wind River Linux

