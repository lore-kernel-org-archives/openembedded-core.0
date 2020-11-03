Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.83])
 by mx.groups.io with SMTP id smtpd.web08.3872.1604409922699476208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 05:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mX2BXz3y;
 spf=pass (domain: windriver.com, ip: 40.107.94.83, mailfrom: jason.wessel@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6QQHbb3DxgsCiixbW/WivE5WX2Bp/wCVLlv8LhyFNk/rojytf7vqD90V/bBu1Z3UBxDz0s2/+wcRuciRePSs78AtYomhjM71sFo9m5I5h584cG0Ven7BouMNA8DdtT03G4XvrJiUcejVklyw7saIFUDgL3Gm3X1/8Q6wbg+XFuKzRg2fkNMhN2niyTGM0Ecy0MaxI66jn87DZJpgBEymFZef9J1CmeGraa3icZeZNjrr9eplKvK95Pdp/0YaCOf5Bl5iLJemgY8ftUCAhxVr9S0TAfTFTqhixgnPVvYuhIHjflssmxjbtVBnaKPUIYd3XIh28S1ynd7QimNNj8LNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJ+2k+KZBPYzZ9Go12uRWwzIqi6fOmfxM3VgyLNvwns=;
 b=LYgX8Pd8tJCKZb04OfSoZkkz6W7x92Mw0oOCjrDNUMNbtLAvJMAGObfaJiTbM1okSxUXstddi3uGc/3TpbNQtbrxGxi12XKOlI5Z5TvhiYuKpWRw7cnUcMDMv8LySFDnk8a0UNzkx0Gb/xyYG+IBszrm9+q/SJYNjr3C5q4A0pssvR6DLm6h5rwfF3WvcTcuYKKM+zNqemC14YsFoAcnflMMPMYfZjLhTE7tR/0L3mULYx8q5pOlJkzeL1U0LMxxvJV+tSDabbKjzGYi9M7jv4Tr4Vqm8sWIrhf48XHUw5ss/AqoCI47+KWeYP0CPr0C+l9HB3E8W/7gwyUWHriBvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJ+2k+KZBPYzZ9Go12uRWwzIqi6fOmfxM3VgyLNvwns=;
 b=mX2BXz3yOI800LTHRH/Pg7+iqNLrmIdqZT+DjUuJ8nKN5MkeleaIvq/fXWWo2QufPikPKwKmLa3bpGyPGGlI4PkbDIE9ktqDnahLbNJIrbdq/6lezf7pI2JgH/mOyZfmmvjBG3t6vyz54vTSXZ15iPCMYrFbAgDoQ4WgpRuuifc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3514.namprd11.prod.outlook.com (2603:10b6:5:61::26) by
 DM5PR11MB1930.namprd11.prod.outlook.com (2603:10b6:3:106::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.27; Tue, 3 Nov 2020 13:25:19 +0000
Received: from DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97]) by DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97%2]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 13:25:19 +0000
Subject: Re: [OE-core] [PATCH v2 1/2] base-files/profile: Add universal resize function
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20201102222852.38452-1-jason.wessel@windriver.com>
 <CADkTA4PuAX+p96ogha6vRcpz_-3DSOYRTZ4hOZ6id6acVGgAJg@mail.gmail.com>
From: "Jason Wessel" <jason.wessel@windriver.com>
Message-ID: <fe6de5d5-c79a-2432-b9bc-9efbf99265f4@windriver.com>
Date: Tue, 3 Nov 2020 07:25:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4PuAX+p96ogha6vRcpz_-3DSOYRTZ4hOZ6id6acVGgAJg@mail.gmail.com>
X-Originating-IP: [73.74.120.8]
X-ClientProxiedBy: BY5PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::34) To DM6PR11MB3514.namprd11.prod.outlook.com
 (2603:10b6:5:61::26)
Return-Path: jason.wessel@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.0.2.15] (73.74.120.8) by BY5PR20CA0021.namprd20.prod.outlook.com (2603:10b6:a03:1f4::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Tue, 3 Nov 2020 13:25:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd181d06-3f77-408d-1a62-08d87ffbe89d
X-MS-TrafficTypeDiagnostic: DM5PR11MB1930:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB19302AECD2590B0DE9894D7C97110@DM5PR11MB1930.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	noOaygFz0iHe64AIAaQ5Th8EcR7xaKoxboDeD0NlmRmewyT/r6oLYC3gKwfTy5sSLLIfNaaAq5DdPQVb4xUso5KZhblBz+vD/ztVzhmKC+nvP7RYLeKMvpagN5vl3nfLdYzk94VNQw7AtosWDkAdYiJUGS5tZkB5YNYDYhCCtruzt6XQ1mh4cl2opk5ZtyxwFhJP+ZluSKIJOMAtGB58AOrK0PCxlYZClR/r9Yd5aszAmXEpzVy/Urw7c3ZVTgzTsop+laGrjFzSlFfZpD3QnMk+shKj5T3w9SFAFw+64jcJ7cPlouoDx815CqF5QA/9tXGryEog0fuu8lVMk5Es0IlstVUy/Ttu9oOJfemlHEfaqrlS/DVrewtJjMUXvALA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(366004)(136003)(5660300002)(8936002)(16576012)(316002)(6486002)(86362001)(8676002)(83380400001)(66556008)(66946007)(66476007)(31696002)(6666004)(52116002)(6916009)(2906002)(4326008)(53546011)(16526019)(31686004)(2616005)(956004)(26005)(36756003)(186003)(44832011)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jqpaadw2gN1l27kc5CzVMEj4jn7f9C98ERuz0/GdrTubAT7xsXL7HzSsxx+dn4KmlNaz2GF6uOHpKmsTkGld5Zd7EN1zjjZq3/6J75J43PGyC1kxv/pxY44Li2+jRkKC076Na3iqTlJ2FMcMpkVvCyas/Z7aJpdNiZb97zkET5rePiaFUjNzZ7w/JPgYo5Yetk01NmkQJYl2jQ8q1jJIq5EJA4kRDSUB6LDrem10vToLSW/i5wzGWHfSHJliKDzwlZPcLvEpRsp8RaCDv4tlmgu84iOq0Yr3H2b2tT7SY1j9henypuAmXmM+vJhNUs/t+cnpHqBLbw1Xrkxy2dFYoF2JjbX/LRLENGZEWpAAARdXmk6NpUf2vpGY04LK4RgV2qLtOkabI6yXNXG7FM6SQDeFHQysQrljzV4lzTeM2G2Z3dhw7+ZzzZ1+tzubSDDL1EUdiyIM6mRGvcW0sJ7GLaI2Rc7cKCXFtaJm2ODATIEx2R52ZCwQGRfp9ADLAEm2v14K5a0LSBhxyZdQYLUs2tSlS37K7iWO/AnNDnFe7Jo1eAeSHENVcXlRiwOW3Sr+YltL4m7eDF9DyZH8ifTLSvP/Vw1E5ltReIza4nKwiOsxkOOdCCJhp4G7cAWHPDoEphoa8aznJ7yxnU5RmDiLOw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd181d06-3f77-408d-1a62-08d87ffbe89d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 13:25:19.1272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqfbK7reew8yv+hcZzNGWjy+fJnWb3gyAf0qBemqNOSsYJT5NeRppEI4u1N9UOCozso5voby0JHi/NBdKn4wXPjB2DSBMIo7qyWc6gR/KpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1930
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/3/20 7:15 AM, Bruce Ashfield wrote:
> On Mon, Nov 2, 2020 at 5:29 PM Jason Wessel <jason.wessel@windriver.com> wrote:
>>
>> Using an editor or any kind of command line that wraps beyond the
>> column width of the session on a serial port is quite problematic
>> unless you are using an 80x24 session.
>>
>> The original /etc/profile tried to use the resize binary if it was
>> available.  The problem is that you only get the resize binary if
>> xterm, or busybox is installed.
>>
>> This updated /etc/profile will add a resize function available to the
>> shell when no xterm or busybox resize binary is found.  More care is
>> taken in this new version to test that terminal is interactive.  The
>> EDITOR and SHLVL environment variables are checked to prevent resize
>> from running necessarily.
>>
>> The function definitions are not indented intentionally to keep them
>> to the 80 column width.
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>  .../base-files/base-files/profile             | 48 ++++++++++++++++---
>>  1 file changed, 41 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
>> index 9e4283e0c7..cc37e1ba77 100644
>> --- a/meta/recipes-core/base-files/base-files/profile
>> +++ b/meta/recipes-core/base-files/base-files/profile
>> @@ -2,7 +2,6 @@
>>  # and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
>>
>>  PATH="/usr/local/bin:/usr/bin:/bin"
>> -EDITOR="vi"                    # needed for packages like cron, git-commit
>>  [ "$TERM" ] || TERM="vt100"    # Basic terminal capab. For screen etc.
>>
>>  # Add /sbin & co to $PATH for the root user
>> @@ -20,13 +19,48 @@ if [ -d /etc/profile.d ]; then
>>         unset i
>>  fi
>>
>> -# Make sure we are on a serial console (i.e. the device used starts with
>> -# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which tries do
>> -# use ssh
>> -case $(tty 2>/dev/null) in
>> -       /dev/tty[A-z]*) [ -x @BINDIR@/resize ] && @BINDIR@/resize >/dev/null;;
>> -esac
>> +if [ -t 0 -a $# -eq 0 ]; then
>> +       if [ ! -x @BINDIR@/resize ] ; then
>> +               if [ -n "$BASH_VERSION" ] ; then
>> +# Optimized resize funciton for bash
>> +resize() {
>> +       local x y
>> +       IFS='[;' read -t 2 -p $(printf '\e7\e[r\e[999;999H\e[6n\e8') -sd R _ y x _
>> +       [ -n "$y" ] && \
>> +       echo -e "COLUMNS=$x;\nLINES=$y;\nexport COLUMNS LINES;" && \
>> +       stty cols $x rows $y
>> +}
>> +               else
>> +# Portable resize function for ash/bash/dash/ksh
>> +# with subshell to avoid local variables
>> +resize() {
>> +       (o=$(stty -g)
>> +       stty -echo raw min 0 time 2
>> +       printf '\0337\033[r\033[999;999H\033[6n\0338'
>> +       if echo R | read -d R x 2> /dev/null; then
>> +               IFS='[;R' read -t 2 -d R -r z y x _
>> +       else
>> +               IFS='[;R' read -r _ y x _
>> +       fi
>> +       stty "$o"
>> +       [ -z "$y" ] && y=${z##*[}&&x=${y##*;}&&y=${y%%;*}
>> +       [ -n "$y" ] && \
>> +       echo "COLUMNS=$x;"&&echo "LINES=$y;"&&echo "export COLUMNS LINES;"&& \
>> +       stty cols $x rows $y)
>> +}
>> +               fi
>> +       fi
>> +       # Use the EDITOR not being set as a trigger to call resize
>> +       # and only do this for /dev/tty[A-z] which are typically
>> +       # serial ports
>> +       if [ -z "$EDITOR" -a "$SHLVL" = 1 ] ; then
>> +               case $(tty 2>/dev/null) in
>> +                       /dev/tty[A-z]*) resize >/dev/null;;
>> +               esac
>> +       fi
>> +fi
>>
>> +EDITOR="vi"                    # needed for packages like cron, git-commit
> 
> If we set vi as the default, should it be in the RDEPENDS for base-files ?
> 
> It's a bit of a grey area, since base-files has some special
> dependency tweaks, and you actually need to trigger some functionality
> for this to be used .. hence it isn't a hard rdepends.


The issue you are pointing out has nothing to do with the problem the patch
is solving.  As far as I can tell the EDITOR=vi variable has been set
for the entire existence oe-core.  I just moved it as an extra safety
check for not continuing to run resize in subshells, which does happen
today.

If that part is controversial for some reason, I'll revert that part
and just check SHLVL.  

Jason.
