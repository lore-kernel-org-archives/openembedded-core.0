Return-Path: <ferlandm@amotus.ca>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0095.outbound.protection.outlook.com [104.47.40.95])
	by mail.openembedded.org (Postfix) with ESMTP id 0B34460750
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amotus.onmicrosoft.com; s=selector1-amotus-ca;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=f/ViFuzYo80vIz0kbkx+83XxJbB1Qw4XBd1LkO7sDoI=;
	b=vIRHDr24ZV7WyNk6hgUEOC0fg7qA3+U6jDdTkBL06pfS0e8dQXyc0Q5OuYfAiDqiV58PxHp4yjvIhJRYTMEK42I+5aHSvD/IJLGZI5lZheX9PG3z3xvwTzW9AGqbMWSByTux3VGVs7P6lgN07Fb8oIDMWoDqcSn7QgxcsL7RAZQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=amotus.ca;
Received: from mail-vk0-f45.google.com (209.85.213.45) by
	BN6PR11MB1667.namprd11.prod.outlook.com (10.172.24.16) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Fri, 12 May 2017 18:07:06 +0000
Received: by mail-vk0-f45.google.com with SMTP id h16so22125368vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:07:05 -0700 (PDT)
X-Gm-Message-State: AODbwcD3R7fZnYYsmz4GUn8snT4eWHCgj0U4ImWDtNb0rwupXAIzgTmJ
	uV2sI1KEziYhRH4OODqb18ulxlnayQ==
X-Received: by 10.31.224.194 with SMTP id x185mr2479713vkg.114.1494612423813; 
	Fri, 12 May 2017 11:07:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.123.1 with HTTP; Fri, 12 May 2017 11:07:03 -0700 (PDT)
In-Reply-To: <20170512180018.GI28053@denix.org>
References: <1494610960-32690-1-git-send-email-ferlandm@amotus.ca>
	<20170512180018.GI28053@denix.org>
From: Marc Ferland <ferlandm@amotus.ca>
Date: Fri, 12 May 2017 14:07:03 -0400
X-Gmail-Original-Message-ID: <CAMRMzCC6u-niBDDzVgDzzV4WbcbvKcjRsjPRCM3vcnhLcpFdYQ@mail.gmail.com>
Message-ID: <CAMRMzCC6u-niBDDzVgDzzV4WbcbvKcjRsjPRCM3vcnhLcpFdYQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Originating-IP: [209.85.213.45]
X-ClientProxiedBy: DM5PR08CA0002.namprd08.prod.outlook.com (10.175.218.12) To
	BN6PR11MB1667.namprd11.prod.outlook.com (10.172.24.16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3831055f-2efd-4ed3-3044-08d49961b304
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:BN6PR11MB1667; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1667;
	3:mYUHd3o8gmP2tTloHuuvU91i3zDEtx8+VuJiCAZqTWaSlz1N/pH0heceaa6yTq3sV0PP3gMeGlMCBpRvq6jumep0p8IB9vdWJXlM7fu7GuK55Y1i6eA/M+WmDOaVsNGQNu3gZcZQjKU4jv/nSEN3XouOPU8E1IrQO7B65b+2RhPDaS53hLXilLDR98aQiR8SsaqF+gr51Y3aSW8hVhML0gu1IN9oJwWelvrCb4Kyd47Yd67jg8JTpkKXulk17wF4StSvxOVFFNs4enfhiaHq91dDUSvefdRpY4I2uubima01BMCEJWFdn5npwhf7e1vL;
	25:WDlJiM7EQ6oi9/uZsEqpW9a6NTJN9QMIA5sQXV5zWitKcdnVg62FeWJeSOS28WzCo5rfJJbztoC/ZdQ6ndsanQCbXxDagdPhvXWbMd01RZjnyR+Oiqs4rQQV+DDXnbUD28Brfvb3H1hKu2g1ugQHj9vx813CppQIhhphWSNT5+IavKeu/B83LJohvB2uwFK5LhIpr7nsKva4gS0sZTPoZ1QlhQpfeUc/yxiqX+csdQ+d72zzE6Mc9ZniRAgfSmldQQ2IXQ3GgLRtCQp8wnuZXDr0v0HO16rXMNH9n3wpve9Omx5gAcOukSC/L5bWA+Ocx1xkcYi0UWGvnlr+kLvv5F7+yrS7l9a9F5wG89vnJNWTMDxdcToDpD9y1STtoncxfOT6vDb5sM/fleItxW8t8hplHFxT8R3FpPY/xLuRx04xD4eU+Lxh2+j7H21uE4VNCHN9h0Ikk8hdbHD6asopdfD1iaRJ+797WIa3GH3a/8M=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1667;
	31:WR+nFcgnYwPT9NkqRWt0KLI9GjQ0NahOA7nAgXznOJUZfqwexBRpEodLPgKeKVO+BlyB3iZpjfLM43aekWgjo/kJIbl22wytCOgOemeKdAdgP4VVyUeZmrr0e9mP0YJFnxVF8iUfs/xv9AsNHCwh/bobXNGUbHBYNoTFeJjCQ4gsCPi5bRMblg/9B20OYStBniENRBjzcBLRdYBVjo/1/5R8UjJ1nBFVStbndvsWWGBZ9WP6OvfTV0MkAc1geKXXOOz+YlAZxWzqCWxwDUWH7A==
X-Microsoft-Antispam-PRVS: <BN6PR11MB16679160E070F8FFF966F534DCE20@BN6PR11MB1667.namprd11.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123558100)(20161123564025)(2016111802025)(20161123560025)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6043046)(6072148);
	SRVR:BN6PR11MB1667; BCL:0; PCL:0; RULEID:; SRVR:BN6PR11MB1667; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1667;
	4:ic+GNj6qB+nzv/ezzDnwu3D970CxISNyxQIro2qWspuD3Dw5GqjMHrfGqo75u1fEtYJCaWrDX0iKJCWUESxvpa8x2BX6lwyTkc6u1uyhri8gkTzCJQVWpqdG7K8WqlZhKaA74xK/uTsepnoOqOL0aBqO4ib3McY2xvTQHa02K/IcYJvyIHaIOQy3LAq0ZmuboR0Q2BiWNOcm9AMAbSs0HfwWk/N/3B8z2yCX61LVFKHyvahZHbLLH6NWfyLzb3V6hBo/UhnaBRexAtfZytosGMq2BttZ4Q0Je1pCGA3/fOylgGjXd/OS/QXnZhahnU8pRDZm2XVOofHk1kY6Z+ROQ+ycPk7sACptR2vg3HV3g77bsYfdrOCO+vpejC6BSTs6w5pxVxe77CBcdIj8nOE8Id8Vf5GDnqX3C4iTsNRw7V6MEGz5pz8vifl4jlXW2dxxxpR3hkP3S8M7tRjpxmvX9oy+AUWv/d4pDGQ/aI1NeHsenBB4bw7SrTKCTmO9B1VjUG2iuWiD81iGCbhQx6vh1xh/eSsgfTevwBaJTPyLi8rmHDX2y+J1Rho2GanvwSiPL5cSfqPWf156zxXAtLoZrMUgAUa8+0paRPRggPfBomIxPs37pMSDhZibK+qwX+ZBV0JqXxDXaw9Y8v5qgXiFuG6i/grBmhdw54EOJLQVNZhOEQazFRYLqwUZqzR/U8FFlOOA9IhjLGfIMs4X8+x8jlG9moogrkhKg/IN6JBX/WN3JrP8AH2rRLLw3I1zIfU43id5ka2teVfL+O0lrtv6/YxLlEgYCqRD5B16LXN3S8xlaIelE8faohLC8uu10mrG40wZ+oZN+GZLkvra9LExmg==
X-Forefront-PRVS: 0305463112
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(39400400002)(39450400003)(39410400002)(39830400002)(377454003)(24454002)(59536001)(8676002)(229853002)(63696999)(54356999)(76176999)(50986999)(93516999)(2950100002)(6862004)(81166006)(84326002)(55446002)(86362001)(2906002)(9896002)(61726006)(3846002)(6116002)(5660300001)(478600001)(74482002)(305945005)(7736002)(512874002)(122856001)(53546009)(5000100001)(53936002)(236005)(9686003)(66066001)(42186005)(498394004)(110136004)(4326008)(189998001)(38730400002)(55456009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR11MB1667;
	H:mail-vk0-f45.google.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR11MB1667;
	23:t8x36SVUHXvqkosfPDyOV11EewYbwvJKg4UBMU8O3?=
	=?us-ascii?Q?drHvBCii2hEi13mGaVUbPmleryXoMsIdZDWm6LUMeVQQQGDg6qvoG5bdBIvf?=
	=?us-ascii?Q?KxcIUpoprI3vBqAXfc7+3CV35KwDzMtLw1Oge0wXogHCjpnCc0aH2COgbhyj?=
	=?us-ascii?Q?f/yrH3e7lPvUNdQAOlbrYutXLtd2998MPrcjMG+Jn61XvbrnG+q1ffbcQoZj?=
	=?us-ascii?Q?fnGdq3KqjyQWTpEb2sTgPNc4AE1ygDwv70qDYZFgyHiBmYjA8gOimmR619Hq?=
	=?us-ascii?Q?+TQyl+Z78A/Tv6yZKBoBdGQVNXtT0CfEClv/AJN5qbleSt0+4bK62R+PVcNU?=
	=?us-ascii?Q?L6tLORKFzt+gj+HFjrMLNmX55VQNGUt5bmsMsEN3m+SKFRraZRTFV61y1hfx?=
	=?us-ascii?Q?FsrUUnX0L7TWrfjB/8it0evXP3twqy0ggsXB7HiXjQbinh9bgzkUSbWbU/O5?=
	=?us-ascii?Q?UNf117fp+sn3atqc/VWeZXeElkmKcMz93jfXonbXhquAlMAdZuW7Rdf6PCO1?=
	=?us-ascii?Q?eaLJnjaXLwIP6PWVbbrnlE4CX7AlCHnfzSo0OE5o5dlgNugrwfkbBI3c8gRq?=
	=?us-ascii?Q?+qY0s0uQJXMTLGrnbPEoppQFBgN9NAREZRKp/SM9iflcX1F7M4adN5Azn2rd?=
	=?us-ascii?Q?9Hw0G/iWz47Uppf6Hr06HQfKSXw5o8joqmekViwLORYlu6r81Fz6Qt7sjgb8?=
	=?us-ascii?Q?khej4G/vscXXnoTEyv0rUp1dZB7EaQVXAIHrr2xeDX+lneDNgiINUw1YvWKG?=
	=?us-ascii?Q?/vaIeydla4mZOEmCwdY68x5Uor+NZpTFJPNPcoc+jEZssw9bcVQidHkhJ2+h?=
	=?us-ascii?Q?gNC6WmyVXdliH7uBLww9SOdJuG1sIkrqj4uOxmYSx+7gZWWGv9PFO86iUbYs?=
	=?us-ascii?Q?LAvy1O5ZkNQ9/REANvQ3t2nUbgi/egsX+h9kS6PIWSycbjJfxHJ1sOzlDH6+?=
	=?us-ascii?Q?+XFhliQHyLVMAgT3W3OlzGDXpioIslFglI3lnbBEgrIWyGIf5av0cKTqqPUh?=
	=?us-ascii?Q?uhZNBFTj+POLYQDtulQF/+Pzo4LmGzBNoPJo/QnLCIjCBNtgNqzdT7thk8Jd?=
	=?us-ascii?Q?VsL7ZcVLh3pRyUqJB67Go4aJ3v6XQ2HGIINmPOh+PChBTQwvMPJRmWSPKN9S?=
	=?us-ascii?Q?ghPqAaKiNjK/8/8K68OV9Ai977T4SGnFUlcz0Co5p3pNYwu+L7QWw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1667;
	6:RvWhj85TVbLlRPW/fvvBiTlj1W6BAv62j3viRd7YYHXgQQidrIVjuGo7lc+t6MEOgPYnfBb1xqhnoapMfQhahMGc3WmyJ/DFhwvx84gG/l4f3py3LXw+p8PSNb2GE1MbfBNB8/RPNsKizl0w1lNo4lxs0yP2LsbFIGbPQJuZuo55mMTESQOZOq9Ab4kNXB6836DzHMnv4PAJFWfHx4dZer+O+c1u4AwwUKZ33ZVRX1aFmGwi92cwhp/yo1RUJpJXikVcXe27OVJpAaxA80UjcWDGix5GzntaJXbxnNC0zdjYiSAzJtX786bORhafQfM+qhhT/8fIzYN/8O7TNflaQCbVan80OLIGodi4WzBXq3N+7vYmlRPwTyeWTt5uwSQE7hHDxp33csUMQJ9PtCsoQKFyAhl4ZB4H901DdUWRXyfJX3hO3B7b4dFJrURR6OkLW9TegAWJD4WAkOBllUahix3PRS9RFMv1grphy/EzXf9OEZzUtdrQb/l/MgA4m3AARb+B09+3ZPqvHMXOUhTWMA==;
	5:JtN76p8M/WB7/Q9Sqp6nPs9Q76vC/TLj7M3tbhE/pNYvffrhrwlbXIS8diNcIYy1jB1j8LzkrLR3v90ketNijufks7GqWDyDZ8iKZOE/Gkvrys4tMgQDVaI9hYDMz/FbTVQgjEiLOCrb3BMkX4798g==;
	24:90SO9ta2VlXKl89LAaC/tx2BBkJ2A8j5GsrNV6yjWP9e6g93h24Y0foFbkhIhaaRubOO0o8pPdBGEbGukyrnBL4OVkUFBgL15KwUI9T9xag=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1667;
	7:en3ur+7mdsak4EU5D00e53O+xnXPIgYcC0Yxxq6s6dVGawFZJDU8Pf+/PhHZYRg91kPvO2qB4MEtFmDwvJnMPpSgULsBYS8d1npj20VeK0CLVl5DyWK6auCNfEjuBrx7GVE7joeDMpU3naraPXVUoml5EkiOfdl3TDwIQOg0tU6M5aqHVZDjiGWwgfadFUSjSpwlennFbv2BOpBBm8xbzAayGxOUyO8losaWOt+c2WohsVjiI27Qrihq/bJE6oYLLm1c6I0VxMhDXjIbEpBAY7j0lE41CoVlneSH1XB6DI12kRoxLpR0UCggH4bSdmmIAc5zUgyZ/T3yH/w7KNItwg==
X-OriginatorOrg: amotus.ca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2017 18:07:06.0336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1667
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] pciutils: upgrade 3.5.2 -> 3.5.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 May 2017 18:22:22 -0000
Content-Type: multipart/alternative; boundary="94eb2c07ab22993319054f579279"

--94eb2c07ab22993319054f579279
Content-Type: text/plain; charset="UTF-8"

On Fri, May 12, 2017 at 2:00 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> Can this be generated as a diff between versions? You may need to use "git
> mv"
> and/or pass -M to "git format-patch"...
>


oops, I did forgot to specify -M, v2 coming up...

--94eb2c07ab22993319054f579279
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, May 12, 2017 at 2:00 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Can this be =
generated as a diff between versions? You may need to use &quot;git mv&quot=
;<br>
and/or pass -M to &quot;git format-patch&quot;...<br>
</blockquote><div><br>=C2=A0</div></div>oops, I did forgot to specify -M, v=
2 coming up...</div></div>

--94eb2c07ab22993319054f579279--
