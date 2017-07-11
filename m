Return-Path: <mkelly@xevo.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0063.outbound.protection.outlook.com [104.47.36.63])
	by mail.openembedded.org (Postfix) with ESMTP id CF9D5780EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=WH/d5NGOtF3JUiCufsJhSF+/rvascthxbRtAx8NrJVY=;
	b=zDZC8tdX6DYPX7zPIu1Purqz2BHYy/uP9I40lhbJ4HFLjpMotW/M78g6Kzb+I4Zm35CwpiUv2XBxmqULHiPmarhiF8SQ2cTGEo4ApyO3NOrWZPv2OPALxvy0AryGy2pcMR9pmqae2xs8U+4z41goJzsb1wdix28nLkxT3U/jvNQ=
Authentication-Results: mvista.com; dkim=none (message not signed)
	header.d=none; mvista.com; dmarc=none action=none header.from=xevo.com; 
Received: from [192.168.1.2] (67.171.33.217) by
	DM5PR0101MB2938.prod.exchangelabs.com (10.174.183.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Tue, 11 Jul 2017 20:54:31 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <20170526070344.6053-1-mirza.krak@endian.se>
	<cda9bddb-3f96-4c9b-1c9e-25dbd5afd7a3@xevo.com>
	<f0a5eec9-abde-b2c2-cc54-e1ec930374cb@xevo.com>
	<CAMKF1spNN9vPHf=Dx6GLdriG387gcG3rTTc7tiXwPKcdxyGq9g@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <9f8063a4-06ed-f47a-5e99-5cd57e6b7c51@xevo.com>
Date: Tue, 11 Jul 2017 13:54:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spNN9vPHf=Dx6GLdriG387gcG3rTTc7tiXwPKcdxyGq9g@mail.gmail.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: DM5PR06CA0025.namprd06.prod.outlook.com (10.168.181.11) To
	DM5PR0101MB2938.prod.exchangelabs.com (10.174.183.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b27e2813-abcf-427d-2642-08d4c89f07a8
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR0101MB2938; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	3:7BLw5zZkTndWQFLKegCoSGY7uCsB8E5b8sV3RNcn6y+zHwhFzxP2fcDTlLmiDwA0PS1lHSqXOYSSSpe2SFeMa44a+0tAYmhaHQ0xxOe/oRbataV5b4cYo63P1losRNG+KpscQh1hj4B55w7+BFzy1iuJUv+hv1mFaYeYlfxbmU6PdTo3P5QplMc0fsACF2hdc0qGb3G40u058BChUZezhZQkT343oELthgUaZmm2PSIoTUW5Ou1i+xoJDvGtMDBzWLy1d8Z5ClNSOYWZ+7RoTLu712qh+DIQulzFh5+DSJiKS+D2Ju398Jjjj9e2/dCOTkUjzsTKmlPPPJWOSOgDj0ywFZaPPwFJBj7vEAbw5OCjnmZDv/MckJjflxYdY7k7caec//aaBwd1/8mwUcqFC0+2G9mnPllgggDPH3zooMACbFQqD3FuUf/jrwUFjmzeHGy4NpjcaHWTkt+R3CSgidGcODASYSYmwRRQdftGqPR8KkwazpBHdlsxkigikUvO4czyet8118Ef41BuWfZ+bu4BqP9f37W7HkswfDwCxUpZ52bz0YLMVJOuE5dt7f9Gvx+DGXpFrF8/5SQ3DN5jibOqSwEWcyhljNvHGecI24ngwkRyw95bmsAEIw+TvfFM2IP3Io6uYMjJ1Sccn5KvhHBYuThrpkHbSNJI1rlaPNvQgREETk1nC+UMQirEHPeg84F9ntY4AyTRIVAXd6eZ2e/Tu9ZboSX3AKMTwSOnHQY=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2938:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	25:BAw4LEXvwTct/5E7WIAn8VokBJ85kdC+jfSiu6z/q+m5XOj1fzzz7jjxKm1ZthzDEah7gkowoycV3ubHKHOjahOhzhrLrumCNvPzJM26ZVsZ8xcFannLzpkqZdahkajdcaIrHN/xWjw6RpI/mWTgkxAot1yT2qO+i816QopehPYVUo1G89sxggiFiojD14cnoM3GDYsH4Zt9bl3gVwtO99Z1jgBO//QNMOL6Uh1FgMgA3/aQgrxvEMF3fD07Kin3vX7zx5clzmF053W4dHy6UtaXSrPwdklfbhJaN5s+SY+uWucw7JnRw2fBuLpwo5lCkckehpI7sBUswkkLaRNsPtu/SvpO6T/ZPUON2/QpzwPinEaHwmqahygJYYrzUulNn/5bqrXK7U4u6IIq3fCEGElhgqNHQZ3aZQ7Cr2ElShyF7F85QdniYF/YxTk+t/j9bZutsa/nzvYl0eDDIvQ0GGq+eSjkBYye+yoo0BytW5CFRO/XJ1umWzrHImHt1DndQDFMSY5vKc9FTvcuxImHvViYIsc42mHRNNF78A5nd7ppubJjEe0J1o6Uir5pPfuxYcb7keneED69hUElmyWL0kWNLNAtWq0ChUT9UAVQvqt5kKj4e9gd8spj+okWr4JP2xAOBe9eUTilg/8YqiqrXidfyLMVZornseUe5gQFAPFzqFvnWFrycCPk9hcJ02eb1stQkztlbP4alnEstxshkVfhNGa4KP0wBRBIYImN4zjMg1V29ZrPQUnkFcIjeexAPu/mG2fBbTxfDPtmiVnK/Hw6PLnnEFYtjW3br0y3T0ZH66VehXeUfG7S8YZ828xB6gK3akilzOCyxcPhN2SaDfIulwhH9Eim1RysHnnHND4k8SbyRWt6QnUmNBoz4OYSOFClgyH2C837PKzeCrVy5uhy/d+/l1Ro863bX+hQpi4=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	31:ivnvz1eRtagPX+ErrrPvSM0s8SAIHbKsaQh68jURyY+5bbEisoqySEC1ZUNHx5o0WCPsX/VrKMw05vX1z3e6DOaUVfFYPuG/alcTnhB1p67Q/azjpyharLh8Kfe/V8qA22uGuLY6zbmkMvrhgmnbhLlrmj/zmO0P/Ymp6ZFzQWslGikKBBYz0dPh9/bTSTn/XFxttcjtE9aA3LME6SzXXhNVueNZ0EjilY/1+N9V+eZUcksAr9OWhW11qGEDc8xtGDczFdhpSGvKtGQPNNxkCaynCwBoXoq0uAS3OiIkGIYdz28ddwxQZ/zmRROrDjeEzfEu7Gsr1W+84TcLX6xAdAb7Tt9cHKPXV+uluiq8dxaOLNxBfeGip4C39UoZXCSUxYwUDbUY2JHH2qoIF0XouTmkpnU3356VliVMcxTg/0PUnFRnvP7zBaz8BZ7ERw+KyQdB88FkOCxScSJKt0Ftl05XJrXq0MHXguztBbC6jwq8b8BvXkXG5eGYska02hxEy8C1/YOwmJs0QTi0JPMZ2BZnKr1A4T8GMUT5Mo8/tf55bQUxwnS2EGRSLnY0+KhVaoaoawoaM/dAm3kUpwY69tVJDCBMIy2LBgjEOITJ5UIFQXe9Nihcd2JapmZfMOECdMrgbL+F79VklMNWllYHbxIbp/1evJ6YM1tgfKCsxPWsVA88scPbyqOrufHlip7rHS5bqEUUqYDS4pVQTdc+tw==
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	20:WYwOvCS15R90wTuznxc8QeHvo18K+D91O7hqE1keQMor+kyaos1mU9wnYMsThgFfxuk719HXj0+D6W2yc6l3oF7cXlU2niVCKMOm+ppw/4jlT0VuYQMDDjUtGvNkStqKCD63ghOiEs+2FV62/8Mf4lK/DXFTmL6MmC2ib5Evy9/iV8Vifbr/CgAgN2L2Ka30mXlZt9UtjQNePPZ2E8vdZ5/dbgrGjWrepsjbuzO6lDsD2iRMO4/Y8T6O+CTA9IC9Nqji2bt3mHxDdP5cMF8Ec2DSy9ePyHYqP9S5pWpv/Q4NwJo6T6FsjlJyD+ZA5BcgcVJ3N6Tp/aJ9FDX0bdTzkkGixWlDwH5k9iSQnd/h1abZh0/Hu8cZfuqko6CbG5EcogB3Ed+8klBCQmdt3yt3l0LZKf8cbwuaoJKtyl/oVcU=
X-Microsoft-Antispam-PRVS: <DM5PR0101MB2938A1947DF1F12FC58AAB65ABAE0@DM5PR0101MB2938.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(48057245064654)(264703809997249); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(2017060910075)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6041248)(20161123562025)(20161123555025)(20161123564025)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2938; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2938; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DM5PR0101MB2938;
	4:eYynaigJJg7Ecs7ZtbQsHdx6WGxUjt5tbvoF?=
	=?Windows-1252?Q?x4LS7c7VlQ56sQepX9pX8JtWOU7sID6oucWTbS19p4u5mq8GTCOK/VsJ?=
	=?Windows-1252?Q?xTZf8B04IkrBVRSwDyW3tIcXCH7EJd5h9jYCh08RpB0kPkyzr75HIMp0?=
	=?Windows-1252?Q?RVgVeL07xPvQdjQ0reGIENURGCWyiLQLaQ5Q80KYsDAM1kRSiP5tvAFh?=
	=?Windows-1252?Q?mX5Z3aaiAAWx/rlAS5X3Z7v2haiIuvE2FJCZWJZm5de8RZDvfgxZs3NV?=
	=?Windows-1252?Q?5KtDNj4PrB//HtbT2i/2oTG/nR/srnpp0ZQQVyJNDVh2vAGv602xRI7t?=
	=?Windows-1252?Q?5Su7Vunra4F02k/OZz9WwnboeWuQ/X/zP3Dz2HvUSHJbUVxraWOV2zI2?=
	=?Windows-1252?Q?l3rnrPnwFcpjVg8SNfUv/8LjLFPYY9gjH6kEtm5idM5Nr2Z64Mz49Qj8?=
	=?Windows-1252?Q?ke/cCXMqKPu0Gt/KCF0KdcG8dzMTBl8a90Cq21OE7vsHX+TlVd/sLpZB?=
	=?Windows-1252?Q?yysYV5Y+25/Ki47w7FMA+XZuOb2+rymui+EngwaCVPncTbvBx/jdu2AP?=
	=?Windows-1252?Q?uRyN/Nlra/e0FxBS6lP0Pin8s/pF3uhrAG4fiOFSZyUz5YWghuLa3XJW?=
	=?Windows-1252?Q?c9O7m3UuErujCu4xkAJDNZ9ztWr1keQ3S2iN+3x7rrEr/A6hM+iJcFKk?=
	=?Windows-1252?Q?PExCC5txq3/eVB4OnfDBYwd0rpV2ffjpSEUlTYk92nWe6QWk8/Ojl4m1?=
	=?Windows-1252?Q?qG/ujNH4kTbZHDplWqbQcXe8Cn5evnse2BIhS4rAaRRVvxoh8wEdP2i9?=
	=?Windows-1252?Q?yVC9zGl+kgt+RbU3qdpAe743WE/g9/qkjVRFcLm10Y6ZK5GoPTFXf+S5?=
	=?Windows-1252?Q?+CrDsPfcB0jOpOgI8Fzu7+X8IRmU5/rHXHWgO2erpZekn9UDBHTBbEmI?=
	=?Windows-1252?Q?aU4G6V8u8nV8DoopuMmYetVL//Xu4agqz2vtsSm66oohFl0zBnVUHR0S?=
	=?Windows-1252?Q?tpaFgV6otNWn7VSM3PDST0o7C9b49dh1ILOl2Bv9fbVxFILwHz1bQ235?=
	=?Windows-1252?Q?dthW8ravmpYg7utQzZJrzeAKBiERdcH73mTvNcnRbpEO4K5TV1WkA4Oo?=
	=?Windows-1252?Q?vBkWUjvGpjx6aFAhmb+KWXavOfhn6uvCEfeLwzh7/8ywKTTIDb9eVzvb?=
	=?Windows-1252?Q?zavoaeFPUHLGdGFoFBawHHbGL1TxHBxWVhzkeErKyxrjj0F4LbCogEQC?=
	=?Windows-1252?Q?0K1fyVB4wt91l8lul1NL3RQ6OCshT22FVpjT8H3tV0K5b8FzRMybaAFN?=
	=?Windows-1252?Q?S6ZEr+CMgyjGyj26Kcm+8ABF5Dj3s6Gs/cMvb+9JzP33hYpQIId2Ddb2?=
	=?Windows-1252?Q?z3vgtSaDOXGP?=
X-Forefront-PRVS: 0365C0E14B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(7370300001)(6049001)(6009001)(39410400002)(39400400002)(39830400002)(39450400003)(377454003)(24454002)(54356999)(76176999)(31686004)(50986999)(66066001)(65956001)(65806001)(47776003)(4001350100001)(6306002)(7736002)(54906002)(305945005)(53936002)(1720100001)(53546010)(6246003)(38730400002)(110136004)(4326008)(33646002)(25786009)(2906002)(50466002)(42186005)(117156002)(7350300001)(36756003)(6666003)(966005)(478600001)(6916009)(2950100002)(189998001)(230700001)(5660300001)(3846002)(31696002)(77096006)(83506001)(93886004)(86362001)(6486002)(81166006)(6116002)(8676002)(229853002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2938; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DM5PR0101MB2938;
	23:y6b2xbWn3cjvsESlMBzsOkCBaBqCVhLukyA?=
	=?Windows-1252?Q?6/U8tebL2uD9e+jcMWtzlOpwZ2W+ctiJoglB1Xz7qLEmRo/Jv5/SJoJ7?=
	=?Windows-1252?Q?IchOwbh63shy9Ce+PM8W7fPtvbrH0wnUHKWEFdqHUl1G2MuWJ/qs3fkw?=
	=?Windows-1252?Q?vH4xKMBjMXXZYN88110ja30JMW6N95I01KumASyxh79XzRUh4+ijquaS?=
	=?Windows-1252?Q?4s0Yuwil655mh9XgTWrIYL+Z9Y5YNmuWe2CPTByxKpcfdiaVyxkkgReK?=
	=?Windows-1252?Q?7FeItLNOu4N+0uv/2XFrz9O3sle6N0BD/J87jVAOefF6tMG8Wtaaqnw6?=
	=?Windows-1252?Q?3371UDr2GEgXVyYD4UQvlDEAtuwOv9L0v9Q9H+EtPkV/0V+LrcNK7TlE?=
	=?Windows-1252?Q?/okaoUYiCl3/nEM2BZ7DtOSHa5gKSdazuCrmvyW+nbo/hreQSClyKSAL?=
	=?Windows-1252?Q?KinvlVk+vFGau65ey6bqMlwa4o3rQ0wqQdFFMzDuPAwysn69XS0fNlCr?=
	=?Windows-1252?Q?Vtom9X+I00eK2ud978GFfkgy9x9L3rfK7YtvbiBDRa31pKQpRxG+dtcT?=
	=?Windows-1252?Q?IHghEH8mMF+z03kpOi3Nx8h0RxOVv+M1Ur//CYpDN2Tdn4DU8W+8ZSrK?=
	=?Windows-1252?Q?lqXlTEfXQGn68YxhtIlSVZ0P1fRENgBxS3ulAIekXLk4ArcKc+XNiFMn?=
	=?Windows-1252?Q?/idpc2YD7gdAg5rBGfJT9JxyiHaO15HAVlAwOegPcWNpFXAK11sLOCeF?=
	=?Windows-1252?Q?rdXU3Y1Jy2UJjfCDgGXj87ibStAiIkEzBxE0TJIUZzrn/U9h6klvB1EE?=
	=?Windows-1252?Q?r+o9FTH+zLWaWUWQL+8kELKXOYh/OvEZ6wGD/M7KApj6HwsKmKMHICac?=
	=?Windows-1252?Q?jCXLEzqZo+DqSVgAFRjCvDAcdZ2dNLNichBN9xxE1d6aNiC+Pbe0oZSq?=
	=?Windows-1252?Q?IYjbJVaycqlOUSbrPVkrqQdhRb5hO8L6F0NgUUUx8mP6jOdEwQRXEqNS?=
	=?Windows-1252?Q?+hhMvWhCQRC/BLdVwXE18pPsrVVQWEeDl4gL490s8fKIsX9BD4et3HVU?=
	=?Windows-1252?Q?cRQgr7haoJ4jh6yZQALYWYMT9RyQF1OR8Fb/Y/eIV9YTUzjHsv4A5EeZ?=
	=?Windows-1252?Q?iP8IYNjehstAVNDP5rRQpZ5jPqGdPwkKiWlSptoaDlJO8lSPWyL8QtQe?=
	=?Windows-1252?Q?8IJwT2XGI7driGdhlidMYAGCWyaVEOAnN7vGWCSmR7KgCejcU1DI/uX8?=
	=?Windows-1252?Q?V5gX5VtoSd1fMY3CTiMAG0CHdUfppJ0Hh+RbrNmeW2qH8oFrTRFXZHaY?=
	=?Windows-1252?Q?7cgWOBwMU4IdOJdW605jgwoMGlQZSzmou8SDNrgfByP5auURoeEzNpcG?=
	=?Windows-1252?Q?fwIXwm4IgfVJw3mRQetVmjpaZjl3m1hcFTT1JkVZFDqBzC/f8RVhnUqB?=
	=?Windows-1252?Q?mMwekeyOvAyqFRlXGT0aQb+K1TWOH+n6AJzBxtZ0s7/oNgCfuoUJtXP1?=
	=?Windows-1252?Q?9RYvTT5qohO20CKdAY5ZJiAdM7lBy?=
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DM5PR0101MB2938;
	6:2GpO1+3nYnLVRw6jrhJYXVIjkUN+kqvjvswK?=
	=?Windows-1252?Q?sSuyuFkfATHeD7Vj/3FgcEbXWu+jOwSiF3J/xh4jEqMxfkuCb+T9MknZ?=
	=?Windows-1252?Q?HrZbDyfhDkayJuF374FSHD8AkjqsAhdJ/pnRKRLcAtFyC4SkUL+5fNO9?=
	=?Windows-1252?Q?DLvFLudCPcwKkrzs9vjdpgzoDkZAlh9AVn2JyxPxRVqUQ70EK2B6GN4m?=
	=?Windows-1252?Q?zBvA16rTq2rnd3AVferDLOCECctDnwZU1eApiHp94hSWmq7gsXtauxvq?=
	=?Windows-1252?Q?fqGWXo9GcmIi1CVlNjdCxsoQ3UX2tMYUt3HfwiAQ3JUKhQB3GrJw5N8/?=
	=?Windows-1252?Q?Y/lkOpUGU4g0/+0OK5W+SNbJKTyI+zxplKHfeDMzIVhe6QynX13Ca2cI?=
	=?Windows-1252?Q?/xHs/OlkyE6Bk03uLJldgwyZ9sHVvtzFUpndPvzzGxbDETAB6QxD4DVp?=
	=?Windows-1252?Q?2EF+/e6mewYMEn5FFMSN0r5Iw0NVjpr0L0dm7if3Wc6d+9p4oMdI7/vf?=
	=?Windows-1252?Q?JkpVnqkT3B10jpD+rhVLFiQCrJjHqPc2YFDnPCoixBhvlPLFwLjnu402?=
	=?Windows-1252?Q?I+/Kbl2E0uz6JT8TK7k7O9dbUQiYgzlP61T9PtuXQHVNGYC695ltWk4D?=
	=?Windows-1252?Q?Ea5+ZiWkQvFjg6GVlsUgX+6V6b5ZxovzHGxcQXhqCaVDqD5jGpc8PKtK?=
	=?Windows-1252?Q?DL3wgMWi25MrwaRvmYVsowYLwe6LSmM91WO6ZuoMBIAOGCIR3cbQ+vsH?=
	=?Windows-1252?Q?mhhoGzPnXJuyLMYwDjN72qiYnJMmQqmV7euR5AKi0R4xqAjqbjikWrRz?=
	=?Windows-1252?Q?Hy1VXNKMCehKQqATdRECycChT1V7Mm6k7yUPf1uPD10hCjacCOtfqhmF?=
	=?Windows-1252?Q?mNgrRApWFqGK0AuNznnjXMDO2jxs63s7W4sApAhA4zpyHd6EpNgixdfl?=
	=?Windows-1252?Q?uw61yKlMG0iuLe0xCsDqP+NXljQcg3E4nm7bf6KWoE8MXsOr/n8nK/d5?=
	=?Windows-1252?Q?aGgFI3kTYOtuAUhPevXh6cwRc81pGickhENX/s2bmJp6GbFsH0G8MdKL?=
	=?Windows-1252?Q?kYM7inm/VCWHeH8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	5:cZEEuaTX3tp/RbqUKn9vD7qkWMrqusev9z4PLjG1WoQMml9MNY0EXGZS+jH4337yyxrDaO+R0syc/je+eg7xkQdojLGA8/HZrD22NIWYKRMh3IREhAc+7fuvLYc3GxGjzG+y1tWqBfSZszzKDRefXoO9bHvS5cG9dMU0ugyypjhJ87eghQUJKNVmWPM3gjpW/MB1pcVy32fypowOZ39PzptlY8aKTtKE4l/gmyIfjcNUUbe0trY27kFstfZSKYum/u9KRH0bJGl0Gq9VEvO25X6RdElDRRcsJ0RvOCbopW7vONkPm8jJsQ78IB+NJ4EKR5iHgYTeZxXxR1pOvcnuXEeqqibhLFnnRFCe1+oJPtcxjq0GcG3ieP0nUE2P90pKkl/NYV6dKLKJamoLi6ZfyOisPs6YALZsdIu/D/zjgAOBqTGr3l3H3DcLWcGAWSvq3d21N7lvtDJ3hjRXhJjbphKWa81061eiHZeImM7vkMwUoZPJeHF6kAIHqoXQhpKC;
	24:6CcfgqPcPL1u2OTs8X0mZHIe7hCJv+ozJ6AdMm6ufOs+4tWoRojZU1dOy/32+WwMtjiZWFpkyFoRRjPYNKWf2mRgNP51JCg/JyRR7S6Fcp4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2938;
	7:6ukZkTZA0dm8qaKQDteFGunMNWC0e60dSRUvq9B4wC4gy/KfzH8iOpQ+NF7+jLKYB3M3DcBDbszGSt4dYn+Yng70BmMcsWgyDoANZQsbeggXGULqAIzO3mczxF2sqpxwoq471MUylBW0+r9WN90ZahtgFUnAlU0PkuC23zf7kyLza2ATFvTjlTEtL0aNSPQUQHGU2mXKn6PFXkXIEJQUrU3aeErK6PZyFnnZCXrG12SiUzFCYyLHwZm3T0ywV2BQUK6QpGbRXnigLYBbIFVDb/hC19msuH8KnUkh8VlIQaMroqFyncbQvEMsid7KaZxNtPendtt0YNZcHfnhCFWGTOQNl+U0lYY12rst/w+hsCRT0U/JJX5XlykKt3MMogfcrOGJyyrt8H8XLkdP7hUJTyRTa7FdJPdLlm5P+cYZWofRBx8qby9Yr+S9lUB71Qi7cdrPua4kUusBm3dmzbIykfnOOKojE+ymOiiObj49PYAxtF89o+bL4IVsErPao6KvSU6OPaf2yJZ7UcsFRtq/qLjbQSBI2c8rhTGYWcjWF7XUQEyPDvE3GMcrPQyb+WmLKlzSGEqoDmQUW6hBHlfxWLa0NJt5LmUFk4HMvHZv6pLs7Q6mu1tAG13c/zRq0oTigezpV5M+n0eWvVpIyRPDPIVUQ+0LAD5kqQmWQLjJlOUunOpR7LQnhU58NyOEhYVMQFQWv+Fd9si5qQxe5jONhc1+PD8+TR7k0urwbI5J3NPyXSDX68b5oWig9qFzPH50Mw84HXYmzdG8vd6tgIVhIO4gC0hydsMNmGctGKRaae8=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2017 20:54:31.5835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2938
Cc: Mirza Krak <mirza.krak@endian.se>, Armin Kuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 1/1] openssl-native: Compile with -fPIC
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
X-List-Received-Date: Tue, 11 Jul 2017 20:54:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Armin,

Could we backport this patch to morty?

On 07/11/2017 12:39 PM, Khem Raj wrote:
> On Tue, Jul 11, 2017 at 12:07 PM, Martin Kelly <mkelly@xevo.com> wrote:
>> Hi,
>>
>> Is there any issue with backporting this to morty? It would help me fix a
>> build crash I'm seeing on morty, and I'm currently using the backport in a
>> separate repo with no issue.
>>
>
> there should be no issues. Let Armin know of your request.
>
>
>> On 06/28/2017 11:06 AM, Martin Kelly wrote:
>>>
>>> On 05/26/2017 12:03 AM, Mirza Krak wrote:
>>>>
>>>> From: Khem Raj <raj.khem@gmail.com>
>>>>
>>>> Fixes
>>>> | /usr/bin/ld: libcrypto.a(sha1-x86_64.o): relocation R_X86_64_PC32
>>>> against undefined symbol `OPENSSL_ia32cap_P' can not be used when
>>>> making a shared object; recompile with -fPIC
>>>> | /usr/bin/ld: final link failed: Bad value
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> (cherry picked from commit 0a19e72081771fca8ed94fb2a2a8996fd3dce00c)
>>>> Signed-off-by: Mirza Krak <mirza.krak@endian.se>
>>>> ---
>>>>
>>>> I hit the same compiler error as in above commit message when running
>>>> on morty branch.
>>>>
>>>> I simply cherry-picked that fix in to morty branch. I looked in the
>>>> git log of oe-core and it seems to me that it shall be ok to do that?
>>>>
>>>> This is a re-send since I messed up Subject the first time around [1]
>>>>
>>>
>>> I want to put in my $0.02 that I have hit the same issue and would also
>>> like the fix to be cherry-picked into morty. I tested and agree that it
>>> seems to work with no issue.
>>>
>>>> [1].
>>>>
>>>> http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136489.html
>>>>
>>>>
>>>>  meta/recipes-connectivity/openssl/openssl_1.0.2j.bb | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>>>> b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>>>> index 9a7cdedd05..b6fb126349 100644
>>>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>>>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>>>> @@ -5,6 +5,7 @@ require openssl.inc
>>>>  DEPENDS += "cryptodev-linux"
>>>>
>>>>  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>>>> +CFLAG_append_class-native = " -fPIC"
>>>>
>>>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
>>>>
>>>> --
>>>> 2.13.0
>>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

