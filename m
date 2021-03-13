Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.70])
 by mx.groups.io with SMTP id smtpd.web09.4826.1615672898090727013
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 14:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VayhE7YT;
 spf=pass (domain: windriver.com, ip: 40.107.100.70, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBEeSAXHkdbADn+wNdxjRC/MzIQ4kWkDyM1KEKieQtZFfeS8lI1Gt+ShrUnVWGhK6cJtGRpAki+Z1ZK15AvIjeIQHdQXrYpqW7OustLv+eruEEFzYRczIr5snwif7lN/mhQ2jgv+6KoGUBdYPEAjEku9+i9478Gc4ZNGVCYnLfDnEfLnjMZ70f/kpXc5mUMaTIanwLpDyTw6/3kjk8Upb/jHVg2qrxlcPFc7bbMQ6j0sXfklXsCzjZkCEbV8R6ks8yPu1iWG/bNbX+REYSdffBGumCl+vy4vLrGvYQipbY0Hpxkse7e/Ln/aQNhkNCset98pT7Xk+W5ZtA84BR2ctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syO9rBtPis3n++p6nrJiHXWRQmqTSM8Nu8xiDyvaJlI=;
 b=CK5M4wlvcRoZc5owZRnvG3JhsNiwzt2T+7joi3XhI3tQSyuqfUJgNaLyd7pZ0UkvSEdRqzkGpLHIdq1QecbH3PaBR1/L+GE+i1/ehCqvwK8vOdlWBrAY264gG9a5pO5RQ3zI8COHXkLMmC2H6egN09cgCnKemAYSNMYLJlzTD57Jcnz6EU3K26zv/3w5eRdnsNJWodeLEnzOtnMxwSBoe1kLmUzDWzH0jdRP779PQfL22ve+UVUzAV8y/pJTY9Z2qzOsvRVPHf1bgDhOuR9LKahZzNDVB6T1ytQTJn2ctMzYYPFqwJmlxha+AEZAkP20pwzbtNvPSQdFt+XTJ4gLTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syO9rBtPis3n++p6nrJiHXWRQmqTSM8Nu8xiDyvaJlI=;
 b=VayhE7YTQyqoYrzo19WV5TFXlVq2OUcSP+WRZ3kNmrgT50eVV69TsOC97LXDkpO8Elsf8Z6F/S/VnsCVFAiiqtvOitNt94PKtcX/d35IE3L1gRiFgP2JWNfuTzAvGfzMLZ4oLIlmJUuehVPAT9xYT6g8yXQaY9Er828aHDBYnWE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3707.namprd11.prod.outlook.com (2603:10b6:5:144::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sat, 13 Mar
 2021 22:01:36 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3912.031; Sat, 13 Mar 2021
 22:01:36 +0000
Subject: Re: [OE-core] [PATCH v2][RFC] distrodata.py: Test to track recipes without HOMEPAGE or DESCRIPTION
To: dorinda bassey <dorindabassey@gmail.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
References: <20210308211207.6853-1-dorindabassey@gmail.com>
 <c9021472-59ad-9511-d9bf-fd9b6d71e109@windriver.com>
 <CAJSnhztKbi-A+jUALk1vJ6fLWbf5TfV4xiYhA-K8xz7Qmj_Bsw@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <d18e39a4-fc11-191a-a784-7b5e67e767d3@windriver.com>
Date: Sat, 13 Mar 2021 17:01:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAJSnhztKbi-A+jUALk1vJ6fLWbf5TfV4xiYhA-K8xz7Qmj_Bsw@mail.gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BY3PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::27) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BY3PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:39a::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Sat, 13 Mar 2021 22:01:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5cabf37-3125-45a0-9080-08d8e66b9226
X-MS-TrafficTypeDiagnostic: DM6PR11MB3707:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3707BD597DF4F1711C74D5ECF86E9@DM6PR11MB3707.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9zIXc1C+VwA2TGpmHxbF2jcZKPwrc4ufhs4PtW3gqsU+UFKS6IEup1w6szxAcVXS2qJAoRgAunuDAyZGqPl8u+isykqfhZsA1UNylLOnBPYsX0H83IBPqHbTKlQLQfv5fvlm9L5xE8LWegqOy83aGKc1GM6RaDH+ZrHcf5arIzvVtFHVhN0+cxaN65J0MyA8d1yOBEdpKhinLaGFa6KOq4TgOtllBTqBgbWj/LHnEMBOGh+4dwUqLnQ+cDQtZWdufsfsgBnz6ozIwjXFtqgcbxLAQU3d7GqnDIzD/dDfnqF9+V6/Wtk502lbx520wC4EE/ZHI/zVs9FQ5hrQZG2Y4easX9HI8gI5nrNT0rrBScGmzFMBq+jDtyz/0ode95foO4hwR24BMIoR9+aXlcl0ZswmboCujjwwMwR/1Dj1sY8qNs4XukA5D1LST3F/4KDZKXhaz6BUUXmuGgPIYA1u3VrJMv4optvgaf1MBAknZmkqbCzwBprgSZolaQJ1sIh4mW7G7iv0EBjHW6PGX+gnbwgyld1EhBH5/i8hW3gx9oZDU0i34vz5kym9iiZyaPI4Cf9zH0y1Eu7w3DLZMCVfQCsvw88d7FRtcxir3KuEbGnpJs3lRuLrSeqgiXwVIgXWHxJBQTqOxmQ4+GJYYXcC3wsxLwYJaV1a7bW4Npl8i2YGEdIAy54RYpd0vUr2ZSxmffyXEVtiQEFfuntI+ggOjzNDIU8fVUHhh9M0BAELewU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39830400003)(346002)(366004)(36756003)(478600001)(83380400001)(66946007)(66556008)(66476007)(4326008)(5660300002)(316002)(6486002)(966005)(53546011)(16576012)(8676002)(31696002)(86362001)(956004)(2616005)(31686004)(52116002)(6916009)(16526019)(2906002)(186003)(6666004)(8936002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?xmUcr+mqDe4lSAA1GMA3Y680TLyFvjbaT0Pfs1SGZ5ytbcfh9FX124rpueXq?=
 =?us-ascii?Q?OBh5BFQR+mkqlZaJz93/R1fhRYdE5U8ZPTGDFgnPaXW1ZCOGNFaemzEXEeIG?=
 =?us-ascii?Q?aUa4BEeA+uawmzgv9BtrE7NzNIhPCi0YmP3oqgyXOoqQSE52j+JUubEB4flc?=
 =?us-ascii?Q?OpLqO+8ciqcgpOSFARy1flJ2TgFy4pvn4OGMGEBNqI70vllrwumPwejLfSrF?=
 =?us-ascii?Q?IDT6TgXimGBL2/DOaRd4T2gtEsklBTqlyU2VtKafslCgatjgR79Acurw2zod?=
 =?us-ascii?Q?0zhSy+k40fHP/EM8D5ELKjEEhQzWBRcasfjrUPdAMos0aPIZu6UA1Q40saqe?=
 =?us-ascii?Q?bOr4tJORA6z/NLyD+HTUMehRwrHrzsR1Ety+AAObzicNS9s4Qhg+FMqT+Aw1?=
 =?us-ascii?Q?h+SpyRcBKG/k3bHr7qKpWpaBF9vqXqIIZzyHQ19JtkkfCz4eOK+H3FDUwIQu?=
 =?us-ascii?Q?2zvc5LC7hhMXpeHgQzsBCzCnGEUJ4H2m60F59iDb3CnWEP6BjW1zfkgM4HDE?=
 =?us-ascii?Q?zOcnVdPRz8nL8IpYea6VS0qOikwBxYxvMqhzz47sfKtHyHxChT7SDvTtmhpM?=
 =?us-ascii?Q?00zznUHyGkklPnGdsmlCdNUPkLsMrJi6L3tuONHwam72hbH43dZV17HPepuI?=
 =?us-ascii?Q?WYnRHmaI0+GxCtiINZvYuiMRup6/ZudzzXt0uIyy41F5kX6/dF+NZBLDQ9b3?=
 =?us-ascii?Q?W/DZeHzWrya4G5z68UoQWtch5oKQOAATSABaP/44Q3AuWuM00v/idKMluxkS?=
 =?us-ascii?Q?FFX9nMLDffiqb3tCiDr2YaxX3pPbJpN57/3wi5upRAH2TU17yom67CqXxPoJ?=
 =?us-ascii?Q?xzw0XWDnlYWtYXUo9qygKHQFYUlgX+D7S6O6XgBFiH2AzDsAZG2hdsHbeozU?=
 =?us-ascii?Q?+pG9n3MshtRh1rnwCUSUHE/LTccA7wTPJJjAGKuCoUuRnjfMZ3YunN5VGCQe?=
 =?us-ascii?Q?ca/O2Jxrij6Fzll6NrP2K5KaitdGVGo1XpfQAOiSjhqZIKuAM27sA8O1Qqpr?=
 =?us-ascii?Q?vYi8KCDRfjuyTUFaDFEdHOInO23wcMZ/C7oK/pM6ykJHVvjXL/y9clFV096y?=
 =?us-ascii?Q?lJzkGm6ys11ADiOh2Wf7oQUQjjydik6AX6sLAJRCIXpM3eMnZcFCjrj660NK?=
 =?us-ascii?Q?aGaeylxhmUdKnJK1wHbI4N26Q+4hYoXKr5MYMGvsVXjC3ZGl7T8+1pUnL82u?=
 =?us-ascii?Q?7K+7WH6ODtZakTC7+D5C1NgFqNuXJ1qO1xSl6vXrqufeUlTGo15FDHSIdYtF?=
 =?us-ascii?Q?5cBwGDAFg7pDI1EbGQHC+l/mt3so5q86Pzg2JPk8b2ZjZPi80Wq31urbwe/z?=
 =?us-ascii?Q?r/RsYM+aLE3X1MwcpWpxsdpy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5cabf37-3125-45a0-9080-08d8e66b9226
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 22:01:36.1604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ezog26uTGAh0PgBJ0LWL3KpEEsLxpR2NjNOTRLWZORZQj/X0ZzjQ9lXBPYbmXhva/05nxeByjYa1rc3kPvCC1FFjdkE2U5x6oCBC2zmrp2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3707
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-03-12 3:44 p.m., dorinda bassey wrote:
> Alright, I get you.
> Will send a v3 RFC.

I think it'll be ready to merge so drop the RFC!
../Randy

>=20
> Thanks,
> Dorinda.
>=20
> On Fri, Mar 12, 2021 at 3:11 AM Randy MacLeod=20
> <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>> wrote=
:
>=20
>     On 2021-03-08 4:12 p.m., Dorinda wrote:
>      > This test is to keep track of recipes that do not have a HOMEPAGE
>     or DESCRIPTION,
>      > with exceptions to recipes whose SRC_URI are not linked to
>     external sources.
>      >
>      > [YOCTO #13471]
>      >
>      > Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com
>     <mailto:dorindabassey@gmail.com>>
>      > ---
>      > v2:
>      > -Changed PN to BPN
>      > -Used set() instead of lists
>      > -Changed condition for checking recipes with missing DESCRIPTION
>      >
>      >=C2=A0 =C2=A0meta/lib/oeqa/selftest/cases/distrodata.py | 36
>     ++++++++++++++++++++++
>      >=C2=A0 =C2=A01 file changed, 36 insertions(+)
>      >
>      > diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py
>     b/meta/lib/oeqa/selftest/cases/distrodata.py
>      > index e1cfc3b621..633bf25dc7 100644
>      > --- a/meta/lib/oeqa/selftest/cases/distrodata.py
>      > +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
>      > @@ -40,6 +40,42 @@ but their recipes claim otherwise by setting
>     UPSTREAM_VERSION_UNKNOWN. Please re
>      >=C2=A0 =C2=A0""" + "\n".join(regressed_successes)
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(len(regre=
ssed_failures) =3D=3D 0 and
>     len(regressed_successes) =3D=3D 0, msg)
>      >
>      > +=C2=A0 =C2=A0 def test_missing_homepg(self):
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 """
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0 =C2=A0Test for=
 oe-core recipes that don't have a
>     HOMEPAGE or DESCRIPTION
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 =C2=A0 All oe-core r=
ecipes should have a
>     DESCRIPTION entry
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 =C2=A0 All oe-core r=
ecipes should have a HOMEPAGE
>     entry except for recipes that are not fetched from external sources.
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Product:=C2=A0 =C2=A0 =C2=A0oe-core
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 """
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with bb.tinfoil.Tinfoil() as tinfoil=
:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfoil.prepare(config=
_only=3DFalse)
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_description =3D set=
()
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_homepage =3D set()
>=20
>     Since the other tests in this file such as:
>      =C2=A0 =C2=A0 =C2=A0def test_maintainers(self):
>     uses lists rather than set()s:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with_maintainer_lis=
t =3D []
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no_maintainer_list =
=
=3D []
>=20
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0missing_recipes =3D=
 []
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipes =3D []
>=20
>     Maybe pick one data structure to be consistent.
>=20
>     If you decide that set() is better then make a separate commit to
>     change that. Apparently sets are faster for some operations:
>     https://stackoverflow.com/questions/2831212/python-sets-vs-lists
>     <https://stackoverflow.com/questions/2831212/python-sets-vs-lists>
>     it would be nice if you checked and documented what you find in the
>     commit log since these tests do take a few minutes on a lowly laptop=
.
>=20
>     The rest looks good to me. Drop the RFC if you send a v3.
>=20
>     Thanks!
>     ../Randy
>=20
>=20
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for fn in tinfoil.all_=
recipe_files(variants=3DFalse):
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not '=
/meta/recipes-' in fn:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 # We are only interested in OE-Core
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rd =3D t=
infoil.parse_recipe_file(fn, appends=3DFalse)
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D r=
d.getVar('BPN')
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcfile =
=
=3D rd.getVar('SRC_URI').split()
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #Since D=
ESCRIPTION defaults to SUMMARY if not
>     set, we are only interested in recipes without DESCRIPTION or SUMMAR=
Y
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not (=
rd.getVar('SUMMARY') or
>     rd.getVar('DESCRIPTION')):
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 no_description.add((pn, fn))
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not r=
d.getVar('HOMEPAGE'):
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if srcfile and srcfile[0].startswith('file')
>     or not rd.getVar('SRC_URI'):
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # We are only interested in recipes
>     SRC_URI fetched from external sources
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 continue
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 no_homepage.add((pn, fn))
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if no_homepage:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail("""
>      > +The following recipes do not have a HOMEPAGE. Please add an
>     entry for HOMEPAGE in the recipe.
>      > +""" + "\n".join(['%s (%s)' % i for i in no_homepage]))
>      > +
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if no_description:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail("""
>      > +The following recipes do not have a DESCRIPTION. Please add an
>     entry for DESCRIPTION in the recipe.
>      > +""" + "\n".join(['%s (%s)' % i for i in no_description]))
>      > +
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0def test_maintainers(self):
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"""
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Summary:=C2=A0 =C2=A0 =C2=
=
=A0Test that oe-core recipes have a
>     maintainer and entries in maintainers list have a recipe
>      >
>      >
>      >
>      >=20
>      >
>=20
>=20
>     --=20
>     # Randy MacLeod
>     # Wind River Linux
>=20


--=20
# Randy MacLeod
# Wind River Linux
