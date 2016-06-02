Return-Path: <alejandro.delcastillo@ni.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0113.outbound.protection.outlook.com [157.56.110.113])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA1A77453
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 20:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AmFZ0lvehq02p05/yoYl2SYA2mZUGZkMyREaEkqoVVk=;
	b=A4FrhuDVuv4K02wTUD346n9hCXIwWLixF+fdAhoSEj9qIu60gkgBeD/wUGBazvHgNuFKGIPMPYwt81VVOy4yCIaNpW/3oQETJZ+4gkhDEDPwUEH0ZuN3tCZeqMmhyN8JZdbXYcTWp5dALFlwsJXCznHBJBTwz6VL1qxxNcMF/yM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=ni.com;
Received: from [10.2.33.36] (130.164.62.82) by
	BL2PR04MB836.namprd04.prod.outlook.com (10.242.196.26) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Thu, 2 Jun 2016 20:04:30 +0000
To: <alexander.kanavin@linux.intel.com>
References: <1464892387-696-1-git-send-email-alejandro.delcastillo@ni.com>
	<63886.10.252.18.48.1464898545.squirrel@linux.intel.com>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <57509149.2050405@ni.com>
Date: Thu, 2 Jun 2016 15:04:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <63886.10.252.18.48.1464898545.squirrel@linux.intel.com>
X-Originating-IP: [130.164.62.82]
X-ClientProxiedBy: SN1PR17CA0011.namprd17.prod.outlook.com (10.169.33.149) To
	BL2PR04MB836.namprd04.prod.outlook.com (10.242.196.26)
X-MS-Office365-Filtering-Correlation-Id: 4f440712-c527-4675-0e54-08d38b211b9f
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB836;
	2:qIQV8ftJG7thUtXB8LbL7a5FDnKv6zE/+nTrpQVdFTEMweuzmFUuIl+HCO/6msdmO4fNO1fcFGtKxz2jj4GtWWx0Rn+FaRuKt5HOWl1P7TuPjkULy/LxH+HHw+2IMYiPlpKWr47HW6PBvwOyYrwZ17VA/Gx9IM+Pxp/+QHg8sWlWvEInJwdUtvw+JP4M7kTi;
	3:enIV5r+178ATjkFg7cAFV6ix0p1j43HKzWE2ZLs9UESSXE14UnIA+aIm/2DNuFbh8KkJ1Hz6NHhtpgUd7R80/se2LKrqAOvBjYYf8pHV6P5fP3t/dGX/A7S29U+N/QRj
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR04MB836;
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB836;
	25:Fi/3QQgJP/pIbho5RRsuU0PyU2eCTt8H7ejnLlLWOb84ug+9IsxVzGKYc8mKZ4spkfJt7qRbTAATef4AB2QTaAoYmFZix9xnQALLzxCP0P4PlBKqAQWBoqlgFLbtJBGE4GiIei1r1Phz9wtCohuo7Xb9swOha4kw3KnjzwLI761r6hU8mzlpUv1LS4a43ZGQ5FRY632TvV6vNLKPi/dyRBcodaqp2tmv2S35w/gRKLwhcF+J6sjXWX2WHhNmN2F/VS6952cjxn/Dp6KQvKjv18UERsVcCfQGw/NsJsp63QK50Luf3J639NHPuCPscPjSkT68yGUDQ2BdAig89mp6TtPQZRnPapAaved6AU50wXiHZYu4JY48+gy2nP1eZQqJa7spD2b/RW7xsgXZYLxVVRhW6ps2BmgJpVYGs6NPWuDuncz3gYrC66XNqBmcYz8n0O/Jcm2WqcI+k4NVvbWRqQOPCQWGY9zWuR59tldoiOU63hXYf4msfCpMTNJjw39tiK30sGtzVznzcIgIMcx/1SprMIFhX8ZDfnCWGLBj0dGNIijku4xnkJyaAtGjAAOV1olSm6gecgCxLhvhUA2g80BTvp6HQGeKphedmyMxYxNPqsJqKt3btSc527s/GTB3QjTnrDGRl6kTR49rrR2O9rlBKor5RNGahpD/G2TMbM5pC5MHSoBQ6Un2CrCoPvLzWtWIFf7c8bC3sLYlng8Oww==
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB836;
	20:SiRTlv8Hvo9wBnvPor46mBraHNOOIHl5Q5PQEOdB7CcwWRlZm2Bei/lFMPDEazVWkRxwLPktAS9SbaLVPDKEObKSIxGN0aYlgNWRGenS768gxfjvrXi3s6UJGD/0EojX6Qs+8gTP4g8mECEYYTBCGKofsB+qGEovv5lz7okXFMSBuGoS3RInTVhy7Jv08NAQPFHpfNNJgPld6A6t9eb4vzEFSDojTlQXy7tK2GkQ53uVTLb2ueMtSER5MpZkRpkFm0QxwQbRDLnTtewypFf2GSvspoP+DEZ530SsHzyFjfyYM9cnz1H7O6d+RKOTBo55/WoplkspUwjAKeseGcAHEIWkeZriJGckRfplr0XNrz6o3NzOrFN0NvgX5K3m4YYrZtDnffranX23O53/KS0ZNDhkkN7q2RIC2/mtnCR9RhdFeXNKQJ0FRf4zDX8PRoD17rV2RSjcdGpyNVb+MA32Abvuiqy8K0+3zbxvg0x76dTAshAXmSk4T/xLmxjw0KdNUowLyUSbFRFoWZWC2dtlRY5SQYSUAPJM5w5lI1S9qM19Pc4P7YjIrzhZEc/S+7JdN/lRhZ8izTwIrEvhd2KMyJU4zBwT9QP0hcewNF6vwGA=
X-Microsoft-Antispam-PRVS: <BL2PR04MB836F3468A55245D500CCD7086580@BL2PR04MB836.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BL2PR04MB836; BCL:0; PCL:0; RULEID:; SRVR:BL2PR04MB836; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB836;
	4:wSJ+iys/9OthVm0jiKhz/P7TYUJ3+OZVspevSuGIFTL2fEoRWXDecnPoH5YsshOomjgjLa2Qs0XUaWdydMRruieC3x5VUVL2xwr5xwaumA16hif10jtwPt1rf6xsEr/DGoFgNzhR2SxSDeRqKCITdbfViIeIE1hwcq/rIY8M4J7sZRXDNygmLPdWJPzAdWraA7vFGqUQSN1gVrqQFmr0AvI8OP/HrAfqA2+zCIsu1sEBo/S3qC0rMlWZE1hFJcAR7DVGcq1HJXkJVd+/VE6zYwikAmj7X9XkS/7OQ/A7P5H4plZ2p7UnIFGb3jq+xWGqbLfXa6y+xVGMHgESymXYxngSl1XmohK8fzeLwPRPNTILxYcAn1MDROyLwtg2vjbaY5e/60ey43VJKoEjb7eSgxBE/li3oPa6ywd0oY2GH3U=
X-Forefront-PRVS: 0961DF5286
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(6049001)(24454002)(377454003)(65956001)(15650500001)(47776003)(2950100001)(5004730100002)(66066001)(65806001)(36756003)(5008740100001)(81166006)(122286003)(8676002)(19580395003)(83506001)(19580405001)(92566002)(77096005)(42186005)(110136002)(117636001)(189998001)(50466002)(3846002)(6116002)(2351001)(586003)(59896002)(76176999)(2906002)(54356999)(23746002)(87266999)(230700001)(4326007)(4001350100001)(575784001)(65816999)(86362001)(50986999)(62816006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR04MB836; H:[10.2.33.36];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BL2PR04MB836;
	23:TPVTfhQCGzEFQ1YPIAt5j5Z5d04lJb5NvJI3DW?=
	=?Windows-1252?Q?zYOKmBGgOhsXFqlB7ELE7H96CMsNmlkYEKYkvBtcGr3wrS5lZ+HHPn8W?=
	=?Windows-1252?Q?mJW6CjhJXedKabKYu6GwEpWZcL9g5K/vyhUhBtzWu5fxK6KDZijQrLgn?=
	=?Windows-1252?Q?quHkQTfK+pxc+hVtGQxoH4rjWr60fZu5YHJMyKboIv+csk1f9wYymqQn?=
	=?Windows-1252?Q?SIuBH4Q6ze7oMUHOoxNi/eTRUh2sgjxFstA0yUHyeNOfiQP7AOyk+r5y?=
	=?Windows-1252?Q?MieetzerUYVOlCP/04RoEcyQIE0vrf0vXGrr2GBxIUAhSiRhUUPSuLSe?=
	=?Windows-1252?Q?XMDrGCbBJ1TKNW+7ooZhFQEKp/VY8J2PaC183Fht4ydjrqp8UHvLI9Iv?=
	=?Windows-1252?Q?N0qlK+naHoMWQfZXvH7QKc9j72WwBmrFPWGczeizk3u/KBO3iueU7rGx?=
	=?Windows-1252?Q?OwhcsSI8K1nI7IrzeNTa6pySOm1Qn8NtlYrchd00h8ygfzq5uI7HMdxZ?=
	=?Windows-1252?Q?AUVZcfl3YzfranyAihfqK4SDsul28BHEKuTkbPvA6JKLXozc3JUv59mp?=
	=?Windows-1252?Q?TDt0mv48RGp9XQHRz0wHt/LkHMxIXRHHbEpkagy+WE8p60Fn9QWRtY0K?=
	=?Windows-1252?Q?th3qN4oGPEmN/jmnFa9f72iU//f0vjVW5pOYGfrpFF9+y+4B0OztOPSk?=
	=?Windows-1252?Q?4W6FjlEHOShr4A5jThfSYH4ZFwAY20rgKedfxZu+1961uq6+dlhlwsx/?=
	=?Windows-1252?Q?/jRvZwgRdEWcoW8fuHTFOWPJctNNJG20mFOFKCiO4wmpgtWeycyf4B8V?=
	=?Windows-1252?Q?84jeHktApos2CMMuq+heXc8O0XF+f2lC0PlG3Rb4q/d7xxPOK6NlzG9o?=
	=?Windows-1252?Q?ArzwavGV44dCvbUnSrixZbSGqNHty/eqSHeAjLa/eprx2Mq3qMHe8Pli?=
	=?Windows-1252?Q?MF65yzmf2Mr1d6Yfk3zANIhyE5tqigZh0L/2thACWqV+meLypPhH66A/?=
	=?Windows-1252?Q?bXYyCp9FGC1fhk5Pp287Xht6bXITX8UDRUj+yuFIfJ5lSvrn9XXqmhmO?=
	=?Windows-1252?Q?N/R8Y1Xsic1lK3SU8K3D0EyoCbiQO39/lbbyap3oycMnZxWcRh7h0blR?=
	=?Windows-1252?Q?apTIrJVOzJrkG0Bk2WLsBTMSztzWaODixPYAbnd1LOM56vUAzvg5HfRb?=
	=?Windows-1252?Q?Kf3m7+ECEy4X3k3Edu+guT/HvYZ/z5RxNxPr1CpGGXWyysOwtztIzBvm?=
	=?Windows-1252?Q?JI80zcoY5ZuHTw4SVJ737ZvRSulH6v2/2ee4w=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB836;
	5:SY88wG4oCFUVsOv3Nv2Ozdvcg21U1cX9UA54/No1O4wUkEScjsCuu5KqORCIAajVZrjkaSjpMbTrU9OtA+ss11eU6lOBrkU7DSn0wRqSAafUyzDtIV6/SUN+x+WCDHaNBFvmomZtC5R/1R1J0hRXeQ==;
	24:D0ci2AQV9Je55OCRu8+zGBu40EZZBusH5X9hFhriVI98tA3jRwJCEYNbkGEA7/WGI5NWSx8Y1JUV2o4DiFgLN6bEV3WT2ZeOlcIKb92yJnQ=;
	7:IY+fTAvCIfeOhMBaYgYSK7vgxPxaHzIye5vwe0dGzj/gxlv5fJPVW1limEDAIzAzvI5ptvTn5L0sDnS8bv2T4P4MIT0szE0ZmFHQkRrjhtoxziM6RFVbDmRqFeV2+qX+NXNHsiXvYIl6+IgI82OCvc1fApQEDod/xWS+o/KTLX7nJoKVZqzMJjO+yXLNU6av
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2016 20:04:30.1087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR04MB836
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: update SRCREV
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
X-List-Received-Date: Thu, 02 Jun 2016 20:04:31 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 06/02/2016 03:15 PM, alexander.kanavin@linux.intel.com wrote:
>> Drop patches now included in newer SRCREV. Update HOMEPAGE and PV
>> version to better align with opkg. Current revision include:
>> +SRCREV = "ecd9a499d336ffd127bda3c5ba403f0a5ca056a5"
>> +PV = "0.3.1+git${SRCPV}"
> 
> PV should match an existing version tag in the repository, and currently
> there are no tags at all. Please start tagging the versions there,
> otherwise there is no link between the version and the commit id in the
> upstream.

opkg-utils, as you mentioned, has never had any tags because it has never had a
proper release. The previous PV was pretty arbitrary too (I believe it was based
on the opkg version being used at the time).

But I like the idea of more tightly coupling opkg and opkg-utils via the
version. Since I am tagging opkg 0.3.2 in a couple of weeks, I'll bump the PV of
opkg-utils to 0.3.2 and will tag the latest commit to 0.3.2.

-- 
Cheers,

Alejandro

