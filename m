Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.67])
 by mx.groups.io with SMTP id smtpd.web09.3201.1605182802881661633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 04:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y2lH5IKK;
 spf=pass (domain: windriver.com, ip: 40.107.102.67, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzZots4Yob/JnIAAmu53A37nWqZR00PwmvsPiYiM8vkESGYQN1DaPlUZWpfndbEgoqJZUw5/FObKEC9nek0NE1R9JalInfLL1pwvmqRm+i6t5GMAjqtYZK3n1+tscRtWS0GhD+O5y5Um7KdbPYWes75ThRI8FKjXm58XBjMUwm+OKwcWR4L3/Z7dRzbCehabjmj+tiwAxXuveIkHGR9HQQdmhHE9Tm5dlDhE9JD4yeYSODbWJDBvBUfqAXDK8lyzldjPpCjNeLQWD39ns3unUB//WBLMO8Lb2e9Reu94BaIkEsD0BTbquZcMD87epFe7zZsHIEqBfGeWpTXMc8kXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQ6j+0jJattQ4TSkoz6YuOKPMEaZZazyvz62LTpI7pw=;
 b=d8XZNxxSVaVdsmjiw81lb06VyJDM89JDb78H2cjWiezlBMkuJ1prHf6ralVviMEvfL7LOxtq4xDSEBj9ouUhL4UoVGQlxJj6u2yTYhBp6QZd9XfAnHvJZG7AWak2AF8JWb+31R2ZtwMw8YybCS2eWQG/fFTYeoxvo8LFuz429uKh7kGQoJDlSJDoCMS6VU7l5yYswcwajGagVe5dTuOpewwKtVWF9rregv5h6r76zwForWzdRJtwfhXKHk03LF45o3L+zAyTsrF48RCa3rsde9Vk5Uq+ScNIgSZ6pyQznwjFV3H2t5HzmUmrLVqv4nF5TWlY7i6/Bwg+9lbzKF1uAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQ6j+0jJattQ4TSkoz6YuOKPMEaZZazyvz62LTpI7pw=;
 b=Y2lH5IKKPOjfm880NYCpCAvIHuAhVxOwUqrODPT3/J2okLCNK9QSk5FJ1FnENTX8EBpi76c/hk7CHHnrak24aMVM6wpPm9mlwTI5QC81wCuHQUSxE4YX2jitjdIwUYDmAO+ZJd9OXegbvoqpRFyVUPWX5J8XB1RU6l1ZdsxzrkU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA2PR11MB5209.namprd11.prod.outlook.com (2603:10b6:806:110::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 12:06:40 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 12:06:40 +0000
Subject: Re: [OE-core] [PATCH 1/1] oe-buildenv-internal: Support extra settings
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1605180304.git.liezhi.yang@windriver.com>
 <9d68429be743586fd36b8f76f086fea16968054f.1605180304.git.liezhi.yang@windriver.com>
 <20201112122412.3dfaaf80@opendreambox.org>
 <2aaa45a7-a835-98a6-d49a-09c56e875721@windriver.com>
 <20201112124730.6bc38ee2@opendreambox.org>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <8fea0429-7cc6-f3ab-ff55-232393339907@windriver.com>
Date: Thu, 12 Nov 2020 20:05:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201112124730.6bc38ee2@opendreambox.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:203:b0::25) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by HK0PR03CA0109.apcprd03.prod.outlook.com (2603:1096:203:b0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 12:06:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df637f1-e97f-44b1-1159-08d8870369b9
X-MS-TrafficTypeDiagnostic: SA2PR11MB5209:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB52097171C91566DE847FD6E3FFE70@SA2PR11MB5209.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RgnNgf5lZd7CIreoQFpPx5aeBY81E8uZ65ZJakZ4cpywMoIB9/E8u4fkNDroLgDq7dejuyWiFINfAvqpTdUsCdRAZnY+NGqA9Hl+bHnNabSR1AefZ6JJsrTKw7ESY3ZFdMT59Vdzbag5DcLnqCzlAEOl25R1SOlOa/oPihz4WJa3QtRMAPc1yp6+FYXySE4TiTS+lUiWEKWhXqi/eyOyHXsTENW1ZelTlBlxsOEZM6vjdJyEOBK7OHUsNNOqEjeqbm6SRYcOYgCGgVAEZecaFn+wOebIrO1MUjfMlPg7SxKNwLQMafkTnxk7PTZvDHUfuBsaL9HEpxodvpWLRauS2ifjsjtUifp2YOvf4JrnkxKtdsrSp4roF9b4mg12d6SWEU85Z80bDHPumFS3xva2+A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39850400004)(53546011)(2616005)(956004)(31696002)(478600001)(66574015)(16526019)(186003)(4326008)(83380400001)(26005)(5660300002)(6486002)(6666004)(86362001)(66476007)(6916009)(66556008)(316002)(8676002)(31686004)(8936002)(66946007)(52116002)(6706004)(2906002)(36756003)(16576012)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	deKhRIrjCwNyyJczcKIh/rtdW1I0Q2678pE9yRrDkbc9DsWoCACgraDYF889sWruvhgTnU2N3x1L3eYm/Ure4ATekK1llLIPvlgtTTDKp+/0FuF0eBihqq4WAmjn1QO27YkzhFwsZsujxVZiXAkVWa5i/oxPRlsiqa94Bmk9iF4+Sx1vyS4Qx2Vf8bJ39UwJ77DOousGDjIm0S3WItqybfc/jK/CUIQHpMIMz+CFfDY/hh7MleLk/fkb40TibyISsa3lVx8RCYINzKM2Qp7bdE/88bnB/YcFjo7oIdbTGlPLCj+5T0yrBy1rGJziSex9kVHU1OhB+Z3+j39JB5u8946crbqW7zKz+E/ipz41WcQaXHj1zQAE0icnHYN6IAuFbuZAWWNW/7KaPupv5ktPf4xCuwZY6q4wpxYrJTNnzOK+pgHM7nnOxaY4OyYdgXWPGReLftJFjnwx2y/AbvH3a2A4YiLTFpc815puPDy+THGwELZ3oKd3eOJrxzmr3z0b0UQeSvBQYBxG4V51w4i7vhqX3JFpAP4gOjrtHTnFKtoyO+0fMXQ4z1P8fG38CUSS6qod+da3Iif3c2oG9ZR5Kjy51YGyiMWslOWeglfm68/rtDz7d6nUadbsDBIrHRM3XAM4Ld3QMxdAPWr76AD9sQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df637f1-e97f-44b1-1159-08d8870369b9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 12:06:40.2872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bf2SjYv7qe26hCQPnfNcIJXKwNCLmB0tTHyS1NymFdrL/BMSZiszY+QTcvmGluhTgDPblfXE7WTV6Blab/8QXvTyPRcRHKYVt+qd+9bNFgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5209
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/12/20 7:47 PM, Andreas Oberritter wrote:
> On Thu, 12 Nov 2020 19:32:59 +0800
> Robert Yang <liezhi.yang@windriver.com> wrote:
> 
>> Hi Andreas,
>>
>> On 11/12/20 7:24 PM, Andreas Oberritter wrote:
>>> Dear Robert,
>>>
>>> On Thu, 12 Nov 2020 19:25:49 +0800
>>> "Robert Yang" <liezhi.yang@windriver.com> wrote:
>>>
>>>> This can make it possible to do extra settings such as PATH for other layers,
>>>> for exampole, other layers may also have scripts directories as oe-core, we
>>>> have to run them with path since they are not in PATH, for example, there is a
>>>> tool meta-browser/scripts/firefox-gen-l10n-recipes, we have to use
>>>> /path/to/meta-browser/scripts to run it. Make oe-buildenv-internal check and
>>>> enable $OEROOT/extrasettings, and set a line like the following can fix the
>>>> problem:
>>>>
>>>> PATH=/relative/to/$OEROOT/meta-browser/scripts:$PATH
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>    scripts/oe-buildenv-internal | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
>>>> index ba0a9b44d6..bf84003d72 100755
>>>> --- a/scripts/oe-buildenv-internal
>>>> +++ b/scripts/oe-buildenv-internal
>>>> @@ -98,6 +98,10 @@ for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
>>>>    done
>>>>    unset BITBAKEDIR newpath
>>>>    
>>>> +if [ -e $OEROOT/extrasettings ]; then
>>>> +. $OEROOT/extrasettings
>>>> +fi
>>>
>>> I think this filename isn't very descriptive, and people finding this file might wonder what it is about.
>>
>> There is no such a file by default, the file should be created by other layers
>> or people out of oe-core.
>>
>>>
>>> How about sourcing all files (maybe with a given suffix like .sh) in $OEROOT/scripts/oe-buildenv-internal.d/ in lexical order?
>>
>> If we do this, people need to patch oe-core/scripts/oe-buildenv-internal.d/ to
>> add their own settings, and oe-core can't accept such customization patches,
>> then it would make their oe-core repo non-fastword because of the local patches,
>> so I'm afraid that we can't do this.
> 
> The same restrictions apply to $OEROOT/extrasettings.

There is a slightly different, if make a symlink outside of oe-core
to oe-init-build-env, then the symlink's dir will be used as OEROOT:

if [ -z "$OEROOT" ]; then
     OEROOT=$(dirname "$THIS_SCRIPT")
     OEROOT=$(readlink -f "$OEROOT")
fi

So $OEROOT/extrasettings can be in the symlink's directory which is out of
oe-core, but '$OEROOT/scripts' can't since it conflicts with oe-core/scripts,
another directory such as $OEROOT/oe-buildenv-internal.d/ should work.

// Robert

> 
