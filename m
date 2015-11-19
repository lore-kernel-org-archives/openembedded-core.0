Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 1729 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Nov 2015 15:58:40 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0135.outbound.protection.outlook.com [65.55.169.135])
	by mail.openembedded.org (Postfix) with ESMTP id E9DE560107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 15:58:40 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=alejandro.delcastillo@ni.com; 
Received: from [10.2.33.36] (130.164.62.82) by
	BLUPR04MB837.namprd04.prod.outlook.com (10.255.188.11) with Microsoft
	SMTP Server (TLS) id 15.1.331.20; Thu, 19 Nov 2015 15:58:38 +0000
Message-ID: <564DF1A7.1000201@ni.com>
Date: Thu, 19 Nov 2015 09:58:31 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	<openembedded-core@lists.openembedded.org>
References: <e54ec1320521a08198512388736dbf21e832fe94.1447947565.git.adi@adirat.com>
	<d1591e89e54b57fae63f7c5be8c70f64100f35b9.1447947565.git.adi@adirat.com>
In-Reply-To: <d1591e89e54b57fae63f7c5be8c70f64100f35b9.1447947565.git.adi@adirat.com>
X-Originating-IP: [130.164.62.82]
X-ClientProxiedBy: BY1PR20CA0008.namprd20.prod.outlook.com (25.162.140.18) To
	BLUPR04MB837.namprd04.prod.outlook.com (10.255.188.11)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB837;
	2:G8ehxvw2rwJQctOmldR5GvCzOl2b72xfuP/mjqejv9FPqyJ7o61bW81P8Vmxgv2eaGfBsX8wNmVSef9Oe9jpK1d0y2zmFVIRhSxrdXS62X0S4epwAehUVH2eLJQ+AX3zS7MxSIT2WD+5A4g0iqszcw==;
	3:y82c4E3Zs2YJM2AKfJqJ0A5YwpJKTds8ZoXYJg4823msUfvTgwriekAjv+ShjyvQGlvEJQMUci4A/rRAotp4amfKZ/oSz6hhxJgnBURya8Cx3R1TE4G2pSzAw2Rw4CWW;
	25:SZDBjCWpCRXROU4/yM//VAH94f1W1SZTXFnGgaiyVWLlm22ReYedE/sidIRk+tg55GkN3EchwCBMHDN1NwBUA37E0R0+ObyIQXLM64BXny2THUvTgw2moN8gwvIRftJMyjo5eOcb/9DpmYYKK1ivdXOFTUKm5z47C+uxKr2zl0kAyPMjQV4XjnqwRjyQu+wF/FDLar2gXgJiPdTTNb0gIWBMiWF2WOvK/Ik0c/SvZimRlmBp88rXBkme4GsrCd7dJLffxI8g7kIL+56tlqWMxg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR04MB837;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB837;
	20:Jj0lP8oEunw+uwNrkE/YlBWGWAjv4e5bsodvqze0wD9eEeCDreY6w6kSpwKqCZ0c8Vt45NdRB+asVaK4r5DRqI4lL3HwS9up/6rSN9bC1XudQxb5RdGGT39E6zsG4uNwRt/QOoihDyqYjSNT5NXCGe264ZkN2tYuQh7WE1cD0NQ/ukq7DY4fhqOqxkELU5s9He7A/Oc6gWJ7nZCTV64T/Aa1G88Ok0HhLODV54kqxCOEQF1abDHAooEwaqx+Wvz8rpbJQzw2KX24cAPs/T4kXlnZvQKTasudMIYFGWbOnuswwcY17Qko3sXBnl1qnD/6eu9/2zws7AM4CGLc5aCBLT0JSOqdR1+k+GSCpmRJ1SZJiEkC3d3S1CJh9c3/UatR6UWhpBY5erpbsP4Ic1tyrL5khS5lEYggZtPjB3lpyVj/QKFCQlu6uUKXEFgJPYNyca4rd4q2xQCI/LgzAFSj6wXoHqeShnWWwuMTO49GivrfF1pRnPOjf0eViVKX5CN0GLfspFf5qvkSV4OnyQthA9pyLsu57df+TomonynSwbqr7Ir2XrCPQKNXyYp9yHld7uP3Ss4cFWU0RUIlPFe0wgXyLhFf1OQAl9UKwBm5XVw=
X-Microsoft-Antispam-PRVS: <BLUPR04MB837D1720101088BC4CA95EB861B0@BLUPR04MB837.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(520078)(10201501046)(3002001);
	SRVR:BLUPR04MB837; BCL:0; PCL:0; RULEID:; SRVR:BLUPR04MB837; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB837;
	4:44SZmU3eJgDdA66eb1AofoVFoNdPIGoiYe4Qdw5qDoY0pApG/HHwkHSun5J5CxlntC3H9l/q1JIda6bdTvQoXn1FD+Vf3uWaWVGvtTbXHt7B4ax7OU/pdxxo66mA+U6beGqEZBs0rRQMT2/zybo6C6Bq15t0j4RfRYfLe7bpEWFbk74tQ6eJqDNkHkB1aI5PuBLKQhAnMNYgKioGc2pBT1I0mE/kbzVE3msLdur+v4U8/sPapwsquShu6NON0NKyw5ecf+86NbH+UcIYY10uSPCPrwSWGN/+8lDEml0bkEZRbaFZGXHDpncdActnDBNu/U4BE3dd+Ay3KJh04L3xPKjWwFWRkQUwELA8eALH9T2JPxmpK7GIxxAh2/C+idwu
X-Forefront-PRVS: 07658B8EA3
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(6049001)(189002)(199003)(24454002)(479174004)(377454003)(65806001)(66066001)(50466002)(42186005)(65956001)(2950100001)(36756003)(47776003)(59896002)(105586002)(64126003)(5007970100001)(4001350100001)(81156007)(106356001)(5008740100001)(92566002)(77096005)(23746002)(450100001)(5004730100002)(5001770100001)(5001920100001)(122386002)(80316001)(107886002)(19580405001)(76176999)(65816999)(101416001)(87266999)(19580395003)(54356999)(230700001)(5001960100002)(40100003)(3846002)(86362001)(33656002)(83506001)(50986999)(6116002)(87976001)(586003)(97736004)(189998001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR04MB837; H:[10.2.33.36];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BLUPR04MB837;
	23:r1pBVGGUbZpZGu5m4NftXsAjPFLyqb+8NpCQ4b?=
	=?Windows-1252?Q?3beAoVymAKw1Mf4UMmwL3l7iEDRx9RVn5z+QgYrnsAHae4JRc8YJIrj7?=
	=?Windows-1252?Q?amXOse+5GsIKakhQ2f1tYQlSsGzRXoOn9tOGi+6G0K4XMLjy9L31W1Ls?=
	=?Windows-1252?Q?Htw33WCQsZ6o0wjUJGlqY8xEgv63+k73fri1CfaOyRfbOkSOMaDAirie?=
	=?Windows-1252?Q?eKfHSrxJEkUalTkLEjeRAv7CBguHTGNuK8xpGSFBhAtBADtu+tMW30pt?=
	=?Windows-1252?Q?9lN3a1OQ4swmdpMt9wGQspBJUZfNeXw/77pMVetyk5+OCiIdr1Bb/uDr?=
	=?Windows-1252?Q?B50cjoseKRMfe5ogWxwBNLCIFFZi0NMmEZb3wmVdp71MNwFZlT8Ozk/x?=
	=?Windows-1252?Q?n3jgh+CHtips6MkRYe0NfPsh3XmRFTodyRpGcL7LKsS74hhpfuguv3kO?=
	=?Windows-1252?Q?u6Xur0AX0XQ75T7qlUlbQAGQvzvbFf62aud/y9BUS0EExWPu4pp8lwIy?=
	=?Windows-1252?Q?aEx1vUnKFZwS3O4NTnpEhxnGG8Ri0TSWr2oDgiQE+VUvE9uRhkKAvXC+?=
	=?Windows-1252?Q?gMQNldLChgZK5av71oUUqqWxPA2N2GERvfdGx+M3Lnm3m/0scWR8gXhC?=
	=?Windows-1252?Q?AnTSPrU35a2SOyxVp5r/hnYLeWDTrs+UVTgRTzhzPKeBFR5QLXkf7l+n?=
	=?Windows-1252?Q?qEe93kE+9O5FzVoPG6EzFA1Cua9KqMzXfptMC5TPPz7uWQpR/dQhkrxE?=
	=?Windows-1252?Q?hV16D/yCKAkwyrCq9sLnKm9pQn/5c3Mj7id7sjKLqGcpUAZol2tcIo7d?=
	=?Windows-1252?Q?bT/gA4ecYz+jHuxB9PhsDNhnfxsprTXagdRJhtxXkGqif651w9M64JRM?=
	=?Windows-1252?Q?v+e/5Iyg9ycZ/q88BzZwKRwiopyxRo/u9Hx6SKL252sqsC9WAv26bs81?=
	=?Windows-1252?Q?SKnBvttw9H/w7tSkMNZrPCCUjAk5tBpbXN1kX2ZK6Sbk9d4i9rCa/KVp?=
	=?Windows-1252?Q?K0JpePPnMebpGni40+3g4h78igDUMNU9hlIX8CGcMbj2LjStLFvJI5Jy?=
	=?Windows-1252?Q?tTF6cxP4JkoodWdfHfQKZhaYGDLuQ1dZqgeQrg+WvFoUqthp/3Pnm9So?=
	=?Windows-1252?Q?lPHbRoLoJibaNq1HMJp+GTo7meRBNxqle/TPrwqGPp/KWIWPygWZ4I2o?=
	=?Windows-1252?Q?0FhcGYgmfJExugAvWtk+Gpmhtk/mvPny+hecYqFQbCL78W1VnGURIi4P?=
	=?Windows-1252?Q?mygHh7ndfouQh8BFFf5GkZ+fhZmALJNBtb4wQ1QVo5qxiX3d3TW870je?=
	=?Windows-1252?Q?V5LsEKrAVR36e0gFkbXlg9Fp7I4e8pua9n5Za23hGVmPXfQcuREdPtSr?=
	=?Windows-1252?Q?NgdU1Ple3VUAuu1GdT1YsO8vFg1SqnaqCB8w36BtKUKSy3kykVLYSghz?=
	=?Windows-1252?Q?M1Hv7WXXPqUeHwfAiUaob9qEwS0RjzGrxdTA0GsTKtHdDdISipuqvc7E?=
	=?Windows-1252?Q?zuz9mYJaXGWq3+kBfYoUqzLobLT2hu2BX9E9GcH8n4xAxOenqLhqBayQ?=
	=?Windows-1252?Q?k96l3KlClVIxMPhZ/G9QAf4bVl2XKzkqYJkfuov66qOzni4YPxJcUj8A?=
	=?Windows-1252?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB837;
	5:A+srL/xcvAzTpkg1mNGDtkE7U1zybHstUDcvkz6UgJs4FIg/csXFQagKaHasNCKJKVP20SSz8GQp6h4Wf65dbMwTqmINYYmWzAfggXqcgw1YD28JM0NT6BfuGtQPIlxNrj2XD/+ep9aOTT8yluizQQ==;
	24:2KF+CbCNYJ2zd7abH0/NDWC1KG6v1excIcdATatNZKzKgx6NIGxgDCqsKhwI6JfDEJAng3qDSPY8wTTpf0NZatA69CYb4/YMAn+fdA8axn0=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2015 15:58:38.9751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR04MB837
Subject: Re: [oe][PATCH v3 2/2] package_manager: support for signed IPK package feeds
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
X-List-Received-Date: Thu, 19 Nov 2015 15:58:43 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 11/19/2015 09:41 AM, Ioan-Adrian Ratiu wrote:
> Create gpg signed package feeds if configured. Very similar to
> how rpm does it. Most of the config variables are shared with
> the rpm backend (like PACKAGE_FEED_GPG_NAME), with the exception
> of PACKAGE_FEED_GPG_PUBKEY which is not needed in this case.
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>

Acked-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>

-- 
Cheers,

Alejandro

