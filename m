Return-Path: <alejandro.delcastillo@ni.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0104.outbound.protection.outlook.com [65.55.169.104])
	by mail.openembedded.org (Postfix) with ESMTP id DD3D760767
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 01:40:59 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=alejandro.delcastillo@ni.com; 
Received: from [192.168.1.76] (23.119.29.149) by
	BLUPR04MB840.namprd04.prod.outlook.com (10.255.188.20) with Microsoft
	SMTP Server (TLS) id 15.1.355.16; Thu, 10 Dec 2015 01:40:58 +0000
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1449694203-15173-1-git-send-email-alejandro.delcastillo@ni.com>
	<1750958.3rdPrcUnoM@peggleto-mobl.ger.corp.intel.com>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <5668D81E.1040806@ni.com>
Date: Wed, 9 Dec 2015 19:40:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1750958.3rdPrcUnoM@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [23.119.29.149]
X-ClientProxiedBy: CO2PR11CA0014.namprd11.prod.outlook.com (10.141.242.152) To
	BLUPR04MB840.namprd04.prod.outlook.com (10.255.188.20)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB840;
	2:aLJb3FdCWhEY1n1+m63WyFgCP98Eeph5xBURyja9RtBX5klln7suv4mG3cw0zEx+9hIIcAAMchJlfo7YlUEZ3iwMAr7aiJeiFUdGQ48Gf/I93cGeYXJdNMiBX3dSJtzp1os+QbpykwL3zpkAYkcuqA==;
	3:sYamogtUqT0oGxjPcOQPGgCGnw2ch2qLzV/eNYcMq1mpS+K6u/f8YW67gQ+Qi7IAO4eRC7iDuzd0ZQr076ozX2i/Pkn3DNyJ93LBQKfCjqKncvm+XIEo2ipKA2mswh1W;
	25:m7Laf2g3wDOwOyb+2cWLiZ6piN0+YoNH3DsnDUzR7DoAYorEe9pv2g+tsbuF1L7wHNe8y8cbE7h7HNtSOAmrYbIFsSGENMivOCCRS14CdBWf1QSKZjNhJ8/Ez0D9N+ixMBDz0OVWVMrVvSZQb+IQFbgENZiK34k41w1ADU313iTgX656+Aq7W/8XOAmHYKJO8itM6SbOSI4oD+N9bEEPMoDeMVqHKDWdvrYEbfVrLgUzurQxtvYkN3aGihnkFLlToG1pf4bIh7IQd4qpQ9IWjw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR04MB840;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB840;
	20:g2PB4SPr5S7JWvjrGjgoNKnYzHHIn/VPaLlz9fw7Kwjuv7kCtz4Tk7AJSlMLlMWMoCjbFPvafujpd4QXuClxcB0wIKY94vLzoCuuADIgwWNQ+yCFOStBF4E2RHMDiabH5I/uTsr8xVa0MspR+E0E2CPz724oOG/JDxNwr2m99JMbhuwUnGmy6S/R1S+7joPwi40U78iTaysT8HrZ5a9mMTW006xaLfPX0vmUkDrP3oD41bV3ULS3tyzOouqKo7O1VgbGgKZdgCEx3rIT/fTmA+c8ithyLmXIUm5KYlYtCcS5w0kKM0l48NS6Ht55w2GbXyn/Noo+N7LCMI6B6l7bPYIRhCk5Tqs4NZdT+yUaBms+XGfEsNiu6DJwOC1zDZkgb69IwWIENmL+AYGlEcBiVX5vEe+RE6eGX+y5X7DEHelQ6i+K/h6r8JFCgc9c/BqgA8P/EZR7MWhlQUdx3Fgs7aFoaHGmV9ACTm9z3sf5UrbCz0hbHVollZ9t+B6zTwgdjyxQ9dSuLdxv/6EHEgiswenLhGfF61UbEGlaSQEdUkVWUifddCgo1JLfHqflhC0qDilISdQ6d0qHT5hzWFioU5t56d7EKiliWsD+ZdQl7tQ=
X-Microsoft-Antispam-PRVS: <BLUPR04MB8400D8948D187ECF8761CC686E90@BLUPR04MB840.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:BLUPR04MB840; BCL:0; PCL:0; RULEID:; SRVR:BLUPR04MB840; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB840;
	4:B+8RS9UGhcEd3PhM1RDmtzCAwHNQA5GVCQD7kGhawm3QVrn4+ftP6CI5vEeNJFE0Qg8mehKl7xxZ+ZdJV+X/bD6qg21OcWV7pWd+YoFnDPcptKIE2jaEwdF8sOhvrPWFiBC/7oa8oWm2AZreTL0IFAul457I7xPy3JsiB2Gq11HVjovFCyIO4spiv8CuT7JM0W82xDZgrw2HR9sfijS4ErRtJbx/oebIgDZkJWuL4xoXMelsLPhpinP8DkncN+/feLs5r14c79KNJBsEv4fvIaQGs8OSuBWIgQn1qyo7la0dNgHSPTce0F4QyUqKorhlSnOukQxJdBWKisL72lMDl9kYKjj2srXfr1xxBYM/UW9+nKoJWS0H5wTPS2PN35LR
X-Forefront-PRVS: 078693968A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(199003)(189002)(479174004)(24454002)(377454003)(87976001)(105586002)(59896002)(117156001)(40100003)(47776003)(66066001)(42186005)(65806001)(122386002)(106356001)(23746002)(65956001)(81156007)(80316001)(5008740100001)(97736004)(4001350100001)(65816999)(5004730100002)(101416001)(77096005)(50986999)(5001960100002)(230700001)(110136002)(33656002)(2950100001)(76176999)(87266999)(189998001)(54356999)(92566002)(36756003)(1096002)(64126003)(86362001)(83506001)(586003)(50466002)(6116002)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR04MB840; H:[192.168.1.76];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BLUPR04MB840;
	23:/bkYaAIQ9DqR7G7bjoUty9wE/tbBi7PvYDipiB?=
	=?Windows-1252?Q?BhfA+uAku9dt0fkORJr8Ah3okN5wlvFy2xnBPdWlvw0P4gwuFQCEGhxA?=
	=?Windows-1252?Q?uly83QbIVyPiurD7gOV384a7615vquGaBDxhCTQ151dk76NCx/N4geAU?=
	=?Windows-1252?Q?Rw+7vRthsxIUoLbHqr0D2OvSyS3k9Qu/DmsAtbdhkEjuCGq7v9IbX0yw?=
	=?Windows-1252?Q?cnjsXdvXRJ0R3URMXWU0d//ntvIUFFqJAY/6iN5MQztPYeBMaB/ht4g4?=
	=?Windows-1252?Q?l8uipc72rGZGmyfkDw5U6fPNQEDIlepF6ONAcjavzGOx40pdNud5vVmo?=
	=?Windows-1252?Q?Tczgdw9E7jHs7yd1DbXIN2e0Aye+lmDC2pQeZT8tO8Q3WbdQoqhnJ/Pc?=
	=?Windows-1252?Q?y3CHg1FPSqORXP5R/A643MMyUODsPH2kTlXRsYy3eR06YTMbWbhbvDpp?=
	=?Windows-1252?Q?fC3+SZVuPZ2wFBOrvWE2vkCzOs31QMNiFkhpNzOOIpl87t2wkp42uIAH?=
	=?Windows-1252?Q?L2F7L3jNovyZpuTj+sPp9oYxhCUviNcrY3pPQS4JAy1jC2p5R3mHznSo?=
	=?Windows-1252?Q?v2E8lr1SHGo5VZhxVONuhPFRvBYYMmQeapiXg5n1MPu8hWS/Gmdr/tcA?=
	=?Windows-1252?Q?Z5gch97eoSF/+LDNwxksn+e6LrSpTyGGlldJtx/IuPsUeAWtJMBTpH0P?=
	=?Windows-1252?Q?C0kzsQi7GrjhYeZ9cydGPoJF6P+gZ58USCN65d99dJPHPRlfz8ySj7cc?=
	=?Windows-1252?Q?FywhEjmpjVE4xkBMTc7xyDgiKv2MPNVKPt5u5JEemz2oqdmiihxTSIU8?=
	=?Windows-1252?Q?BK2zHJvCjuHIggh6ZCo1UPgT3G2JR6c6Kn6qUe3NPbUL9YnuXtpqkFFt?=
	=?Windows-1252?Q?k+YRJ+1/u2qPgD43Jtec9bDfCfyBDYOeY8TWsDB6kHGqiaAA2N3+tQUw?=
	=?Windows-1252?Q?U5hx45OeZM3n8bCIT1miFPPHE9zB2g+jEgajjGI87t14Ytbx+L0ax5nG?=
	=?Windows-1252?Q?LHmo7nBCLIKDpq0mSbX9sWxS3ol9Ati6cpIw5h5qzbKu0Staobg3+htu?=
	=?Windows-1252?Q?7k+GOGG3N1c8gWUUXEcgH7ue/7qsP/QvUPtgc7RYSs1tA2yTB7jEKDqI?=
	=?Windows-1252?Q?kcFma3s2PjZ+2ib+oERcItzHsjvxaDKVnu09svIqFzGoI4aeYHxGCPlQ?=
	=?Windows-1252?Q?o6MVrDgPTqtVjw0+lPKWGwXMYN2xiGe2wUAv8uk+b5F8OrtXDQK3UEyQ?=
	=?Windows-1252?Q?m0S8GOzDKl4mIcdUeb2dfI1jjv8IO0cxUryyj4/PqdfZWiRdscdD2pEh?=
	=?Windows-1252?Q?eE1hlYFbYTK3/WxjN0XRTNborYiJqRe+u6cd1dMOMS89I=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB840;
	5:oqSoPkWeW5Gp0advBt9LUFi3D7NUKoSab30Q6Pxe10cN4RVEo+pCsjU5Uom+peGzE94zarrCIbr4Hjr1b9gXm29qE+iY3olwAMkdSHa2UgiwNYm04ppZBV0MR5g9Bj5NolCFw6UZonraOvJAt7sVzA==;
	24:rTXot2OXSEvQ/0Mlcs5x32Q7PBWyNbYEDJ/cIfIWelGNWWFDf0szmaeY/XJH4FnplqNlFSw2KxAau+b/gov3TEuxVGLwkm0EEA4/RpeOx20=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2015 01:40:58.3327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR04MB840
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsolv: add new recipe
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
X-List-Received-Date: Thu, 10 Dec 2015 01:41:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/09/2015 04:04 PM, Paul Eggleton wrote:
> So perhaps it was discussed elsewhere, but in any case if you want this to be
> added to OE-Core there needs to be something mentioned in the commit message
> about why - what needs this? If nothing, is OE-Core the best place for it?

To add a bit more color: opkg 0.3.1 has a new backend to use libsolv as the
dependency solver instead of using the recursive internal algorithm. 
Moving forward
(jethro + 2 probably) I envision OE using the libsolv backend by default 
since the libsolv solver is vastly superior to the internal one.

-- 
Cheers,

Alejandro

