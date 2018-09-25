Return-Path: <urs.fassler@bbv.ch>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0054.outbound.protection.outlook.com [104.47.2.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA6660079
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bbvSoftwareServices.onmicrosoft.com; s=selector1-bbv-ch;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CNTTePjUvUtq1FT/v/11Z2eMIsOUkAiFkXXZ4fTqQ6M=;
	b=r0Ra1f41Cv13sEGZBno9p5COUJHRkHv/gT9ToFUpKx5ZAUq0TyqQ0QynP+LIvzY7SmaeDDsZ92hUvPhzMqsUmVsvv1AJV9nBC4DWjlRSlzO8t7z07bpxJriv7ZVGJ7U01cLh2vrOFB8oe6UxZVqLpH01/8mbMBDhbVTFK+L3Blc=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=urs.fassler@bbv.ch; 
Received: from ofone.lan (85.7.125.190) by
	AM0PR03MB3827.eurprd03.prod.outlook.com (2603:10a6:208:6e::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1164.22; Tue, 25 Sep 2018 13:05:46 +0000
Message-ID: <aad5fbd908a38999b681052115038764caf45c5f.camel@bbv.ch>
From: Urs =?ISO-8859-1?Q?F=E4ssler?= <urs.fassler@bbv.ch>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andreas Oberritter
	<obi@opendreambox.org>, openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 15:05:40 +0200
In-Reply-To: <1537795580.13947.1.camel@bbv.ch>
References: <20180919064135.30249-1-urs.fassler@bbv.ch>
	<20180919171113.21fecc56@t460p>
	<ed51b3579be101e9d2f711ef9f94d16029981f92.camel@linuxfoundation.org>
	<1537795580.13947.1.camel@bbv.ch>
User-Agent: Evolution 3.30.0-1 
Mime-Version: 1.0
X-Originating-IP: [85.7.125.190]
X-ClientProxiedBy: VI1PR0202CA0025.eurprd02.prod.outlook.com
	(2603:10a6:803:14::38) To AM0PR03MB3827.eurprd03.prod.outlook.com
	(2603:10a6:208:6e::28)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1abe8819-c6e0-4593-bb46-08d622e79bf5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR03MB3827; 
X-Microsoft-Exchange-Diagnostics: 1; AM0PR03MB3827;
	3:HCX1Gizf3PgyTM9Cwe9BBG8ja5JL9KO33eQhtXv19PrYXlBSzgLvZ1iXXGebIJ4H47ij2nrvI2Dvhi7QF3WmTyHkSYXQTZIdZByp/GA7nh09Yfk1fPkRbgeYPaKNBMCkQGQpQv0nI9z+Xx+/3+LVK9yp/Xz8UyOLZDT6Mds3ylEHcdxPPLJqJwb8Kfmn3ShBWWHbI1ZE246dRwMf89lmkkOCiAuta2DY9cACLhPzqWVfOgsrJqLUh1xkh/+1IgvP;
	25:FcdazKPHRVkvKlYywNugeK+4h1gYLqOQPxwjHplrQ3fcBHqTnSttFbxOXjGpPD4mIZc3CO4u+U3difWFZeIKm5OMlN+m/ut8cSWj9vGrDswCQuONEd50hZkdlq/PkS2lXayPSk8BZSKAW+dFGbSr1zp+haTOLNWSPJBJjEsp6RBdWILG6sKN3QkA9fZxFOLUXoaiw7LMEhktjTK4nx4F8l0j6caFkTNCuGAAgeHC7u0NGlYOSowj45SQIqcl/MDf6m/taRxm/UsJNezbR2BJG3rECVkPNl4bBigzA63mtZ6LG/PHoKFbnzvf1qpH4a0KKYbwjmwZHKd4G925EiBD7w==;
	31:I9pZFxkW2dUwJZSV2fVFkG9At/mBnQICgqVQ8fIRy1Q/4vNtPrj2xZmsaJklnmJpcHNPYJ05id2a3JxZHeU0wRnp8QaC9KS6wlXyOLsG5D7kGKB2vwrOmW+zYG/9Ci54YhXVhjNbku8VwdEAIIE3IX/7GULNxHrW+NTCtPp6ef112i7Pqjtvo9RAu9otiv1XG4IApygnLsc/YfJ1PdDdjsMJ7ky9pPvgdl83HsS7tA8=
X-MS-TrafficTypeDiagnostic: AM0PR03MB3827:
X-Microsoft-Antispam-PRVS: <AM0PR03MB38278CC4A8032E9F75B84F9F8F160@AM0PR03MB3827.eurprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(149066)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051);
	SRVR:AM0PR03MB3827; BCL:0; PCL:0; RULEID:; SRVR:AM0PR03MB3827; 
X-Microsoft-Exchange-Diagnostics: 1; AM0PR03MB3827;
	4:W1lL1NO8uVCj6jQEEWX5JAVwmbJQdRO7ARKW/V4mrPHKzRBwhHVm+u1iwUhPES7XPToaAVZ8oYNliMf+aIGAGuSGU2mbAS6c1a6kjZFB98UsfrsXHHIzRJMr2u2R6/kb+5xzz1blnPspuF8UapBz3nsNkxBsjbsaJtl7LxDtLYYoojR6kcS275fu/D/MVZtKJbQuS4zFi+hJVBB0HlsQolgiaatRp+dWgPJO3ASResFER7o4mT9T7uaiFAo0yto2xQ4jz1bfYP35+kZAtBTbew==
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(396003)(346002)(39840400004)(136003)(189003)(199004)(478600001)(8676002)(68736007)(956004)(476003)(486006)(25786009)(5660300001)(58126008)(110136005)(6246003)(7736002)(74482002)(118296001)(93886005)(21086003)(8936002)(81156014)(81166006)(69596002)(50466002)(23676004)(33896004)(386003)(36756003)(11346002)(305945005)(34290500001)(446003)(229853002)(6486002)(2616005)(86362001)(53936002)(76176011)(6506007)(52116002)(2906002)(8886007)(16526019)(2870700001)(6512007)(6666003)(316002)(3846002)(6116002)(97736004)(186003)(105586002)(106356001)(5820100001)(66066001)(47776003)(26005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3827; H:ofone.lan; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: bbv.ch does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTBQUjAzTUIzODI3OzIzOnYyVW04VDRrckQzb1lFbFdLQ3Q2TzBJV0hn?=
	=?utf-8?B?clYwck45Y3VwSlhMWi9MTm1FTFJSdVhpemRiUHUzL3NFWktrbFcxMnF0Y2pD?=
	=?utf-8?B?bXl1QVFya3JFd1lUbWcxdVRrVHB3QjZ3ZnpBYlVwWGJGMDY0alRDRUt2anNP?=
	=?utf-8?B?L3VkMDdEbjI1eHg3bDhMQ2ZidG8rcGdJUmRJaUpuZnhpdXFBYXdiczVDY1RY?=
	=?utf-8?B?WWNaZE5uWE1RVXhkaXFVMVQxdlFmbHRSU2tsaUQ3R1ZjOGp2a0RhNkoxWDM4?=
	=?utf-8?B?NFRFTFVkUE5NcHhPYjhQd3NBWnZCQmFSVEVpM1lQVHJTRElnc05CTmtsakhM?=
	=?utf-8?B?bmIrdzlFYjlOUEZOU1BSelc1dUhmMHBoMU1CRGQvcG9JZXFVVGJ2VDhUN3R0?=
	=?utf-8?B?ZUNnU2FtNE5JZElEbm9aU1pkSEhNakswWC9VbjdSQnloVlBDT1BHbjFaZVNM?=
	=?utf-8?B?RUZmWFVGS1l2MmVaU041cm84Y0VwRE1DK1QvZDg4aUlGejFHb09UcmJ0UXp0?=
	=?utf-8?B?OWFCRG9KMlVkR2Z0bHJHRllVRFhYQXN3UG00NTJqVktqNDRSdGM3c0VHVTZa?=
	=?utf-8?B?VU1vOWpRNWdvMjc5OG5HVjE0bzYwcW1VRFpqYmdZSlVjRjB1NWh2YWRoS3Q4?=
	=?utf-8?B?L3E2TTNaUm5iWW16N1NkeG9MdE9EZlpuaWcyc0hreUJJeVNlbFk2cElXTVJq?=
	=?utf-8?B?Um5mNjJiNmtKc2VzS21nTUNta0R4YmZVUmY4cENSOUVUR3JwYVlGbXdSOXZt?=
	=?utf-8?B?bnB0bkkyYWJHbEhvbUlhZ0I1UHNhMlhqQ1EwQlJGOXBVK1ZCWitsMElGWFF4?=
	=?utf-8?B?VXRDbHpKTXFZdkZoNGdmd1N3cDZyQTNxeUZzS1VTd1l4Q2s0U2lzN1V0SHJU?=
	=?utf-8?B?V0NGQmJxUjdKZGYwSTZFQ0JaakV1UTNCRXF2cWcrMXdHcWZ2ZU1uaDB3L016?=
	=?utf-8?B?UVRXUVArRlg1V2xRWFF4eEN3V1ZqeEtTaVBRU28zcC95TzlHUDBaNksrdGZN?=
	=?utf-8?B?NmI2M2VqdFpaSmI4a1RJeGlJTjQreWhsWTM5OXdQZk5jaG01VmhlOEtFTTVY?=
	=?utf-8?B?d2JHZWlhbUtpSEt6MnhjdlVDM081WWM2MFhDYWFkNG1JL2xLaHNJWkhQOVRn?=
	=?utf-8?B?MmQ5NXdMUlNVbTdSc0Fka0FJTnZKR2pnL3NabEUyK0xmeW9PV0l3bnEzQ3M1?=
	=?utf-8?B?cmZVdmhVeTRHRW4wWWVWTVBGN1VoUWxpS3lKUEZaOVZHaXBKVnBDWGJwaTBr?=
	=?utf-8?B?V0lMOWJmWGt3RGs1R1JxWHpZQTFLWEpWSGx0MXUwUkVQSlNFelZsUDVjeVNa?=
	=?utf-8?B?ejI0STFVWm9BM0NyRmx4RWgxVFZ4UFBVOHZzQ1R6bDdSZ0lOWE4xOCtyd2Mx?=
	=?utf-8?B?VlpTam1yMHVIdTUwekhZcDIzdjcveVN2OXoxeW4rRDc5L21PNU96bVp6Y0VZ?=
	=?utf-8?B?UFVhdWFObVJHT0pTRTQzWi9UQXpVcHhTV05Hd3czK2ZWNURMMFhUUUhEaTFS?=
	=?utf-8?B?UWs1ZmlVOURVK2h2ZUtKZ056bVF6RG5INlZ0YmxYMENUTkcvREhxUjVDZ3J1?=
	=?utf-8?B?TENERUNkMlB6emVsY0JKNSs4Z1ZSS3IrcWM1ajNtZzU4WEIvSTRYRldrTTBv?=
	=?utf-8?B?NG5JY08zWGhkQjBOVFZNcEpWUUlxOGg4dnlnenRrMEZVbFZEV0p0MnpyWDZE?=
	=?utf-8?B?NWRjZkxuOTUxQXoySGhWQjlHUm52TG5BTGpRWHJuQnRLYzVicHJucFpxdTND?=
	=?utf-8?B?ekJtM1kwMmhtK0dIU1RmcHkrM05XdUVzYzNNMlhlU0ZFQkpySmMxVzZDZjVy?=
	=?utf-8?B?RlF4R0RGWHptbWk4M0JOdjlGNERRTFVHUTAvWDBDdzlGNmtnc0NkRHZMOVNX?=
	=?utf-8?Q?fijzynIk2ho=3D?=
X-Microsoft-Antispam-Message-Info: kf796K44Do0nDXobCmOq7gKFqUyIiAe+dXJUFU3r1a+G37yTmaT3hpATHve9e/5kLD2s+XQTi/Md789Si8/CPpMSSa4Tr2aAB/aKkST2ax2KxbmaHcIJGMOUY4VTVcyKvLkv7T+bjiUgrJ4vCRHdS4UkDzycurm8W5avwj7lUNyETSHjAH9wFM4yX1fxVI494ufw6uX3GEM6V32uEwL2b4A5nfIJCEo5k8ZWO7T05eSXAXKd7YRPyM2G+DJnahpVpr+P2q01sg3Qme9QDNYi6b6AktCe8y3YuAnfxw/pEeacb0FC2gttgUSeN6pmmMwX9a8l41q0WW9nlFXHZsGOFZoFv43xuisDpVM1rXsYMRY=
X-Microsoft-Exchange-Diagnostics: 1; AM0PR03MB3827;
	6:uzCMMSujiPby/HyTGqGBCIZQuNSbBnZB+aRxDVZ1ujpeI26KWGl6upuHdwXf7qKuGXsYZk2tdXSyV9NdNC4cPN945bG2uuU/fWsRuFMS41GLI6xGqEVrjERuNBIh10P+ijyqHGYSTVAY5ike9JajG8+baczLZi8/sp3EaqPF85Ao7IMsrTMBGDRnV2VcxeQT+zCKwmQx/songMg0Ylbns8TMNALIooqnKM5x98E/rhm+ClOO7R9Dplurexb7jAqBN3EqMxJOBeTBsJQqaUQOMTHaPmDzSfUl+Tceu4aD/Y7maWEeqlywHNDEzQvdfZQgkpkGttCBy14XaJtfBxM2D3kFQBfTZQZq+RIfuuwIn5UV6qyMkAh+mpa2BbGv20T3HOsg6j+Zair4exFPfRZFvbqcXglYenp7qDbSnhT76Yo8Dq8cbX2iWnoCjcXO0LwSrynVmvdVSL2emoZqirzyZQ==;
	5:Mr1kr5LZg7cjgiLHOBgHVYfSQ58ZkzJ5h38s0QVlg9izdcLuI0KwyV9a6c/N8q/gE5bdwOY4qN9FVgAWiOl3LuqZ1dSUh7+kx1O0Uo3hEBSbNHniQBhWfveYq/CcRLpd/PaCt8wI4KLneqDpXLd/VP5WJzd5MK5Q8Ucpna84xmY=;
	7:XbDVC/kVBVh0okElDt+DAm3fCjf1uoH4dISB05nD31CLGETfahVVJ5taI7+whNflVqHVza3qlRzA9PsXofQoUq5BJ/k1yrpLgVgyGIma5zPHciZBNt21iGIlO6IPygWULk1GoarokYayu9fEgTF7vYhKFHjUUMMmUQvjj5X9YAm+BVQK4giYs+UDWNbz2J13qtrT346aJuS8UDzSULkxV84/mzUKnIspNy3otueQAZcHRJl+ucBE0JjhTfd4XXai
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: bbv.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 13:05:46.6644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abe8819-c6e0-4593-bb46-08d622e79bf5
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 279985bd-2077-4d9d-9797-42238cfc06e2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3827
Subject: Re: [PATCH] openssh: resolve install conflict with openssh-sftp-server-dev
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
X-List-Received-Date: Tue, 25 Sep 2018 16:38:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-09-24 at 15:26 +0200, Urs Fässler wrote:
> On Wed, 2018-09-19 at 09:01 -0700, Richard Purdie wrote:
> > On Wed, 2018-09-19 at 17:11 +0200, Andreas Oberritter wrote:
> > > On Wed, 19 Sep 2018 08:41:35 +0200
> > > Urs Fässler <urs.fassler@bbv.ch> wrote:
> > > 
> > > > Image generation fails with the configuration:
> > > >   EXTRA_IMAGE_FEATURES = "ssh-server-dropbear eclipse-debug
> > > > dev-
> > > > pkgs"
> > > > This is due the dependency eclipse-debug -> openssh-sftp-server 
> > > > ->
> > > > openssh-dev -> openssh. openssh can not be installed since it
> > > > conflicts
> > > > with dropbear.
> > > 
> > > That's odd. Why does openssh-sftp-server depend on openssh-dev?
> > > Does
> > > openssh-dev contain a file which it shouldn't, e.g. a dynamically
> > > loaded module/plug-in?
> > 
> > It doesn't, its the fact that "dev-pkgs" are requested in
> > IMAGE_FEATURES. "openssh-dev" would be the default for openssh
> > packages
> > and dropbear-dev would be the default for dropbear packages. 
> >
> > The patch here doesn't sound correct. I'm wondering if the
correct
> > fix
> > is for ${PN}-dev should not depend on ${PN} and whether that
> > would fix
> > the problem?
> 
> The dependency from ${PN}-dev to ${PN} seems to be the default
> behavior
> in Yocto. I don't know the consequences when we change this for
> openssh. But it helps in my case.
> (I added RDEPENDS_${PN}-dev = "", didn't found a better way)

If somebody know the implication of removing the dependency from ${PN}-
dev to ${PN} for openssh and give the ok for it, I am fine with this
solution.

> Another workaround is, when I don't allow the generation of an empty
> ${PN}-dev package. I have the same considerations as with the
> previous
> idea.
> 
> I see the problem that dev-pkgs automatically installs openssh-dev if
> I
> select the openssh-sftp-server.
> The nice solution would be to tell Yocto not to install openssh-dev
> when openssh-sftp-server and dev-pkgs is configured. But I have no
> idea
> if or how this is possible.

I don't think it is possible on a package level. Only in the script
that resolved the *-dev installation. This is done with scripts/oe-
pkgdata-util at line ~116. First, it tries to install package xyz-dev
for package xyz. If the package xyz-dev does not exist, it looks from
which recipe package xyz does come from. If it is from abc, then abc-
dev is installed.

Adding the openssh-sftp-server-dev guides the script to use the first
choice of the script.

Kind Regards
Urs



