Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.102])
 by mx.groups.io with SMTP id smtpd.web12.55209.1622538927037767672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 02:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mysnt.onmicrosoft.com header.s=selector2-mysnt-onmicrosoft-com header.b=TliH3FoD;
 spf=pass (domain: kontron.de, ip: 40.107.13.102, mailfrom: frieder.schrempf@kontron.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDkYVq6Trgg1CGssN3+gYcQ6HX+ERQWmcnBJj+FxkZy4d1ac04nzEeLzsKP0AUipUk7Z5Jrnqi9BCj4pDfVQx+LLSC2Bv7pXBv8WkZ9/3UVL6CK0fIr8K9fg5Mt7b2J7FwiRT3AHQelwjOp84ihH45YDfPb4D6lppjhF8TAg9RBmY8w0hpCfUEIf/oxwaSTeJcq403tQgCYyF+IaBC/HnFcFgoaIRdIi+qtmM9eTztRjIt/fpekjLcocHHUkuX9VpRdYf2FuBffGzuSlb5KbFCnIFxVFAAFKaoOn/AU4nZB1dD9fAW7pgm46dikquIwsVK4k0081WcvkR1qkddZMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKOozN9Q86Aa6ftPQUmszueW4+VAiucYhSYdlYvrwJk=;
 b=nUNLzNv85LviGF/ftbs19fkXZWiHk8l3GSUIXdsjXV/12npNjaukKGj11tItN7n/WTuMUhhDcS1/lFViI6Gy9vjx4Xv6fIdGLlBNsgpCTB8Wh9hx39Pl5OJ2h+vX/0Gg9pI6V/aPWXNzGUrXuNoZpvfPyHMoImNiuiwHgz30F6bvO9fnDcIM3Vs0MgxFKB9t4vqLAvt2ncJyUnwUG9H+FpCJBK1RmQdRkp1URssA9uWUjVYvmFPCYFzRViZhXpawce5HrwkR+7v85zu7MJXogsTuKE3KHwhmA+7li1L1MbFPHQHfOvlSeOcWzBpfekSjShgc4GaHgGSrLke4ekLxEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKOozN9Q86Aa6ftPQUmszueW4+VAiucYhSYdlYvrwJk=;
 b=TliH3FoDd46rG9eLHWP7fI5WjNFTVhPFq7iPyBmwcD1mvUwuco4la0LzZfpEoeRaHogX6kMZTWqcW+GYSnjQM2Bmuh5VzG/9YpEvW2XHJ/2+Y8ridtxRTy4hinWWV+Wf/jAc1zGvnO/FSJgPsfYDOm8Qr90pGWtdKfiRSj6ttRQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2275.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Tue, 1 Jun
 2021 09:15:24 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703%5]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 09:15:24 +0000
Subject: Re: [OE-core] [PATCH v2] kernel-fitimage: Don't use unit addresses on FIT
To: Steve Sakoman <sakoman@gmail.com>
Cc: klaus@linux.vnet.ibm.com,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <99b61172c516c71dadbc7342da4e20a064299110.camel@linuxfoundation.org>
 <20210222183818.22615-1-klaus@linux.vnet.ibm.com>
 <648ca8e0-5a3d-ff2a-2b5a-5884cd618f5c@kontron.de>
 <CAGDS+n=rFYdcRMvTqqnA+PKPLf0FhfwSopkzpD0yNKxLa6hcNg@mail.gmail.com>
From: "Frieder Schrempf" <frieder.schrempf@kontron.de>
Message-ID: <48487c3c-b224-db21-b20d-cf2c65853669@kontron.de>
Date: Tue, 1 Jun 2021 11:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAGDS+n=rFYdcRMvTqqnA+PKPLf0FhfwSopkzpD0yNKxLa6hcNg@mail.gmail.com>
X-Originating-IP: [109.250.129.140]
X-ClientProxiedBy: AM3PR07CA0064.eurprd07.prod.outlook.com
 (2603:10a6:207:4::22) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
Return-Path: frieder.schrempf@kontron.de
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.32] (109.250.129.140) by AM3PR07CA0064.eurprd07.prod.outlook.com (2603:10a6:207:4::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.10 via Frontend Transport; Tue, 1 Jun 2021 09:15:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86a2c3d7-ffd4-4dc1-c1a6-08d924ddc99a
X-MS-TrafficTypeDiagnostic: AM0PR10MB2275:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB22757B6FE2074825E8F8D896E93E9@AM0PR10MB2275.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VKFjmlvUy9kzXq1iIhPdu7SK8OC7JO6lJXhQiALAmJTHKv9i6cnOCGTYBCUYN4NGpHtFN5O84szyRJPXfqyx0Xhg/lIqhz5/UxlTQNbackorlVSWz0yIZQIWIGq5YO0Wh0Qd8qt4YNdj9QV58t2VMmGPjd3FGHTwfeqLaUzRPwFcsCx+W1evRMpO+LoM00i8ne6Vcm/5cyXLXi9/m8PWuNE8NAyiEXO+e7vlycP9eTUsTXLxfK2hpFyAVtv2+uV/lV7hQbcU57xrv0LiLKOCgrNQRbFuESwdhBwxm3lwOrTEcan28y3n3XDEAWODDTFEoUwTxPlVED2w07Maw7HVMiUdjxtGCwTAbKuvncKWS8EDDeLshx3OAQlK7e8UioT9v8gMfhXLHo4bY26Ti1DuwuaHpJXi6wjLZx6ovRj/lcmzCmHr8oicOKXulsqaH8sLL+Po8g+k/lDsmxMFa778TldoCPuOedOLQrpJAPNYlBHjMXshnLcU7f+RCt9n7q95cb2qtCX1I0r2dTIXnDvawh7wqYk4iL8etz/jrOZ+tST8TmKY/L8Lr7WqV0lDg/c7SefGBG9SJ1C0/sgWycCfVZBUl6va4Z+3No4RigVhGdJlgwZrGK2wRIiMw6aYMk+uzabhOcn/GeyqAA8fxQ935DMmk3O+ahhS6A3iaGsvbfBieXJs5kX3Gz1q5I82Bb4l3VgLOKUecvK5aUfBMFrv78RpE6fObPy4nDFpUfv8mittZDe99lpotQ0/3sNyK4dgCQeqdhjOtBI0yQUezZ1rUhUSNo2ZjwkBulvAxJCfZoXqgAmzLZHeDPUR0o6eLTu0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(478600001)(966005)(83380400001)(86362001)(44832011)(36756003)(38100700002)(4326008)(30864003)(8676002)(6916009)(31696002)(26005)(31686004)(16526019)(2906002)(66556008)(186003)(316002)(66476007)(66946007)(16576012)(6486002)(956004)(2616005)(8936002)(45080400002)(5660300002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bksvSXk2Qm1LdVNtS2gyYXUzeVlNb0hoNG43enVWQlNpMkVVVTNLbDFvV2p3?=
 =?utf-8?B?eXY2b1hhTGNMRnZEZlpWajg4SDRBWXozYzJ4MUdDUmV1N01SNTA1TW12MWNH?=
 =?utf-8?B?R3UrNVZ1NzlWcC9tRUJWeXF1bFJKTTJSbFNodWlIN0VYbFRDZ056SmRvSEcv?=
 =?utf-8?B?b0pUSkV1emVBTDJkTDZEWk9qTktkVUdpdXJ2VGdxZkpwaHI4eS9xUVU2Z0Rr?=
 =?utf-8?B?b1RoYnJXa0VzN2NrS25rZFJyZms0SUYxZGpxckJPZVVBQkVMOHg2ZmVrTHFq?=
 =?utf-8?B?MEROSU1lbStTVlRuVmRZTFU1UXpnM1kvd2FhQVBEckcyT21MSHNyb0xvZWJx?=
 =?utf-8?B?TGxrcE9EUTk0YnpIQ3grVmdKZ09Dbnd6SnJPbUEyRmowQTdxYzR4N0dwTGNt?=
 =?utf-8?B?TkFEKytYY0d1YzY2K2x3Z3NWY0k3NElkbG1ScktSc0c1RnZoSWlac1h1dzlB?=
 =?utf-8?B?YW9BZ2lGVVFKVkthN1NmOWZRU1hKY1E2M3VzQXRoZXF4TDJSalN3bzR2eDNs?=
 =?utf-8?B?NXRkSkdVWkhMSjRpTC8yczZIZVBRbHRHeXV3ajdmSHJEYkxoOWVkVzlUNzA1?=
 =?utf-8?B?cXBkQWh5Ky8xY1orTndtcUNhN0JkT3I1YXNONTkyVy9FWXJZYTdzY1psOWlC?=
 =?utf-8?B?VVBoY1hxZFZJZ1ZmN2UwZDV1YnVmK1JEUFVPUjlQMFp3aER6d01wNjVYVmY2?=
 =?utf-8?B?Z0lpMklGclVHZTFtQXU5WDRDbUEvM3k4ZTBrN0dOYUlTcTlQQ3pjWFlHWXlB?=
 =?utf-8?B?UnFBb2dlOTY5TDBCS1dDZjFYMWIwdlZYdS94a3U0TnkzN3BNNEdLL1pQdFpP?=
 =?utf-8?B?OE5xaVpEeWlFSUNydU5LYnpDZ3ZNZGZxaVVYWjAzNDdZdTllY3BnaWloNUQr?=
 =?utf-8?B?cUhxRjczQnhyNXpXRktuUkNuenVVaGhPalIrdU5XL3pvRmVpUVkvaHFxMjNq?=
 =?utf-8?B?bzEwcFg1bkx3SVRDdkcwTE1aeEdERTB6ZHBkZzRQc05XbVloNmNoOURsS2Qr?=
 =?utf-8?B?OTNyQ3hkYUQxTnl2R2NjZ3I0N3YyU2FMTUVWdlgzOWtUUWR3bFpreVhJRnlN?=
 =?utf-8?B?M2J6Q1Q4TDd2ZEJWckxaRi9tdUtIOGhNQW1DMTdTUTRrKzRNNm9FSDFDdVQy?=
 =?utf-8?B?ZC82MmVtODVJNVRydzBRd25jakVKS1ZtTFFMOU9KRkhyamsraXFNUXhDNWtY?=
 =?utf-8?B?dmpoaGoyanpRbGxhZXgyQUJwaUlxWG9YelNLZ0s0ZEtYUnVFeU16a0dERGlX?=
 =?utf-8?B?NUVMVE9vbWVpUmE2VmtxclBDTVhiVFVUYnpQWGEvZDQ0RVQ3OWtUajg3ZDIy?=
 =?utf-8?B?SUc4ejlicGZ4OGEzblFVYVlGSE5yc2Z1aXluUS9ZNExBeXg5TGtTaThVN2o0?=
 =?utf-8?B?ODlNcWMyUGQ5RFVSM0ozL3RQN1V0eGNTVVkvcHpIZXdjWG9xMWc1MU56dEUr?=
 =?utf-8?B?ZHJoRXRza1lXNXBnQXoxcXVXRjZFNzVicHE1TFNaODQrbHBQdmU5cTZQSHIw?=
 =?utf-8?B?ZnQxQ2FVSDJLVERXdVRscFNLQVdiRXhGeE1yZ3hpUUg2Nlp4V0R0R0c3M1lq?=
 =?utf-8?B?ejBGSDVqTUg1bzFPZjA5MGNhZWF0UlpCRjRkUkIrRmVER0I4clRVTDIvRFE1?=
 =?utf-8?B?NlRZR0tVbm0rYWI5eFo3blVjcWFqOFh3OTQwMGVibXVqQUM3UjgycGsrWTFh?=
 =?utf-8?B?YS9vMjltcDdlRmNQanQrK1NWM01Db01TRjVNMSszc2pYaDMyWGpBN3RPeWNk?=
 =?utf-8?Q?b/IRAE+pKIXzOTD0FLhVMZn6JknsTSekxn/SUnx?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a2c3d7-ffd4-4dc1-c1a6-08d924ddc99a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 09:15:24.0599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krG+sqV+utkF/8zrn/vdN2ZEP58TUMo8pN00daM/lffbe6YjrSvdfrgMhXbVh5/4Pba8Ti21dQukYjbHIMYFWjhIaySiScSH/oopGJ5Sbcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2275
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.05.21 17:59, Steve Sakoman wrote:
> On Mon, May 31, 2021 at 4:59 AM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>>
>> Hi Steve,
>>
>> On 22.02.21 19:38, Klaus Heinrich Kiwi via lists.openembedded.org wrote:
>>> Das U-Boot 2021.4-rc1 has the following commit:
>>>
>>>     commit 3f04db891a353f4b127ed57279279f851c6b4917
>>>     Author: Simon Glass <sjg@chromium.org>
>>>     Date:   Mon Feb 15 17:08:12 2021 -0700
>>>
>>>         image: Check for unit addresses in FITs
>>>
>>>         Using unit addresses in a FIT is a security risk. Add a check for
>>>         this and disallow it.
>>>
>>>         CVE-2021-27138
>>>
>>> Adjust the kernel-fitimage.bbclass accordingly to not use unit
>>> addresses. This changte is required before we can bump U-Boot to 2021.4.
>>>
>>> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
>>
>> Could you pick this and the follow-up patch 0ef3a5e2a6d4 ("kernel-fitimage.bbclass: drop unit addresses from bootscr sections") to the dunfell branch to fix FIT images on U-Boot 2021.01 or later with dunfell?
> 
> I can't do a clean cherry-pick of this patch.  If you'd like to submit
> dunfell versions of these two patches I will add them to my testing
> queue.

Sorry, I should have looked at this more closely. I just sent a backport patch for dunfell. The second patch covers code that is not available in dunfell, so it's not needed anyway.

> 
> Steve
> 
>>
>> Thanks
>> Frieder
>>
>>> ---
>>>
>>> Notes:
>>>     V2 Notes:
>>>       - Adjusted testcases
>>>         (reported by Richard Purdie <richard.purdie@linuxfoundation.org>)
>>>
>>>  meta/classes/kernel-fitimage.bbclass     | 40 ++++++++++++------------
>>>  meta/lib/oeqa/selftest/cases/fitimage.py | 36 ++++++++++-----------
>>>  2 files changed, 38 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
>>> index 2414870817..f5082c93df 100644
>>> --- a/meta/classes/kernel-fitimage.bbclass
>>> +++ b/meta/classes/kernel-fitimage.bbclass
>>> @@ -161,7 +161,7 @@ fitimage_emit_section_kernel() {
>>>       fi
>>>
>>>       cat << EOF >> ${1}
>>> -                kernel@${2} {
>>> +                kernel-${2} {
>>>                          description = "Linux kernel";
>>>                          data = /incbin/("${3}");
>>>                          type = "kernel";
>>> @@ -170,7 +170,7 @@ fitimage_emit_section_kernel() {
>>>                          compression = "${4}";
>>>                          load = <${UBOOT_LOADADDRESS}>;
>>>                          entry = <${ENTRYPOINT}>;
>>> -                        hash@1 {
>>> +                        hash-1 {
>>>                                  algo = "${kernel_csum}";
>>>                          };
>>>                  };
>>> @@ -179,7 +179,7 @@ EOF
>>>       if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${kernel_sign_keyname}" ] ; then
>>>               sed -i '$ d' ${1}
>>>               cat << EOF >> ${1}
>>> -                        signature@1 {
>>> +                        signature-1 {
>>>                                  algo = "${kernel_csum},${kernel_sign_algo}";
>>>                                  key-name-hint = "${kernel_sign_keyname}";
>>>                          };
>>> @@ -210,14 +210,14 @@ fitimage_emit_section_dtb() {
>>>               dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
>>>       fi
>>>       cat << EOF >> ${1}
>>> -                fdt@${2} {
>>> +                fdt-${2} {
>>>                          description = "Flattened Device Tree blob";
>>>                          data = /incbin/("${3}");
>>>                          type = "flat_dt";
>>>                          arch = "${UBOOT_ARCH}";
>>>                          compression = "none";
>>>                          ${dtb_loadline}
>>> -                        hash@1 {
>>> +                        hash-1 {
>>>                                  algo = "${dtb_csum}";
>>>                          };
>>>                  };
>>> @@ -226,7 +226,7 @@ EOF
>>>       if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${dtb_sign_keyname}" ] ; then
>>>               sed -i '$ d' ${1}
>>>               cat << EOF >> ${1}
>>> -                        signature@1 {
>>> +                        signature-1 {
>>>                                  algo = "${dtb_csum},${dtb_sign_algo}";
>>>                                  key-name-hint = "${dtb_sign_keyname}";
>>>                          };
>>> @@ -283,7 +283,7 @@ fitimage_emit_section_setup() {
>>>       setup_csum="${FIT_HASH_ALG}"
>>>
>>>       cat << EOF >> ${1}
>>> -                setup@${2} {
>>> +                setup-${2} {
>>>                          description = "Linux setup.bin";
>>>                          data = /incbin/("${3}");
>>>                          type = "x86_setup";
>>> @@ -292,7 +292,7 @@ fitimage_emit_section_setup() {
>>>                          compression = "none";
>>>                          load = <0x00090000>;
>>>                          entry = <0x00090000>;
>>> -                        hash@1 {
>>> +                        hash-1 {
>>>                                  algo = "${setup_csum}";
>>>                          };
>>>                  };
>>> @@ -321,7 +321,7 @@ fitimage_emit_section_ramdisk() {
>>>       fi
>>>
>>>       cat << EOF >> ${1}
>>> -                ramdisk@${2} {
>>> +                ramdisk-${2} {
>>>                          description = "${INITRAMFS_IMAGE}";
>>>                          data = /incbin/("${3}");
>>>                          type = "ramdisk";
>>> @@ -330,7 +330,7 @@ fitimage_emit_section_ramdisk() {
>>>                          compression = "none";
>>>                          ${ramdisk_loadline}
>>>                          ${ramdisk_entryline}
>>> -                        hash@1 {
>>> +                        hash-1 {
>>>                                  algo = "${ramdisk_csum}";
>>>                          };
>>>                  };
>>> @@ -339,7 +339,7 @@ EOF
>>>       if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${ramdisk_sign_keyname}" ] ; then
>>>               sed -i '$ d' ${1}
>>>               cat << EOF >> ${1}
>>> -                        signature@1 {
>>> +                        signature-1 {
>>>                                  algo = "${ramdisk_csum},${ramdisk_sign_algo}";
>>>                                  key-name-hint = "${ramdisk_sign_keyname}";
>>>                          };
>>> @@ -377,7 +377,7 @@ fitimage_emit_section_config() {
>>>       # Test if we have any DTBs at all
>>>       sep=""
>>>       conf_desc=""
>>> -     conf_node="conf@"
>>> +     conf_node="conf-"
>>>       kernel_line=""
>>>       fdt_line=""
>>>       ramdisk_line=""
>>> @@ -396,19 +396,19 @@ fitimage_emit_section_config() {
>>>       if [ -n "${kernel_id}" ]; then
>>>               conf_desc="Linux kernel"
>>>               sep=", "
>>> -             kernel_line="kernel = \"kernel@${kernel_id}\";"
>>> +             kernel_line="kernel = \"kernel-${kernel_id}\";"
>>>       fi
>>>
>>>       if [ -n "${dtb_image}" ]; then
>>>               conf_desc="${conf_desc}${sep}FDT blob"
>>>               sep=", "
>>> -             fdt_line="fdt = \"fdt@${dtb_image}\";"
>>> +             fdt_line="fdt = \"fdt-${dtb_image}\";"
>>>       fi
>>>
>>>       if [ -n "${ramdisk_id}" ]; then
>>>               conf_desc="${conf_desc}${sep}ramdisk"
>>>               sep=", "
>>> -             ramdisk_line="ramdisk = \"ramdisk@${ramdisk_id}\";"
>>> +             ramdisk_line="ramdisk = \"ramdisk-${ramdisk_id}\";"
>>>       fi
>>>
>>>       if [ -n "${bootscr_id}" ]; then
>>> @@ -419,16 +419,16 @@ fitimage_emit_section_config() {
>>>
>>>       if [ -n "${config_id}" ]; then
>>>               conf_desc="${conf_desc}${sep}setup"
>>> -             setup_line="setup = \"setup@${config_id}\";"
>>> +             setup_line="setup = \"setup-${config_id}\";"
>>>       fi
>>>
>>>       if [ "${default_flag}" = "1" ]; then
>>>               # default node is selected based on dtb ID if it is present,
>>>               # otherwise its selected based on kernel ID
>>>               if [ -n "${dtb_image}" ]; then
>>> -                     default_line="default = \"conf@${dtb_image}\";"
>>> +                     default_line="default = \"conf-${dtb_image}\";"
>>>               else
>>> -                     default_line="default = \"conf@${kernel_id}\";"
>>> +                     default_line="default = \"conf-${kernel_id}\";"
>>>               fi
>>>       fi
>>>
>>> @@ -441,7 +441,7 @@ fitimage_emit_section_config() {
>>>                       ${ramdisk_line}
>>>                       ${bootscr_line}
>>>                       ${setup_line}
>>> -                        hash@1 {
>>> +                        hash-1 {
>>>                                  algo = "${conf_csum}";
>>>                          };
>>>  EOF
>>> @@ -478,7 +478,7 @@ EOF
>>>               sign_line="${sign_line};"
>>>
>>>               cat << EOF >> ${its_file}
>>> -                        signature@1 {
>>> +                        signature-1 {
>>>                                  algo = "${conf_csum},${conf_sign_algo}";
>>>                                  key-name-hint = "${conf_sign_keyname}";
>>>                               ${sign_line}
>>> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
>>> index 0958036a6f..02692de822 100644
>>> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
>>> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
>>> @@ -69,9 +69,9 @@ FIT_DESC = "A model description"
>>>              'type = "ramdisk";',
>>>              'load = <0x88000000>;',
>>>              'entry = <0x88000000>;',
>>> -            'default = "conf@1";',
>>> -            'kernel = "kernel@1";',
>>> -            'ramdisk = "ramdisk@1";'
>>> +            'default = "conf-1";',
>>> +            'kernel = "kernel-1";',
>>> +            'ramdisk = "ramdisk-1";'
>>>              ]
>>>
>>>          with open(fitimage_its_path) as its_file:
>>> @@ -137,12 +137,12 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
>>>              "%s FIT image doesn't exist" % (fitimage_path))
>>>
>>>          req_itspaths = [
>>> -            ['/', 'images', 'kernel@1'],
>>> -            ['/', 'images', 'kernel@1', 'signature@1'],
>>> -            ['/', 'images', 'fdt@am335x-boneblack.dtb'],
>>> -            ['/', 'images', 'fdt@am335x-boneblack.dtb', 'signature@1'],
>>> -            ['/', 'configurations', 'conf@am335x-boneblack.dtb'],
>>> -            ['/', 'configurations', 'conf@am335x-boneblack.dtb', 'signature@1'],
>>> +            ['/', 'images', 'kernel-1'],
>>> +            ['/', 'images', 'kernel-1', 'signature-1'],
>>> +            ['/', 'images', 'fdt-am335x-boneblack.dtb'],
>>> +            ['/', 'images', 'fdt-am335x-boneblack.dtb', 'signature-1'],
>>> +            ['/', 'configurations', 'conf-am335x-boneblack.dtb'],
>>> +            ['/', 'configurations', 'conf-am335x-boneblack.dtb', 'signature-1'],
>>>          ]
>>>
>>>          itspath = []
>>> @@ -158,7 +158,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
>>>                  elif line.endswith('{'):
>>>                      itspath.append(line[:-1].strip())
>>>                      itspaths.append(itspath[:])
>>> -                elif itspath and itspath[-1] == 'signature@1':
>>> +                elif itspath and itspath[-1] == 'signature-1':
>>>                      itsdotpath = '.'.join(itspath)
>>>                      if not itsdotpath in sigs:
>>>                          sigs[itsdotpath] = {}
>>> @@ -182,7 +182,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
>>>          }
>>>
>>>          for itspath, values in sigs.items():
>>> -            if 'conf@' in itspath:
>>> +            if 'conf-' in itspath:
>>>                  reqsigvalues = reqsigvalues_config
>>>              else:
>>>                  reqsigvalues = reqsigvalues_image
>>> @@ -210,9 +210,9 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
>>>                      signed_sections[in_signed] = {}
>>>                  key, value = line.split(':', 1)
>>>                  signed_sections[in_signed][key.strip()] = value.strip()
>>> -        self.assertIn('kernel@1', signed_sections)
>>> -        self.assertIn('fdt@am335x-boneblack.dtb', signed_sections)
>>> -        self.assertIn('conf@am335x-boneblack.dtb', signed_sections)
>>> +        self.assertIn('kernel-1', signed_sections)
>>> +        self.assertIn('fdt-am335x-boneblack.dtb', signed_sections)
>>> +        self.assertIn('conf-am335x-boneblack.dtb', signed_sections)
>>>          for signed_section, values in signed_sections.items():
>>>              value = values.get('Sign algo', None)
>>>              self.assertEqual(value, 'sha256,rsa2048:oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
>>> @@ -298,7 +298,7 @@ FIT_HASH_ALG = "sha256"
>>>          its_lines = [line.strip() for line in its_file.readlines()]
>>>
>>>          exp_node_lines = [
>>> -            'kernel@1 {',
>>> +            'kernel-1 {',
>>>              'description = "Linux kernel";',
>>>              'data = /incbin/("' + initramfs_bundle + '");',
>>>              'type = "kernel";',
>>> @@ -307,7 +307,7 @@ FIT_HASH_ALG = "sha256"
>>>              'compression = "none";',
>>>              'load = <' + kernel_load + '>;',
>>>              'entry = <' + kernel_entry + '>;',
>>> -            'hash@1 {',
>>> +            'hash-1 {',
>>>              'algo = "' + fit_hash_alg +'";',
>>>              '};',
>>>              '};'
>>> @@ -327,7 +327,7 @@ FIT_HASH_ALG = "sha256"
>>>              else:
>>>                  self.assertTrue(test_passed == True,"kernel node does not match expectation")
>>>
>>> -        rx_configs = re.compile("^conf@.*")
>>> +        rx_configs = re.compile("^conf-.*")
>>>          its_configs = list(filter(rx_configs.match, its_lines))
>>>
>>>          for cfg_str in its_configs:
>>> @@ -348,7 +348,7 @@ FIT_HASH_ALG = "sha256"
>>>              else:
>>>                  print("kernel keyword found in the description line")
>>>
>>> -            if 'kernel = "kernel@1";' not in node:
>>> +            if 'kernel = "kernel-1";' not in node:
>>>                  self.assertTrue(test_passed == True,"kernel line not found")
>>>                  break
>>>              else:
>>>
>>>
>>>
>>>
>>>
>>
>> 
>>
