Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.53])
 by mx.groups.io with SMTP id smtpd.web09.5098.1613552253890181101
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 00:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=k/El5ayg;
 spf=pass (domain: kpit.com, ip: 40.107.139.53, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsChNFUOl40n27tuq2Y2r70OIbRBL2d5ZFjZDXd4pykfVFGC3ShZxO/578P//IDOiTzDobZ2H3y5USsMdaUPV3bwMNbNsv9s6YfoEwl6d/TvJNmrmvo+Bf9BLYDGPsnf2kdkAsDTRPIbMZg1Kad6aEHq6QSFQYk9p3Hgj6yI+RDdvusTZhdtvZ46jdpylj3LQByDJoDNbyINdEQqkAxC/CnA7DmjzOjhrL+A6WgzQtuhs3HLtnGmUE5Kwe1VClPovdY8mLBUXXu5lY/gxrsDh3wTQ5pG0KaU8kXGb+ixFOMU2QEgaVdnOKx6BXTCYa8kNJY6IitK2FRpgpqvOAuNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ped/+MfUZeIS17wqzf8LWpp/ooSSeki8hgP/wPOXZk=;
 b=Q2qigGKv7QklRJQ0EQA/j7OW9d2yWhTGVDRwtlpCQ+F29dZnmjKBW3Lf9/coS/7hman5Kg3BBtlvrO94BjF9iZcIwOECfQnd7+u8vzptnvlIDNLEkCrRwXkVkf2QBvf0eAWv/gb6xmZP64zs0zq+Qrj1Mg8D/8RQARsvI6Q/QTPSwR26FvbuYEIK1qrjCKtD4y1zwy0ainIPNOdzPVYJe9svlWxE2rTnFOpRX4LDMXxoqW2pParypwiLm8JFRgge1xrdDrH9ONnmo+UP8BO++ngwT2qJRKUN1L0Dk8NU/bzWjsZvNnDW+L2RV2O8jPVuEMlm89miWRDZcIM3swYwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ped/+MfUZeIS17wqzf8LWpp/ooSSeki8hgP/wPOXZk=;
 b=k/El5aygt4yH5mUmYvJgO8hwAPfN6K2J0TIkv6FODQchRuFJ7sQ/294+hovWrvy9j5JqzyZYif3GfS6J571SsRA7xfY6rJwB3RQq3NdnmBSYYw0b9vEwayrr8KKdgjwAnOAuzYT4HozydEvHz88AFG/o2O4NxuPKQhVgQ6HiHpg=
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BMXPR01MB2293.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:30::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Wed, 17 Feb
 2021 08:57:21 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7%7]) with mapi id 15.20.3846.039; Wed, 17 Feb 2021
 08:57:21 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: akuster808 <akuster808@gmail.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Harpritkaur Bhandari
	<Harpritkaur.Bhandari@kpit.com>
Subject: Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2: Add fix for CVE-2020-11080
Thread-Topic: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2: Add fix
 for CVE-2020-11080
Thread-Index: AQHXBD835SbkqO6G9EifuVOeU2EF76pa8c6AgAEZvtE=
Date: Wed, 17 Feb 2021 08:57:21 +0000
Message-ID: 
 <BMXPR01MB34318E8491F3B495127DDFB8F2869@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <20210216083900.7631-1-Rahul.Taya@kpit.com>,<8abf4b2a-c035-eba0-0a19-8136296e4ad4@gmail.com>
In-Reply-To: <8abf4b2a-c035-eba0-0a19-8136296e4ad4@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [182.70.89.188]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ddef945b-2e9a-4e52-b27e-08d8d3220994
x-ms-traffictypediagnostic: BMXPR01MB2293:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BMXPR01MB2293731D8655BF9B915C2FE8F2869@BMXPR01MB2293.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Fm3asbZIFqlVf+Com1WZKVkbBHUiidoSakdbqm3soI1HORgF1m5O9p6hWECvptqp3gbjgjZF8xn2jq1pceY4dS/wvqn+WJiu+TImCMVvcIMMJrEFGBmEdBkHHXC7/nMhr52Gxtez1xK0W4Xfvuml7Vi491Jr74vuDRC8DsIVpdzsYn0nrSJt7U+tWee63xcqmTWm10uuq16fp8Wx1xOsCnqm92UGralkGr8BN+xE9OfD1kafjN/3nPc1ugEnR8kuZaNPQ9sE6tH0tejD+BgMnErOqGfLimWGHHgJ9tcxjOqWao3KTAK7pUPEJqury83IwtK27uPFTH6e1y42/s4oSpNUJxqjB2G+xDMPl4EeCOnrgGYft4/6eF7urADrZ6GH5AVFo2eTJWmMkJNAmbpVNugBxxgRRWYU7KzYFMc1+8qTggDNUmQQdrVb8ElWeoNjc02eGO2hex6NZge6qH8oTXcHdAPAFDvvCzH+m5IsAQZOALRx3i8zBdV31x9zLyjRQSQ0JTJnfAmlxLOm7y7UqrHAUKqlnJYlmRmb7ONYj7D3u6y1tMqGelu5IJm/ru1nfBrEXGlI0jkyMUGEpCoWQgzC5nQwe4AqSwmNwQT3VAM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(346002)(366004)(396003)(66476007)(71200400001)(86362001)(110136005)(316002)(107886003)(5660300002)(30864003)(4326008)(55016002)(166002)(9686003)(8936002)(54906003)(66574015)(478600001)(53546011)(6506007)(966005)(2906002)(52536014)(64756008)(66446008)(26005)(7696005)(83380400001)(76116006)(66946007)(186003)(66556008)(33656002)(8676002)(19627405001)(45080400002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?Zq4gPLqlsqopfbwP/1NHfn6i62w/WfkWEs7gEajHy8dBOtXswvau5pd+AVlk?=
 =?us-ascii?Q?vgK3rqEHC0nu8SRwMqMkzyMx1ma9o0GoPgpSL/CXA2EI01695Ol6NGTwgPGM?=
 =?us-ascii?Q?KK/iwBv4nGuvxHh5QvAOUSZo3fsKnPkymd34cZH2RXg2T4e2+6CJdBAOpNaN?=
 =?us-ascii?Q?yxCVUQJbvtsXmjUJuHJfHrstgk/+yHffBWlIvPMaYjFfIxofWilBLGW3mxIV?=
 =?us-ascii?Q?2GPW3kTM95JfQhjwZ7wYjo6hdVbjSPConCmvOaaUaWsDPqou6ZdgA4ReIgBz?=
 =?us-ascii?Q?tFur3Ng/TpO7bk0nal6wUQCBqHGETZUxkUHzTdR1UPmhudAqBYct93WQQbYk?=
 =?us-ascii?Q?GJARdgMEXjzTNkrhsFGszDAmD/6jopn1cUQjmWxuih9vaxcPMHls+OYb3gAT?=
 =?us-ascii?Q?clFAFjPlQXYUBSMUh9hWWQmgpNFYvP9E8hwIRA4pupAms8+4GFh016ihfZJ8?=
 =?us-ascii?Q?u9n1atP7AiddRpYINXOqRGC+JHYh8eSdhsWHa3nhq48r0AUy30vRBxWd9RdL?=
 =?us-ascii?Q?PGfG7nq682g4OhCjwDTRwcsv57uUfSjVpHhaVFlaLSnga78167lYRCnoSpt5?=
 =?us-ascii?Q?GEHmsvuuNJuKxPjUDkHjCUNqW54vWhHy53lkrj+ZkExUovr9ElLihmOM0InM?=
 =?us-ascii?Q?j+ryQMHmf2iHYEkPfiqsh1k4USC30DVRV2SBIyrpAdELBkSfn1Dwwt7L8dW1?=
 =?us-ascii?Q?605/63Nl3B2uzmsmyLOfmtcmTXrpnhHhsI4VWtmyJ1bNOuvqqJbBbvuVpu8s?=
 =?us-ascii?Q?G0JUZQgvu17h+olwOlJlNfMHr8rWp5MgDesjBs+UZ1Z5NcZWTRbDuVKrolNw?=
 =?us-ascii?Q?EpiLXZlRMb1C6OEOrtVsdsbqm/2rcQ+umyVc1Q9fYqkEw35I8IOlJ9eWhume?=
 =?us-ascii?Q?MPS41SuifuJE6CTZc1uuPYZ3d7/srsdJH+imtANW0Wsuh32DhjGgpl/26j+T?=
 =?us-ascii?Q?sCQzm1LTeVuLRZ/msCsD36V5be5S7NNEhvgHsVh1caeu6VE37z5ZYpavgICN?=
 =?us-ascii?Q?/D1Hl6CWLgS4XlzZANCQ8pezduu4SHe/MB9ot/CGA7OW0qTRuQO82n3bzaap?=
 =?us-ascii?Q?Iozfk4tc35EG3GVoZ5O0FTt6w8gOIl/RtTz39fQcWrBkaPorc3pOUsPPu+lU?=
 =?us-ascii?Q?nSdpckib7XtUV4aZ1oL5re30EsDmnUW5gmDxCv3zvgaqviTIcyJzzOak+7q2?=
 =?us-ascii?Q?CPnz92aZU3Bt/kidboD/G8HIi8ARpaEa19nk/AC0is4BTdH67sA/C1g7eSEk?=
 =?us-ascii?Q?Ca5pAQx94LbcV49CAKyOzH2aDEvnMiMx4lU1nZk4bX2KZkVWBwuATOqjXIU4?=
 =?us-ascii?Q?ZpU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ddef945b-2e9a-4e52-b27e-08d8d3220994
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2021 08:57:21.0577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sEGQsT/hoqtnUt1FSAi5EgKJsg8F75esnFxIxoUyLEZWqF94Uk7PmH1do1egADx+lxD0ZHqR2IeIceI3M4s06g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2293
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB34318E8491F3B495127DDFB8F2869BMXPR01MB3431INDP_"

--_000_BMXPR01MB34318E8491F3B495127DDFB8F2869BMXPR01MB3431INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I have backported this patch from Master branch as in master(v1.43.0) and =
Gatesgarth(v1.41.0) the code of this patch is already present in the source=
 code so it is only applicable for Dunfell(v1.40.0) and Zeus(v1.39.1) branc=
h.

Yes i will add my signoff in the patch.

Can you please tell which is the correct ML for sending this patch ?

Thanks and Regards,
Rahul Taya
________________________________
From: akuster808 <akuster808@gmail.com>
Sent: Tuesday, February 16, 2021 9:32 PM
To: Rahul Taya <Rahul.Taya@kpit.com>; Openembedded-core@lists.openembedded=
.org <Openembedded-core@lists.openembedded.org>; raj.khem@gmail.com <raj.kh=
em@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Harpritkaur Bhandari <Harpri=
tkaur.Bhandari@kpit.com>
Subject: Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2: Add fi=
x for CVE-2020-11080



On 2/16/21 12:39 AM, Rahul Taya wrote:
> Added patch for CVE-2020-11080 taken from below link:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736b18785c27f75=
090&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2=
944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;sdata=3DLO7%2BKX%2F6ZD4VSi85fOVS%2FydUAFSH1kCUamqOyQ=
cV0Ww%3D&amp;reserved=3D0
>
> Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
Wrong ML.

Is master or Gatesgath affected by this?

Also the patch it self is missing your signoff.

-armin
> ---
>  .../nghttp2/nghttp2/CVE-2020-11080.patch      | 306 ++++++++++++++++++
>  .../recipes-support/nghttp2/nghttp2_1.40.0.bb |   1 +
>  2 files changed, 307 insertions(+)
>  create mode 100644 meta-networking/recipes-support/nghttp2/nghttp2/CVE-=
2020-11080.patch
>
> diff --git a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11=
080.patch b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.=
patch
> new file mode 100644
> index 000000000..a376e5372
> --- /dev/null
> +++ b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.pat=
ch
> @@ -0,0 +1,306 @@
> +From 336a98feb0d56b9ac54e12736b18785c27f75090 Mon Sep 17 00:00:00 2001
> +From: James M Snell <jasnell@gmail.com>
> +Date: Fri, 17 Apr 2020 16:53:51 -0700
> +Subject: [PATCH] Implement max settings option
> +
> +CVE: CVE-2020-11080
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb=
0d56b9ac54e12736b18785c27f75090&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%=
7C81c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C637490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DLO7%2BKX%2F6ZD4V=
Si85fOVS%2FydUAFSH1kCUamqOyQcV0Ww%3D&amp;reserved=3D0]
> +Comment: No hunks refreshed
> +---
> + doc/CMakeLists.txt             |  1 +
> + doc/Makefile.am                |  1 +
> + lib/includes/nghttp2/nghttp2.h | 23 +++++++++++++
> + lib/nghttp2_helper.c           |  2 ++
> + lib/nghttp2_option.c           |  5 +++
> + lib/nghttp2_option.h           |  5 +++
> + lib/nghttp2_session.c          | 21 ++++++++++++
> + lib/nghttp2_session.h          |  2 ++
> + tests/main.c                   |  2 ++
> + tests/nghttp2_session_test.c   | 61 ++++++++++++++++++++++++++++++++++
> + tests/nghttp2_session_test.h   |  1 +
> + 11 files changed, 124 insertions(+)
> +
> +diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
> +index 34c027929..f3aec84da 100644
> +--- a/doc/CMakeLists.txt
> ++++ b/doc/CMakeLists.txt
> +@@ -42,6 +42,7 @@ set(APIDOCS
> +   nghttp2_option_set_no_recv_client_magic.rst
> +   nghttp2_option_set_peer_max_concurrent_streams.rst
> +   nghttp2_option_set_user_recv_extension_type.rst
> ++  nghttp2_option_set_max_settings.rst
> +   nghttp2_pack_settings_payload.rst
> +   nghttp2_priority_spec_check_default.rst
> +   nghttp2_priority_spec_default_init.rst
> +diff --git a/doc/Makefile.am b/doc/Makefile.am
> +index 4d73cef50..f073bfa4c 100644
> +--- a/doc/Makefile.am
> ++++ b/doc/Makefile.am
> +@@ -69,6 +69,7 @@ APIDOCS=3D \
> +       nghttp2_option_set_peer_max_concurrent_streams.rst \
> +       nghttp2_option_set_user_recv_extension_type.rst \
> +       nghttp2_option_set_max_outbound_ack.rst \
> ++      nghttp2_option_set_max_settings.rst \
> +       nghttp2_pack_settings_payload.rst \
> +       nghttp2_priority_spec_check_default.rst \
> +       nghttp2_priority_spec_default_init.rst \
> +diff --git a/lib/includes/nghttp2/nghttp2.h b/lib/includes/nghttp2/nght=
tp2.h
> +index e3aeb9fed..9be6eea5c 100644
> +--- a/lib/includes/nghttp2/nghttp2.h
> ++++ b/lib/includes/nghttp2/nghttp2.h
> +@@ -228,6 +228,13 @@ typedef struct {
> +  */
> + #define NGHTTP2_CLIENT_MAGIC_LEN 24
> +
> ++/**
> ++ * @macro
> ++ *
> ++ * The default max number of settings per SETTINGS frame
> ++ */
> ++#define NGHTTP2_DEFAULT_MAX_SETTINGS 32
> ++
> + /**
> +  * @enum
> +  *
> +@@ -398,6 +405,11 @@ typedef enum {
> +    * receives an other type of frame.
> +    */
> +   NGHTTP2_ERR_SETTINGS_EXPECTED =3D -536,
> ++  /**
> ++   * When a local endpoint receives too many settings entries
> ++   * in a single SETTINGS frame.
> ++   */
> ++  NGHTTP2_ERR_TOO_MANY_SETTINGS =3D -537,
> +   /**
> +    * The errors < :enum:`NGHTTP2_ERR_FATAL` mean that the library is
> +    * under unexpected condition and processing was terminated (e.g.,
> +@@ -2659,6 +2671,17 @@ NGHTTP2_EXTERN void nghttp2_option_set_no_closed=
_streams(nghttp2_option *option,
> + NGHTTP2_EXTERN void nghttp2_option_set_max_outbound_ack(nghttp2_option=
 *option,
> +                                                         size_t val);
> +
> ++/**
> ++ * @function
> ++ *
> ++ * This function sets the maximum number of SETTINGS entries per
> ++ * SETTINGS frame that will be accepted. If more than those entries
> ++ * are received, the peer is considered to be misbehaving and session
> ++ * will be closed. The default value is 32.
> ++ */
> ++NGHTTP2_EXTERN void nghttp2_option_set_max_settings(nghttp2_option *op=
tion,
> ++                                                    size_t val);
> ++
> + /**
> +  * @function
> +  *
> +diff --git a/lib/nghttp2_helper.c b/lib/nghttp2_helper.c
> +index 91136a619..0bd541472 100644
> +--- a/lib/nghttp2_helper.c
> ++++ b/lib/nghttp2_helper.c
> +@@ -334,6 +334,8 @@ const char *nghttp2_strerror(int error_code) {
> +   case NGHTTP2_ERR_FLOODED:
> +     return "Flooding was detected in this HTTP/2 session, and it must =
be "
> +            "closed";
> ++  case NGHTTP2_ERR_TOO_MANY_SETTINGS:
> ++    return "SETTINGS frame contained more than the maximum allowed ent=
ries";
> +   default:
> +     return "Unknown error code";
> +   }
> +diff --git a/lib/nghttp2_option.c b/lib/nghttp2_option.c
> +index e53f22d36..34348e660 100644
> +--- a/lib/nghttp2_option.c
> ++++ b/lib/nghttp2_option.c
> +@@ -121,3 +121,8 @@ void nghttp2_option_set_max_outbound_ack(nghttp2_op=
tion *option, size_t val) {
> +   option->opt_set_mask |=3D NGHTTP2_OPT_MAX_OUTBOUND_ACK;
> +   option->max_outbound_ack =3D val;
> + }
> ++
> ++void nghttp2_option_set_max_settings(nghttp2_option *option, size_t va=
l) {
> ++  option->opt_set_mask |=3D NGHTTP2_OPT_MAX_SETTINGS;
> ++  option->max_settings =3D val;
> ++}
> +diff --git a/lib/nghttp2_option.h b/lib/nghttp2_option.h
> +index 1f740aaa6..939729fdc 100644
> +--- a/lib/nghttp2_option.h
> ++++ b/lib/nghttp2_option.h
> +@@ -67,6 +67,7 @@ typedef enum {
> +   NGHTTP2_OPT_MAX_DEFLATE_DYNAMIC_TABLE_SIZE =3D 1 << 9,
> +   NGHTTP2_OPT_NO_CLOSED_STREAMS =3D 1 << 10,
> +   NGHTTP2_OPT_MAX_OUTBOUND_ACK =3D 1 << 11,
> ++  NGHTTP2_OPT_MAX_SETTINGS =3D 1 << 12,
> + } nghttp2_option_flag;
> +
> + /**
> +@@ -85,6 +86,10 @@ struct nghttp2_option {
> +    * NGHTTP2_OPT_MAX_OUTBOUND_ACK
> +    */
> +   size_t max_outbound_ack;
> ++  /**
> ++   * NGHTTP2_OPT_MAX_SETTINGS
> ++   */
> ++  size_t max_settings;
> +   /**
> +    * Bitwise OR of nghttp2_option_flag to determine that which fields
> +    * are specified.
> +diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
> +index 563ccd7de..415e34776 100644
> +--- a/lib/nghttp2_session.c
> ++++ b/lib/nghttp2_session.c
> +@@ -458,6 +458,7 @@ static int session_new(nghttp2_session **session_pt=
r,
> +
> +   (*session_ptr)->max_send_header_block_length =3D NGHTTP2_MAX_HEADERS=
LEN;
> +   (*session_ptr)->max_outbound_ack =3D NGHTTP2_DEFAULT_MAX_OBQ_FLOOD_I=
TEM;
> ++  (*session_ptr)->max_settings =3D NGHTTP2_DEFAULT_MAX_SETTINGS;
> +
> +   if (option) {
> +     if ((option->opt_set_mask & NGHTTP2_OPT_NO_AUTO_WINDOW_UPDATE) &&
> +@@ -521,6 +522,11 @@ static int session_new(nghttp2_session **session_p=
tr,
> +     if (option->opt_set_mask & NGHTTP2_OPT_MAX_OUTBOUND_ACK) {
> +       (*session_ptr)->max_outbound_ack =3D option->max_outbound_ack;
> +     }
> ++
> ++    if ((option->opt_set_mask & NGHTTP2_OPT_MAX_SETTINGS) &&
> ++        option->max_settings) {
> ++      (*session_ptr)->max_settings =3D option->max_settings;
> ++    }
> +   }
> +
> +   rv =3D nghttp2_hd_deflate_init2(&(*session_ptr)->hd_deflater,
> +@@ -5657,6 +5663,16 @@ ssize_t nghttp2_session_mem_recv(nghttp2_session=
 *session, const uint8_t *in,
> +           iframe->max_niv =3D
> +               iframe->frame.hd.length / NGHTTP2_FRAME_SETTINGS_ENTRY_L=
ENGTH + 1;
> +
> ++          if (iframe->max_niv - 1 > session->max_settings) {
> ++            rv =3D nghttp2_session_terminate_session_with_reason(
> ++                session, NGHTTP2_ENHANCE_YOUR_CALM,
> ++                "SETTINGS: too many setting entries");
> ++            if (nghttp2_is_fatal(rv)) {
> ++              return rv;
> ++            }
> ++            return (ssize_t)inlen;
> ++          }
> ++
> +           iframe->iv =3D nghttp2_mem_malloc(mem, sizeof(nghttp2_settin=
gs_entry) *
> +                                                    iframe->max_niv);
> +
> +@@ -7425,6 +7441,11 @@ static int nghttp2_session_upgrade_internal(nght=
tp2_session *session,
> +   if (settings_payloadlen % NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH) {
> +     return NGHTTP2_ERR_INVALID_ARGUMENT;
> +   }
> ++  /* SETTINGS frame contains too many settings */
> ++  if (settings_payloadlen / NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH
> ++        > session->max_settings) {
> ++    return NGHTTP2_ERR_TOO_MANY_SETTINGS;
> ++  }
> +   rv =3D nghttp2_frame_unpack_settings_payload2(&iv, &niv, settings_pa=
yload,
> +                                               settings_payloadlen, mem=
);
> +   if (rv !=3D 0) {
> +diff --git a/lib/nghttp2_session.h b/lib/nghttp2_session.h
> +index d20827315..07bfbb6c9 100644
> +--- a/lib/nghttp2_session.h
> ++++ b/lib/nghttp2_session.h
> +@@ -267,6 +267,8 @@ struct nghttp2_session {
> +   /* The maximum length of header block to send.  Calculated by the
> +      same way as nghttp2_hd_deflate_bound() does. */
> +   size_t max_send_header_block_length;
> ++  /* The maximum number of settings accepted per SETTINGS frame. */
> ++  size_t max_settings;
> +   /* Next Stream ID. Made unsigned int to detect >=3D (1 << 31). */
> +   uint32_t next_stream_id;
> +   /* The last stream ID this session initiated.  For client session,
> +diff --git a/tests/main.c b/tests/main.c
> +index 41e0b03eb..67eb4a1c2 100644
> +--- a/tests/main.c
> ++++ b/tests/main.c
> +@@ -317,6 +317,8 @@ int main() {
> +                    test_nghttp2_session_set_local_window_size) ||
> +       !CU_add_test(pSuite, "session_cancel_from_before_frame_send",
> +                    test_nghttp2_session_cancel_from_before_frame_send)=
 ||
> ++      !CU_add_test(pSuite, "session_too_many_settings",
> ++                   test_nghttp2_session_too_many_settings) ||
> +       !CU_add_test(pSuite, "session_removed_closed_stream",
> +                    test_nghttp2_session_removed_closed_stream) ||
> +       !CU_add_test(pSuite, "session_pause_data",
> +diff --git a/tests/nghttp2_session_test.c b/tests/nghttp2_session_test.=
c
> +index 6eb8e244d..33ee3ad84 100644
> +--- a/tests/nghttp2_session_test.c
> ++++ b/tests/nghttp2_session_test.c
> +@@ -10614,6 +10614,67 @@ void test_nghttp2_session_cancel_from_before_f=
rame_send(void) {
> +   nghttp2_session_del(session);
> + }
> +
> ++void test_nghttp2_session_too_many_settings(void) {
> ++  nghttp2_session *session;
> ++  nghttp2_option *option;
> ++  nghttp2_session_callbacks callbacks;
> ++  nghttp2_frame frame;
> ++  nghttp2_bufs bufs;
> ++  nghttp2_buf *buf;
> ++  ssize_t rv;
> ++  my_user_data ud;
> ++  nghttp2_settings_entry iv[3];
> ++  nghttp2_mem *mem;
> ++  nghttp2_outbound_item *item;
> ++
> ++  mem =3D nghttp2_mem_default();
> ++  frame_pack_bufs_init(&bufs);
> ++
> ++  memset(&callbacks, 0, sizeof(nghttp2_session_callbacks));
> ++  callbacks.on_frame_recv_callback =3D on_frame_recv_callback;
> ++  callbacks.send_callback =3D null_send_callback;
> ++
> ++  nghttp2_option_new(&option);
> ++  nghttp2_option_set_max_settings(option, 1);
> ++
> ++  nghttp2_session_client_new2(&session, &callbacks, &ud, option);
> ++
> ++  CU_ASSERT(1 =3D=3D session->max_settings);
> ++
> ++  nghttp2_option_del(option);
> ++
> ++  iv[0].settings_id =3D NGHTTP2_SETTINGS_HEADER_TABLE_SIZE;
> ++  iv[0].value =3D 3000;
> ++
> ++  iv[1].settings_id =3D NGHTTP2_SETTINGS_INITIAL_WINDOW_SIZE;
> ++  iv[1].value =3D 16384;
> ++
> ++  nghttp2_frame_settings_init(&frame.settings, NGHTTP2_FLAG_NONE, dup_=
iv(iv, 2),
> ++                              2);
> ++
> ++  rv =3D nghttp2_frame_pack_settings(&bufs, &frame.settings);
> ++
> ++  CU_ASSERT(0 =3D=3D rv);
> ++  CU_ASSERT(nghttp2_bufs_len(&bufs) > 0);
> ++
> ++  nghttp2_frame_settings_free(&frame.settings, mem);
> ++
> ++  buf =3D &bufs.head->buf;
> ++  assert(nghttp2_bufs_len(&bufs) =3D=3D nghttp2_buf_len(buf));
> ++
> ++  ud.frame_recv_cb_called =3D 0;
> ++
> ++  rv =3D nghttp2_session_mem_recv(session, buf->pos, nghttp2_buf_len(b=
uf));
> ++  CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);
> ++
> ++  item =3D nghttp2_session_get_next_ob_item(session);
> ++  CU_ASSERT(NGHTTP2_GOAWAY =3D=3D item->frame.hd.type);
> ++
> ++  nghttp2_bufs_reset(&bufs);
> ++  nghttp2_bufs_free(&bufs);
> ++  nghttp2_session_del(session);
> ++}
> ++
> + static void
> + prepare_session_removed_closed_stream(nghttp2_session *session,
> +                                       nghttp2_hd_deflater *deflater) {
> +diff --git a/tests/nghttp2_session_test.h b/tests/nghttp2_session_test.=
h
> +index e872c5d0b..818c808d0 100644
> +--- a/tests/nghttp2_session_test.h
> ++++ b/tests/nghttp2_session_test.h
> +@@ -156,6 +156,7 @@ void test_nghttp2_session_repeated_priority_change(=
void);
> + void test_nghttp2_session_repeated_priority_submission(void);
> + void test_nghttp2_session_set_local_window_size(void);
> + void test_nghttp2_session_cancel_from_before_frame_send(void);
> ++void test_nghttp2_session_too_many_settings(void);
> + void test_nghttp2_session_removed_closed_stream(void);
> + void test_nghttp2_session_pause_data(void);
> + void test_nghttp2_session_no_closed_streams(void);
> diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb b=
/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> index 9ed8c5642..b212ede4d 100644
> --- a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> +++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
> @@ -10,6 +10,7 @@ UPSTREAM_CHECK_URI =3D "https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Frele=
ases&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d=
2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;sdata=3DmisO%2FSEpB92THW3xVx9%2BWkvFsdI3Z%2FL%2Fy%2=
FdMcEG88AY%3D&amp;reserved=3D0"
>  SRC_URI =3D "\
>      https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgithub.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&amp;data=3D04%=
7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3Dtq%2BGz4zgfP84bLfqf2UAI384FMhi%2BU4KvPghoPjGR9Y%3D&amp;reserve=
d=3D0{PV}/nghttp2-${PV}.tar.xz \
>      file://0001-fetch-ocsp-response-use-python3.patch \
> +    file://CVE-2020-11080.patch \
>  "
>  SRC_URI[md5sum] =3D "8d1a6b96760254e4dd142d7176e8fb7c"
>  SRC_URI[sha256sum] =3D "09fc43d428ff237138733c737b29fb1a7e49d49de06d2ed=
bed3bc4cdcee69073"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>

This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print, retain copy, disseminate, distribute, =
or use this message or any part thereof. If you receive this message in err=
or, please notify the sender immediately and delete all copies of this mess=
age. KPIT Technologies Ltd. does not accept any liability for virus infecte=
d mails.

--_000_BMXPR01MB34318E8491F3B495127DDFB8F2869BMXPR01MB3431INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I have backported this patch from Master branch as in master(v1.43.0) and =
Gatesgarth(v1.41.0) the code of this patch is already present in the source=
 code so it is only applicable for Dunfell(v1.40.0) and Zeus(v1.39.1) branc=
h.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Yes i will add my signoff in the patch.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<b>Can you please tell which is the correct ML for sending this patch ?</b=
><br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:; margin:0">
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Thanks and R=
egards,</span></div>
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Rahul Taya</=
span><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> akuster808 &lt;akust=
er808@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, February 16, 2021 9:32 PM<br>
<b>To:</b> Rahul Taya &lt;Rahul.Taya@kpit.com&gt;; Openembedded-core@lists=
.openembedded.org &lt;Openembedded-core@lists.openembedded.org&gt;; raj.khe=
m@gmail.com &lt;raj.khem@gmail.com&gt;<br>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Harpritkaur Bha=
ndari &lt;Harpritkaur.Bhandari@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2:=
 Add fix for CVE-2020-11080</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText"><br>
<br>
On 2/16/21 12:39 AM, Rahul Taya wrote:<br>
&gt; Added patch for CVE-2020-11080 taken from below link:<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e127=
36b18785c27f75090&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a5=
89c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63749=
0881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DLO7%2BKX%2F6ZD4VSi85fO=
VS%2FydUAFSH1kCUamqOyQcV0Ww%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub=
.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736b18785c27f7509=
0&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8=
d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DLO7%2BKX%2F6ZD4VSi85fOVS%2FydUAFSH1kCU=
amqOyQcV0Ww%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Rahul Taya &lt;Rahul.Taya@kpit.com&gt;<br>
Wrong ML.&nbsp;<br>
<br>
Is master or Gatesgath affected by this?<br>
<br>
Also the patch it self is missing your signoff.<br>
<br>
-armin<br>
&gt; ---<br>
&gt;&nbsp; .../nghttp2/nghttp2/CVE-2020-11080.patch&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; | 306 ++++++++++++++++++<br>
&gt;&nbsp; .../recipes-support/nghttp2/nghttp2_1.40.0.bb |&nbsp;&nbsp; 1 +=
<br>
&gt;&nbsp; 2 files changed, 307 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta-networking/recipes-support/nghttp2/nght=
tp2/CVE-2020-11080.patch<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020=
-11080.patch b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-110=
80.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..a376e5372<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.=
patch<br>
&gt; @@ -0,0 +1,306 @@<br>
&gt; +From 336a98feb0d56b9ac54e12736b18785c27f75090 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: James M Snell &lt;jasnell@gmail.com&gt;<br>
&gt; +Date: Fri, 17 Apr 2020 16:53:51 -0700<br>
&gt; +Subject: [PATCH] Implement max settings option<br>
&gt; +<br>
&gt; +CVE: CVE-2020-11080<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcomm=
it%2F336a98feb0d56b9ac54e12736b18785c27f75090&amp;amp;data=3D04%7C01%7CRahu=
l.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C637490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sd=
ata=3DLO7%2BKX%2F6ZD4VSi85fOVS%2FydUAFSH1kCUamqOyQcV0Ww%3D&amp;amp;reserved=
=
=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
github.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736b18785c2=
7f75090&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd981=
5d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637490881707290=
985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DLO7%2BKX%2F6ZD4VSi85fOVS%2FydUAF=
SH1kCUamqOyQcV0Ww%3D&amp;amp;reserved=3D0</a>]<br>
&gt; +Comment: No hunks refreshed<br>
&gt; +---<br>
&gt; + doc/CMakeLists.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt; + doc/Makefile.am&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt; + lib/includes/nghttp2/nghttp2.h | 23 +++++++++++++<br>
&gt; + lib/nghttp2_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp; 2 ++<br>
&gt; + lib/nghttp2_option.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp; 5 +++<br>
&gt; + lib/nghttp2_option.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp; 5 +++<br>
&gt; + lib/nghttp2_session.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | 21 ++++++++++++<br>
&gt; + lib/nghttp2_session.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp; 2 ++<br>
&gt; + tests/main.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++<br>
&gt; + tests/nghttp2_session_test.c&nbsp;&nbsp; | 61 +++++++++++++++++++++=
+++++++++++++<br>
&gt; + tests/nghttp2_session_test.h&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt; + 11 files changed, 124 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt<br>
&gt; +index 34c027929..f3aec84da 100644<br>
&gt; +--- a/doc/CMakeLists.txt<br>
&gt; ++++ b/doc/CMakeLists.txt<br>
&gt; +@@ -42,6 +42,7 @@ set(APIDOCS<br>
&gt; +&nbsp;&nbsp; nghttp2_option_set_no_recv_client_magic.rst<br>
&gt; +&nbsp;&nbsp; nghttp2_option_set_peer_max_concurrent_streams.rst<br>
&gt; +&nbsp;&nbsp; nghttp2_option_set_user_recv_extension_type.rst<br>
&gt; ++&nbsp; nghttp2_option_set_max_settings.rst<br>
&gt; +&nbsp;&nbsp; nghttp2_pack_settings_payload.rst<br>
&gt; +&nbsp;&nbsp; nghttp2_priority_spec_check_default.rst<br>
&gt; +&nbsp;&nbsp; nghttp2_priority_spec_default_init.rst<br>
&gt; +diff --git a/doc/Makefile.am b/doc/Makefile.am<br>
&gt; +index 4d73cef50..f073bfa4c 100644<br>
&gt; +--- a/doc/Makefile.am<br>
&gt; ++++ b/doc/Makefile.am<br>
&gt; +@@ -69,6 +69,7 @@ APIDOCS=3D \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nghttp2_option_set_peer_max_con=
current_streams.rst \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nghttp2_option_set_user_recv_ex=
tension_type.rst \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nghttp2_option_set_max_outbound=
_ack.rst \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nghttp2_option_set_max_settings.rst =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nghttp2_pack_settings_payload.r=
st \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nghttp2_priority_spec_check_def=
ault.rst \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nghttp2_priority_spec_default_i=
nit.rst \<br>
&gt; +diff --git a/lib/includes/nghttp2/nghttp2.h b/lib/includes/nghttp2/n=
ghttp2.h<br>
&gt; +index e3aeb9fed..9be6eea5c 100644<br>
&gt; +--- a/lib/includes/nghttp2/nghttp2.h<br>
&gt; ++++ b/lib/includes/nghttp2/nghttp2.h<br>
&gt; +@@ -228,6 +228,13 @@ typedef struct {<br>
&gt; +&nbsp; */<br>
&gt; + #define NGHTTP2_CLIENT_MAGIC_LEN 24<br>
&gt; +<br>
&gt; ++/**<br>
&gt; ++ * @macro<br>
&gt; ++ *<br>
&gt; ++ * The default max number of settings per SETTINGS frame<br>
&gt; ++ */<br>
&gt; ++#define NGHTTP2_DEFAULT_MAX_SETTINGS 32<br>
&gt; ++<br>
&gt; + /**<br>
&gt; +&nbsp; * @enum<br>
&gt; +&nbsp; *<br>
&gt; +@@ -398,6 +405,11 @@ typedef enum {<br>
&gt; +&nbsp;&nbsp;&nbsp; * receives an other type of frame.<br>
&gt; +&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp; NGHTTP2_ERR_SETTINGS_EXPECTED =3D -536,<br>
&gt; ++&nbsp; /**<br>
&gt; ++&nbsp;&nbsp; * When a local endpoint receives too many settings ent=
ries<br>
&gt; ++&nbsp;&nbsp; * in a single SETTINGS frame.<br>
&gt; ++&nbsp;&nbsp; */<br>
&gt; ++&nbsp; NGHTTP2_ERR_TOO_MANY_SETTINGS =3D -537,<br>
&gt; +&nbsp;&nbsp; /**<br>
&gt; +&nbsp;&nbsp;&nbsp; * The errors &lt; :enum:`NGHTTP2_ERR_FATAL` mean =
that the library is<br>
&gt; +&nbsp;&nbsp;&nbsp; * under unexpected condition and processing was t=
erminated (e.g.,<br>
&gt; +@@ -2659,6 +2671,17 @@ NGHTTP2_EXTERN void nghttp2_option_set_no_clo=
sed_streams(nghttp2_option *option,<br>
&gt; + NGHTTP2_EXTERN void nghttp2_option_set_max_outbound_ack(nghttp2_opt=
ion *option,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t val);<br>
&gt; +<br>
&gt; ++/**<br>
&gt; ++ * @function<br>
&gt; ++ *<br>
&gt; ++ * This function sets the maximum number of SETTINGS entries per<br=
>
&gt; ++ * SETTINGS frame that will be accepted. If more than those entries=
<br>
&gt; ++ * are received, the peer is considered to be misbehaving and sessi=
on<br>
&gt; ++ * will be closed. The default value is 32.<br>
&gt; ++ */<br>
&gt; ++NGHTTP2_EXTERN void nghttp2_option_set_max_settings(nghttp2_option =
*option,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; size_t val);<br>
&gt; ++<br>
&gt; + /**<br>
&gt; +&nbsp; * @function<br>
&gt; +&nbsp; *<br>
&gt; +diff --git a/lib/nghttp2_helper.c b/lib/nghttp2_helper.c<br>
&gt; +index 91136a619..0bd541472 100644<br>
&gt; +--- a/lib/nghttp2_helper.c<br>
&gt; ++++ b/lib/nghttp2_helper.c<br>
&gt; +@@ -334,6 +334,8 @@ const char *nghttp2_strerror(int error_code) {<b=
r>
&gt; +&nbsp;&nbsp; case NGHTTP2_ERR_FLOODED:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return &quot;Flooding was detected in this =
HTTP/2 session, and it must be &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
quot;closed&quot;;<br>
&gt; ++&nbsp; case NGHTTP2_ERR_TOO_MANY_SETTINGS:<br>
&gt; ++&nbsp;&nbsp;&nbsp; return &quot;SETTINGS frame contained more than =
the maximum allowed entries&quot;;<br>
&gt; +&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return &quot;Unknown error code&quot;;<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +diff --git a/lib/nghttp2_option.c b/lib/nghttp2_option.c<br>
&gt; +index e53f22d36..34348e660 100644<br>
&gt; +--- a/lib/nghttp2_option.c<br>
&gt; ++++ b/lib/nghttp2_option.c<br>
&gt; +@@ -121,3 +121,8 @@ void nghttp2_option_set_max_outbound_ack(nghttp2=
_option *option, size_t val) {<br>
&gt; +&nbsp;&nbsp; option-&gt;opt_set_mask |=3D NGHTTP2_OPT_MAX_OUTBOUND_A=
CK;<br>
&gt; +&nbsp;&nbsp; option-&gt;max_outbound_ack =3D val;<br>
&gt; + }<br>
&gt; ++<br>
&gt; ++void nghttp2_option_set_max_settings(nghttp2_option *option, size_t=
 val) {<br>
&gt; ++&nbsp; option-&gt;opt_set_mask |=3D NGHTTP2_OPT_MAX_SETTINGS;<br>
&gt; ++&nbsp; option-&gt;max_settings =3D val;<br>
&gt; ++}<br>
&gt; +diff --git a/lib/nghttp2_option.h b/lib/nghttp2_option.h<br>
&gt; +index 1f740aaa6..939729fdc 100644<br>
&gt; +--- a/lib/nghttp2_option.h<br>
&gt; ++++ b/lib/nghttp2_option.h<br>
&gt; +@@ -67,6 +67,7 @@ typedef enum {<br>
&gt; +&nbsp;&nbsp; NGHTTP2_OPT_MAX_DEFLATE_DYNAMIC_TABLE_SIZE =3D 1 &lt;&l=
t; 9,<br>
&gt; +&nbsp;&nbsp; NGHTTP2_OPT_NO_CLOSED_STREAMS =3D 1 &lt;&lt; 10,<br>
&gt; +&nbsp;&nbsp; NGHTTP2_OPT_MAX_OUTBOUND_ACK =3D 1 &lt;&lt; 11,<br>
&gt; ++&nbsp; NGHTTP2_OPT_MAX_SETTINGS =3D 1 &lt;&lt; 12,<br>
&gt; + } nghttp2_option_flag;<br>
&gt; +<br>
&gt; + /**<br>
&gt; +@@ -85,6 +86,10 @@ struct nghttp2_option {<br>
&gt; +&nbsp;&nbsp;&nbsp; * NGHTTP2_OPT_MAX_OUTBOUND_ACK<br>
&gt; +&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp; size_t max_outbound_ack;<br>
&gt; ++&nbsp; /**<br>
&gt; ++&nbsp;&nbsp; * NGHTTP2_OPT_MAX_SETTINGS<br>
&gt; ++&nbsp;&nbsp; */<br>
&gt; ++&nbsp; size_t max_settings;<br>
&gt; +&nbsp;&nbsp; /**<br>
&gt; +&nbsp;&nbsp;&nbsp; * Bitwise OR of nghttp2_option_flag to determine =
that which fields<br>
&gt; +&nbsp;&nbsp;&nbsp; * are specified.<br>
&gt; +diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c<br>
&gt; +index 563ccd7de..415e34776 100644<br>
&gt; +--- a/lib/nghttp2_session.c<br>
&gt; ++++ b/lib/nghttp2_session.c<br>
&gt; +@@ -458,6 +458,7 @@ static int session_new(nghttp2_session **session=
_ptr,<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; (*session_ptr)-&gt;max_send_header_block_length =3D NGH=
TTP2_MAX_HEADERSLEN;<br>
&gt; +&nbsp;&nbsp; (*session_ptr)-&gt;max_outbound_ack =3D NGHTTP2_DEFAULT=
_MAX_OBQ_FLOOD_ITEM;<br>
&gt; ++&nbsp; (*session_ptr)-&gt;max_settings =3D NGHTTP2_DEFAULT_MAX_SETT=
INGS;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; if (option) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if ((option-&gt;opt_set_mask &amp; NGHTTP2_=
OPT_NO_AUTO_WINDOW_UPDATE) &amp;&amp;<br>
&gt; +@@ -521,6 +522,11 @@ static int session_new(nghttp2_session **sessio=
n_ptr,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (option-&gt;opt_set_mask &amp; NGHTTP2_O=
PT_MAX_OUTBOUND_ACK) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*session_ptr)-&gt;max_outbound=
_ack =3D option-&gt;max_outbound_ack;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; if ((option-&gt;opt_set_mask &amp; NGHTTP2_OPT_M=
AX_SETTINGS) &amp;&amp;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; option-&gt;max_settings)=
 {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*session_ptr)-&gt;max_settings =3D =
option-&gt;max_settings;<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; rv =3D nghttp2_hd_deflate_init2(&amp;(*session_ptr)-&gt=
;hd_deflater,<br>
&gt; +@@ -5657,6 +5663,16 @@ ssize_t nghttp2_session_mem_recv(nghttp2_sess=
ion *session, const uint8_t *in,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iframe-=
&gt;max_niv =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; iframe-&gt;frame.hd.length / NGHTTP2_FRAME_SETTINGS_ENTRY_=
LENGTH + 1;<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (iframe-&=
gt;max_niv - 1 &gt; session-&gt;max_settings) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
rv =3D nghttp2_session_terminate_session_with_reason(<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; session, NGHTTP2_ENHANCE_YOUR_CALM,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &quot;SETTINGS: too many setting entries&quot;);<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if (nghttp2_is_fatal(rv)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; return rv;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
}<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
return (ssize_t)inlen;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iframe-=
&gt;iv =3D nghttp2_mem_malloc(mem, sizeof(nghttp2_settings_entry) *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; iframe-&gt;max_niv);<br>
&gt; +<br>
&gt; +@@ -7425,6 +7441,11 @@ static int nghttp2_session_upgrade_internal(n=
ghttp2_session *session,<br>
&gt; +&nbsp;&nbsp; if (settings_payloadlen % NGHTTP2_FRAME_SETTINGS_ENTRY_=
LENGTH) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return NGHTTP2_ERR_INVALID_ARGUMENT;<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; ++&nbsp; /* SETTINGS frame contains too many settings */<br>
&gt; ++&nbsp; if (settings_payloadlen / NGHTTP2_FRAME_SETTINGS_ENTRY_LENGT=
H<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt; session-&gt;max_set=
tings) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; return NGHTTP2_ERR_TOO_MANY_SETTINGS;<br>
&gt; ++&nbsp; }<br>
&gt; +&nbsp;&nbsp; rv =3D nghttp2_frame_unpack_settings_payload2(&amp;iv, =
&amp;niv, settings_payload,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; settings_payload=
len, mem);<br>
&gt; +&nbsp;&nbsp; if (rv !=3D 0) {<br>
&gt; +diff --git a/lib/nghttp2_session.h b/lib/nghttp2_session.h<br>
&gt; +index d20827315..07bfbb6c9 100644<br>
&gt; +--- a/lib/nghttp2_session.h<br>
&gt; ++++ b/lib/nghttp2_session.h<br>
&gt; +@@ -267,6 +267,8 @@ struct nghttp2_session {<br>
&gt; +&nbsp;&nbsp; /* The maximum length of header block to send.&nbsp; Ca=
lculated by the<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; same way as nghttp2_hd_deflate_bound(=
) does. */<br>
&gt; +&nbsp;&nbsp; size_t max_send_header_block_length;<br>
&gt; ++&nbsp; /* The maximum number of settings accepted per SETTINGS fram=
e. */<br>
&gt; ++&nbsp; size_t max_settings;<br>
&gt; +&nbsp;&nbsp; /* Next Stream ID. Made unsigned int to detect &gt;=3D =
(1 &lt;&lt; 31). */<br>
&gt; +&nbsp;&nbsp; uint32_t next_stream_id;<br>
&gt; +&nbsp;&nbsp; /* The last stream ID this session initiated.&nbsp; For=
 client session,<br>
&gt; +diff --git a/tests/main.c b/tests/main.c<br>
&gt; +index 41e0b03eb..67eb4a1c2 100644<br>
&gt; +--- a/tests/main.c<br>
&gt; ++++ b/tests/main.c<br>
&gt; +@@ -317,6 +317,8 @@ int main() {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_nghttp2_session_set_loc=
al_window_size) ||<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !CU_add_test(pSuite, &quot;sess=
ion_cancel_from_before_frame_send&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_nghttp2_session_cancel_=
from_before_frame_send) ||<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !CU_add_test(pSuite, &quot;session_t=
oo_many_settings&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_nghttp2_session_too_many_set=
tings) ||<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !CU_add_test(pSuite, &quot;sess=
ion_removed_closed_stream&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_nghttp2_session_removed=
_closed_stream) ||<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !CU_add_test(pSuite, &quot;sess=
ion_pause_data&quot;,<br>
&gt; +diff --git a/tests/nghttp2_session_test.c b/tests/nghttp2_session_te=
st.c<br>
&gt; +index 6eb8e244d..33ee3ad84 100644<br>
&gt; +--- a/tests/nghttp2_session_test.c<br>
&gt; ++++ b/tests/nghttp2_session_test.c<br>
&gt; +@@ -10614,6 +10614,67 @@ void test_nghttp2_session_cancel_from_befor=
e_frame_send(void) {<br>
&gt; +&nbsp;&nbsp; nghttp2_session_del(session);<br>
&gt; + }<br>
&gt; +<br>
&gt; ++void test_nghttp2_session_too_many_settings(void) {<br>
&gt; ++&nbsp; nghttp2_session *session;<br>
&gt; ++&nbsp; nghttp2_option *option;<br>
&gt; ++&nbsp; nghttp2_session_callbacks callbacks;<br>
&gt; ++&nbsp; nghttp2_frame frame;<br>
&gt; ++&nbsp; nghttp2_bufs bufs;<br>
&gt; ++&nbsp; nghttp2_buf *buf;<br>
&gt; ++&nbsp; ssize_t rv;<br>
&gt; ++&nbsp; my_user_data ud;<br>
&gt; ++&nbsp; nghttp2_settings_entry iv[3];<br>
&gt; ++&nbsp; nghttp2_mem *mem;<br>
&gt; ++&nbsp; nghttp2_outbound_item *item;<br>
&gt; ++<br>
&gt; ++&nbsp; mem =3D nghttp2_mem_default();<br>
&gt; ++&nbsp; frame_pack_bufs_init(&amp;bufs);<br>
&gt; ++<br>
&gt; ++&nbsp; memset(&amp;callbacks, 0, sizeof(nghttp2_session_callbacks))=
;<br>
&gt; ++&nbsp; callbacks.on_frame_recv_callback =3D on_frame_recv_callback;=
<br>
&gt; ++&nbsp; callbacks.send_callback =3D null_send_callback;<br>
&gt; ++<br>
&gt; ++&nbsp; nghttp2_option_new(&amp;option);<br>
&gt; ++&nbsp; nghttp2_option_set_max_settings(option, 1);<br>
&gt; ++<br>
&gt; ++&nbsp; nghttp2_session_client_new2(&amp;session, &amp;callbacks, &a=
mp;ud, option);<br>
&gt; ++<br>
&gt; ++&nbsp; CU_ASSERT(1 =3D=3D session-&gt;max_settings);<br>
&gt; ++<br>
&gt; ++&nbsp; nghttp2_option_del(option);<br>
&gt; ++<br>
&gt; ++&nbsp; iv[0].settings_id =3D NGHTTP2_SETTINGS_HEADER_TABLE_SIZE;<br=
>
&gt; ++&nbsp; iv[0].value =3D 3000;<br>
&gt; ++<br>
&gt; ++&nbsp; iv[1].settings_id =3D NGHTTP2_SETTINGS_INITIAL_WINDOW_SIZE;<=
br>
&gt; ++&nbsp; iv[1].value =3D 16384;<br>
&gt; ++<br>
&gt; ++&nbsp; nghttp2_frame_settings_init(&amp;frame.settings, NGHTTP2_FLA=
G_NONE, dup_iv(iv, 2),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2);<br>
&gt; ++<br>
&gt; ++&nbsp; rv =3D nghttp2_frame_pack_settings(&amp;bufs, &amp;frame.set=
tings);<br>
&gt; ++<br>
&gt; ++&nbsp; CU_ASSERT(0 =3D=3D rv);<br>
&gt; ++&nbsp; CU_ASSERT(nghttp2_bufs_len(&amp;bufs) &gt; 0);<br>
&gt; ++<br>
&gt; ++&nbsp; nghttp2_frame_settings_free(&amp;frame.settings, mem);<br>
&gt; ++<br>
&gt; ++&nbsp; buf =3D &amp;bufs.head-&gt;buf;<br>
&gt; ++&nbsp; assert(nghttp2_bufs_len(&amp;bufs) =3D=3D nghttp2_buf_len(bu=
f));<br>
&gt; ++<br>
&gt; ++&nbsp; ud.frame_recv_cb_called =3D 0;<br>
&gt; ++<br>
&gt; ++&nbsp; rv =3D nghttp2_session_mem_recv(session, buf-&gt;pos, nghttp=
2_buf_len(buf));<br>
&gt; ++&nbsp; CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);<br>
&gt; ++<br>
&gt; ++&nbsp; item =3D nghttp2_session_get_next_ob_item(session);<br>
&gt; ++&nbsp; CU_ASSERT(NGHTTP2_GOAWAY =3D=3D item-&gt;frame.hd.type);<br>
&gt; ++<br>
&gt; ++&nbsp; nghttp2_bufs_reset(&amp;bufs);<br>
&gt; ++&nbsp; nghttp2_bufs_free(&amp;bufs);<br>
&gt; ++&nbsp; nghttp2_session_del(session);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static void<br>
&gt; + prepare_session_removed_closed_stream(nghttp2_session *session,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; nghttp2_hd_deflater *deflater) {<br>
&gt; +diff --git a/tests/nghttp2_session_test.h b/tests/nghttp2_session_te=
st.h<br>
&gt; +index e872c5d0b..818c808d0 100644<br>
&gt; +--- a/tests/nghttp2_session_test.h<br>
&gt; ++++ b/tests/nghttp2_session_test.h<br>
&gt; +@@ -156,6 +156,7 @@ void test_nghttp2_session_repeated_priority_chan=
ge(void);<br>
&gt; + void test_nghttp2_session_repeated_priority_submission(void);<br>
&gt; + void test_nghttp2_session_set_local_window_size(void);<br>
&gt; + void test_nghttp2_session_cancel_from_before_frame_send(void);<br>
&gt; ++void test_nghttp2_session_too_many_settings(void);<br>
&gt; + void test_nghttp2_session_removed_closed_stream(void);<br>
&gt; + void test_nghttp2_session_pause_data(void);<br>
&gt; + void test_nghttp2_session_no_closed_streams(void);<br>
&gt; diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.b=
b b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb<br>
&gt; index 9ed8c5642..b212ede4d 100644<br>
&gt; --- a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb<br>
&gt; +++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb<br>
&gt; @@ -10,6 +10,7 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://apc=
01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghtt=
p2%2Fnghttp2%2Freleases&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81=
c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7=
C637490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DmisO%2FSEpB92THW=
3xVx9%2BWkvFsdI3Z%2FL%2Fy%2FdMcEG88AY%3D&amp;amp;reserved=3D0">https://apc0=
1.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp=
2%2Fnghttp2%2Freleases&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C81c=
7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C=
637490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DmisO%2FSEpB92THW3=
xVx9%2BWkvFsdI3Z%2FL%2Fy%2FdMcEG88AY%3D&amp;amp;reserved=3D0</a>&quot;<br>
&gt;&nbsp; SRC_URI =3D &quot;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://apc01.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fre=
leases%2Fdownload%2Fv%24&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C8=
1c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C637490881707290985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dtq%2BGz4zgfP84b=
Lfqf2UAI384FMhi%2BU4KvPghoPjGR9Y%3D&amp;amp;reserved=3D0{PV}/nghttp2-${PV}.=
tar.xz">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub=
.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&amp;amp;data=3D04%7C0=
1%7CRahul.Taya%40kpit.com%7C81c7b0a589c54fd9815d08d8d2944b5f%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637490881707290985%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;amp;sdata=3Dtq%2BGz4zgfP84bLfqf2UAI384FMhi%2BU4KvPghoPjGR9Y%3D&amp;amp;re=
served=3D0{PV}/nghttp2-${PV}.tar.xz</a>
 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-fetch-ocsp-respo=
nse-use-python3.patch">file://0001-fetch-ocsp-response-use-python3.patch</a=
> \<br>
&gt; +&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2020-11080.patch">file://CV=
E-2020-11080.patch</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; SRC_URI[md5sum] =3D &quot;8d1a6b96760254e4dd142d7176e8fb7c&quot=
;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;09fc43d428ff237138733c737b29fb1a7e=
49d49de06d2edbed3bc4cdcee69073&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; This message contains information that may be privileged or confident=
ial and is the property of the KPIT Technologies Ltd. It is intended only f=
or the person to whom it is addressed. If you are not the intended recipien=
t, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.
</body>
</html>

--_000_BMXPR01MB34318E8491F3B495127DDFB8F2869BMXPR01MB3431INDP_--
