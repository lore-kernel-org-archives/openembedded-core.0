Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.116])
 by mx.groups.io with SMTP id smtpd.web12.2934.1596615694637777900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 01:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=muxC9ARR;
 spf=pass (domain: prevas.dk, ip: 40.107.21.116, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJp4CZ9OlsLNfK0szr8wo1VIZ3GS3p6QyEc0BRUkDlRtryGOjwLcbZEw5YHdHlrCjIIkNAOv5cwIjiNYKDGlZ1n2+QlWBw7MglF+vsEc3QGDQmh2Q8BxQv95cibzZAdcPIPzQSJiT0FNdFDuaCmucRTeaZqyaM9DkTvI+mQxuUMulH+yo1MJ+n9lyY9TNj3phK+pU9s5xmo3hmj+7Oje2TnjnBNDMf8aev5B+P+9T7v/MpH1aoNPMx36NFlpAGveI8ix4f89xHmfVhqtvREdGic7xmcHreX9Vl5jWX/An09hLB/6C1Sb3eOJ+4v7TsQlLoJdkJaZKbPEgch0G/t0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhcYAThN8Gm7K/FXT2YDCYFr64zSu7+oICeS60f1zO8=;
 b=jnLYDfs6o//qIs56vQ88deZqz7NphLZ9oj4jIUZ+2xQFYtImSW+xcnQ+7M0FriMKp7G5jmFyTQxVW75DnE6pPv/yJYO63CIj4Nu4anHFMiyqItW5LyGlvqFwotqs1Yo/hfvn7zOJKxGmQC/szlmBpaS5ShkFOj/sf3H9olnu7m9enolNQt6RTDWZtQdiysW7P7LiOP+TV4ZINZgIxOZkiwRcIkiKYFn7laeJb6sx3jbN3b60hO9Hb4X9zYsvH4RD7CfLBSjchzulzXeIpK8Xqhn+oMEd+CmI+Jcv/mBhAoQeRb6/dz5BLbp/OBdbfUt3hOhzqtAqfHgfwj7uMRnzZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhcYAThN8Gm7K/FXT2YDCYFr64zSu7+oICeS60f1zO8=;
 b=muxC9ARRABbkbf7wS/asxTkZiiKVmj95H33W4GLUpUlyeVsj3yoUeTPZnpeA/3SbrPDBl7kG4mFX/VRsTnuiH1n6U740ifjCTJoD8K73TlbDA4ggANc1dYC0HYTbGjVc1b8NMj6eEgeFX4SYmnC+qPvK5n9ZyX26+w2Xu6145LY=
Authentication-Results: deif.com; dkim=none (message not signed)
 header.d=none;deif.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM4PR1001MB1347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Wed, 5 Aug
 2020 08:21:31 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec%3]) with mapi id 15.20.3261.018; Wed, 5 Aug 2020
 08:21:31 +0000
Subject: Re: [OE-core] file checksums versus SRC_URI globs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Kjeld Flarup <kfa@deif.com>,
 =?UTF-8?Q?Per_N=c3=b8rgaard_Christensen?= <per.christensen@prevas.dk>,
 Paul Eggleton <paul.eggleton@linux.intel.com>,
 =?UTF-8?Q?Kurt_=c3=98stergaard_Frandsen?= <kof@deif.com>
References: <aaad9ac7-be6a-1ffb-6990-ab371ed40015@prevas.dk>
 <20200701140321.wueczs4qd34rbhwh@qschulz>
 <161DDC5BD88A8AE5.10798@lists.openembedded.org>
 <16202C67498F91AC.11682@lists.openembedded.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <1b9d5481-a933-4d47-0673-71e688ae4e25@prevas.dk>
Date: Wed, 5 Aug 2020 10:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16202C67498F91AC.11682@lists.openembedded.org>
X-ClientProxiedBy: PR0P264CA0189.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::33) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.11.132] (81.216.59.226) by PR0P264CA0189.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend Transport; Wed, 5 Aug 2020 08:21:30 +0000
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a2e744c-8bfa-4dae-1e06-08d839188e9e
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1347:
X-LD-Processed: d350cf71-778d-4780-88f5-071a4cb1ed61,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
 <AM4PR1001MB134777DAA44DB906EBEAF893934B0@AM4PR1001MB1347.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 N6WakqMzKYoJmAVJkR1/199Iz/jbiMPZzHhQInB6blBDyELxUJ4MK1iZkKpD9+JX2EeO3Mgz0GlPdyaKqct6XU4LaEQOWNiu1oe65a2i4apbfXLnyKTWFQBAK6ED2GcwV/XI0sknx56LoxQ8jyEdDlhdx1kt7lc7oBPC0uERXmEDRWH7nXz0kfb9yhPGMSPQyPTzxWaamKOfReNfJYZS6YM3VIseSUwiSy8TFYVo0lhZKsfEImheyWr003QlIsWfhCxiJfIWM4qePPeSngILcsFFGYt/tFVyViuXs/b7a6HztakS2xnDBK7m2oFiL8oUZTT+cCHDAcUPkE1YDdlZbW+kjYVLwIMB3H6pwnAqwB1WH+IdutQnieEQhcqK4diT
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(376002)(396003)(346002)(39840400004)(136003)(366004)(16526019)(508600001)(6486002)(186003)(2906002)(26005)(2616005)(8976002)(8676002)(31686004)(54906003)(16576012)(86362001)(44832011)(66556008)(6916009)(66476007)(316002)(66946007)(52116002)(5660300002)(31696002)(956004)(8936002)(4326008)(36756003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
 rSdylK0RRj8MLMSvM8Plc/zn2TnXe19PdI/cZwUD+QN3k5feVuu9JZT+uIzmw1KPX6GkZaN4zPzZqba2QqjTte/i7aEJjsdkUghZJS2h3NepEcdvE5bs8c1LcFWwONTEH0Y6kwDcrhlAp11Q4Mqi5KD+bvVTE0OUp2p95EMEcwDLOb1hPBwC/jCToF1mfasvZWaj6LFH5utictmuR4Rg89uOgcSMe0qpuP+cigLi/9Q8RvLebLNn2ExWCvkSTCR7ovRz5xmvxry6PA6SIBXVV3+B5kLlmS2kbO/vRQvX/9h8mOjfbKQL5WK2chF8iPv7bRQQNOxJrzfcyVekmO5y2rp9uzIAs3AmlBur4NvNs+7wLpm5puUwIn9ekcTaIC51KpDDlbm4PtDy9I+Iap39Ot86E6WcznI0wJHBgufK2GMvVu0DrnIkLE9MFSYIDY4B4myszqnDIKPc3uhNu1AaE7DIuwFA4LUowALce0cb17uU6D92fvt3TWbhSOeZk75XIy8lOzcXSfEseuH8FPDQ+hAaPMm7je+Dy8WaE0JEb3pCYhOqcQ9z1JZU0K2QiogFWAYY85IIwIcsLN0agxkMdmPg4On38ePJ2w1dy6omriFvwWrIjtSgIZFO+7ZNoCKm5SNeDDMYuH0+TJx1lljUtQ==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2e744c-8bfa-4dae-1e06-08d839188e9e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 08:21:31.0738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlDQ3xV98g9+tm+OyNtq3AJlUa5XVmvjQxGl43346VRnuw1UYfUVrwKBbxdaCz9cU3I/XqgWCfoeqBDxVL/BeJoFefD+He/Aq/aoyZ4qeFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1347
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/07/2020 21.31, Rasmus Villemoes via lists.openembedded.org wrote:
> On 02/07/2020 08.42, Rasmus Villemoes via lists.openembedded.org wrote:
>> On 01/07/2020 16.03, Quentin Schulz wrote:
>>> Hi Rasmus,
>>>
>>> On Wed, Jul 01, 2020 at 03:51:19PM +0200, Rasmus Villemoes wrote:
>>>> Hi,
>>>>
>>>> We have a recipe that uses
>>>>
>>>>   SRC_URI += "file://somedir/*"
>>>>
>>>
>>> Glob aren't supported. Use "file://somedir/" instead.
>>
>> Thanks, that actually works for one of the cases we have (there are
>> others that use globs which cannot be solved quite that simply, but for
>> now I'm just listing files explicitly instead).
>>
>> However, I'm not sure that "globs aren't supported". The commit I
>> referenced clearly tried to make that work (better), it also "works" in
>> the sense of unpacking the expected things when building from scratch -
>> there's even
>>
>>     def test_local_wildcard(self):
>>         tree = self.fetchUnpack(['file://a', 'file://dir/*'])
>>         self.assertEqual(tree, ['a',  'dir/c', 'dir/d', 'dir/subdir/e'])
>>
>> in bitbake/lib/bb/tests/fetch.py. And the two upstream recipes
>> connman-gnome_0.7.bb and matchbox-desktop_2.2.bb both use that exact
>> pattern.
>>
>> So either
>>
>> - this is a plain bug in the signature computation,
> 
> I'm guessing the culprit is
> 
> commit 6c0706a28d72c591f1b75b6e3f3b645859387c7e
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Mon Dec 8 21:25:23 2014 +0000
> 
>     cache/fetch2/siggen: Ensure we track include history for file checksums
> 
> which was the one that introduced the ":True: or ":False" suffixing via
> 
> +                filelist.append(f + ":" + str(os.path.exists(f)))
> 
> and then also did
> 
> @@ -981,6 +980,10 @@ def get_file_checksums(filelist, pn):
> 
>      checksums = []
>      for pth in filelist.split():
> +        exist = pth.split(":")[1]
> +        if exist == "False":
> +            continue
> +        pth = pth.split(":")[0]
>          if '*' in pth:
>              # Handle globs
>              for f in glob.glob(pth):
> 
> which practically guaranteed that the "if '*' in pth" would be dead code.
> 
> Richard, do you agree that this is a bug in the signature computation?

Richard, ping?

Rasmus
