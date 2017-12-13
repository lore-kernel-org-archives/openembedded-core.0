Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 649847887D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 19:40:05 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vBDJad2C011429; Wed, 13 Dec 2017 13:40:05 -0600
Received: from nam03-by2-obe.outbound.protection.outlook.com
	(mail-by2nam03lp0052.outbound.protection.outlook.com [216.32.180.52])
	by mx0b-00010702.pphosted.com with ESMTP id 2eu9wvg4ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2017 13:40:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=nv767K36sGeYWr1cAFnX7rw7R99eXRW+kBe7b0o1S30=;
	b=JvTZ6nDy3whFDn7tNmdvpsZQOAsv8dYSHrWQSdmmSch5O/D2xWGxeApK1rS41hbFd2OcbqHkggrk9w3JASyWVIIlxYXW2z2eBEYHnTJZIebi/HbE+lc5lSG+MGsyyFTiNdhf1o+0+61DNQ5v4/q39N48txTocBsPFpZcYC9ENaY=
Received: from harisdt.amer.corp.natinst.com (130.164.62.150) by
	DM5PR04MB0700.namprd04.prod.outlook.com (10.172.187.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.9; Wed, 13 Dec 2017 19:40:02 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <1500479806.27323.202.camel@intel.com>
	<20171107184039.31164-1-haris.okanovic@ni.com>
	<1510179606.1903.92.camel@intel.com>
	<f65277d0-e056-5181-9cc9-1e78e4e97c6b@ni.com>
	<CAJTo0LaZ7cQFyvMazuZ9PAFMdFgptBHovLBpsHsBmQbmo+19qw@mail.gmail.com>
	<47b7ee7a-938e-a893-10ba-f766a3f16060@ni.com>
	<CAJTo0LZ-vib0jUNyZP7Eaf9SrtJkQ4fiof9PdzOrR16kqJ_hsw@mail.gmail.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <5814e01d-2bb0-2cec-3110-8ec88a180d7c@ni.com>
Date: Wed, 13 Dec 2017 13:39:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ-vib0jUNyZP7Eaf9SrtJkQ4fiof9PdzOrR16kqJ_hsw@mail.gmail.com>
X-Originating-IP: [130.164.62.150]
X-ClientProxiedBy: MWHPR2201CA0056.namprd22.prod.outlook.com (10.172.59.30) To
	DM5PR04MB0700.namprd04.prod.outlook.com (10.172.187.142)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ff5fd55-09ba-4ace-784e-08d542614e32
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307);
	SRVR:DM5PR04MB0700; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0700;
	3:wwjV3/ska3/wibcyOl575QS/0DqBLiXE1RYEBpijo4VlNVo4wOIWrGeoX+3DInMl+WQnfiZNjiryCN/BoW2C9bb5YE6MYzhFc1O6/xFz7VerJgQpiCJx9fKIKfpGoijo+DsXvdH66MSanJMB6tMV/gWOKPNZXoh5yUKHatz/VE72t9RmnXPURfngEtyqRHzQ98+2YGBcN1eOTZhvwax/69W/Wx1IqRKFVJdcWNrC6JqVJWQYddC3he98aFY5iHWz;
	25:UPf8HweP7y920hUbbmwbkZ73Esi6LKfCTN7S91B3vXyMZH6tkp5CtdrJuOReKrepGkoGfjk2gyJZ5icYzWvbI8Nf2Z9957ap5ErcM6dMn9SfcwF+kPYv8EeS3Qt0oYQPpmqcQ8yxLkdYC57T5sIOTS7do6rBLw5Gnh9PiIJwj2rvdgOX5REuHWN/5dC3VOPHdeQSLk1q1wwtPkRmbh8fp1FD5kxI4p8bXNgzX8nnriVo8y8nEay/4b6opYcG8VOvNK7B7I4QM0EHrPUADUO8ise+E0UlnEQIK3PLJJDjnV5VYgt6kDApP4tmlEHG51KPZrQIrxHO7LB662PkH+JtjA==;
	31:N0qx6oqnj1QXwgO+PyzZfJMOJW3zUhcaTtYcXmTRnSeL/XhLVAzLap7SQ1/1AEfcRBJ3HlgkRhPqguhuIvaSMna+Q5OswTkB9bT6apgUFbEiiZujPFMfT0uKknA6c0xAdCDHaa7VBb/iyoEwiAdkE8dakHYpCXHN3+jcJU2hm8N4pIxrzLihxTl1Nrxc95HIk+SPH5DdqkHkTQlBK5YPMkexSn9e8PPAHb/D02GaUc4=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0700:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0700;
	20:12E/OYXQYxDgF/vouxswh8+rCApnnrXL7Rzi5aV6K1opJNwA5df108I/K5Y7Ye3E5gGR27rtGR4beHG/7wTuqawM6/0o+lJfB0rbPXAUKm2OM4J1iai1zn9F7zUscoetce22bjB91NMJq+N4vVgNx0bcqlqzVo/uxjE7Oy10dZky+kDuJJmwvMUywl966DTR55WB4TiW4i0DokqTtzQd605J+WfAZDpCDE9fg04oPDnvwM7cT/LnODyQmtRzKz7eL2LElfc4o2EFQ3mKU4sMcG6ZxnGJ4MLG4qFEkiCt3fnDeGNwu+J9zAWbJ3eSZtUPI4vmd4XaSUKfF1o55qDoS50ixlPALSvOOfRCG5ocGqzXwkNywAvRkThANK2keci/rHCdROVtYCAAS/gOUaVnXdJRZVZY+/S7M2Gb04BrduX14YdxTcS+71Tiun4UnlvuTwCVpwZc1lYesOfWESJe3SuqZxJRSiSetlYsdsCzZxuQRROiYujtPoNm6wPabIcFMx5EDfQdYN8geLX+DPhvJ24XumgAZCqzWHqpUHtOhnhzeyV5/W+dKUlwRA9nfRKcNNUA2cEjQxDRWzBKG9yhkeZ3eSxMs3ejBh5+UCu0+QM=;
	4:+xMbKSK5bZcYlllSJm7tIktZjXwKWIcOaMiLBWqQIglKN0W/8++tXR5AV2QxHYlUxWn9ed6TP6yRSK0lvG5Locc/OMIwcOmtY4hWstkAF5dugjtAjOEgZ6/LxrfggFpSuqpU25J2H6Sad7D4kvUnFKuOxZqkbBYR7espM3V8S6mwuZjFYH85mQ8ro6RsrTFMUuq/UnJOOLNL/+vhONEWJ5z/OUpM+RfBQfJ+CGW4rD1f8ixWHCEYXczF5dk2TjOTlZ+tFmqnii5QjCwTGoK7SnAOFJy1RBNAyzK2E8+yjDbSMzP2+WUPua1kIvB5Cjni
X-Microsoft-Antispam-PRVS: <DM5PR04MB070090DA3F1A2C983101C25EE5350@DM5PR04MB0700.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231023)(93006095)(93001095)(6041248)(20161123564025)(20161123555025)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(201708071742011);
	SRVR:DM5PR04MB0700; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM5PR04MB0700; 
X-Forefront-PRVS: 052017CAF1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(39860400002)(346002)(51714002)(199004)(377424004)(24454002)(189003)(316002)(229853002)(83506002)(6246003)(2486003)(4001150100001)(478600001)(5660300001)(68736007)(6666003)(6916009)(2906002)(86362001)(52146003)(386003)(67846002)(6506007)(3846002)(47776003)(23676004)(76176011)(2870700001)(6512007)(93886005)(31696002)(52116002)(54906003)(25786009)(8936002)(8676002)(4326008)(305945005)(53936002)(106356001)(105586002)(31686004)(50466002)(6486002)(66066001)(7736002)(16526018)(65826007)(81156014)(36756003)(97736004)(65806001)(65956001)(81166006)(58126008)(6116002)(2950100002)(64126003)(53546011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0700;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjA0TUIwNzAwOzIzOjFQS3hCQncwUVlMdDRhMDA0OUJTZDF1L1BP?=
	=?utf-8?B?aXdqR1hyVlNiMkpaK2tzWlZ5dkJTRHhTNXk1TEJtUldQd0NhZWs0VmYydUdh?=
	=?utf-8?B?MmN2aERpMFZJL1QyN0t4cnZIM2h6dnNrNUhFYjd5ZXYzaFo4YnllWWZDSjNM?=
	=?utf-8?B?SzA1OFJSME5rcURWakNoa0F4MXFXWDlJYzE5Ui9RTkJEc2IxVUpOREQxQTFj?=
	=?utf-8?B?T2JJd2hkSUIxT3lTYVdlcTBtQ1ZsVUZscllzTTA0OThDaVpDR0x5SmJOUFFm?=
	=?utf-8?B?Zkh4WDhkbGNuVFVaVGQ5SmRJQTRsTkVLN2sraE43SHdjZ2FTVk9CSGlrbXlW?=
	=?utf-8?B?MVVnOXBhTnVrdlk2ZDhLUDJmWGlTSEFMdUs3R0tTZUhJRGVtNG83Y0tlM0VM?=
	=?utf-8?B?Tmg1WEt2RjlleXE0TVJXYzVqSXVYTW42dW0zRXdnSmJ1VFVaT2Y2TWJMY2hK?=
	=?utf-8?B?Q0NzenR5dDlNcTRNTVVtSW5DQllrU05kY0h5OXdCNzcvSFVOYnM2THlKVU9C?=
	=?utf-8?B?d3NOeWpPNUxXcTlSRGkySmMvWS8vWjBnZU5ibUFSTlhYSjI1SENOSHIzbk1w?=
	=?utf-8?B?cE5LVGN3TTl1aVNMeHNLb1JrcllyU2RVOHRlWDlWMkxtTEsvWUhab3JvSW5C?=
	=?utf-8?B?RDNWMzc2a3pFWnh3ejVpYjNtMjdJdUh0QW9wWWg2Vldqc3BxY3daMU5DdDI3?=
	=?utf-8?B?L2xZMlVQL3hIV0FSYkN2dmdxL0hIckNjRExWMlFMWXhpSC9wdndKY0h3UmFo?=
	=?utf-8?B?LzdpVnpCSkhrQWt0V0RuMlllRjdMUk9ocDJYaVpkWU1oZzA2SHlkODRXbVB6?=
	=?utf-8?B?QlJ2YlF3aGVGR2dWTkRyVGRrR1Jic3BuQUhQMnd1VytFbURuVHc1RHJPcXRR?=
	=?utf-8?B?bm0zMGExTE1kWUhDVlF0azIySHJGYUt5UExoM3RyL2laR0JjeUdEWFJ2N3FS?=
	=?utf-8?B?cFR0WGdQenlOQ2JSY0Y1VG51VWJWb3dSOWNUMk92VzVMYWtlb2FvbTNrWkhG?=
	=?utf-8?B?QmF1Yk9XblYwemFXNWdTWjduWWM0Q280NDVVRlJLREVxaXQzZDhKZG9RL2Q5?=
	=?utf-8?B?QlVYTjVtRjlKTStqeHVIN2xmZTdyTGRrVzJEaFE2T1VZcU5JaTY2ejVBcWgy?=
	=?utf-8?B?eEE1RVFQVFQwcFRvSW0rWk5jSHM0bjlDaUg1eHZoOGt3MGFNWUsyVDF5UzFE?=
	=?utf-8?B?T29oM25qRWtGWEd6MEtmK1BaSk5iNk1oNjVqKzlheEU5YUpHRU9RL2hoM0hO?=
	=?utf-8?B?cUtiVTZ5WldiNUFlNjdIRW9wUHRMR3hXRmdYL2xUdzloT3FpTFFGQWJoeVZE?=
	=?utf-8?B?aXdVU1hTVGl1T3ZGaUhZV1NwVXZicWNRaDJEcEswbHVpSnRNNm5jUmhrSk5J?=
	=?utf-8?B?d2pGd1BOekJwdFM5cnpJTUluSW5MSVkvYVZWWDFlNG52Q0Fod1l1UVUvL3Zk?=
	=?utf-8?B?aFhxVUhFZ08xVlFoOEZKTFpKcWFhYmU3Q0JoMnpUc0h4NmtuN0I3VUVLWGdP?=
	=?utf-8?B?VUJ6ZGtRZHlHMHpqY2kzT2ZaallUcnlIYng1ZHcyU0V5bVFvWHo0Y0VLTHJl?=
	=?utf-8?B?a244UlNuck8vQWNGbElRR0RTbTcrcjRCVmMxM2Z4eVJ0YkVxKzFhU0haZDAx?=
	=?utf-8?B?YW9Yckx1SWIxZEJhdWJGQ1VHTDd0b2t3L3UvQnVUdjBoSTA2VCtGS1dQYVB4?=
	=?utf-8?B?NHB2OHp1b3ZzbFhXZUZwelpia2JoTDlYdlI5b3o5MC9Ca085N2hZS1YyUDZE?=
	=?utf-8?B?SUVrVk10NWVORVlkQ0IrU1MxSzFBaC9qM25uYnZUSGFxQmJ3WWUrQlVjME10?=
	=?utf-8?B?VmcvUXI3NC9NMFg0Tk5FdVhkSFlMUnU1QUVNNUtZOUgxNVlqaVFqV09IM1Ri?=
	=?utf-8?B?b1BzYWZmWnh3cTlzcjJaS1hxc3hLbWl2bzJCUENYbk9LMTVuQUxUVThoN3NP?=
	=?utf-8?B?RzNCOTZzeVl3PT0=?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0700;
	6:v1hz9//Wke/XZg4Rrl/PGOgZckpQbVBWD0Jq74PbbfV0UIDsNtB2rZX3jpF2dAdDOVsJ2Azt8HeC1Cqk6iS6Tp/kK+yNd6vqsXd30vmqiybWu+mueZaKGxAK0C2xikMwgAibSLaxpQMFQSEckOyu4aFdzDzvaMl/M7YGma9lEeUOq8QHNc8P2OeOaONuWZNecWCwbtvI7O0MylZFDRSZmIRyBw0ilYQ02xQn1JHkinIHBlPGWUExQfPii28vI+BPhnpzbSrAtXldVq2k1fuzhlh0Q4+usTpkQiVHymWfTIW1r5jo+5eMB++ipQD9gCWC5YKikgeNki3vo5orIKlRYMiOY1P9DxtZZBtoD7O9WNE=;
	5:WbeatdJU/yJw3iMn6nSmlGfmmXcM02Vc6p8qXcoZOyT+VNuG2+eJs5cYfZ/t3gkA8l1dGvvS0qhktYJByzqsGGLiQAc67Xg8N3il+41yw+6oMqT7IlquXuIT0wl3y/FMdlRmAudfGUiMN5a+0fVghF/VY8a2xtiy4nGD2GnMrgo=;
	24:iW2mZ8pNsgU317LMawGFBxoHuV5x8tVPpOtu9CH2jV58dLZhVyV2DRS7vwAt6VP9JnNwVSMouGdYK6XgzmLDDLZY/jO+9XuswwfEywGPasw=;
	7:m0mObS8xebYeojqza4C/Ym7wCyCBGQIJ7+Me0lQjU24Xz2vw7xrnUbwNNhuqWqg3lKex7KVKt70idK/yqkmgDC//qG8/xzBpiXjVLsvokZIoTrykodDConVIo1JNRMEDH0WtduzWJU9UDPqNJoi8BcXc6pwBjIGaxbXn7h4G5ZGdtn+hIpkdc0fN1upYYFXCLGjN5GERy7pDk/mwfU5m0meRquzRqrQRXVdbwJgBdt0d88qOF20dbNoJMAQXesuZ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2017 19:40:02.4297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff5fd55-09ba-4ace-784e-08d542614e32
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0700
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-12-13_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1712130272
Cc: "Ashfield, Bruce \(Wind River\)" <bruce.ashfield@windriver.com>,
	"josh.hernstrom@ni.com" <josh.hernstrom@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH v9] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Wed, 13 Dec 2017 19:40:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I rebased the patch to latest master (openembedded-core commit cf5c44ac) 
and still can't reproduce what you're seeing. I can see a /boot/bzImage 
symlink in both buildHistory [1] and the IPK [2].

Are you using the same source? It seems like your kernel version is 
4.12.16 but linux-yocto is at 4.12.14 in master.

Could you send me the output of `bitbake -e virtual/kernel`? The only 
case where /boot/bzImage should be missing is when 
"${KERNEL_PACKAGE_NAME}" != "kernel". Search for an `ln -sf ...` call in 
kernel_do_install() to see the logic.

[1]
> $ cat buildhistory/packages/qemux86-oe-linux/linux-yocto/kernel-image-bzimage/files-in-package.txt 
> drwxr-xr-x root       root             4096 ./boot
> -rw-r--r-- root       root          7016320 ./boot/bzImage-4.12.14-yocto-standard
> lrwxrwxrwx root       root               30 ./boot/bzImage -> bzImage-4.12.14-yocto-standard

[2]
> $ tar -tvf data.tar.gz 
> drwxrwxrwx root/root         0 2017-12-13 13:34 ./
> drwxr-xr-x root/root         0 2017-12-13 13:34 ./boot/
> lrwxrwxrwx root/root         0 2017-12-13 13:34 ./boot/bzImage -> bzImage-4.12.14-yocto-standard
> -rw-r--r-- root/root   7016320 2017-12-13 13:33 ./boot/bzImage-4.12.14-yocto-standard

-- Haris


On 12/13/2017 06:31 AM, Burton, Ross wrote:
> On 12 December 2017 at 22:19, Haris Okanovic <haris.okanovic@ni.com 
> <mailto:haris.okanovic@ni.com>> wrote:
> 
>     I can see a reference to "/boot/bzImage" in both buildhistory and
>     tmp-glibc/work/.../pkgdata [1] after running a clean rebuild of
>     virtual/kernel [2].
> 
>     [1] file paths:
> 
>     "buildhistory/packages/qemux86-oe-linux/linux-yocto/kernel-image-bzimage/files-in-package.txt"
> 
>     "tmp-glibc/work/qemux86-oe-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_16de014967-r0/pkgdata/runtime/kernel-image-bzimage"
> 
>     [2] clean rebuild command:
>       bitbake -c cleanall virtual/kernel
>       bitbake virtual/kernel
> 
>     Which file are you diffing? Could you share the full path?
> 
> 
> If I build a qemux86 virtual/kernel without and with this patch and then 
> run buildhistory-diff:
> 
> packages/qemux86-poky-linux/linux-yocto/kernel-image-bzimage: FILELIST: 
> removed "/boot/bzImage"
> packages/qemux86-poky-linux/linux-yocto/kernel-image-bzimage: PKGSIZE 
> changed from 7020062 to 7020032 (0%)
> 
> kernel-image-bzimage contains /boot/bzImage-4.12.16-yocto-standard but 
> not the /boot/bzImage symlink:
> 
> $ cat 
> buildhistory/packages/qemux86-poky-linux/linux-yocto/kernel-image-bzimage/files-in-package.txt
> drwxr-xr-x root       root               60 ./boot
> -rw-r--r-- root       root          7020032 
> ./boot/bzImage-4.12.16-yocto-standard
> 
> Ross

