Return-Path: <mkelly@xevo.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0050.outbound.protection.outlook.com [104.47.38.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3266E77D41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 19:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dRnlMps2Q9sK833UVVH4VVUJot/e/fahEU3gqkgnOuU=;
	b=cc0id3qyNkH2MDXVZ1CGLKxLIYGZ5ea8xPd3TgIuZa+scvllxzV8nnuQlCxqBU3sf5zFUWtBE+g8GXWc/mUs94teJktorDn7fvq0xQCDiJH/6IVSaEEjeu3Lxe4MvOrOM02Ja66W81FHxXI+9GZv0Sfel+NQZWyHH+kJJ50bC5s=
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.991.14; Thu, 30 Mar 2017 19:15:33 +0000
To: <openembedded-core@lists.openembedded.org>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <0eeb55ac-a3c8-95c3-a5e6-4cc94f963427@xevo.com>
Date: Thu, 30 Mar 2017 12:20:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: BN6PR18CA0007.namprd18.prod.outlook.com (10.175.188.17) To
	CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28)
X-MS-Office365-Filtering-Correlation-Id: 82c6906d-775d-4ae2-3825-08d477a123c3
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY1PR01MB1406; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	3:KloiCWMwBqTWNjdmO7ky/ofunrMlkKKgQDp7bC6VOx9odbSfiI/dsvEaensGO0Woh0lOTznNeKbgpQ4xDffI4flvWWOzeF703bnKrrDrsxpkOJNmDki8S91bEoWhtEcSz7nFA2RerFZemcFP6huxKWXDMirEo9+dCJ8OEcsyxQBF2V6UFZmSMwFNmkk4d0sdtuyhhpsQI3UyMmNRc3AZCAFj1HuYk7UJNyFEMBfW1Hwbdq2oH0vtIu6rdAEvFpcteWGEYHX0R8m1IZ9eMfO0YuxXx4ivDNyhfse+uph8YNGpygVeh6M4QBSCHI3mnz6QUNW7D1hiM46/BHle53ZDOw==;
	25:+X7P+kWesfoF02EfxyTrmi6Neg5R8i1ry1KNp/bdAhbuwKSUJpDOeB0s7I7HjJ0rh8uTSduPxOFzKbaNIYsgVMh+cuZ5Vc+ufnqtv/q+UuGxGfXqTtEDOXBIaSk3Yjf3soijwtPVIvaQTFhtbhYhuKVAJsEc7BONfvF5/HgXEBtuVtNZs2NIwEzlSgF7GwqZj7THJUCHd6OdaZvDwMA73fX4JPuKnZRnQSmJ3LlddD3gE6cTg/tlhmAkqKu2MW8YqeZhyhGzgiKRzHshMFpO6FzJQIbTgvcml4r2MGUJ9JjlyP4Z0zZToVsdRGFTGLQvHQPjglGaxfIALNa9qjQvc+/M408dXM7X3TK3+amqA2rZkJtUuzBexfcP5l5M2bTJGDoerhFHMfOkRTVANfWNOBTS9sqRGIrL3txDbd3dKw3snyBjs9+jzllfg/jyO9TQrau5phUIKkhBPELotE0FOA==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	31:q8bGDnfsnsOefn9CYvzSKf+Dtrwcbs5p5Hror42tTlNutohBWh3iC+2sl81XsM3+MotOxWlbEtCnWzSaWNzhhbcuafpZPFiiLBQ+LrIRB9Tvh5v2rm5T4+DfTfph73Xa+RGLivdpXgv0qJ/ad5Uh5virmDPL6JyC2/uXXEVj8CYh4LIflcriUo1njdXjPTJVi7A29JBNEW6bIKoKRfYh1tCKIkAJAT6EPVgwE6mQ31zOfEqe5NVzrHcTxNfg+1iq;
	20:veFhHHsMRa2nUv7QCCcLMjExya02qoRGaOp9e6lPtN1J6zO/qnOq2evzQkj8wNPmpwyHVXQBZuWMQrGp+YLW3LvnjpMakKZFeNk5M3E/6DYhrDGcyQj0pLgmiLq1yCfEYgSi/lXXl7hCkOPJ5Y3+6JXOgqkJQ0q29j/Cy7sjt5budKcsGmDlxj+Jek3Z2fkY2EHY4hoAH6QC3w+ss3jOp21F3sXD+xiwv0QsQ1liSzU/N2X4eMdX25ivj137BWCBma1vBKvQ44g4uK0TiYwmtCLlAOIr6yJr08tk7oSTceJJH65AUuPAa0CM+t/Bq8jREbrGwbsVmfyQKsxV0twVIw==
X-Microsoft-Antispam-PRVS: <CY1PR01MB14061D85BBF467DEE4B9FF21AB340@CY1PR01MB1406.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123564025)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(20161123560025)(6072148);
	SRVR:CY1PR01MB1406; BCL:0; PCL:0; RULEID:; SRVR:CY1PR01MB1406; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	4:bf++dKJAztKV9JHh0zYWh7ZEMBJJfgRGYBNwbGCtKMWvjrCzVPsyv66NxStOK+EjUw849/vpGhIrjvcPA8Hpw/bz4fVshRGysGs6CCFSAeyZyPIB6keNSuTAF+lO5EoGpmPJuG0IDsJjn/K9wob1ko2Rh8TtQlxjECZH0CFhKLHpXcKy68Ivu1xlaR+G/TBCwaHR3FW1embQWTKjT3wRXK7ZQjsrJDlBMjb53gwF3FmtNw6klZiioO2m3DuZKB7tTQf6W4I9VLlGeapycp13r0rnVfQAwodaBzp/IooY/uFDO+nbgnAE32T9AY71LSJWdpkNdunurcKAxdwB42XYs2xsY+Z33k36nmzUt2dkY0sq8yGsc4+J4oz469gd6iepWTjToWTsWtn0SyfsKg5Krlg6H4dwbkVIxZfKVAQsn6cbyKZC6/pWrd8uOi7JjpXe4chdXUehUpOYW891gb/rjsWRirWJgVJpP9QHxu3UM9XB5qq8S2pOXVrOmWUYuwxEceHSrEbAXrwQ7u+Mi+GzWRMhyifhw1dx6jCbn913UQi2l3x8Nd8I6EFFfl6lfer5DPFx+POww4NrP9/2Ysk5CYvXZT/j2VxqOL2ARDgXKmHQbZ6O0FFfJo6adDNf2DzNgHsoJ3zsjiSRwB8fN3E/snpMTHqzw2rklT7FWVqxLaA=
X-Forefront-PRVS: 02622CEF0A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39830400002)(39450400003)(39400400002)(39410400002)(66066001)(4001350100001)(53936002)(47776003)(3846002)(6116002)(25786009)(230700001)(6486002)(86362001)(77096006)(90366009)(6916009)(189998001)(4326008)(31696002)(6666003)(50986999)(54356999)(33646002)(42186005)(31686004)(2351001)(23676002)(83506001)(8676002)(81166006)(5660300001)(305945005)(7736002)(64126003)(110136004)(36756003)(50466002)(38730400002)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR01MB1406; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAxTUIxNDA2OzIzOlJ5ODRVeFlMZ2ZBczNtM1RFUUpCK3d4UFM0?=
	=?utf-8?B?WitwN1p6bGtmcExHT1Zsd1RyNWp1QVZOaDVNaUdaVTBKTXBnMmJ6bFM5Sk8x?=
	=?utf-8?B?eFJLM3kvVkNWZmVFdkxnOW56WGU4WXU4TXhVcVBCUkh4eWR3eUNBKzZRVTlV?=
	=?utf-8?B?MlBZSUlVYk10V0dNMXVDQjJ5ZUxwTjJIRVdnczRwVzlteVZQMG5vUGhjdlRw?=
	=?utf-8?B?amQxY2hYaWp2QURTK0JKN0lxSzZGYVJnWlJRYlUydllYeEtxZ0tQQWo4K1dF?=
	=?utf-8?B?UXhLRm1ZS1VlTXd2VnFES0JKTk9vSW14S0V4Z3QvVUw5eE1NYW1taUhiU0l6?=
	=?utf-8?B?UEF6VFRpQnFkV3NIa29JekNjU0d0Z1RqUDVpQjJIRmtHTmdYUnlKY1l4d0p2?=
	=?utf-8?B?V2ZRUG03M0pET3lBZFhYbFlzRzhxU1NBNjU1ZVJ4ZmUrbjlLcVJZZHhTcUVz?=
	=?utf-8?B?NXhKczhab0JaMjZWODVBMVF4N2hCY0p0ZHl2MFNzWVF3Mnoya0dIaGh6QStY?=
	=?utf-8?B?RWdxQU1ScDRTOVl2VTlxT3pDUTkxT0Y3Qk05bHlZSXpWU1VRbDFRdzdMU1dU?=
	=?utf-8?B?dnF1MzJCWlByOWM4NllIdS9DeUZseURIZXcxSENIRHRXY3UraWxnYyt5Y2Y4?=
	=?utf-8?B?TVVVV3dVV0toWlB0YmM5WnBwTE1GN2tBUVJ2WnR4dkN2Z1dBL0cxMVYzWEY1?=
	=?utf-8?B?c1Uvek45SFZzeDlEYXhiVDhuWjV6Ukh6b05tN1l5N3BCZjhueU5PcU5VMzZw?=
	=?utf-8?B?MzRibUREdnpmanYrdE5mYlJQZU5mS21pbzJDZUUwUldQcmdmNU4yNW52REtx?=
	=?utf-8?B?WmhjenozM204QS9hWWtvUHU2R1NiR2FSNkJYQU8vQURsZ2RvWTRMeGZPUm9W?=
	=?utf-8?B?NEpBSEFmNU9EcFJ1cmVuY2VDWDJxcmlGTEU4MGNOVEUxVm9KRmxGa2QwNkN6?=
	=?utf-8?B?dkR6bkxHOS9TNDQvditJa3l3Y2gwZWpMNDZ3cks5aFF0OWhDSFV5TUY0Qmox?=
	=?utf-8?B?STh0NVpoWmVmS3VkcXZXcGxrUFhZT21ZQk9IbE5OQzFBUGZnUVlzc1ZTMm03?=
	=?utf-8?B?RGwvQThNdWhPYWFTaEdsRW9LNXpjWExaQitOOC9Pd3N3M0d1Z0lvUVBmRFU4?=
	=?utf-8?B?VWN5Rmk0eW1uRmtTVk8zWHBkS2RIODBOMS81bTZUVHhnZEJtZTBzWVVSU2xQ?=
	=?utf-8?B?V0MxY1NxRkdjVjIvRkU5UnkxTzRicDIrbzlGTWlwTUcrcFFHRkFVaXBQdElU?=
	=?utf-8?B?SjJqOFVlSU5yZ0FKMWtWblhIUjdsYWxWcm5sNk1lckphN1licmwzR2RyMzgz?=
	=?utf-8?B?Vzd6amY0U2lwMHl4bjQvQWxRV0NPY043eHkxRS9CR21YYU5xYmdMSmxwM1pa?=
	=?utf-8?B?aDBBNTVIVUowcFdTckpYZ3ZwcXQxTEd0aGEyYU1ka1BpQ0IvdHdyQ0ZsaUtG?=
	=?utf-8?Q?F5vsngGJ5RBBjUy4HC8zhFjxsJT?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	6:0AVRATVc1Idzk3DcSwLa4QGRw9bHBpPaGXVKWF4TjBoh8BEsrsjXxgGC8Ft0iqC+7JGepeNgmD1l2hEF3z9qwky+nvscC4qwwzB9wrn2+aZzeJajZd+x3Eunymy95JYZNN/Rzm4GJ7uuJEx85+8HAEheXm1zTtgNybYVsYw6GnhRprzsykPFxiVKLzt3DM/7lzz3Psnm4V1uCa+Oub0ReRG43TbMzcNsmt4vFKpol5AAOLNavAybfoOYgDHTvIUstHeO+iWvN+Om5bkedR/9TKVA2J1ezNmMzG8PnttHDXpINSiTEmkc70H2Tbsv1+ZvRXIpLcKwys8SbsUtudSSysvuOVYPG31eHNNdU95dUSQJ702EsfWbr+7y4KpA/YIjrF+kRL3HO4vvIRQuzebzNg==;
	5:pkVMNxdLv2QoIR8sNb0lgRiz0t/N9ZqEPqIh1fQ5g3IeGua1pofUHVDV03P6Z85VRQ+81TVB6ZiDlo5p2a2Jy0GHI3t4Nmatp2r6s7BaK+QQzOhlvhfjuU3HnvRmCf5w8Ir0Klk1pgPn3yUJV+55Mw==;
	24:b9Rfgd+iPeBFwk4NyBQaBtApxawKjvBpIu2MmTX7/7ak8vyVV2Nc/7/XtG9HEwIk/F2Xm4oilKEVj6+fMgCQOf+HHbs2o2A8czR9IRvJO/Q=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	7:/h0VKn8Sta2lC+TA1d0FCsG7BF3FiuB2Ldu/Sk1nyZpl/ibKahOpKgNmy0IKLipWGEKTo8TI0KHQkKKBeF7I2cEl08pXabHEv1fl1+WfgVQX0ABNNuV/xmGkZva+GtY64PyDs/0V4x6KP9fEpKKFmhhD2hIjia5oHX6N80Edn1Sc//P/h7/rNBdpEyARmDaTqNdeWV1nprtO3Q6Ssvx2lRrYuXo09GCILGod2lKATa5hUQ86AVEa4ck1XyrpGzr73l0K931yTGJukZEJFffr9ery/QyoUZVR1asjqDZZRU3bUBnfvutxtF1LP9Wa2peEBVd0K+z0Vo1CrAthhizR1A==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2017 19:15:33.4204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR01MB1406
Subject: [meta-clang] oe-core and meta-clang llvm coexsting?
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
X-List-Received-Date: Thu, 30 Mar 2017 19:30:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to integrate the meta-clang version of LLVM 4.0 (used for 
recipes that need a newer LLVM version) alongside the oe-core version of 
LLVM 3.3 (used for mesa). I'd like some recipes to use LLVM 4.0 and some 
to use LLVM 3.3 and for them not to collide with each other.

Right now, once the meta-clang layer is enabled, the recipes collide 
because they both provide llvm-common.bb. I tried explicitly versioning 
llvm-common, which makes them no longer collide. However, mesa then 
fails to build because the meta-clang version of LLVM installs 
llvm-config into the native common sysroot in 
tmp/sysroots/x86_64-linux/usr/bin/llvm-config . This llvm-config is 
based on LLVM 4.0, so when mesa picks it up, it gets confused and fails 
to build.

I'm trying to figure out the right way to fix this and get around it. Do 
you have any suggestions? I imagine there might be a quick-and-dirty way 
to do this and a nicer, long-term way to do it. I'm interested in 
hearing both.

Thanks,
Martin

