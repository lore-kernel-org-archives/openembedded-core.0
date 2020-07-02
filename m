Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.125])
 by mx.groups.io with SMTP id smtpd.web11.1209.1593672125816631162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 23:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=DmqrEpQz;
 spf=pass (domain: prevas.dk, ip: 40.107.2.125, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhnIb39OFJ2CyVn3LacdH8ahFuBz7UriReG74YinXuE7vM36vS4RiSjnEEDIBx9hmPmSTEoEBIKkpUneLhxq/AKWZm6WkrKZ3GKWDQDSwIDY7JmfwG1gtmZeFB0kMD3JdKOANYbvkWP3j/dU5nR6RlxE+22RygO3GTlhdTCOn4fNMauWm0opJcIVcuC4pWL/zzSalsrN1/R4Ee9CXhYluGwCZjtahYauo8+krZlm6nTR+LFraIABKvq48VTAD3zzcsLh6EyiYylToNmuJTBlxr0T4rDBRA2zam3mx5/h0WPWpjdeuaVRGR7Ao2csaYKFAcrTffbbQWWNvZEETpczkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqQyuD/d+jyg2gBFJsIQmQZ2XY/t38fL1ejh1iUJclU=;
 b=HZ6PWOuEOxGkU0/8CwLMjm9hNWvX8FZXEIOaCAZ/8wl6SOMFrMUqfN1BdkZJY9ZKBPnzZOL8n3H7QuDrPl7TULLjm0EOBO/16tQB0bZjMywgizoJj7PEwykfoVQTvZBidpozc5VlAN5dxh/ef3MbqTorDhxnBsWQrYomvK6M5fM/wCIgbN0csE9oCe1iYffMllwE3La8fZZmplaiNx9eVbKUHH/quUHKJKEkGyeeIDR7iwhivI+dipZwCMFaftScBKptrQ+k9/siY7E5IOIWMLNmrAGP1ZTdqLEl52V6vrP0OAGLJ7lMzyfR5WVFFxHyNsevc5n8iGHwoJIMmvULeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqQyuD/d+jyg2gBFJsIQmQZ2XY/t38fL1ejh1iUJclU=;
 b=DmqrEpQzOYHQdQcEnRdwYB11dnP9cHiozbcOWvAzS/gVmPFxEYtoTTqB8RUzQwxYXemjEi5YFTUEZX29jMaJPw/UyHo+ad3/iC7JY72btwieLGSFVMqJMfqmRZaJM9Zjhjqn/Je5Q46zf1R6K8VDnmYfWfKkHSPSuIzhtHWz53c=
Authentication-Results: deif.com; dkim=none (message not signed)
 header.d=none;deif.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3603.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:156::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Thu, 2 Jul
 2020 06:42:03 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663%7]) with mapi id 15.20.3153.023; Thu, 2 Jul 2020
 06:42:02 +0000
Subject: Re: [OE-core] file checksums versus SRC_URI globs
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Kjeld Flarup <kfa@deif.com>,
 =?UTF-8?Q?Per_N=c3=b8rgaard_Christensen?= <per.christensen@prevas.dk>,
 Paul Eggleton <paul.eggleton@linux.intel.com>,
 =?UTF-8?Q?Kurt_=c3=98stergaard_Frandsen?= <kof@deif.com>
References: <aaad9ac7-be6a-1ffb-6990-ab371ed40015@prevas.dk>
 <20200701140321.wueczs4qd34rbhwh@qschulz>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <c16556f1-5f7f-4562-77e2-7da33e5c345f@prevas.dk>
Date: Thu, 2 Jul 2020 08:42:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200701140321.wueczs4qd34rbhwh@qschulz>
X-ClientProxiedBy: AM0PR10CA0013.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::23) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.11.153] (81.216.59.226) by AM0PR10CA0013.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Thu, 2 Jul 2020 06:42:01 +0000
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eba17557-13ba-4486-d28a-08d81e5306d3
X-MS-TrafficTypeDiagnostic: AM0PR10MB3603:
X-LD-Processed: d350cf71-778d-4780-88f5-071a4cb1ed61,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
 <AM0PR10MB36039C9A4C32D533B9B3D2B3936D0@AM0PR10MB3603.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 0452022BE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 Js/9jlwB3UPxpWDnNGuXdUle1f8qdpAuSemcAyFYzTbs0TwlmsEEtKVfR13ZD+w8WDucYBmSUXgZtwrBk46j3nE7d2jp0ZAIipAmKnyTyOG2n1Rp7xsEqEzXYCoTvpzMw7BDQK4V6vozpdXYoRof0bNjYFyKFDULjAD4D2u9rmPYGUEB3M8T8EYy+mvO+tGPlTlLV37HACAu0NodFmyJ6p/Kphm7967WIpCs4avw6j654tEnXg6XWStwmq8NIzxckxnhQzak4gNs4W96CjdtqXX2VUe3sOQHuTPKE7w0wplEoQ0H6KgJWqTyRQuxpo3NJoleBDp+pyN1x1cdVEKYsTiqoxII/h30vGumYDgT24EJom8+MsDxCvFGY6FpLpBT
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(346002)(376002)(136003)(39850400004)(44832011)(52116002)(83380400001)(8676002)(2906002)(31696002)(66946007)(66476007)(66556008)(478600001)(86362001)(6916009)(2616005)(8976002)(4326008)(16526019)(186003)(956004)(26005)(8936002)(5660300002)(31686004)(36756003)(316002)(6486002)(16576012)(54906003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
 wiU9aoWKrJ5Md7FjWAWzfDzUtM91JemPO62lCzzkHvBYNWA4R8Xq6lvhdxPFVmE/BnnKeIhFs6boNdvz3PGEHWl590E8aZTYAa8pysvTqHTTVPcldpEc21NhJTrLyX+NmnzOLVpF5pNWb+Rt6k8AB8iEmiBgrKtXiIzQzzdlcz/jKbZdjWq1f04tDfWtim1N+ccBcbRHpcqsvnGuMwEJQ42inGrmu2MQAbZbdhl3UJXtBnx/C244zrjARrxuKg2BJzSrdll3IU6/8p8MRpP/xR8LTj3EsiiG47ZeAyYERe2/zlALUANjMVqXBjSZGLcR+oTyr9LDvu3AGh1B1nPAhUXIekb7dj3Kw2LDsgtRT25PtNG+NDbvKu2+4If7ro1rVnKb6Ke8PCnCdOW1RNs24y6x9I0G2RBhJ50P7YZvDtfL5oYBnyD2lY0WZ7F9zKEnk395Vns1cBsRoGt2hwFZTFaiqZDya/7+EwzIhbP9UIM=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: eba17557-13ba-4486-d28a-08d81e5306d3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2020 06:42:02.7114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ac6mydm2r+h28LNcSJElUsvNbLGoqq1sDwo0n9KXlfLX3YtwqtaYB3e/S1UDOWt86OsIzsC+aG17StR9Gh+c5PfHFU8eVCV9h/sVf+N5lbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3603
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/07/2020 16.03, Quentin Schulz wrote:
> Hi Rasmus,
> 
> On Wed, Jul 01, 2020 at 03:51:19PM +0200, Rasmus Villemoes wrote:
>> Hi,
>>
>> We have a recipe that uses
>>
>>   SRC_URI += "file://somedir/*"
>>
> 
> Glob aren't supported. Use "file://somedir/" instead.

Thanks, that actually works for one of the cases we have (there are
others that use globs which cannot be solved quite that simply, but for
now I'm just listing files explicitly instead).

However, I'm not sure that "globs aren't supported". The commit I
referenced clearly tried to make that work (better), it also "works" in
the sense of unpacking the expected things when building from scratch -
there's even

    def test_local_wildcard(self):
        tree = self.fetchUnpack(['file://a', 'file://dir/*'])
        self.assertEqual(tree, ['a',  'dir/c', 'dir/d', 'dir/subdir/e'])

in bitbake/lib/bb/tests/fetch.py. And the two upstream recipes
connman-gnome_0.7.bb and matchbox-desktop_2.2.bb both use that exact
pattern.

So either

- this is a plain bug in the signature computation,
- documentation lacks a big fat warning that using globs in file://
should be avoided unless one has a fetish for tracking down bugs due to
confused sstate, or
- all code that makes glob patterns work should be ripped out so that it
is indeed not supported, thus eliminating this footgun.

Rasmus
