Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.44])
 by mx.groups.io with SMTP id smtpd.web09.3943.1611214169298305252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 23:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=AcSY+ul9;
 spf=pass (domain: kpit.com, ip: 40.107.138.44, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZwKYxCvGD6z6jiPsEe+eHKllu6CY7pl+E5ihXKGC53gAKqchzkotwjfzPeHCqgyKFeWKTBblv3zy03mk/NSb+d/5hG/F7PShYi8g23eRW13m6yUVdRCxjqH2AtQ9m03MIwJdpilgAUgkoL6GABvZbjC4atvp7wJDMInrXcLL0X5A9wxVAXKo9wZrZEKuVoLxCHmTYSUJBbNiZk+rhaoACXy+Sc9ZbBgYXIIYR9SJCF2R7wB1FInHaMoycSXgS5W6smRTygA84RZVMbNKY0VjUJBLd88mdH4apESXobKa7OZTzA4tRbzGdDFJEN/I4loL5M2hmuOW5Mv51S+rY+eyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oQZutOuiFpWB9rzz/yptdsdAH5bm7TB8612+1KhLa4=;
 b=Sc6lznMZXcfybeqtUKNcBf62BhUcTxpZUb8VH/QvHOK6vLv7W1kyVpi0IU20lJ5lZ3xhlMyx5uqH8WtLIX0CWeY6LytqhUk5uP/Ak8zV0c98YBL6+cD6SIDMbk7bIHcRpmBQ54hNwHtmUCFv1BhuFN/WfsFo1Axm8sCh2tRQirtRONK6RTPLfiB3kju6hqTj9WaP/2Ec2aOV/GhzVXFE8jAMUZkGQiAUAkQgoCpiyT2S/qLp+lMHhp1wmxTAPbc8M1toEJ/1f7kZ49jAz2mjwisgWljleNNBtkKHE/kleHM8akaZyzeIuxF6L35+OgODHDCvZwUyewDHXI995l3p2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oQZutOuiFpWB9rzz/yptdsdAH5bm7TB8612+1KhLa4=;
 b=AcSY+ul9Cy3zg7SeTEVubKlM2lHXt5+SqmjrUqPGkmoRkoiKy7/qycxk0p7eO5Sk1BW/LAH8Jjwzo14KtlnlFd/Dg+Ak7NUqC7UB10Gzy3rrVeH+5vwmLl/rZXZRaFDBgbXEPA/NDkFMeFW4e2Vhmei2cGWNkEIVGPJ7ZYbAE30=
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR01MB3475.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:6d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 07:29:21 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868%7]) with mapi id 15.20.3763.016; Thu, 21 Jan 2021
 07:29:21 +0000
From: "saloni" <saloni.jain@kpit.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Nisha Parrakat <Nisha.Parrakat@kpit.com>, Anuj Chougule
	<Anuj.Chougule@kpit.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] openssh: Added security fix for CVE-2020-14145
Thread-Topic: [OE-core] [poky][dunfell][PATCH] openssh: Added security fix for
 CVE-2020-14145
Thread-Index: AQHW70c+FbrIYhYQMUKuQZ9gAFe6B6ows2kAgAD79Po=
Date: Thu, 21 Jan 2021 07:29:20 +0000
Message-ID: 
 <BM1PR01MB4019169CEE8F3C4AFE2D56C587A10@BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <1611159212-7640-1-git-send-email-Saloni.Jain@kpit.com>,<CAOSpxdY=R1pRpVySuWo_ekr4Pb_7yumuxhHjbggVD4OJ7EDvRA@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdY=R1pRpVySuWo_ekr4Pb_7yumuxhHjbggVD4OJ7EDvRA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [157.34.67.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b3a38b6f-4577-48fb-0170-08d8bdde4511
x-ms-traffictypediagnostic: BM1PR01MB3475:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BM1PR01MB34750652333792DFEAA2C31387A10@BM1PR01MB3475.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Wmp+QRKJdkuJj8AoKYiQjhQcgH3SgNmvo5gLGIXJpslc5RuR+cmzEfKJ7LOgBYi7P4BCaLc5kSe2m5kaW4MLdEGP6oghlJBlRDvNrGAl5ZCYD8yVhsu1kzGRVonnjKnTJmEXTd/qlXnlmfhEwOrISfdJxhy0hylZ3s6nJeOB/jTULLjXX+K/YanwaAjyypE3hXyJTl0muEdrJav9+hmNVb3lTvoPeWOaOXHRTfl5ciohyoSP+HHYVKjOKYWd8tDRkBWEQJTom8t/SgdENw44qvvVPnE12OyB2nWE+c0ZkO1VJakzLhGLXFPM/XRhvCRkKHSKwwI7gNz2MSJqbumwU4jIiGEe9ajPsLSCprKCzZI3NxLp8FLL7uviPglhYnhdkR/4d7qMsW7ilidqhBWb7+LXbTi2sbGm8xzNCfBpRpxCIEwEI/t1DjhL/8XtdMlfStD9MJcqo8AuJ0tlnxdUqJizLceRbynWVmfk1LjjyE9eGGbnGmGw3TB22nRIcUi6zNP5cmI/YXUfbW/LAyFyqQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(396003)(136003)(346002)(6506007)(4326008)(30864003)(316002)(18265965003)(76116006)(15650500001)(54906003)(86362001)(8936002)(166002)(71200400001)(186003)(966005)(66946007)(66574015)(53546011)(5660300002)(83380400001)(64756008)(45080400002)(66556008)(6916009)(33656002)(9686003)(107886003)(7696005)(55016002)(26005)(66446008)(66476007)(91956017)(52536014)(2906002)(8676002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?Te/4o+o6wTR8FcE7ZOBEcJeWopZRqGZEx8zFvqsEDn41dfINiwd/u59OmcT/?=
 =?us-ascii?Q?OIqryi3wOL0qLt1Y+RBJDH03HF6M75X47oNS1sUzCLUMmmzN6ywnK/32O6sK?=
 =?us-ascii?Q?yDj8+aRgUKULZhs/kT0TarJvAuQKx6ZLlKPXkdzFTVtVHpKaFZCRAdp2iiRz?=
 =?us-ascii?Q?8zAAUNEQno5ZtB9fsVz13L/F2dRLrHQS/Qm1FTqcPFWSDCElnL4DBw4BZDRn?=
 =?us-ascii?Q?DTMhQOwWFErCA6e3axBAT3nHKatvc2h8EJqZUlZ9Oatq+W576DGE8eoPImbt?=
 =?us-ascii?Q?E6RfXY/3vN5hU5X4FEXsrH4OlEFTlQh06hNoaXAokr1f777a5T7YGQL2DdAm?=
 =?us-ascii?Q?zMBmTd7waLw1PgExyvS9JIRp0o7R7WcgyxFTJLM1+CoH34LRsKLyzf1brEhK?=
 =?us-ascii?Q?VCDTf69CNc+8X6DnBShuvacQCk6t8TWYtpBRY8/04EJ3hspc8tZf1oHhCU1w?=
 =?us-ascii?Q?0CgZwZjD8tzXdAYzHjrzMqnUiBCBIusoPSPzRF7QK7np188HZB3qjC5sOLiV?=
 =?us-ascii?Q?KSRQKZNIU1+BqOuf7fmXGal2IAV/d5DhjS+OMSKb4E71C6QSzsHnTpNqta9b?=
 =?us-ascii?Q?gGfKCmuRSW2XSpuofXdkZviC9hWf7poV+R1OLaRl9fyaeQzTcbhuZ19+y0Q+?=
 =?us-ascii?Q?5aER9+ld0E06KgNr10Kx7vyXvS22ghrWnvM+Sc05nCBiNLicC1+lp3Kop5Oq?=
 =?us-ascii?Q?yyOc+vaXHGfMafdAzNWkGI9FYMov/rtsWcuZTrAZtYy2mQunKYGd4qiWzehY?=
 =?us-ascii?Q?9MqBOytod1GsJHoLDiokzF43ElCYrs/AUzqJ1sjQx3PGzXLD4q0doF8VDNSp?=
 =?us-ascii?Q?Vf4B/pGNaqJ6eM+hQeUmDMduWzFa+f6j7y9xSnrgq3oAfC7koEKB78yik5pd?=
 =?us-ascii?Q?gf+MkW/DThopxR154g79OCiqtM3DVgsUr/I1/JMkRjUrWlQeEas+7cOq4/Ml?=
 =?us-ascii?Q?YthuLpibkMywLuabZfqJMZrHBF+7Vp2ZC6/4V+5wQc3Q7hBcB5WTlls68TPF?=
 =?us-ascii?Q?BJs+?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a38b6f-4577-48fb-0170-08d8bdde4511
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 07:29:20.3341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aHBY9AILrY37y7t2CZ6sI0u5qHXHJnFAP7KqbM+T5vZIvwhRCA0db83UpC16UPv4dZzk4t1vF9BYqtDKvkzDng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3475
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB4019169CEE8F3C4AFE2D56C587A10BM1PR01MB4019INDP_"

--_000_BM1PR01MB4019169CEE8F3C4AFE2D56C587A10BM1PR01MB4019INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

Thankyou for the feedback, I have fixed the comments and sent a v2 for the=
 patch. Please review again.

Regards,
Saloni Jain
________________________________
From: Steve Sakoman <steve@sakoman.com>
Sent: Wednesday, January 20, 2021, 9:56 PM
To: Saloni Jain
Cc: Patches and discussions about the oe-core layer; Khem Raj; Nisha Parra=
kat; Anuj Chougule
Subject: Re: [OE-core] [poky][dunfell][PATCH] openssh: Added security fix =
for CVE-2020-14145

Thanks for helping with CVE's!

On Wed, Jan 20, 2021 at 6:14 AM saloni <saloni.jain@kpit.com> wrote:
>
> Added security fix for below CVE:
>
> CVE-2020-14145
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-14145&amp;data=3D04%7C01=
%7Csaloni.jain%40kpit.com%7Cf83bbfc7c77f4ad8d8f208d8bd60288e%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637467567996984807%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DZXW2tuDBsIINaE761xKo4Nmn5jDjMNn8JvTMTw29dmc%3D&amp;reserved=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fanongit.mindrot.org%2Fopenssh.git%2Fcommit%2F%3Fid%3Db3855ff053f5078ec3d3=
c653cdaedefaa5fc362d&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7Cf83bbfc7=
c77f4ad8d8f208d8bd60288e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63746=
7567996984807%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DV%2F8wQlaBwMgj2jUEcgsYDtyD=
gO%2B2eQmQ4fRCbCSpYEo%3D&amp;reserved=3D0
>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  .../openssh/openssh/CVE-2020-14145.patch           | 87 +++++++++++++++=
+++++++
>  meta/recipes-connectivity/openssh/openssh_8.4p1.bb |  3 +-
>  2 files changed, 89 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-1=
4145.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.pa=
tch b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> new file mode 100644
> index 0000000..50bf74d
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> @@ -0,0 +1,87 @@
> +From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Fri, 18 Sep 2020 05:23:03 +0000
> +Subject: upstream: tweak the client hostkey preference ordering algorit=
hm to
> +
> +prefer the default ordering if the user has a key that matches the
> +best-preference default algorithm.
> +
> +feedback and ok markus@
> +
> +OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f
> +CVE: CVE-2020-14145
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-14=
145&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7Cf83bbfc7c77f4ad8d8f208d8b=
d60288e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637467567996984807%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;sdata=3DZXW2tuDBsIINaE761xKo4Nmn5jDjMNn8JvTMTw29dmc=
%3D&amp;reserved=3D0]
> +Comment: 1 hunk with comment changes removed.

Needs your Signed-off-by here.  See "Patch name convention and commit
message" section at:

https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwiki.y=
octoproject.org%2Fwiki%2FSecurity&amp;data=3D04%7C01%7Csaloni.jain%40kpit.c=
om%7Cf83bbfc7c77f4ad8d8f208d8bd60288e%7C3539451eb46e4a26a242ff61502855c7%7C=
0%7C0%7C637467567996984807%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DYpC3QCRXeKyiw=
KE9jIUC4BiBjuKNk%2BabN80Fg3AN%2BKo%3D&amp;reserved=3D0

> +---
> + sshconnect2.c | 39 +++++++++++++++++++++++++++++++++++++--
> + 1 file changed, 37 insertions(+), 2 deletions(-)
> +
> +diff --git a/sshconnect2.c b/sshconnect2.c
> +index 347e348c..f64aae66 100644
> +@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostkey, =
struct ssh *ssh)
> +       return 0;
> + }
> +
> ++/* Returns the first item from a comma-separated algorithm list */
> ++static char *
> ++first_alg(const char *algs)
> ++{
> ++      char *ret, *cp;
> ++
> ++      ret =3D xstrdup(algs);
> ++      if ((cp =3D strchr(ret, ',')) !=3D NULL)
> ++              *cp =3D '\0';
> ++      return ret;
> ++}
> ++
> + static char *
> + order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
> + {
> +-      char *oavail, *avail, *first, *last, *alg, *hostname, *ret;
> ++      char *oavail =3D NULL, *avail =3D NULL, *first =3D NULL, *last =
=3D NULL;
> ++      char *alg =3D NULL, *hostname =3D NULL, *ret =3D NULL, *best =3D=
 NULL;
> +       size_t maxlen;
> +-      struct hostkeys *hostkeys;
> ++      struct hostkeys *hostkeys =3D NULL;
> +       int ktype;
> +       u_int i;
> +
> +@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *hos=
taddr, u_short port)
> +       for (i =3D 0; i < options.num_system_hostfiles; i++)
> +               load_hostkeys(hostkeys, hostname, options.system_hostfil=
es[i]);
> +
> ++      /*
> ++       * If a plain public key exists that matches the type of the bes=
t
> ++       * preference HostkeyAlgorithms, then use the whole list as is.
> ++       * Note that we ignore whether the best preference algorithm is =
a
> ++       * certificate type, as sshconnect.c will downgrade certs to
> ++       * plain keys if necessary.
> ++       */
> ++      best =3D first_alg(options.hostkeyalgorithms);
> ++      if (lookup_key_in_hostkeys_by_type(hostkeys,
> ++          sshkey_type_plain(sshkey_type_from_name(best)), NULL)) {
> ++              debug3("%s: have matching best-preference key type %s, "
> ++                  "using HostkeyAlgorithms verbatim", __func__, best);
> ++              ret =3D xstrdup(options.hostkeyalgorithms);
> ++              goto out;
> ++      }
> ++
> ++      /*
> ++       * Otherwise, prefer the host key algorithms that match known ke=
ys
> ++       * while keeping the ordering of HostkeyAlgorithms as much as po=
ssible.
> ++       */
> +       oavail =3D avail =3D xstrdup(options.hostkeyalgorithms);
> +       maxlen =3D strlen(avail) + 1;
> +       first =3D xmalloc(maxlen);
> +@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *host=
addr, u_short port)
> +       if (*first !=3D '\0')
> +               debug3("%s: prefer hostkeyalgs: %s", __func__, first);
> +
> ++ out:
> ++      free(best);
> +       free(first);
> +       free(last);
> +       free(hostname);
> +--
> +cgit v1.2.3
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_8.4p1.bb
> index 688fc8a..b71e156 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
> @@ -24,12 +24,13 @@ SRC_URI =3D "https://apc01.safelinks.protection.outl=
ook.com/?url=3Dhttp%3A%2F%2Fftp.openbsd.org%2Fpub%2FOpenBSD%2FOpenSSH%2Fpor=
table%2Fopenssh-%24&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7Cf83bbfc7c=
77f4ad8d8f208d8bd60288e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637467=
567996984807%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dp8z%2B6W%2Fbfbz9n0b8gZiLtTu=
Cc8LjfdRq4gsyYQkVvTA%3D&amp;reserved=3D0{PV}.tar
>             file://fix-potential-signed-overflow-in-pointer-arithmatic.p=
atch \
>             file://sshd_check_keys \
>             file://add-test-support-for-busybox.patch \
> +           file://CVE-2020-14145.patch \
>             "
>  SRC_URI[sha256sum] =3D "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33=
bd38748dafa1d2b24"
>
>  # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat=
 Enterprise Linux 7
>  # and when running in a Kerberos environment. As such it is not relevan=
t to OpenEmbedded
> -CVE_CHECK_WHITELIST +=3D "CVE-2014-9278"
> +CVE_CHECK_WHITELIST +=3D "CVE-2014-9278 CVE-2020-15778"

Why are you modifying the whitelist here?

Steve

>  PAM_SRC_URI =3D "file://sshd"
>
> --
> 2.7.4
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

--_000_BM1PR01MB4019169CEE8F3C4AFE2D56C587A10BM1PR01MB4019INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
</head>
<body>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
Hello Steve,&nbsp;</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
Thankyou for the feedback, I have fixed the comments and sent a v2 for the=
 patch. Please review again.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
Regards,</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255)=
; text-align: left;" dir=3D"auto">
Saloni Jain</div>
<div id=3D"id-a16575be-a56e-49c5-ae56-bd58334c2936" class=3D"ms-outlook-mo=
bile-reference-message">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg"><strong>From:</strong> Steve Sakoman &lt;steve@s=
akoman.com&gt;<br>
<strong>Sent:</strong> Wednesday, January 20, 2021, 9:56 PM<br>
<strong>To:</strong> Saloni Jain<br>
<strong>Cc:</strong> Patches and discussions about the oe-core layer; Khem=
 Raj; Nisha Parrakat; Anuj Chougule<br>
<strong>Subject:</strong> Re: [OE-core] [poky][dunfell][PATCH] openssh: Ad=
ded security fix for CVE-2020-14145<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pa=
dding-left: 4pt; border-left: #800000 2px solid; } --></style><font size=3D=
"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Thanks for helping with CVE's!<br>
<br>
On Wed, Jan 20, 2021 at 6:14 AM saloni &lt;saloni.jain@kpit.com&gt; wrote:=
<br>
&gt;<br>
&gt; Added security fix for below CVE:<br>
&gt;<br>
&gt; CVE-2020-14145<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-14145&am=
p;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7Cf83bbfc7c77f4ad8d8f208d8bd6=
0288e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637467567996984807%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DZXW2tuDBsIINaE761xKo4Nmn5jDjMNn8JvTMTw29d=
mc%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecuri=
ty-tracker.debian.org%2Ftracker%2FCVE-2020-14145&amp;amp;data=3D04%7C01%7Cs=
aloni.jain%40kpit.com%7Cf83bbfc7c77f4ad8d8f208d8bd60288e%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637467567996984807%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;am=
p;sdata=3DZXW2tuDBsIINaE761xKo4Nmn5jDjMNn8JvTMTw29dmc%3D&amp;amp;reserved=
=3D0</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fanongit.mindrot.org%2Fopenssh.git%2Fcommit%2F%3Fid%3Db385=
5ff053f5078ec3d3c653cdaedefaa5fc362d&amp;amp;data=3D04%7C01%7Csaloni.jain%4=
0kpit.com%7Cf83bbfc7c77f4ad8d8f208d8bd60288e%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637467567996984807%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DV%=
2F8wQlaBwMgj2jUEcgsYDtyDgO%2B2eQmQ4fRCbCSpYEo%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fanongi=
t.mindrot.org%2Fopenssh.git%2Fcommit%2F%3Fid%3Db3855ff053f5078ec3d3c653cdae=
defaa5fc362d&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7Cf83bbfc7c77f=
4ad8d8f208d8bd60288e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637467567=
996984807%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DV%2F8wQlaBwMgj2jUEcgsYDtyD=
gO%2B2eQmQ4fRCbCSpYEo%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../openssh/openssh/CVE-2020-14145.patch&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 87 ++++++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-connectivity/openssh/openssh_8.4p1.bb |&nbsp; 3 +-=
<br>
&gt;&nbsp; 2 files changed, 89 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-connectivity/openssh/openssh/CV=
E-2020-14145.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145=
.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..50bf74d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch<=
br>
&gt; @@ -0,0 +1,87 @@<br>
&gt; +From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: &quot;djm@openbsd.org&quot; &lt;djm@openbsd.org&gt;<br>
&gt; +Date: Fri, 18 Sep 2020 05:23:03 +0000<br>
&gt; +Subject: upstream: tweak the client hostkey preference ordering algo=
rithm to<br>
&gt; +<br>
&gt; +prefer the default ordering if the user has a key that matches the<b=
r>
&gt; +best-preference default algorithm.<br>
&gt; +<br>
&gt; +feedback and ok markus@<br>
&gt; +<br>
&gt; +OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f<br>
&gt; +CVE: CVE-2020-14145<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker=
%2FCVE-2020-14145&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7Cf83bbfc=
7c77f4ad8d8f208d8bd60288e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6374=
67567996984807%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DZXW2tuDBsIINaE761xKo4=
Nmn5jDjMNn8JvTMTw29dmc%3D&amp;amp;reserved=3D0">https://apc01.safelinks.pro=
tection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftrac=
ker%2FCVE-2020-14145&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7Cf83b=
bfc7c77f4ad8d8f208d8bd60288e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
37467567996984807%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DZXW2tuDBsIINaE761x=
Ko4Nmn5jDjMNn8JvTMTw29dmc%3D&amp;amp;reserved=3D0</a>]<br>
&gt; +Comment: 1 hunk with comment changes removed.<br>
<br>
Needs your Signed-off-by here.&nbsp; See &quot;Patch name convention and c=
ommit<br>
message&quot; section at:<br>
<br>
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fwiki.yoctoproject.org%2Fwiki%2FSecurity&amp;amp;data=3D04%7C01%7Csalon=
i.jain%40kpit.com%7Cf83bbfc7c77f4ad8d8f208d8bd60288e%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C637467567996984807%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sd=
ata=3DYpC3QCRXeKyiwKE9jIUC4BiBjuKNk%2BabN80Fg3AN%2BKo%3D&amp;amp;reserved=
=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
wiki.yoctoproject.org%2Fwiki%2FSecurity&amp;amp;data=3D04%7C01%7Csaloni.jai=
n%40kpit.com%7Cf83bbfc7c77f4ad8d8f208d8bd60288e%7C3539451eb46e4a26a242ff615=
02855c7%7C0%7C0%7C637467567996984807%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3DYpC3QCRXeKyiwKE9jIUC4BiBjuKNk%2BabN80Fg3AN%2BKo%3D&amp;amp;reserved=3D0=
</a><br>
<br>
&gt; +---<br>
&gt; + sshconnect2.c | 39 +++++++++++++++++++++++++++++++++++++--<br>
&gt; + 1 file changed, 37 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/sshconnect2.c b/sshconnect2.c<br>
&gt; +index 347e348c..f64aae66 100644<br>
&gt; +@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostke=
y, struct ssh *ssh)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++/* Returns the first item from a comma-separated algorithm list */<=
br>
&gt; ++static char *<br>
&gt; ++first_alg(const char *algs)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *ret, *cp;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D xstrdup(algs);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((cp =3D strchr(ret, ',')) !=3D N=
ULL)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; *cp =3D '\0';<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static char *<br>
&gt; + order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short po=
rt)<br>
&gt; + {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *oavail, *avail, *first, *last,=
 *alg, *hostname, *ret;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *oavail =3D NULL, *avail =3D NU=
LL, *first =3D NULL, *last =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *alg =3D NULL, *hostname =3D NU=
LL, *ret =3D NULL, *best =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t maxlen;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hostkeys *hostkeys;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hostkeys *hostkeys =3D NULL;<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ktype;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u_int i;<br>
&gt; +<br>
&gt; +@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *=
hostaddr, u_short port)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; options.nu=
m_system_hostfiles; i++)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; load_hostkeys(hostkeys, hostname, options.system_hostfiles=
[i]);<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If a plain public key exists=
 that matches the type of the best<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * preference HostkeyAlgorithms=
, then use the whole list as is.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Note that we ignore whether =
the best preference algorithm is a<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * certificate type, as sshconn=
ect.c will downgrade certs to<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * plain keys if necessary.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; best =3D first_alg(options.hostkeyal=
gorithms);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lookup_key_in_hostkeys_by_type(h=
ostkeys,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sshkey_type_=
plain(sshkey_type_from_name(best)), NULL)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; debug3(&quot;%s: have matching best-preference key type %s, &qu=
ot;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;using HostkeyAlgorithms verbatim&=
quot;, __func__, best);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; ret =3D xstrdup(options.hostkeyalgorithms);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; goto out;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Otherwise, prefer the host k=
ey algorithms that match known keys<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * while keeping the ordering o=
f HostkeyAlgorithms as much as possible.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oavail =3D avail =3D xstrdup(op=
tions.hostkeyalgorithms);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; maxlen =3D strlen(avail) + 1;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first =3D xmalloc(maxlen);<br>
&gt; +@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *h=
ostaddr, u_short port)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*first !=3D '\0')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; debug3(&quot;%s: prefer hostkeyalgs: %s&quot;, __func__, f=
irst);<br>
&gt; +<br>
&gt; ++ out:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(best);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(first);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(last);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(hostname);<br>
&gt; +--<br>
&gt; +cgit v1.2.3<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb b/met=
a/recipes-connectivity/openssh/openssh_8.4p1.bb<br>
&gt; index 688fc8a..b71e156 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb<br>
&gt; @@ -24,12 +24,13 @@ SRC_URI =3D &quot;<a href=3D""></a>https://apc01.=
safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fftp.openbsd.org%2Fpub%=
2FOpenBSD%2FOpenSSH%2Fportable%2Fopenssh-%24&amp;amp;data=3D04%7C01%7Csalon=
i.jain%40kpit.com%7Cf83bbfc7c77f4ad8d8f208d8bd60288e%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C637467567996984807%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sd=
ata=3Dp8z%2B6W%2Fbfbz9n0b8gZiLtTuCc8LjfdRq4gsyYQkVvTA%3D&amp;amp;reserved=
=3D0{PV}.tar<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <a href=3D"file://fix-potential-signed-overflow-in-pointer-arithmatic.pa=
tch">
file://fix-potential-signed-overflow-in-pointer-arithmatic.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <a href=3D"file://sshd_check_keys">file://sshd_check_keys</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <a href=3D"file://add-test-support-for-busybox.patch">file://add-test-su=
pport-for-busybox.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=
=3D"file://CVE-2020-14145.patch">file://CVE-2020-14145.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &quot;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;5a01d22e407eb1c05ba8a8f7c654d388a1=
3e9f226e4ed33bd38748dafa1d2b24&quot;<br>
&gt;<br>
&gt;&nbsp; # This CVE is specific to OpenSSH server, as used in Fedora and=
 Red Hat Enterprise Linux 7<br>
&gt;&nbsp; # and when running in a Kerberos environment. As such it is not=
 relevant to OpenEmbedded<br>
&gt; -CVE_CHECK_WHITELIST +=3D &quot;CVE-2014-9278&quot;<br>
&gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2014-9278 CVE-2020-15778&quot;<br=
>
<br>
Why are you modifying the whitelist here?<br>
<br>
Steve<br>
<br>
&gt;&nbsp; PAM_SRC_URI =3D &quot;<a href=3D"file://sshd">file://sshd</a>&q=
uot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.7.4<br>
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
</div>
</span></font><br>
</div>
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

--_000_BM1PR01MB4019169CEE8F3C4AFE2D56C587A10BM1PR01MB4019INDP_--
