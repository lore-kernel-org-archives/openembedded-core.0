Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 1781 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Jun 2017 15:42:19 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 0610F782C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 15:42:19 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5GF8Is0002742; Fri, 16 Jun 2017 10:12:35 -0500
Received: from nam03-dm3-obe.outbound.protection.outlook.com
	(mail-dm3nam03lp0020.outbound.protection.outlook.com [207.46.163.20])
	by mx0b-00010702.pphosted.com with ESMTP id 2b4hq600dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2017 10:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=m1w/KdIsNWHHfYJIXq0GFrbTG8ItYsmTuFgQDp8MjbE=;
	b=fQabDGwqBjXCCAcIQLKmiaOGBPvNGUTtUgRMDbG984FuuM5vU+5nweRwpBXv4ulOgx32wtUnAULAjGsZO638/MvaaobNSPXTAinxAeguj0vIVMUIEib5eP+hhSqYTqnjPRre4YtHH8hXujrGASOwKKWFuvswyGIe+eBn/5Wzzk8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=ni.com;
Received: from [10.0.62.53] (130.164.62.126) by
	BY1PR0401MB1320.namprd04.prod.outlook.com (10.161.204.139) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1178.14;
	Fri, 16 Jun 2017 15:12:32 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <1497568647-2740-1-git-send-email-alejandro.delcastillo@ni.com>
	<CAJTo0Lab=4CGgXFoH3BNdXo12WdobaZ_MBb8NaWAhA7Cfm-6OA@mail.gmail.com>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <22cac9e6-01d1-8b23-14ab-79c3b34d0c1e@ni.com>
Date: Fri, 16 Jun 2017 10:12:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lab=4CGgXFoH3BNdXo12WdobaZ_MBb8NaWAhA7Cfm-6OA@mail.gmail.com>
X-Originating-IP: [130.164.62.126]
X-ClientProxiedBy: DM5PR17CA0033.namprd17.prod.outlook.com (10.173.128.147) To
	BY1PR0401MB1320.namprd04.prod.outlook.com (10.161.204.139)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94a8b201-1878-471a-fcc8-08d4b4ca1d19
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BY1PR0401MB1320; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0401MB1320;
	3:HftV4BWMfSHSrpXAZLiNWsBfDieUma9wWhe4AGes+nfZADx4JCv4j6mvSNkOc5nyE+T7P/OxMQNoaK3xusPv2F+7iBKqyHmibjnmj95uooO38jXsZaOTM+O8jGSRf2x7a8noG0e2JDcGQh1eeSkgFjkb3lTGWQO3NyfNLQ7hzxYf6qWx8EIWj67spaPoifczkjdFlZ5RjPwUKnUXIUEJIB9ZWod0so6fsX1rLRPqyU3AcWeZXlOijgLsNVuhJsoCsmsQIU/b+Yq1BTBwi5wEwQwKiZDXLNWpZlsLDWXJPNClWFMUeuLATyVUcg0B9z+6/GKgs+EWfb29RX01xZvCJw==
X-MS-TrafficTypeDiagnostic: BY1PR0401MB1320:
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0401MB1320;
	25:69fkRvm39PTi70TqEpQ8G4JoRILEnHVrXEShnU0r6pblPCXgh8OLf3P5iIGpd91uWDlN4X5jFu+yuc183jTVooLxuloxo4RixgrNwgFqIk/P+0fNISfVWkQJVwEy1FuUoD69LlW+3lfhYqKiGx/KiiuRTF9TUASbzGYQt/Ra7uvww5k99gCwA8de5Ihk09bUZPRyBcM3XsTQVUUNIebiXfX7lXnSFJhR+NW3kBNfy9mH47GhyLLwFOD6k6LW4mWxEefpr8BwB/ly2wPLJs66TarfgyKJpCsS4bwzORWA67xUcplzr5GVoVQGRu2gy+ntF3Mm47k4K7GeBy+kU4y+bg6cjEkfwnpOGUUpj39Qld5VzXmikn6YoW/0PviXT7VM4F1P94BIS05eHmfOx5xK4QtGOstDnD1nNnzzbJwkFnjUdGwQC3DulKrGv6S6BmS1EvtBhzexdBGxAW6Mv8dBIALnCkzOs88Tahuu+O+G87uDZDGhgpkNruxsH47/Chu475TAtSfKLNAZZI9vsXoPQWdI+XJJk55s2DghaFsuoBbmsLOiUeInPXlhLtFvzIumE7Bj/oITaqor/XzQ0KXlT8p4PRp48zXJ9X6xadzqKBL6ytvVvOvRy3Fm4ikwAFjcOU39LB5MD3aWb2KLGD7on5CD6x1a1hWY8Ja5GWSwJIx+u/jC4opKSztJfF+iogPcGmlsfIVPheTXgJAuCipHIXbBRhT9QyT8d5hDx1abhPrVH1I3sc24fxh0RGGk3DrIxl0EtW3UJZXnJSjVMxKya8PxI64tV/CW2pElQ6bsPqF1Eb1kDYksS9PcT8VZWQ0LGLZ24ga/IHrf1MdpYnvag/+VjOp7GW4lpJxQSZY6M0CliAtFIBHp2Sfp6qAyORYGQPz1NVDhfWl3No8YdGf94N1bs0sg38gr3gRjAoxlHwE=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0401MB1320;
	31:0I5Ne/E+RUdMtKcNusYAxK04DGnomRmKxdTSwPLABgX0IK+WsxD9dxoI7YS2tuyLECNVYtUZwsPZ16YDMsMcyeMwnJVRQzVRMJ/A89s/W/yzsl2Oi/MWnBuwIgtTHcS/Wj3nxo2VMjtO580+Rc0J8GUtqJ5TTn65eEiKbC+fq2dUGLWNMt24KYt6k8K5c6qnlGYJUBli0MBxj5BY74JKwngeUXyb/p8cQznaY1wgR8t56XsYc/n0lIQpACptlgsEXKL+HAocp3uAsVT378ZCOyVTbP4LiGpfVX0Yq0w9RAj/sglEb2uqXGIqu3+oSBBqF9Pnn7nO6sTcaXuDl6d15tioIcPkVfo4cCfo/xSrblQCrJ9UoIFz/OFmrZ5GO3GIh5cSX15ZdSJkN6yZPnJd/wWNRalmxKKjlXUvuyiCJ6MQS4Wiu+zYSfeLTG+DeQ5OVxRbk+g44odKJjLbiqRiUPXEmDfTtn24XLwiDplpOSubbdT/+wHh5HA9Cxy8E7r4zb6euLdF5VnqlIiLNRsoFk5S3qKJ0NpWi2oE3b/x/leEUhjJaYEbsBJHRo5XfFK7zMm7X7STYvFcE2nofrSKmRDB5J6PnEfbZXciVtJdXif/1G2xQuspjn0WhWWcRwbUtKpE+ZvGAROWupz8vN6daQfchpiZ5sTjas0SU62VXNUo7mF/dlrg46HQH3KPgS/5
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0401MB1320;
	20:RbeYnzPfh1qZDAFdCQWVfBXWTTgwIkUjkRa34AX/kF4Yi1245OUtxrwbB8o4wcyVGZplkCOJwP/hwHKAJJR9q8DePi/fWNSWtjplXiJkBH916sv4TgxD/mPi89PTUViFVAliIJ0DvOiU7c8ZDbsQpAFPsrlWhl9wz1maSAgVde8nMzXZ3pqO6vXCTUxiOd+0ogjJLB1MvqNCV7FtUbJh8waoBZSD4fneE73tT7GV+QdL93a1rupp7Uz8TZkQRHiw+Fu7OmgvqKLtJk3FM5nPfimVF1JOfWHXCrH2IfyYdiS1LokqxviSy81unRVJVWnsyMTE1a7QCUFqIEJ5ckbz6gyEvQN+des224Y5QVYW3GGBDW26/zHUKD6RB9PRdZdS+spWf665/1yp1RMa8YY83t/YaDdw0aSSNO3NQ0wndoxNedDJ/J3qipap91Rwz+4blelXduv0sde8CkUNr3eI18LzXss6myUKF+DQhwloT+0qdVsz54/qMkQ/kMtLVjR80IhPa/j70vmebIlQZpq/bY+jqXVLAn0b/ACjjF2imUMw5CArBl622FN+/Beh3MrgP+Yiawov8Srbwkzn3hqWRQGBMaAs+e5/YuNTXTZ8GUU=
X-Microsoft-Antispam-PRVS: <BY1PR0401MB132031C2B3C15EB51728A35086C10@BY1PR0401MB1320.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6041248)(20161123555025)(20161123560025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY1PR0401MB1320; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY1PR0401MB1320; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTFQUjA0MDFNQjEzMjA7NDowRGU0Z3YvVm4xbmNGajBGMElTRHVlYkJG?=
	=?utf-8?B?MlB2Qyt0M0NiMlpKcUxlQ3hKYjdLbzhTNDRObmlzS2N6OVVUeGR3Ui96TlFk?=
	=?utf-8?B?VzBIVjVWbHF6Z2E3ZE5JTWY4OW9XNk5wVFRUd3hlNVN2OURkK1BWbGJVNUUz?=
	=?utf-8?B?KzFqNE85czJVelJDOVFLeVdtY1BmMDNNY1dud1FkaldQMitSMGpVYWM0K3Bo?=
	=?utf-8?B?dWpKSjlNMEU0b1lOQTFDS0wza2RzbkEzUFJjMWZhaU4wekRrVHhsRTZYbEkx?=
	=?utf-8?B?eWhOWGgrNWxSUjdhUFlsVC9wVE1NTkRNMEVtaUtoeDhiczFwUnFtaUV5MWdY?=
	=?utf-8?B?UnZUZktDc0QyT0NXYmcxM2c3TU9yR2xOSi9JcnozdmdnY2hVdjkrMEwrKzM4?=
	=?utf-8?B?THAzUkh0Zm5sLzlMaThDRVVwM2pkOTNQclpRK0tybnJOQUc1QjE2L05DMEww?=
	=?utf-8?B?TUFINEJTNnZYaVVnZ01PRjh6WUxzbFRiRXhWQWR1Q3N4a3p0M0tXdFpRak94?=
	=?utf-8?B?eWhuQWlQMzNYamd6OVdvSm1MSjJ0dDdRNFR0SjNOaUNXNDZDb2VRWkNMb2h5?=
	=?utf-8?B?a3J1MTB2eGxMT2EvTzRqQk5Vbm1mZ2tENGIzWTB6ZDVkSFZSNGxidzBKWnZX?=
	=?utf-8?B?cUtTNGpNSEo3UmY3VFlNUlB1M0NERFpOZTZKM1hIcGhNR1FoNXlNNUp6c21q?=
	=?utf-8?B?R2lGTGQrUGI5UWpGRTQyeHd5Nzlidmh3QVdUTm9lRE9STXNmNmJBU2V5bGVj?=
	=?utf-8?B?cW83UzcyWVBtcUlCQzlhVDN4N28zU1J3ZVgreVpldFdYWDVDV2xmcXFjZ1ZX?=
	=?utf-8?B?TXJpd1RNUHYxQ1ExMFNpMjRZU3Z0Ry96M0ozb1A2VmJpZjJoaHc1M3NkQjNj?=
	=?utf-8?B?ckVHWkRsajQ5Ti9EOElya2RMRjB2azFXTVR6QXg3dURjUHZxWnlpL1dDYzUw?=
	=?utf-8?B?eVcxeEtIdWxZdUxzWVhFWjZJa2RON3laL1VxbVRRL0ZLNCtpWGZtVFV5MmV3?=
	=?utf-8?B?UWl5VzVrbUF4dWVFY29vY20rc3Jlc2dYd3FibVNZQ1pFQ0tjallLRDVJMmJx?=
	=?utf-8?B?YnpZVVR2YkVxZ014TkNCWmFkTElaM2YrdkJka0EyMkRNVkRHMU5QcDBHWktu?=
	=?utf-8?B?SjZqaHBmdnZ1TXUwMnZZa2htdElVWXpYNDNXK1VkcXh6d3BsL240V3BYUHdt?=
	=?utf-8?B?aHRGRlNYVURQYXVXRkduUGNLUVBiZHBqSFdCVldPbDZmdUZQUGE1dm5ERjYv?=
	=?utf-8?B?eU8zaUc5MzFvZzhndHFTREE0UjFtUks0UTU0QWlBNGlhelllL1J0U0dtK1FK?=
	=?utf-8?B?QnlVZWZkVENGRFM0Y0NHZ2EyV2RuWW1ENmxxWEwvcmJqREZGaFBBZ25LOEVS?=
	=?utf-8?B?Y1YvQTdLd0M5bFdWYlFHcmZ0TlRlZ2RUUzc2VmhzN2pnTnZVZGFxSjNWVDA2?=
	=?utf-8?B?d0xqTzliUTRpM0NaeEV5aHJXNHAwWkNWdEYvbUZ4V2t0dDVGeTBWQjhMRWpx?=
	=?utf-8?B?ZGRKRUhBSnRwSjBqdEJtVnNYUEJXZnB1OTRVU09QRGtwdForYWtwTjFtRFRV?=
	=?utf-8?B?VkRRblByM3l3Tjd1SCtoUUJFSHlmU1BQUW4ybVZWdmg3WDVjTDFjUjloWEtB?=
	=?utf-8?Q?=3D?=
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(6049001)(39850400002)(39410400002)(39400400002)(39450400003)(39840400002)(377454003)(24454002)(33646002)(4001350100001)(86362001)(38730400002)(305945005)(229853002)(6486002)(110136004)(31686004)(77096006)(31696002)(47776003)(189998001)(23676002)(42186005)(66066001)(83506001)(53936002)(64126003)(81166006)(36756003)(3846002)(90366009)(8676002)(6246003)(230700001)(6916009)(76176999)(2950100002)(6666003)(5660300001)(54356999)(65826007)(50986999)(6116002)(2906002)(478600001)(25786009)(53546009)(50466002)(7736002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0401MB1320; H:[10.0.62.53];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTFQUjA0MDFNQjEzMjA7MjM6L0NLaHA5dDZJZzhyZFZhQXN0S3Mva0FR?=
	=?utf-8?B?TDRWdVhCd2V1L1ZoOEdoV2xwZkhidWlkaUs5V09SWmEwVGt0TmF5WWgrRWxG?=
	=?utf-8?B?aG10QjkvbzlCRGUrSDlCMmhoS0c5OFNJMk9tclp1dDBaRXg5VkkwakFvL3Vy?=
	=?utf-8?B?RkxNNGV3bS9qM0taVTFVYXM5eXRyV0R0VzZnL0JRd2VJSUprczVOZHlobXJ4?=
	=?utf-8?B?WFVJSGw0WVppVGxVK01KbmYvdTFsdklJVXJkdlFyWFk1T2JQRk0yWStCY0Zo?=
	=?utf-8?B?R2cwcjFuTjIzSjVxamk4MGU0c3VOTmY0TjNNRVhBUWFRbUI2RWNyelNpRTRW?=
	=?utf-8?B?b2h1SWpHMHNFK0p6TjlWUGVxVHgzWm52VUxDdUNnMDNteHVOZW1YL0g2UmFZ?=
	=?utf-8?B?QkwvMVpOMmhnQ3dOYlBYUnd2dkRpbHdXZWIzanNvYjVReUZBeHVyY2MzSHZj?=
	=?utf-8?B?NWhlaGREWExRTGduWTNDRWFqYXJERGsyZFFkU0tSQWFYY3pqTkdCYzFhaUo3?=
	=?utf-8?B?YStZbkxLdXNIR0xSUS9VQjdDOGl2UE1LTlQwVmhmWElDOFZJNnVrazJpKzY1?=
	=?utf-8?B?SW9jcUllVGJYeU11di9IN3g5cm9RUDJvVk5SL0RNbFpuTUtQQUxCcHF0dFZU?=
	=?utf-8?B?Mk03eGxSTmJYUWVJWGJGNE8zL2UyekdRb01KSVZsdzdUYXh3akJJakVRNGd2?=
	=?utf-8?B?V09pOVNjcUoydWVFS0xYUEcrYXVwdDI4WnhLZDNacCtmM0NTb2l6SnhWQXA3?=
	=?utf-8?B?citBbW9xTW9UWWNtZXBhbjRNL2pNU3FuaUwzMVg5eXM1UExmMmcxQlFXMnBL?=
	=?utf-8?B?d2xFRVNlOWJNcDlBczJ4SXBucXNmUks1R0tBclNETmpKOTlwYTR0aVRZajg4?=
	=?utf-8?B?QWFGdW5sMEU0MXV6RE8xUEVGNFRNZVllTHVRTVdLWVBPNHYzY2p2OERZZmJ6?=
	=?utf-8?B?aXh0YmNZcnd1OXJ4S2F5MXFjaHNSb2ZHOTBia0gwWnFLOUpiTmZNVDNXRlFL?=
	=?utf-8?B?RWp6ajFET204c3l4YjVVcjRRT0hyem5ENkNQQ0RmczNJOW9ubVF2cmh4aXVX?=
	=?utf-8?B?d2MwRnVudStTZ0xUSXV0UGxiT0xoTEd5TmNGZjc0V3lKeGF0ejFzMTdmSEVO?=
	=?utf-8?B?WVhxYW9MTEJuOWRXaUlqWVo4QUphRVlqTHBGKzV2M0ZFZms1eUdnckVGbzNE?=
	=?utf-8?B?MXYyNG5XVWVMZm9MRWhPQjREM0lKek1oenc3N0RQUjBmTktyeGVvTWZrSVVQ?=
	=?utf-8?B?UUVOaDhxcm50KzFUYVM4TklZbjloRmxPb1J0aXZrL3NaVEh4Q1FZWWpFKzFG?=
	=?utf-8?B?UWV1TUpwRDg0MVVMR285OTM5ZzJYTnpGMkZiamh1ZmZlNzRhcitYeGVaN0ZV?=
	=?utf-8?B?bGRVN3RPMk5BZG9GWTFOc0c2TURhM1RlT1JDN2J2Y2RQVG54NGxYSkRiWTk5?=
	=?utf-8?B?cXMrRE1Pc20wZVkwcjY4SlhnaXlrZWtmbFJ3NUlxUDlmU2RMUU16aUlkbXl5?=
	=?utf-8?B?MlZkNUVWRmhCNE13M2hlNVo4WlFENE5CWkNVSytJRm5ra05rdzNVUGJkcHpl?=
	=?utf-8?B?QUVjOGQ0bHdmUkdBMW1iZGFnTW9mTGw3SUVDUHZXWjhvQU5FeCtuZXhaSUxC?=
	=?utf-8?B?OGR5ZTVKWllXV3JsL2k2cVp3QldvQUk1ZWlLa0tUbUJoRktVbzYzSVRzU25X?=
	=?utf-8?B?MHFLWmFmR1ArN2JvNzRXL1o3bXJLQjhOYllhN0FsSXVTM0tHK3RpSG5hZTln?=
	=?utf-8?B?MDVrWFA5STQwSTBiY2VQbFZBPT0=?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTFQUjA0MDFNQjEzMjA7NjphejlEWnZCbWlxS2dISzBFdFJ6b2NMVHVU?=
	=?utf-8?B?RW5DU0ovSXE2ZVY5QlZYRDE3cTJFUWViUUpVa0FFV21ETGRzL0puQzMzM2N4?=
	=?utf-8?B?emN6ckdwTVFaVzlTSFg0TEJvdG5kbitxOWYxazBUZDFQOGJMYTZFUzQreDlw?=
	=?utf-8?B?M2xUQkN1c3ZJYUYxUnBWSlZna0dlWTlrY1k1c0I1dVRFTWpYWDFWbnltZFMr?=
	=?utf-8?B?UTdFV2cvT01Gb2pZNlBBczRIVCsrdEMweFB6M1I1enk3K2NEK2pHVkRqRGNN?=
	=?utf-8?B?OW9YQVpuTUNLWmRMZFVJWkNpU3NQcWdpb0hQMWZseUt4Q3JDVjMxZzZvMjMw?=
	=?utf-8?B?QzhmVHNobSttaFZpQ2hnVGdnZGRxcnp4S0JwWExFT3c4OEFjeUFyaVRtcHpk?=
	=?utf-8?B?cnl5UitSVThraThkNjlCZDdGcW4wSGUvNHVDcCtUWDQvNU5QUVRNbWFkNVNI?=
	=?utf-8?B?YXNOVVdSVkhoM29OY1lJd1lrMEFVS2dkZWdrcWVkOUhQVFViaXhXYmVWQlhE?=
	=?utf-8?B?ZVNnZlNER0RRRURSVExjVmNHYzR4ZkJwQXdjNytUb0x1dnhUNVNBWFVWaGRF?=
	=?utf-8?B?K0pLZzJMUlpreGF6WmZHNlIxdUNQeGhyQlZkd1BmWTAybkgvMkIvOWJKR0p3?=
	=?utf-8?B?OUp2YUVXSU9odVloa05iNzJtelZFcUh5bU9KWG9sOEN0bk5oOXcxL3ppWEp5?=
	=?utf-8?B?ckFGaWRqVWg3L0taR3ZDQlZaVEU5WDgzajNmcnNRcDFERmFGREMraWExclcr?=
	=?utf-8?B?T1V1UjdmRDIwR2EyenE4bGxQb0loN04wSTRmZys1OE02V2RxN01lZUNMT1V6?=
	=?utf-8?B?Y3NsUkx5OWorOS9EbjVvRnIzSnBZWm52UHpUTkNrYjN2WVB4NUcwVkM3a2tz?=
	=?utf-8?B?YlM3UFNXcFNxalhMVXlmVVZxOTdYa1JvbTc4N0h3Y0U3bXlXd2E1azhOVDdI?=
	=?utf-8?B?YVlMTXFXeUNhQzJFVEVjMzNXd3hlU2d5bHJDNFRGRGs4eVVSeXkwWmZYVmQ2?=
	=?utf-8?B?RW5ITjhraGhabjZxV0lUZ3R4VXdMT090dFJNSzU0N3R0aDJUUTZyRjUxN0NY?=
	=?utf-8?B?SUNCcG1XaHdlZnlxT3dVWnFGaXh4eHExRlhzRko0dVZYOEp4Z2dCeWlkMDVD?=
	=?utf-8?B?OENteGQ5SHVZZnZqelNoWGNxeFNYODhmUzdGcVRYWmcvdEEzMFB2RVpLU2ll?=
	=?utf-8?B?YVlha09xNjJOU3V1LzRnbklwdVVEMXdHQWU3VUZwS0VPcHlhcU4yZkh5anho?=
	=?utf-8?B?YXBkZW1DQUlBbWErd1IyNFlOUWgzZG1sdnJ1OS9wcFI3MWZuNEdwVHJnVXdV?=
	=?utf-8?Q?UPvZm2lU2luRdwKzoiCCeeu7ALwplToGo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0401MB1320;
	5:zF8miAlNIO1HNYiHCenw1KDb9pm7JyWgkKnCny4Lg8AGO9vOTKntv25EimbAMIP18GuZJW5vP85z4w2Yy6hWkaxaXKwf42S4s57dY61T5SWHrVetSEWLC3Q7umxGYUwAJ2RmXo/AW/itu4/wh4aUXb5WfpiNBm3NT34vmZw++KJQ/aR3WKP7fYk/vUlYQyFDB29hTfDxlwebfIhvPjfAYEIabd3L6HJKR5ku9IKrNL3N+6OPw1rVMDSfc9/S08qBwm3jYkOHToanZiwzFBIsJ5vbLmYSygAc5GxQdTWD9al63zHmhy0fE0ETdc6+KLs5SIPjFOZ+OVa/Ee0LCqXBqQ+CIouLfznpQmAfUMYU25pR5yqBXIjdRQZf1gnMjw/f+8uOYRnxTGFHAENUc5Rdxvgg1XuE3GUnzIs+GOVemVFZtGMhhO2svpG8A7xHZ2LX+FX1iSDfWONG/0Ue98CeyMHZ04K0H41QPaTO5QU7Gjsc5IxGOcUlDQRu+aEUMcy3;
	24:CdtUfJZ1MExxO5k6sX5dODhk8v9zQ3FtwJKZy1D3JycFK19CdxRGpQb5KMG8aYHgZqFZ2F+WlteLM1kqlmWx/zh3pNFrEF/MD8TwW/awM0M=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0401MB1320;
	7:m8CP+O55Uc8PAxkv096WAfOybBR6Dv6wZ/H7WNMoiVNH9w14BWRqLHA35MK6Y3YueBgiO4z4JaTNihRGuQ1ttTXEsHfO6zzUep2PE/zpnyD03AcCJGIODjl8rNV+qf2CryB2QlgsHeFhiLCPD8cCtTEa1i8f0KkQKKSRElGw4dEz6LkbnNZMeC9we0n65toiqjsKyNvIylv5n+BDtEoyAfpewyY3/S9FXUQAWTXTxAhOiWidRK/D17W133Snno0MT17yo8pE4uKwG4dhKKcW8VuzJXqj4osnKDiAF5F13BIu6refTLjC4jvGKdPdHwgZz4/4p8kFscLTOrBMq7Cln7H0TJr47edTnWcVnFeZPOv3alvu9pXbd8nW7vaHbViymwm1LO5cmeqJRxP60WxZGasx/YOmM1r4o5a6tYEzPRRd2NHpk7Gw2dYqc5+pmes4lksnUkQAsh0gOW0q8XFCXu4g7wclDkBOqewNt9kfO4ankq6We25Wh/0ETLnZ/1A+34kNPfBiDPomy2tXRdbIwVHkBHf7UoW2rOXJ4yzAfjR0PhzF38Ik6AVdIP/BP5Rr9l8JCb1q90YgWwivNqwhn3vGr+xLzEXkJ+J1MBFRkRx5C07SqCwKEBNbmsPQaHs9oFyDFm/Z7fVajCye9eKxE4PQujWjvup/7EK3ijis26OWM5WaT1KtuXdhJl7z8K1aUCarofcKReqKo8SKLf0xWYiAFKMfmFENqbubQRHV4pFr2nyzy25lJjJGHVmItercRVmOtjDJC0KLYdkWNJVAYnlQma/Ngl2nMUTSjxvDWlk=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2017 15:12:32.6968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0401MB1320
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706160250
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg-utils: bump PV to 0.3.5
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
X-List-Received-Date: Fri, 16 Jun 2017 15:42:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 06/16/2017 06:21 AM, Burton, Ross wrote:
> 
> On 16 June 2017 at 00:17, Alejandro del Castillo
> <alejandro.delcastillo@ni.com <mailto:alejandro.delcastillo@ni.com>> wrote:
> 
>      SRCREV = "1a708fd73d10c2b7677dd4cc4e017746ebbb9166"
>     -PV = "0.3.4+git${SRCPV}"
>     +PV = "0.3.5+git${SRCPV}"
> 
> 
> As Martin said you're missing a srcrev bump.
> 
> Also if you're just tracking the release SHA, then for simplicity you
> can rename the recipe to opkg-utils_0.3.5 and just have the SRCREV set. 
> No need for a SHA in PV if it's the 0.3.5 tag.

On commit d6b04e12127dd65b96ac7f4509b829510ef21071 the SRCREV was moved
to the rev that eventually became 0.3.5. In this change I am making the
PV match that, since I just tagged the 0.3.5 opkg-utils release.

But you are right...now that I am tagging releases I should probably
rename the recipe. I'll send a V2 with the rename.

-- 
Cheers,

Alejandro

