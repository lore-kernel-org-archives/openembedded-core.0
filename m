Return-Path: <Nate.Karstens@garmin.com>
X-Greylist: delayed 1122 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 Dec 2015 17:48:23 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0129.outbound.protection.outlook.com [207.46.100.129])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3106FFF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 17:48:23 +0000 (UTC)
Received: from DM2PR04CA046.namprd04.prod.outlook.com (10.141.154.164) by
	BLUPR04MB642.namprd04.prod.outlook.com (10.141.204.19) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Tue, 22 Dec 2015 17:13:55 +0000
Received: from BY2FFO11FD027.protection.gbl (2a01:111:f400:7c0c::101) by
	DM2PR04CA046.outlook.office365.com (2a01:111:e400:243c::36) with
	Microsoft SMTP Server (TLS) id 15.1.361.13 via Frontend Transport;
	Tue, 22 Dec 2015 17:13:54 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.247)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.247 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.247; helo=garmin.com;
Received: from garmin.com (204.77.163.247) by
	BY2FFO11FD027.mail.protection.outlook.com (10.1.15.216) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Tue, 22 Dec 2015 17:13:53 +0000
Received: from OLAWPA-EXHT06.ad.garmin.com (10.2.0.28) by
	edgetransport.garmin.com (192.168.18.222) with Microsoft SMTP Server
	(TLS) id 14.3.266.1; Tue, 22 Dec 2015 11:14:04 -0600
Received: from OLAWPA-EXMB03.ad.garmin.com ([169.254.2.163]) by
	olawpa-exht06.ad.garmin.com ([10.2.0.28]) with mapi id 14.03.0248.002;
	Tue, 22 Dec 2015 11:13:53 -0600
From: "Karstens, Nate" <Nate.Karstens@garmin.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] dhcpcd: add recipe for dhcpcd
Thread-Index: AQHRO/EHyhi3jjWSdkqs3ACrg645pJ7XolSA//+b0PA=
Date: Tue, 22 Dec 2015 17:13:51 +0000
Message-ID: <145451D4E6785E4DA4DFA353A58CB7B2F7E4C174@OLAWPA-EXMB03.ad.garmin.com>
References: <1449718597-2085-1-git-send-email-nate.karstens@garmin.com>
	<CAJTo0LbEMPzVs6JsjtnagwfHqxuyHmTXGXyKc302gCRrb4LKAw@mail.gmail.com>
In-Reply-To: <CAJTo0LbEMPzVs6JsjtnagwfHqxuyHmTXGXyKc302gCRrb4LKAw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.5.143.129]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.000.1202-22018.001
x-tm-as-result: No--47.889700-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD027;
	1:OvDImG4/+8CS/ux05zT0sjCG3gi41mX0vK/5u7xR0aa5gu+fmWGF7vbo4jxS0uJbK+lMh0wMjlLVktR9AHuZMGzlZ0rAiSionmH7wrpVEWotCUAtxxRzwb0N6kWRUeBSiD6oy1TyAOvRZ9Ld0kyaDg+dXQlgilxWUy/gi9BzoMPyorPGS+UdYjcOEfxvdczvtfNgfbGUywh9ZBGw6w3CdV1vkgLicZspPbT+A0dTJxVOurgKAdQXmZ6elth4yJiLrf7DCbqaXFUbV1+51J55riLStwNtSJ9FqxwR7TXeFMWuy7+oEk1DVvWAvUBDjn4Mqe4KN8/pOYv6BY0oI44OUtgnss65as0f0ztAtwW3YR4yTMxlojxCZcNjp+VIAJYKzYmSFPOgmMyDCcKvqYa41A==
X-Forefront-Antispam-Report: CIP:204.77.163.247; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(2980300002)(438002)(36304003)(377454003)(164054003)(199003)(24454002)(189002)(40036005)(6806005)(5008740100001)(81156007)(2950100001)(86362001)(84326002)(19625215002)(87936001)(300700001)(15975445007)(5890100001)(2900100001)(5004730100002)(97736004)(92566002)(21086003)(189998001)(110136002)(2920100001)(5001960100002)(16796002)(16236675004)(106466001)(69596002)(19580395003)(19580405001)(106116001)(77096005)(1096002)(102836003)(6116002)(3846002)(1220700001)(33656002)(586003)(790700001)(50986999)(512874002)(76176999)(54356999)(19300405004)(5003600100002)(55846006)(129583001)(17423001)(156123004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR04MB642; H:garmin.com; FPR:;
	SPF:Pass; PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB642;
	2:1clWrJH9jRjHSdFGYxpkA0uxiGk2LSM8Qz0jYihvowt04/ElMG7FX8bdbg4bXVZpWwsn6VYEkgIJTowV4nLgrQ3oRv34KOdM2s5MPuE8cjlz39XIqY/IRdXuQdzgVAugunROxd/6q+o7jJzbufL77Q==;
	3:fH33OkGnsafkj97BsoVrx1PX0w634f3moGRP5n+C+wQjpCsOuXSHZTEaHnjOu1ILgDBSJP0uYPwEsjm3rRk5T6pIS0UsYu2NpNrDIaIVTfTMJP2Mjl06hcIsmgevBHBMKsRneBq+2ZZ1xP4Ig9ml/8EUtNKd+GjRA5lSBtqdpNEMfnulidH32cafi/SECwM5NVslbo1oyoEbHeLjdxAIxA/i8SgA7a/FLZUMjoXU2iyULKMHxwP4uFq875urYeDjKRx2UU/Jn4rkzNDRvcEcfQ==;
	25:VTu+CsZvb+5ui63e8DMnvpjDajZpG5bmgdWyBrBYY9wwsoHpxPqVGBws584e3S8xg5qBLkbzOHMdmnQaG3Ed9Soev6HeVM8BRYhyi5WnfhjE2IP3lxqNuJ7V7NMrnO/iWXnOQhFhkcq8pvDUeGnYmq8kQmIUNqQ/iL+ld8Bcc5GVocB8c4+3Ote61gq06W3o4DoCqnpb8AJXTtaySKkzRGbMRVwEchYtEg+wVjfDouevzIsF+HUphvVglu1rsdwP8e9OK5HvvZ9gbkyp1rtxZQ==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BLUPR04MB642; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB642;
	20:L4lIUwfkgePbsRQ+kpmROIwyvRVZa8chBmar0vNAejlWDOIQWhqRhUYeu22JLHUH1fwOOqWmKSvCQ0nXi34OT9QKUWyqG2Tei+BeKx+UTecwJDPmXHXdSZJsJXo8GA5G6bsUg6FTaIx1MB4cxUj9+F9oYywpwByYoDlnSCZj4Sycf+LzLvCkya7ULdRqNTM4pqGgyX59gEmLiBAYOKgEc7PsGKavwdIuR5iw2AWzdqXM4ZzfpX6drLlZ/db5ptnKQ0B5PS1CCDXKwNCXicVa0ACPlmKE1LVD4LCPB1uS4gfEEUYUGeJVAxdVvP2TJNEpidHS12xiyf+zjvoE71bU63xldRV3rylVKuwhdL7N+xgdz/TpGv+F5k6TonzKhqQJlInu2FUkIREjAp3Zf/fPZGe4cQN6JftTbx2hFX3qFhE3KIy1n7P/G/Wjqy8Flwa0JmjRCAJxhwbH3OwdV05yNazIozPmQ4Xh28/vFNy/d9wx4vJQV/+Jb8L3NLRTysoa;
	4:NIGb9v4ibtJFoAWGRHW+6m+b8M9hrM1docqF0h3QnQHxhS77cgL8829ZRwuJmb4vEfQxEqSZWbym28zYn5gQZfMAZBBrrhOZfVNBUy85CuVUsOlW4Kl0ZA3X3PP22uBweSuUde+TnWZbhdOs5HUTyYWC9OrDP+vD+9GaQ67I6Sn60AbRTJ4YgIGpYjajzm9pdLmpwbcket7n0/RafXaDzGzSriX7vEhHGHvSv4zo0I9lenIDOZS0CFpiclXMZaPuro5SWfBrAgvur+TUKpEvHTfGHyMbStA0VkrkWK8hWKbFn2gB0biiZOQHWTShDzUl1FNANZtEVnSuQ0dpIQjUlMIfcckse4pk/mvG5nvceLJE0hHmkQ/+VTTDywD8jWg1s2k+0qDiEf78yvlBpR3248Y7cRGEn0TZAlpPMVCsGJgXN3+p5S/BI4Gkeae8BMbJ
X-Microsoft-Antispam-PRVS: <BLUPR04MB6422257A16AFD21FAB59ED39CE50@BLUPR04MB642.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(210672237334638);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR04MB642; BCL:0; PCL:0; RULEID:; SRVR:BLUPR04MB642; 
X-Forefront-PRVS: 0798146F16
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR04MB642;
	23:HYxDWkgWNEphvHNHjf/lHf5qEUWxj64z4vHSuqhH7/?=
	=?us-ascii?Q?8CbgjtgndmQKfQVbLOjqVcuU72SNLrsNRAhhg1cOB2j78jew+E5yUP/N9nAA?=
	=?us-ascii?Q?kowdZCqUMmhFGWahw27QDQMPmTr/raBlf6IoThaiKCzNvJXMp/XBHVJbMbTg?=
	=?us-ascii?Q?6A6nXKxezjYz0qEQH+0tNxnq3VhwHWlJzJEw8dwI207usz5A0+cCbSFZx6Yt?=
	=?us-ascii?Q?SZsB6DZycKZjEmk+8iyH2lrh5ww1dYvSFPfB1yINMd8aqem6AJnJIr5sSEni?=
	=?us-ascii?Q?kcs3JrwwQhUzCVIKy5THnCNOHmXED9pgC+/HfbJtTt+VBdgFrd6fxyfd2KN3?=
	=?us-ascii?Q?BQ6n4/e/fk6ybhdWGkCQebXZ6/i2sBqf+LB0JKTjd3YZQq8Mbzwu9gO//OAI?=
	=?us-ascii?Q?26cz2oCYc+oUNUuPJLUx8cP6UlOtAeiwe82MZ9230uWJgzzx1LIEjvGD0ajZ?=
	=?us-ascii?Q?xTa5KcaA1dqKI9kXqBMON09pVNipXa2h1nEpXiCoWSAzg0f2tiS5GvBcQOxm?=
	=?us-ascii?Q?Ble5lvIAJJd2SAejaZjwL2JyyWSp6fu8AJ2FNeeKH3wLLeM1L3HeEGMd/MGd?=
	=?us-ascii?Q?hypHYhEAo0wFfX3j/mUe/18FqXy6woYTUed+cTtc4jTePE2N2Yj7LV6GlKC9?=
	=?us-ascii?Q?qLf7gSuJbt2OckrR/0CLTv854yvvxRoau5jaYXTleIyvzgCn6X6/MlPtXkXp?=
	=?us-ascii?Q?RfniZmgnViPFWElv8x8CM79GAAQ6f2E3jIiVh93rLxfFDTd4U+r1Cg0VAlks?=
	=?us-ascii?Q?n0tCDz1mfAZB7ROfkBkfOhxlrGa9W2hTC/7I9QEnSxKsBmSZFsMWfr4Mh8rb?=
	=?us-ascii?Q?C68wP+uvcCniefcRxZAJ8UaAx3w9AjQktO8SfzEWsQIVs6xDjaT/Flhw16o/?=
	=?us-ascii?Q?W97LBmRIXHFh5e7ej914NSQ7m6Gv65UGEfJ0c2xVsevc028F3gbgn9ILVZTv?=
	=?us-ascii?Q?VmGfublEMrIcSJKmy5EnhRZmv1rOUTDTdZzjet+sRXbPk28lXp/Q8SjW+Q5d?=
	=?us-ascii?Q?zrRQ7meyLF8vzTHcNlzMKyQrzN+TgnTjPREYTJTNmMps6VJHspNXshh3OJkv?=
	=?us-ascii?Q?sFqo19j2pz3BPs3oLlkADbUzTnHYeakCb78MMCSoa5hTZNZGP9KUR1daW8px?=
	=?us-ascii?Q?WJH7EKpCJ4xn5JlDwDSDMhjPVo3ESWm3zCBJbUs3cBfG3hc/wEBeK6iqSrWs?=
	=?us-ascii?Q?7UuGQTxMY5FlkUdaX/c4HkMRpQ62RMkFdvX52DhV+biY/bvWnKDlJs0MUJm+?=
	=?us-ascii?Q?sqSk4Zgad7BSoVCIlAEg+DWs+w1mZLkLuYnAOhcFxqgUjSyhQSitaD+cPFnt?=
	=?us-ascii?Q?3LcoY4qsoG9FozGohGGxvP4Rdy0BrDJ9uWtwS4G3/YL+Nch1YopofQ/yiE+n?=
	=?us-ascii?Q?P6rkoTH6C3CYNVXLPUMCuyW53aH2tGYKOZMaLxpV6WKz1idV9jzke42s5mDQ?=
	=?us-ascii?Q?EZ0tLNuTpWyMvYiZwL744AosGl1Dc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB642;
	5:nZaZQqHd3A6Z20UquVYsm+GrMn3hNMUirOeK/KPA/hCNsledTGorgRMo8XSbERzypsq+e7XtrE0942EBfhwGWniAelaYDIaNdj0ZCJLgzRhVZS3czHYMq2cbtCRAdkJBrlfMbQ9fM1Lxpfj4fq8vKQ==;
	24:dc81Buc/IUlP7FNk85duLtHKlBwn6mTVih27MWO04tD/qtDKKEun2Nw1GHgjHxeYXZiLykHxXTGWRNWDsFG9VaEomPukU6dGqRnTEltOdsQ=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2015 17:13:53.7973 (UTC)
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.247]; Helo=[garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR04MB642
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Tue, 22 Dec 2015 17:48:25 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_145451D4E6785E4DA4DFA353A58CB7B2F7E4C174OLAWPAEXMB03adg_"

--_000_145451D4E6785E4DA4DFA353A58CB7B2F7E4C174OLAWPAEXMB03adg_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzLCBSb3NzLiBUaGVyZSBhcmUgY3VycmVudGx5IHR3byBESENQIGNsaWVudHMgaW5jbHVk
ZWQgaW4gb2UtY29yZS4gVGhlIElTQyBESENQIGNsaWVudCBpcyBpbiB0aGUgZGhjcCByZWNpcGUg
YW5kIHVkaGNwYyBpcyBpbmNsdWRlZCBpbiBidXN5Ym94LiBUaGVyZSBpcyBhbHNvIGEgdmVyeSBv
dXRkYXRlZCByZWNpcGUgZm9yIGRoY3BjZCBpbiBtZXRhLWFsdC1kZXNrdG9wLWV4dHJhcy4NCg0K
QmFzZWQgb24gdGhpcyBJIGNhbiBzZWUgdHdvIGFwcHJvYWNoZXM6IDEpIGxvY2F0ZSBhbGwgREhD
UCBjbGllbnQgcmVjaXBlcyBpbiB0aGUgc2FtZSBsYXllciBiZWNhdXNlIHRoZXkgYWxsIHByb3Zp
ZGUgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eSBvciAyKSBpbmNsdWRlIGFsdGVybmF0aXZlcyBpbiBv
dGhlciBsYXllcnMgKHdoaWNoIGluIHRoaXMgY2FzZSByZWFsbHkganVzdCBtZWFucyBkaGNwY2Qg
YXMgdGhlIElTQyBESENQIGNsaWVudCBhbmQgYnVzeWJveCBzaG91bGRu4oCZdCByZWFsbHkgYmUg
Y29uc2lkZXJlZCDigJxhbHRlcm5hdGl2ZXPigJ0pLg0KDQpJbiBlaXRoZXIgY2FzZSBpdCBwcm9i
YWJseSBtYWtlcyBzZW5zZSB0byByZW1vdmUgdGhlIG9sZCByZWNpcGUgZnJvbSBtZXRhLWFsdC1k
ZXNrdG9wLWV4dHJhcy4NCg0KVGhvdWdodHM/DQoNCk5hdGUNCg0KRnJvbTogQnVydG9uLCBSb3Nz
IFttYWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KU2VudDogVHVlc2RheSwgRGVjZW1iZXIg
MjIsIDIwMTUgMTE6MDQgQU0NClRvOiBLYXJzdGVucywgTmF0ZSA8TmF0ZS5LYXJzdGVuc0BnYXJt
aW4uY29tPg0KQ2M6IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gZGhjcGNkOiBhZGQgcmVjaXBl
IGZvciBkaGNwY2QNCg0KDQpPbiAxMCBEZWNlbWJlciAyMDE1IGF0IDAzOjM2LCBOYXRlIEthcnN0
ZW5zIDxuYXRlLmthcnN0ZW5zQGdhcm1pbi5jb208bWFpbHRvOm5hdGUua2Fyc3RlbnNAZ2FybWlu
LmNvbT4+IHdyb3RlOg0KQWRkcyBhIG5ldyByZWNpcGUgZm9yIGRoY3BjZC4gTW9kaWZpZXMgdGhl
IGNvbmZpZ3VyZSBzY3JpcHQgdG8ga2VlcCB0aGUNCmhvc3Qgc3lzdGVtIGhlYWRlciBmaWxlcyBm
cm9tIGJlaW5nIHVzZWQgaW5zdGVhZCBvZiB0aGUgdGFyZ2V0IHN5c3RlbS4NCg0KU2lnbmVkLW9m
Zi1ieTogTmF0ZSBLYXJzdGVucyA8bmF0ZS5rYXJzdGVuc0BnYXJtaW4uY29tPG1haWx0bzpuYXRl
LmthcnN0ZW5zQGdhcm1pbi5jb20+Pg0KDQpGb3IgbmV3IHJlY2lwZXMgdG8gYmUgYWRkZWQgdG8g
b2UtY29yZSB0aGVyZSBuZWVkcyB0byBiZSBhIGdvb2QgcmF0aW9uYWxlLiAgSXQgc2VlbXMgdGhh
dCB0aGlzIGlzIHZlcnkgd2VsbCBzdWl0ZWQgZm9yIHRoZSBtZXRhLW5ldHdvcmtpbmcgbGF5ZXIg
KHBhcnQgb2YgbWV0YS1vZSkuDQoNClJvc3MNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCg0KQ09ORklERU5USUFMSVRZIE5PVElDRTogVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFj
aG1lbnRzIGFyZSBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykg
YW5kIGNvbnRhaW4gaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgY29uZmlkZW50aWFsIGFuZC9vciBs
ZWdhbGx5IHByaXZpbGVnZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSByZXBseSBlbWFpbCBhbmQgZGVsZXRlIHRo
ZSBtZXNzYWdlLiBBbnkgZGlzY2xvc3VyZSwgY29weWluZywgZGlzdHJpYnV0aW9uIG9yIHVzZSBv
ZiB0aGlzIGNvbW11bmljYXRpb24gKGluY2x1ZGluZyBhdHRhY2htZW50cykgYnkgc29tZW9uZSBv
dGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQgaXMgcHJvaGliaXRlZC4gVGhhbmsgeW91
Lg0K

--_000_145451D4E6785E4DA4DFA353A58CB7B2F7E4C174OLAWPAEXMB03adg_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9
DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCglj
b2xvcjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpw
dXJwbGU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxNw0K
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIs
c2Fucy1zZXJpZjsNCgljb2xvcjojMUY0OTdEO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHls
ZS10eXBlOmV4cG9ydC1vbmx5O30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDEx
LjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9u
MQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48
eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwv
eG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQg
djpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hh
cGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIg
bGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1m
YW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPlRoYW5r
cywgUm9zcy4gVGhlcmUgYXJlIGN1cnJlbnRseSB0d28gREhDUCBjbGllbnRzIGluY2x1ZGVkIGlu
IG9lLWNvcmUuIFRoZSBJU0MgREhDUCBjbGllbnQgaXMgaW4gdGhlIGRoY3AgcmVjaXBlIGFuZCB1
ZGhjcGMgaXMgaW5jbHVkZWQgaW4gYnVzeWJveC4gVGhlcmUgaXMNCiBhbHNvIGEgdmVyeSBvdXRk
YXRlZCByZWNpcGUgZm9yIGRoY3BjZCBpbiBtZXRhLWFsdC1kZXNrdG9wLWV4dHJhcy48bzpwPjwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29s
b3I6IzFGNDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2Fs
aWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPkJhc2VkIG9uIHRoaXMgSSBjYW4g
c2VlIHR3byBhcHByb2FjaGVzOiAxKSBsb2NhdGUgYWxsIERIQ1AgY2xpZW50IHJlY2lwZXMgaW4g
dGhlIHNhbWUgbGF5ZXIgYmVjYXVzZSB0aGV5IGFsbCBwcm92aWRlIHRoZSBzYW1lIGZ1bmN0aW9u
YWxpdHkgb3IgMikgaW5jbHVkZSBhbHRlcm5hdGl2ZXMNCiBpbiBvdGhlciBsYXllcnMgKHdoaWNo
IGluIHRoaXMgY2FzZSByZWFsbHkganVzdCBtZWFucyBkaGNwY2QgYXMgdGhlIElTQyBESENQIGNs
aWVudCBhbmQgYnVzeWJveCBzaG91bGRu4oCZdCByZWFsbHkgYmUgY29uc2lkZXJlZCDigJxhbHRl
cm5hdGl2ZXPigJ0pLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkm
cXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtm
b250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+
SW4gZWl0aGVyIGNhc2UgaXQgcHJvYmFibHkgbWFrZXMgc2Vuc2UgdG8gcmVtb3ZlIHRoZSBvbGQg
cmVjaXBlIGZyb20gbWV0YS1hbHQtZGVza3RvcC1leHRyYXMuPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9u
dC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fu
cy1zZXJpZjtjb2xvcjojMUY0OTdEIj5UaG91Z2h0cz88bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZh
bWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+PG86cD4m
bmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNl
cmlmO2NvbG9yOiMxRjQ5N0QiPk5hdGU8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVv
dDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+PG86cD4mbmJzcDs8L286
cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj5G
cm9tOjwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6
JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj4gQnVydG9uLCBSb3NzIFttYWlsdG86cm9z
cy5idXJ0b25AaW50ZWwuY29tXQ0KPGJyPg0KPGI+U2VudDo8L2I+IFR1ZXNkYXksIERlY2VtYmVy
IDIyLCAyMDE1IDExOjA0IEFNPGJyPg0KPGI+VG86PC9iPiBLYXJzdGVucywgTmF0ZSAmbHQ7TmF0
ZS5LYXJzdGVuc0BnYXJtaW4uY29tJmd0Ozxicj4NCjxiPkNjOjwvYj4gT0UtY29yZSAmbHQ7b3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0
OjwvYj4gUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGRoY3BjZDogYWRkIHJlY2lwZSBmb3IgZGhjcGNk
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8
L286cD48L3A+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uIDEwIERlY2VtYmVyIDIw
MTUgYXQgMDM6MzYsIE5hdGUgS2Fyc3RlbnMgJmx0OzxhIGhyZWY9Im1haWx0bzpuYXRlLmthcnN0
ZW5zQGdhcm1pbi5jb20iIHRhcmdldD0iX2JsYW5rIj5uYXRlLmthcnN0ZW5zQGdhcm1pbi5jb208
L2E+Jmd0OyB3cm90ZTo8bzpwPjwvbzpwPjwvcD4NCjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXI6
bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0NDIDEuMHB0O3BhZGRpbmc6MGluIDBpbiAwaW4g
Ni4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2luLXJpZ2h0OjBpbiI+DQo8ZGl2IGlkPSI6NzA3
Ij4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkFkZHMgYSBuZXcgcmVjaXBlIGZvciBkaGNwY2QuIE1v
ZGlmaWVzIHRoZSBjb25maWd1cmUgc2NyaXB0IHRvIGtlZXAgdGhlPGJyPg0KaG9zdCBzeXN0ZW0g
aGVhZGVyIGZpbGVzIGZyb20gYmVpbmcgdXNlZCBpbnN0ZWFkIG9mIHRoZSB0YXJnZXQgc3lzdGVt
Ljxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6IE5hdGUgS2Fyc3RlbnMgJmx0OzxhIGhyZWY9Im1h
aWx0bzpuYXRlLmthcnN0ZW5zQGdhcm1pbi5jb20iPm5hdGUua2Fyc3RlbnNAZ2FybWluLmNvbTwv
YT4mZ3Q7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PGJyPg0KRm9yIG5ldyByZWNpcGVzIHRvIGJlIGFkZGVkIHRvIG9l
LWNvcmUgdGhlcmUgbmVlZHMgdG8gYmUgYSBnb29kIHJhdGlvbmFsZS4mbmJzcDsgSXQgc2VlbXMg
dGhhdCB0aGlzIGlzIHZlcnkgd2VsbCBzdWl0ZWQgZm9yIHRoZSBtZXRhLW5ldHdvcmtpbmcgbGF5
ZXIgKHBhcnQgb2YgbWV0YS1vZSkuPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPlJvc3M8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8
L2Rpdj4NCjxicj4NCjxocj4NCjxmb250IGZhY2U9IkFyaWFsIiBjb2xvcj0iR3JheSIgc2l6ZT0i
MSI+PGJyPg0KQ09ORklERU5USUFMSVRZIE5PVElDRTogVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFj
aG1lbnRzIGFyZSBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykg
YW5kIGNvbnRhaW4gaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgY29uZmlkZW50aWFsIGFuZC9vciBs
ZWdhbGx5IHByaXZpbGVnZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSByZXBseQ0KIGVtYWlsIGFuZCBkZWxldGUg
dGhlIG1lc3NhZ2UuIEFueSBkaXNjbG9zdXJlLCBjb3B5aW5nLCBkaXN0cmlidXRpb24gb3IgdXNl
IG9mIHRoaXMgY29tbXVuaWNhdGlvbiAoaW5jbHVkaW5nIGF0dGFjaG1lbnRzKSBieSBzb21lb25l
IG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lwaWVudCBpcyBwcm9oaWJpdGVkLiBUaGFuayB5
b3UuPGJyPg0KPC9mb250Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_145451D4E6785E4DA4DFA353A58CB7B2F7E4C174OLAWPAEXMB03adg_--
