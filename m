Return-Path: <haris.okanovic@ni.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0108.outbound.protection.outlook.com [207.46.100.108])
	by mail.openembedded.org (Postfix) with ESMTP id 4EDC9731EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 16:26:04 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=haris.okanovic@ni.com; 
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	BL2PR04MB004.namprd04.prod.outlook.com (10.255.228.22) with Microsoft
	SMTP Server (TLS) id 15.1.377.16; Tue, 12 Jan 2016 16:26:03 +0000
To: "Burton, Ross" <ross.burton@intel.com>, Andre McCurdy <armccurdy@gmail.com>
References: <CAJTo0LaHTkODDiLfOYDQoFC-VBDD5h4XctAidjzRfyYGgdAfKA@mail.gmail.com>
	<1452020669-24036-1-git-send-email-haris.okanovic@ni.com>
	<CAJ86T=XLn=tLvxv+aOH4=Z0ma3B7A_fuuESZYUZA=K4KKsLOfg@mail.gmail.com>
	<CAJTo0LbktbQ2h=LCveqxqFuuxajwZAYGJT3M9JcVNqTqf0WwJQ@mail.gmail.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <56952913.7050202@ni.com>
Date: Tue, 12 Jan 2016 10:25:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbktbQ2h=LCveqxqFuuxajwZAYGJT3M9JcVNqTqf0WwJQ@mail.gmail.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: BLUPR05CA0056.namprd05.prod.outlook.com (10.141.20.26) To
	BL2PR04MB004.namprd04.prod.outlook.com (10.255.228.22)
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB004;
	2:DU6CZYvAf3sqn8AVkQdMh+PE0A21qBkV6cba/KWYdOK6Apl1mnoJeQz88/jBZ3msMjRRn1sPV1223ehkp1XbMxFAMJ/3pylXFmjKhZZmudbojFRZSIyXFq30TUtCI4SpAWjENDWt9NNrbpteMESGOQ==;
	3:qYEi1UkkqRHghUQ+r+4MpB8xcO9UwZuEZsuC6Pat42kR8VB5GWN5GqMMpm0hfv+L0RR/4RSsO1E3ham1sYpBGatb2gIwHl5RLbAcH6NxJNAN9owwmKbNIhut0UG3X65X;
	25:1kbKEAqzKjXPjUtECGZ5SPvvN4yqj1X1WMo6ca2JqN2pPKKSNZvG8WoV/evxtvJyxXONhNEtbE6ZdF7sturp90/ySurL6keBd0l/2PYqo4EnBH0rMnJ/e0xM4ZujqGUx3aQM1qRmBxgaNETpViSsATzsDWQ3ZAwqLuGDsZP5Ziwv4l2TL8A2dIzCu7jpvYPTJ7u/zv9aNJo3lsITM8TBw1x48ZXwssKoy4UUfwlSkzL0wJOdCXaHH4KmTMHNDiyP
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR04MB004;
X-MS-Office365-Filtering-Correlation-Id: 9e45263b-f5e2-4fba-b1e0-08d31b6d10db
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB004;
	20:t29lQa072qvenR26rcMPRZ33sywr5z9hgHFlusdPIqwrEImzj7ODW0NpySynPGZiVcRNePe8Nt/qhaZUqWVBtPZDZcfd9VDhQqAMMAzM6VgVwM3wkyB1Ss11TV9XPNAufvNnnhT9zjYAae6OHteMV3pHWFYFp7CXlDl//oTnX/ndZ7AhxJsMmoVQWaqiIXXhZjhZhKdxAYP4vfWULECk4DmeBm5SFgAD1JwYCDIHbwF/06cHaX6KlUs55lK7gi2z3MI3iva1qyl4EwvUFjOi8al/kxXpzNMXQRlQ0pcKowCeqLXTNX6T8XqdM+72xGl6L6usZOGre3CphJvUsH1ToLYtF67G1THt5QQWRqYhtn3/t1+mEpgiVVPyWbPTzbUPyTPQsVhF76NAish6zTpHeQdEy4Y0z3IFTCkVzoK9hQnV5DMylItntU38YVuoGfcMfSA7AVMzat5ChtAoVujPscYa0hx6FRzUe+rBQNPwQ8UiNx2ZedKzApLUbtJTq9toVkUvuyBcSJ1APWhj+ahXKzq3bOJ1s74cJbYAtdUw9jBuExzxfhvQLLN4nr7ZOfuQIoxXU9lWca1IBM2P4JdV7TWh2+gD1dZ36q04OVWRWkw=
X-Microsoft-Antispam-PRVS: <BL2PR04MB0045DC3FABBCB6E8D4AFAE9E5CA0@BL2PR04MB004.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(123027)(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046);
	SRVR:BL2PR04MB004; BCL:0; PCL:0; RULEID:; SRVR:BL2PR04MB004; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB004;
	4:wG1d/ned8wX5Lq/QJFfmeWX34QX20Y9xo6V4Qo/7jQqn3ZFOWRVTNDQn8k7ewNu8i7ZjzybrQy3aoPQ9Q2lBT/ZVeNoSdv7Os+4Mskk/qJD7kVcq7wofkN3IRNu3QE3um19eYq2kFA4msiaZW10Axyf7C1noUvoEeu0E5dqW4FKsgj3uwfhXdrbtzLUNlKONO+5kNuweyPKx1cp/7qdgGVo1gQL8D4CDoZnSnrzZQ70+1N0RX5fc+avzwFNxIrRlO9Eqj4RTLmdjsSWDCV7cIIcZseEHhjGiIu1cXOo2h6QsTqe9k9+8TUa0+v3Chmd3TzMKFPEGyFBcI+ebMAAs9pqTtVKwMXekRa+jJtp93NagUud7AYGp/SJZJ27291L4oTBh9n+9SFqIh+6MN8NxOg==
X-Forefront-PRVS: 081904387B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(479174004)(189002)(199003)(24454002)(377454003)(65806001)(6116002)(122386002)(5001770100001)(87976001)(86362001)(76176999)(50986999)(65816999)(77096005)(5001960100002)(586003)(1096002)(2950100001)(54356999)(3846002)(15975445007)(1720100001)(40100003)(97736004)(189998001)(92566002)(23676002)(4001350100001)(64126003)(93886004)(5008740100001)(66066001)(47776003)(65956001)(117636001)(42186005)(36756003)(83506001)(81156007)(230700001)(105586002)(19580395003)(2906002)(101416001)(99136001)(87266999)(5004730100002)(19580405001)(106356001)(59896002)(4326007)(50466002)(62816006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR04MB004;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDJQUjA0TUIwMDQ7MjM6dno4RDA0ajNBb01vOHRxcnJ6NTM5MzhSWkhv?=
	=?utf-8?B?Q292WmdwOG9RQ1g4T1ZqL1o4cm5FR1c0WW44MzI4ME10TFBldjQ2Q2VJUFUw?=
	=?utf-8?B?M1p3aEM0YjhOQkRVWFNxWGVzZkFyUFlZMXp3bkdSZ2VJRUluRUdEbjhxVm1D?=
	=?utf-8?B?WlhQUUlwMkF3d0s5Z1FFM205dmVFS0xGcjh1WDB1cm1CREdwU2UvUVg3dVBJ?=
	=?utf-8?B?YVVGT1pCbm53c29EQ0pVc0g1Nkd4RS9nOVJpb1BEeDZVYUxUQmJhUUx0YnM5?=
	=?utf-8?B?Z3pneDRyN3dsNEVtZXc3MGV1YUZjTUlHSXZKMmluSUhRWElxZXR2NC9iTzVT?=
	=?utf-8?B?YWtZRzJiWkUyN0lVbVFXTUxSeWJYSHBnYmM4S3BmbVFOZzl2Q1hkeElJOFky?=
	=?utf-8?B?a3BGMEU0NXptZ1c2d0ZsUktKcnh6di9wSmp6ODFDb2szWk85eWtOZVpDWnpq?=
	=?utf-8?B?dnFnanFKSGlaQklhaVhuakJjcFh4R1lBNjhPSG5yV0IzcHdKVEJDUlhWTG5P?=
	=?utf-8?B?RDBXM0lndys2WjRwOVpmVVNLZitieTFLc0tkYjdTYm1wTFViUHhRYXAycWdX?=
	=?utf-8?B?bkVxd0VYQkdEUnZrelZQaCt5MzN6QUkwc2RCSk5xSnQva2NLNkFjL3lKNGZT?=
	=?utf-8?B?aDI3RzFQdDEvMkNVRVVhOGUvS0xObzlTZU42cXBUbUtzMVdUd2M3MTA4YW9y?=
	=?utf-8?B?NFBPdm5ZYTFnaTh6MXgxUjE1ZFJnUlJKK3E0anhvWnoydFZVMDBJTXljb1hW?=
	=?utf-8?B?bWRuRWx1U0FYblZEUXJXMFB5ZHBTVUNYdXJyWTdXZDdBUUhycjVtbk9abUxP?=
	=?utf-8?B?eTEzdzVFZTAxZ1VqS2J5YmtsdEl1NnpPV3VJUW84WVZGSGFkV3NWT1lPM200?=
	=?utf-8?B?Z3F0cHR3MVhtT1lWeE9NdVZleWNXUzdZY3RwVzRjVEVoem85ZU1NcVlQSEFv?=
	=?utf-8?B?MFJjV3Y5T29TOUlGN1dib1pjcDRhdm9rMVZ5WjhNeGp5QWhub1I1NVE2Y1RH?=
	=?utf-8?B?SEJoTTRaZ3JqQ2dscUhtUEFrb0tCQjFZUTkwaExKOVBEMG0zN2JXZXJ1NDdW?=
	=?utf-8?B?UDE4SW1EOXlnbk5GWHJFRGlEWlZWSUJmaURGMkZrMVQ2VytSZkg0SFdkU1RC?=
	=?utf-8?B?M3kxOFQ3R1hIU1dHWWFXMVlmQUpDcEtlTHVPMDNLTklWQkg0L2N6WjgxUEZD?=
	=?utf-8?B?UmVJenI3cVJIczNWR04xYnRjVlJUd1B5VUoxcVNlL0FGdFhORndRTlhFQVVn?=
	=?utf-8?B?T2RKR3RMVU82UnZPRGQzL1c1MXFwc0lFSkI3VmJoanpIenJ4bXNra016d0lr?=
	=?utf-8?B?WStOV2NHdjJtQk9ZSDRtS0NydzdDQUdXSndSREJhVEtjNzhyMWdZWUFwZGVs?=
	=?utf-8?B?Z05HbW50TmVWSkx0NCtqR1F0QlkvN0hXYVVzZXdGdXV6R1lpQXBjWG02bEox?=
	=?utf-8?B?c041cGI0cm9XRytXTXkzeC9FV3IrL0Q2dnM1ZzNaZnpkSFAwU1o4aUs2Tm9X?=
	=?utf-8?B?SHgzZE9GQzhZaGc1WFNxeUNlbEJRMGdzcjh4NjI2M1V1citlRUg3cFAya0RP?=
	=?utf-8?B?MlhXeEl5S3UzYVorcHlzUHp0M1hLZGJ0Z0R5RmZHWFd6ZGRIOUFnYy9sTVZk?=
	=?utf-8?B?eTFpVjlCU3FIVzE5UkNYbnd5cUJPSTdNTmpwT3ZPQ2cyYkFHTkxkaWxrY1Z6?=
	=?utf-8?B?ME1RenJTK1NjbDMxQ0ZBYWJEeGRlUk1BcU1xVzVjQ1BtOUNXSDFaK1dYVmdz?=
	=?utf-8?B?OVE3SDErejZLbk84RjNPb1lNYzIwT09MckZNakY3Qm5PdVFKTDVzYmxiNUJi?=
	=?utf-8?B?T2l1VXNsT0svcTlZT01sYjRTV2Z2enJZQ1JrNWE3Z1hKMXdSeE5tWW1IZG94?=
	=?utf-8?Q?4NUPC5EQnOh78deQ9nMUKx1+rK7i6mw?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR04MB004;
	5:2O5yMUjNniIAlC62CP3n1nWYcPbjZx8Y5cQ2wMo9mjGbR2qrEHujFMUUgGIE2WHvoAMMqVIdb5A0K5hEjcQMhKAL2JOCb8FPRdnQQCVx0u+zUfnPBhPnmxmKnUiUR9UKdZ8ZJGZ7qoFeJQm+qXR68Q==;
	24:wImekqoTD2r9SBn1A4SQY8a1SRqqJfSOT79CawKNBESxh+9Us/+oH4JG6z3ZLB7buWwHNp9AEQ1tbQpbrh1vZF0qgUsPGCL/6v4KY+eBeoQ=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2016 16:26:03.5250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR04MB004
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] tzdata: Make /etc/timezone optional
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
X-List-Received-Date: Tue, 12 Jan 2016 16:26:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2016 04:24 AM, Burton, Ross wrote:
>
> On 12 January 2016 at 04:03, Andre McCurdy <armccurdy@gmail.com
> <mailto:armccurdy@gmail.com>> wrote:
>
>     You lose a style point for == in a shell script...
>
> Patch sent.  We really need to scan for bashisms in our shell fragments.

Bah, my bad. Perhaps we can run checkbashisms in QA.
http://linux.die.net/man/1/checkbashisms

-- Haris

