Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0056.outbound.protection.outlook.com [104.47.33.56])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1C8799C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KtzebMF0fDtGSKvJG3S4oUW47EKeAPNDDH4qYKsIrFo=;
	b=4LFD14QKBLkWQiDPFLxyrH+R/EBmBWIY5s1f3LJK5cyfhaTfnhQGBdTAU0oE/b8fAISGfhepasH+0cWhou9uu9Hswn9b/OAHd1G+ygLFx51Vrflj1PVelR0b6oROzvx+a2KP8b6Jac37WHxOfUjWYJBTnX1/80rG01G1g9kxUyY=
Received: from SN4PR0201CA0007.namprd02.prod.outlook.com
	(2603:10b6:803:2b::17) by BL0PR02MB4753.namprd02.prod.outlook.com
	(2603:10b6:208:5d::10) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1122.18;
	Fri, 14 Sep 2018 16:48:42 +0000
Received: from BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by SN4PR0201CA0007.outlook.office365.com
	(2603:10b6:803:2b::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1122.16 via
	Frontend Transport; Fri, 14 Sep 2018 16:48:41 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT007.mail.protection.outlook.com (10.152.77.46) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1143.14
	via Frontend Transport; Fri, 14 Sep 2018 16:48:41 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g0rGq-0004Kf-QU; Fri, 14 Sep 2018 09:48:40 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g0rGl-0004Fj-N0; Fri, 14 Sep 2018 09:48:35 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8EGmSE0001343; Fri, 14 Sep 2018 09:48:28 -0700
Received: from [10.23.119.150] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1g0rGe-0004Ev-DN; Fri, 14 Sep 2018 09:48:28 -0700
To: Andrew Geissler <geissonator@gmail.com>, <ross.burton@intel.com>
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
	<CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
	<CAJTo0LYBrnBuL-jTw6cDXf6qztp8H5YpphBgsrrUyUuaQ-KoyA@mail.gmail.com>
	<CALLMt=pHOQHswPeLF-rWpA2QXmtkL8Hc9RKav_j6tF1MuozVoA@mail.gmail.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <23294a6c-88cc-9f11-5d5f-67b1ce8906b9@xilinx.com>
Date: Fri, 14 Sep 2018 09:48:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CALLMt=pHOQHswPeLF-rWpA2QXmtkL8Hc9RKav_j6tF1MuozVoA@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(396003)(136003)(39860400002)(346002)(2980300002)(438002)(199004)(189003)(126002)(186003)(65826007)(5660300001)(8676002)(50466002)(106466001)(93886005)(64126003)(31686004)(63266004)(36756003)(6306002)(65806001)(6246003)(966005)(2906002)(36386004)(316002)(2486003)(230700001)(426003)(446003)(76176011)(2616005)(11346002)(39060400002)(14444005)(31696002)(54906003)(486006)(47776003)(9786002)(81166006)(3260700006)(476003)(53546011)(4326008)(6346003)(106002)(26005)(110136005)(23676004)(67846002)(356003)(77096007)(478600001)(107886003)(336012)(65956001)(58126008)(305945005)(81156014)(229853002)(8936002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4753; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT007;
	1:OgDzzoocCk7dFAmcL85D9+Ry/iS9RDBYR6T/Vr+gb/3MS221AZt7zFrDryqEGrwqPTiHd12/pM/WfwhLUG1M1zf5cBZfUrXNLWihbZovrnIJEvbVJZgfGyHZ+gjeOnzX
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 933c6ab1-df8f-4a3a-f4e3-08d61a61ed69
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BL0PR02MB4753; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4753;
	3:UgmvJnpr9BVHDTke2NGAmYGQA/LDIUxW6hlILhQKJyLrVRjQyCdifyKAI2tWe7JrJsHBZLhc9g1i6UoWyRwUD7yDIjrKTgFoa5Afo/nImophPPGviLpNrnC26OBo7fj8SON7J5cH58/+OkYLTo+wYC0VKx8kTusF+JGkc6OW6S34VdoF8KVZydMUE84AL/xubOwM7k6DJzjS+HptoOQaDjD2Ruirp3QB+VpSrlXoKlTjAisoIt7IiKtzK+oHuQRuBJdWVAful7sC1F5uJVUIqdJ+70lnxRtVbFRziXmNnF4GbMKbIkUhI8S0VOdOHSNBVC5WHbKFrogF6uZkHU1ToVlNlY0kNk3wp6+17nku55s=;
	25:aPqdFu/2KJavc1PTnckoWbixVvq53a4vXX2tFmk2ZkmCGRDmwLq5DQhIsV8fV9lt38sERtPCmxAl92cYKgHGbA0aBNoQ8/vSPaxoq/7p/IQvzu5utPuu+AI55XdxDqqwaKp+xqmvQqNsvA5JAlGz7+cjib5zBeG6FJr3rGGtaJ92rzsS5ZVpdlBLoeuwE95CN53TC4WgkHHFtY10FfAOXEei6+HRycOHuVD0BPH/8Id4LGovlF2uZcYP+ZrrFkGp0i/jESu+ORmPDd66A7L0Y7PrcgmFOUCNCthpDCVMbUzDZDKP0TgaeT5YPrvkFVcAzoKJX/zbnm5nzQfu6DgkPw==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4753:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4753;
	31:VyT2vsCfWLziv9/nmzH2iHGy3C4hVyZ+n2q8w0vRUnZgE1R7sjX45q1kHhBqBzyU6DhslrQbNqytl/NcNgy1U6K94msiP2SJ8n+bgrMH0bfhNHo5KjU8HGignpXuCpwZAYV4uimj7QqTkna2T0f3sNYfauBW7gPxVTb9Zmj9o4+TQEaB/rgjb6dXHhTUyuu5K4m0wTuZoR27SfCqCU4RceYE/oE3KR5MLnsKE/Fh7tQ=;
	20:z5ASMMcS7cUOcEoMXx5dxDf8KXSnZKY9syaCg++spa2aJgT27Tj+oD2XUee+PubvsNp9LoicY3rqhAaFjWFOR7Gn/+9khLpJDCwY+I1mnkOAVSYO1aAERv8biid4RKo9X/WZk5FQXAAx57PYy1NJCM3u1VPjCdl6pBGxX+xOE/uRSIGIUiyAomApjfFkS5MH4yC0qB8ilPr9HY9JV431lWnC35Vkn4rkBWlRtAS73yK7NoFsofdugPRU4sr93UMeiuSgSVMoSotfHJFgVBZ8MiirIZS3U5htuk4cUvBhw0C/bswgb7gO8zNsJaLgL95HWOu/wvJeMV/3D3QCWjFsV3n+UVe/GrSIC/qgP6K9ekhzmPRXSLp440uZUPeumUDyyyu866J2isAZWcf0jrNWaDYY0WRaK5LKDJG4IFYulJaTGd/Z0+4Z5rr8BsNmcCm12nC+w5Q50amXnWggTet8ZpZpm1d7WkVsaNfsgUUORbTQJ5mXK8WbkLse2T785v4i
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB4753A15FCB7A483D0311C412AC190@BL0PR02MB4753.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(3231344)(944501410)(52105095)(3002001)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699050)(76991041);
	SRVR:BL0PR02MB4753; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4753; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4753;
	4:WHVf07UkSzGeooGI+M4tGg41vzNuMAdeJtDq+l7q5OFdblEhkTdYRwAa2jceKuma5ctfrpaVv3/34EWUWi4b3lkQKcu0Nj53Ib7aYxblr2oMN8+PPlwUQa0maGZWr6kr55KVjAD07T1JcVd3jIUipXUucbQV6wMLAye/I5r32PhTB5B7UtXEmQPdYCu9FU7a7hRkLSuRHFZ0437e1yFCOaTddSQ/ZoUROZ5OrHizM2u66d2EU+bbj+XfcJu9TT9TcaV3SkLzfQzJhqC6bprMu7arsxe9DC/6jcjkLhxpiyCaswkiTneilFOeupMmX+qn
X-Forefront-PRVS: 07954CC105
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDBQUjAyTUI0NzUzOzIzOk13N2JManVsTEJ4b0ZuQUcwOGxmck9mKytO?=
	=?utf-8?B?SDYwblpTTHRKeWp2MGFsLzI0Uk5JV0lEaE82Qy9kRUxTM2tVRk9ndHFMSjgx?=
	=?utf-8?B?aXpyaytNUXJzV0lCTFczbHdqZHhDSkRweTR3SGptd2hxZWNLWUVyVS91aWxJ?=
	=?utf-8?B?L0tzS2VBNGozRjczSEZ6VGpkWWxXWUZHamxkcng4eHh6UFhZaTNzbXlKcE5P?=
	=?utf-8?B?OTVlbnlXL2d6UzBtZlBoVnNJcGgvd0lGbmhYWTgzTHdLVmI4aVRPZWN2SjF0?=
	=?utf-8?B?ZGdHeDQ5L2xobm1kRGZzb2s3OWFWOTR3RUx0Y2U3VjdpTVV0ZVRDT2pHdy8r?=
	=?utf-8?B?c2ExTkJobGZjZzBLWHhSMnpqZnZPLytEUnl4SHRNcVVUMnRzTGYwbDd6WU9k?=
	=?utf-8?B?ZERlWkFBK0lHOEpybTBHZ1B1ZC9KZzdkL2s3Mnc3OXcrQUp4VmZQSGVzdDJi?=
	=?utf-8?B?Tm1kSkxpeVk0WUxUTjRvZ2JOV0Mwdi9IS0I5ZVdoNWlXZU5ncDFzOGFINnV0?=
	=?utf-8?B?RW1hKzhmWDRORFRZODgyVXFXQVd4anFtVkh5YXBBTGVnelpaeEh5d0VFSmov?=
	=?utf-8?B?M2pZZEMrK0xvRmkvUGZTYmMwbU11c3k3WUg1MDN6anR4OXFwekZTaVkrNGhy?=
	=?utf-8?B?WnEvbytQQVJQNGQvQ1l4WUhhRUJpdWZzTUVER1hacHEvRmcwRXE4ZllnK2My?=
	=?utf-8?B?c0cvTGdFQlF2TnUvSzU2Y2FXQ29NTmhCT29IVWNpYmlRZGRYMmhxQ05iT2FR?=
	=?utf-8?B?cituYUM1cWxzT09TL3RhYVlPTVVvNDV0UnRUVWxFbnVMYjRmVXB1c29HMzk4?=
	=?utf-8?B?RWU3Qmo2OFRIUXNQbDI2bGJmVmhkSjF1SGgyZ2pJTnNieGQrWVRmbFFIcDVV?=
	=?utf-8?B?UStqNDhKSHF0UDlJV2ZhWFFQVWttN0EyeFV2eTdJZitqWUhuTDZONDZhZmcx?=
	=?utf-8?B?VDFoK3JXR01pTksvQmU3SklWbkYzbXBwWm9JbUhjVTdlSWxVK3gwNlhTdm92?=
	=?utf-8?B?R3RPMk9UM1N3OU1DQ242MXNmZDAyNWQwL1JITzVYN2NMemZobHF1aGp1MGY4?=
	=?utf-8?B?OVowN0NjS3RSM2ZNNXl3b1dobkN2d1Iyd0xGdWpNelVKQjJOdVhXaFZFMDRv?=
	=?utf-8?B?TjRTaXJHUW5JTmJrNS9yQzdtNG9RL3lXUExlQkpzblY4T1RkejdVMit4MVJD?=
	=?utf-8?B?YW94VWh3Z0VmYk1pdEUwTHRodFVzRmdNSi8zOWUxNkVJYlowc1RDWTFOWEpl?=
	=?utf-8?B?dVdUVCtVVFJFdXJsdzhacStnQWc1WVo3N3FwK2dQV0pwTlRRM1BBQklVQ1Br?=
	=?utf-8?B?ajEzQ0hxTk1jeGdoMVgzTm13d1FMMVdpN1h4TE5mMVJHRThsZ3JoaTdndm9V?=
	=?utf-8?B?dXNYZVZGRmg4MzlwV2hqU3NIM0JVa0MzcUI4NHVHSzN4dnhrcnZVQTh5WVlN?=
	=?utf-8?B?NjRYZGlBajZRbWdBR2w2TlVJNUVPb0V2eHFVMHhSZDdMNzlpdVFhM1k4N3hp?=
	=?utf-8?B?WXozQkUwaUxnUUtsZUhSa0REL1JudVpnRWJSdFNqTzJNUzNqU2paUmtQNVZw?=
	=?utf-8?B?ZUQ5OU9TL2tGZXc2bnBUcjk5SnN0akx1OUwrbXhoNkgvUFI0bTNQMGppeWtT?=
	=?utf-8?B?WVFEU1h3ekZWOVA2R3lHc3JoTzVSa29yNi9NTzB4OGpSNXE5MVhLRk1kSmV3?=
	=?utf-8?B?b1Jla2VCaGtzOW9rblFVK0t4ZC8rRTU4ekxtL005bjlBQkRzblJJWEk5TmJp?=
	=?utf-8?B?dmNjT3dKeG9Rb092UmJGYVduSTV0K3hDcWNBNGYyemFKYUF4WmNUV1Z1M2lF?=
	=?utf-8?B?SFZVZThzMWwvd0hXSDFHV1ZiZ3NKRm1RNjNKanVucnFyQ3pmT0h0bjAwcUgx?=
	=?utf-8?B?VGRhNWc5cGRsOXNIVmlMMDZjeTl3Y0lrQ1EzYTF3WTcvNW1OOE1oc2E3R0tS?=
	=?utf-8?B?NFNpVWRNZ2NRPT0=?=
X-Microsoft-Antispam-Message-Info: vGGSq1Ylp0eg0nrKR93U7VrI/cgc4v3XGDXLZz4DaRdeF+DWsfBpWtXhs0KxHmRrqedgWs4ongtiSOxumAlIdFoNpnwLe14X0i3NcNhoHoswtHy1gM1KJ6mf0UOZodf7edQxykQ/KH9Ggj4RjUq+IognxHyb9VCQhSCEEIIIc8zKxENZ83wQ9N9ZvB88mGksCu4URNIuAngN4FlRXCodddGV4u3myn9Bfe6EicIZtIjtGgGGtZTuAU1zmBdfn8oFrGTqBZmq14hDA4qH0o9cNtJHPe9f3Kpe92MvEuxexJ9WE5goo4vyk4gLDuHNo9c5ghS8I8FvNdXf++H7j23SbAasR6OEyYtZbgr2Ku/n8L8=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4753;
	6:q6/W/921yr3+8lW/MNdDDwZlUoP4Dyr1gznRwHNmYL70sfjM2NeeT192N2IyEMxG7K3WRDnerh1GOn3Sl3eqlQC13KqkiQE7v86tgcKJVy5FDrfbd9wy3kv8g6wYHN/NLniwZQqNzcOTIV/uTg6eLBaONZx56r+yz/bNA2EGaHhiwefxzCOE/uKiz0yuxSE4oFkW10pUn9/C0jqWHwDQLbVkslAbQenBGSakzU9hxOnjUW7q5rKlLlbZrqSX4JNUnj9waTpB4q08YN/11e5F3sVAQ3hILfHMm26mwXJj0aK5u1ZBX59NIgEJ11o/7iCY8fJ5D3MCMQVQnkxXtmaXwfZKZgXN7PSqOHWLUVHbQXdgPsl+zFsmeVF5pZuHUCqZEMfp7z/7kP7EpBdm6sH83uFoUJFppB459O9p/UlPVsb2gegafpnXjlLYpU6jcuKDmzs8FADSVyNUM9clUtWJcw==;
	5:7uiWN878GPar5sV0AYKul3lXAdnBz3OH+ZnIRBQS5Aur2GtVbt3kKVKKdx3vPJ2lgO/uXZvaG4ls7ak9IAvA+bWAKD1I4C/zTcWptuZjtF33/z0/0Dxd8obExK8okqYcsrr0ecXqeWity2HAsSax/01eOrmdr8Kplawz4LZkkf0=;
	7:5spaM29R0GHv2Yn23x0faNqle6yUCFUqLelC9JQe5tNTivRPayXC27qCck+YltnUpbU9kdk0Xj+LD46v6xIES7rYN2s4vSQEhYRugCdldmkANfy2ncs8qmL3bqn1XocCJPgz+Xt60cdW2/iG6Jg++PYOk4zWyqKA+3UJVLcENdNh4DwFatLCYGeNYwGSmjnu0QQ4SVlfD4Q4TjVNmRhHa6ZxqqMmIvIZCTag15/ZPH2L6TY8z+bFWa6XOM2D43qT
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2018 16:48:41.5079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 933c6ab1-df8f-4a3a-f4e3-08d61a61ed69
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4753
Cc: alejandro.enedino.hernandez-samaniego@xilinx.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Fri, 14 Sep 2018 16:48:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Sorry about the last email, I just saw this after sending the other one, 
yes I believe this might work, it would give us more control on how we 
handle packaging, although in a way it assumes the user knows what its 
doing which is not always the case :)


Cheers,

Alejandro

On 9/14/2018 8:13 AM, Andrew Geissler wrote:
> On Fri, Sep 14, 2018 at 8:06 AM Burton, Ross <ross.burton@intel.com> wrote:
>> On 14 September 2018 at 00:49, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 14 September 2018 at 00:30, Burton, Ross <ross.burton@intel.com> wrote:
>>>> I suspect simply adding python3.5/*/test/ will catch the bulk of this
>>>> now and in the future.
>>> Gave this a go and annoyingly the manifest generation must sort the
>>> list because the glob works for everything apart from packages after
>>> tests alphabetically, so the tkinter and unittest tests don't get
>>> moved.
>>>
>>> I guess we could change the manifest to put the tests package at the
>>> top of the list, and be sure to respect the order when generating the
>>> lists.
>> So I went and did this.
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/manifest
>>
>> Does anyone have a problem with this?  Basically all the test code is
>> merged into python3-test, including the previously separate
>> sqlite3-test.
> Nice, thanks Ross!  Looks good to me. Will you be back-porting to
> python2 as well?
>
>> Ross

