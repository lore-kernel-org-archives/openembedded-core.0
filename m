Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7D5109C05C
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 19:57:03 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.115])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32364.1774468617902893850
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 12:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=tNZnxYAk;
 spf=pass (domain: navimatix.de, ip: 40.107.162.115, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJSO/J2YJxRiOSTsEvRfmj1ByGCMdjC5sy29oUwHCAweShatHRafFti4kVkF3C8p/kQJd2eHR+xFaPSHMxAy8flCVEbY64t6DBxjGP1sIaVL9ppc5B94nnAbSj+iDeuQnS/G+qvVhG+2seN5xFNHhAPLPKVza8PExuyL2VBysJ93CHi1N600teh0E1NbLmUFIsURwINw995hf1M0jcAGgvUrIO1QvUDYiK9nQTGJ4C5wqw5hNc9iRfDrcaYRnL3XWVa054OvxAZrVuNa72yj5wuWQtbo1cQQx2v8s6Dlhn72owWYgJrK6ro3d/NMKcbdLPVl4pOFz6UVV/oBrUYv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pUoV/1xgQdNGXaRdqGpYabTqSwb0SgjcHbrM2PIHeI=;
 b=x8gJ2SNQoQTyDrAx+aTDq8jW0nZ+B++FPTXMTAA4zH2o5ROiRKkiScc5QO+kCnpg5PnAdeBe7w1lQxJtjBEaBrEJEIWY4B0GvO/CRaoGj1Iy0pHgd+YCx1I30D/FAJ35TnVY0lmN5tx9u8KMxcrkGxeeYL4hZTzs+XrRgy5oesP9LXNPpImopiBddNyFLUshz7i676nEGo/LgDHskEm146BwZy592j2pt/26Knob3oS9exf0SLDKt0HrpKnZ/+PxagTmeSlNLUzSF/AuBkMW5D0OAauZwcQI2cyEgkYxx0t2bGRdJ4Lh6JPkOEIOkOjdPOrMEj37u0SypMeLvKkb0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pUoV/1xgQdNGXaRdqGpYabTqSwb0SgjcHbrM2PIHeI=;
 b=tNZnxYAkaVF/g1QWyTW6v3xsEdxYGxtuOFGdWSIMKZUuEUoBNnTswlE4fWDdNpOkR1s2SwV9J4lI0QXpa4xEG/6AdWvwSoXcN1NSJhclN740pDzGbqWsf9QfFA4dboY8K9YSfovTXee5l3gQXUhvHmvkEcPeAfJwomXrfXAg7fA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI2PR01MB12690.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:327::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 19:56:53 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9723.022; Wed, 25 Mar 2026 19:56:43 +0000
Date: Wed, 25 Mar 2026 20:56:51 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: JPEWhacker@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] Remove SPDX 2.2 support
Message-ID: <acQ9L4xr3OE8nYqT@navimatix.de>
References: <20260325171631.1048346-1-JPEWhacker@gmail.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="cy3gd5yulnrdl4se"
Content-Disposition: inline
In-Reply-To: <20260325171631.1048346-1-JPEWhacker@gmail.com>
X-ClientProxiedBy: BE1P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::9) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI2PR01MB12690:EE_
X-MS-Office365-Filtering-Correlation-Id: ec793684-1aa1-424e-5e82-08de8aa8a379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	LoRwB4dwlrX+zw8+ds5fvIq1lLte/7UVn8qACM2AH09Kdl+4+zY9u4qkFezK7sovdOkwGM2LCrwzcb1wKq/pyWn+43/ovS5Y1J+I3NNqCV69RSsK++Pq71Y7NKAx/j0/GhM+RSmhMn9SnNsJ7VevihTul2r7kIVfU3GjbgtmqRYBkc/vwjUdge4aycnEkD8OeaiRYfdba5vPGfqqX7jcSyduEv0YcZ80H5mi8K2ENgEkJl35kG6IEhCJsrmzcGGAtdE3PQXil58Oi1qGBrjEscLT8bJaEjkCIDDJI1oYWX7/Wghmnl/iMK+47RwZ5IGg/0rtUlrakXrtU13N3HLYBltCIHNUetake75GkZhysveCtb3L8hhz3T5nCUQ8/+8enrAPCPWN9dhxw6ipxVxuHWejIIJj4AY7XPiomgAhbI6s+GjVR5tmJlp1zOhuKKUb9z17+elHgMQFcXMp7j3HIizJRNHyz0YBgNCnP/gU8QL3T5AzjRG7SOI139jAzgtIUnbW1O4CwMVe97AvLcGuBjeEsyfJZ1iAbUx9CBXfeK2+VF9CUqjuRiIJNdmJSmGJw0pg7ZVOdFdrIujhlfDDWxVZF4FdY6GaCtZIZDpPUCa0dcOIO6rI6VrqezIGZadYi+e/eEixVQR23Y9c3AGfdJkh2PB97K8OqTUG0cGumy3keSnL0wntVZTKocNtyShR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?S1qZTLJWPQdtsen6Nj7cl1rwEwdfGPq9jlAb1wiLoNbXJmOYnWYXNQh8fJ?=
 =?iso-8859-1?Q?EkP4vK4qy2zG7+uVpKFPyPFZOVQDwc0e7cGGSEHf+CxXtOo8Qb0A/bG0yy?=
 =?iso-8859-1?Q?BPg7oy14tt7jUG45Jrf2THArPzJCu2gZohtd8tcx8yP61dHkCzQnnfP1pj?=
 =?iso-8859-1?Q?/HTC8Rqd23M+XkPZ5HSpzrL5pKMdGLnd9ZdcGJBLA8dKbEk+z12RoahlPS?=
 =?iso-8859-1?Q?rbV6q7HSozfFqUd2zFfnq9myMfFkHUihqWZbY7ufIC6OYIqo2OHXEoXFjK?=
 =?iso-8859-1?Q?VMWRXjkYVdEcHP1nn4tqHzqAZVoKlUZ+7LL6bkW2CTi4pouh+EJdNRPgx6?=
 =?iso-8859-1?Q?+v18sdGa4kuVDGjV0QiOFYhElV/AF2gifGp5yzGbq1jEg+ibpPk4gWf/gZ?=
 =?iso-8859-1?Q?L7R+SgskJGZ/FRA5jhs6ZpClPSgcBRWQtqe6dsOBykqHZeGpa+j0z3S2Rh?=
 =?iso-8859-1?Q?6iUqvSucdfch/C8w2xT+fVzeIbFSB0AyV6puYh0zCmfsOAuFSr1xkBQfwP?=
 =?iso-8859-1?Q?fITIhbkpz/bMkrYlffrJY1jpnP3qOvWnM4+U9nZGY0x6U0zk/rZSSlxeSm?=
 =?iso-8859-1?Q?XMx1f18Ty+QvepHg/CH4sy4p92FgeZjjbpOADL6B1Uvx/otNZssTX7sNvA?=
 =?iso-8859-1?Q?SkfKU8O2nplw+DFmXX9zQQhGWykof150bfYR0pybHxS7wnTEjHcnmg1dWv?=
 =?iso-8859-1?Q?KrgxOaR6fuWVtUY3R7Cn8dCQvk33+pN/2YeH0buHdiNzIUkCEOO8Wa1GMp?=
 =?iso-8859-1?Q?S2VpQnRmVojgfh+gCCJFbboSboFFZnXdcaH66Ro9q5ArdA4l35VcO5OOWC?=
 =?iso-8859-1?Q?wlFBB26oIa8uUoSGbF4MzHALt6xydQA35mZqfSINfhYIGUK9N8QXl/gll4?=
 =?iso-8859-1?Q?Hiy9hp/p6OL5y44Zgarncgr4tukeaKtmszmEjxTD7pcahWUB7F76W1Uxgm?=
 =?iso-8859-1?Q?c0rmZQDhsBzGsGA+LEMZokGXVm7yR+pXaBaKEaGIk/zdGzZ/AZSArtLVK8?=
 =?iso-8859-1?Q?lfrvS35hoiejzo/jnVmd3lTDMg+njsuYBbF+mR386Qt5BXdGojCzW+Mblr?=
 =?iso-8859-1?Q?LF/0afHcNGkUopPyss6X/okM3IWm4I7y9j0jXBsC7i4PCFyAq1xUOArpMR?=
 =?iso-8859-1?Q?CfDGfBS1Ei1TugClZMjywmInTfQfj4Rlzn9RDig1LVPR0+smHU1HBFgxlI?=
 =?iso-8859-1?Q?xXVfRP8v9UsUee1PmNIfvtynwQcloW4t13Nfa9KZxiBZB1Qg6U5R9087Ke?=
 =?iso-8859-1?Q?JA9hZJPAEXJev4dlCev8EEqLirFLKitDa1IVo9idFYo8kCXgR9CxUUaBSc?=
 =?iso-8859-1?Q?Kw7WwafCMka3G4YdvH7eiz907++ORtR8WQztdo9Tj8dYec9ao+j7bN/Aws?=
 =?iso-8859-1?Q?CCUvlIFncfnZiKc3GTnHSktu7ofedFXn3EhU40pIMPP/25alLvgqHUllDG?=
 =?iso-8859-1?Q?k9SlSoehrCfx1f2rZrIQLNgzGQiilSIC2H67H+LlfwA9Uf+Fj7ZPHw9fJ2?=
 =?iso-8859-1?Q?SSlLj0J05w/zDmT5gRN06spnBT5CJpaW/0Y1mA5JgVfN6mjpEs2JZESDjw?=
 =?iso-8859-1?Q?1V9sF7mkWufvPOqqZGSlttsiGr52i94ZQcvUl7M03XKCQF/SW4mdvLR19s?=
 =?iso-8859-1?Q?2wKiVPkHuxhAoSJPp8oTHxU7lIecYQicVFocSnp7gCMnPgJLerSEXVYqBB?=
 =?iso-8859-1?Q?gduwWXBXdfo7l78I8mn+xuk8z6r/K9pStnbUMiu51Wn+XgKZQ5rSSkRhQR?=
 =?iso-8859-1?Q?Kko8Kk6ZRbpE04rmtMq6anXI4cpTn84ydUEIwdYg63rmFJiNC4ZKWxXTrQ?=
 =?iso-8859-1?Q?dmfKP+pxMfj8yFgfIFsda6a+ICBmbFA=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ec793684-1aa1-424e-5e82-08de8aa8a379
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:56:43.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouA0f4xHKXn7udWmiVwnTe9Su4KJNJDGPNFGdUhNB0pwQomVS7QFHxiJ3fghRJkQXsNBdjj0/pPoz52tDrWSCh2Khmw3g4w+l8r86ktJ75c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR01MB12690
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 19:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233935

--cy3gd5yulnrdl4se
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core][PATCH] Remove SPDX 2.2 support
MIME-Version: 1.0

Joshua Watt via lists.openembedded.org schrieb am Mi 25. M=E4r, 11:16 (-060=
0):
> Removes SPDX 2.2 support in favor of SPDX 3 support being the only
> option. The SPDX 3 data is far superior to SPDX 2.2 and thus more useful
> for SBoM uses cases.

s/uses/use/

Could this be delayed until after the release of 6.0, so 6.0 would contain
SPDX=A02.2 support? For internal tools we still use SPDX=A02.2


J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--cy3gd5yulnrdl4se
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIThAYJKoZIhvcNAQcCoIITdTCCE3ECAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG
9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAw
WhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4w
PAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY7
5tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHb
SuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfq
B6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC
0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz
6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5
v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNV
HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
cmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3Au
dXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfX
ehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2
f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGW
MeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF
8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bw
c/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F
2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORds
NmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNK
cIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQR
EJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVv
JsmzNicwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggJ7MIICdwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggaAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzI1MTk1NjUwWjAvBgkqhkiG9w0BCQQxIgQg2fhXZcOc
7EtsHmPPtZmJ/t3jYmfv661AshENlSZsJ/EwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAFAOxEmH5nH5
Bhsz4xvF1GXP9JKope/DFvOhFZpUvFs7NedtjQ61SpWhYye90vcvcQ+D6x9U5bDJsfMB5E17
dHwH0oYbTXrQMpf4QAfns2gEmokiS7fM2LIWMMe5VPsw4m4Se1XWkMLebZWO2DRNwr4Sy44U
/xsiVMeEx6IpFQ6/tZfEAeZ5IBhiuCkZLmI5OeaSOAskcKMUEEQkDGQc2dpqmrHHXuMk/CB4
oy4GuDZsJ5VRlkXAfFnplFiqQzCPKkLFx3DD6NB5Uw8YskQoz6QjVdc5qKpCyrvk0Ucc+DjG
BgiPr2zBu7FKldhp1IrsvTp2HJEcrWPxwDaVbMXseP0=

--cy3gd5yulnrdl4se--

