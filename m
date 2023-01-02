Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFB6C3DA7A
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 15:40:55 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.62])
 by mx.groups.io with SMTP id smtpd.web11.37923.1672674050214944062
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 07:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=D9NrIxoT;
 spf=pass (domain: weidmueller.com, ip: 40.107.249.62, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPpYPOYl/2EQpAILzBwuVYmzmPTWwZuO4u0jGDDXjQLS7+UJDML7+FFDn8TSUScQZyU8NkZGWcjykz11U9TXwuv+6LAVCrZiTmll9OivQcUjWnHM5uRMCaCxnLcPPrkcaY9Zb7Z5Vm/WxtJQ81z70DP5gXWPur1AeP/zmgy+yEdtO2zmHcImjKzZjx3aw3XVLbtjmzmsQ8PKfxXs4HJ5CTGzcilKUf2It+lD2O92pUW7ZqyX8qaGPQmvbjuovs1iXbG7FRLie3MCTnmSISZM58o2nZI9PSOpEd0p4XGW3P+5XgW4CEO1R7D19GWHjFWxsHrCUeqL8/0bqgSIvNwZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImEd6f6k6blXNndGDgk3AC9L8RmT0Xr5+4pl37HyB8U=;
 b=k/4jGdnVjWc6T8rsLvjTA6Yve4gNH4BVkEPgFYvsntwPAbf8EUjn6x0xj6poqrFqXIOIczZJmHty44bw0O5iamqf08vIWjxtuvvDnI5t7lZBwqOzwd2F+L6sJtWloQfOxFD4IT8OaAnJvGJGDlEwWmF20dpmeszGPeJj+cazzIPyn7NZxd7r+Njst3EfONIbpJ2aKF7sf5AmZP1J1hVm5Zfzlaaw6y87Qsmca8Uiov963phsmc2/ud6LaZ4ytVJVNwpT1/AIb2joPYcKpYSxYaUimRmm+fTZ3R/Vp/6ZGUCxcSUnx6KSAG53IGXK2SaJsgmv2wE3f03RpW0NsTBlZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImEd6f6k6blXNndGDgk3AC9L8RmT0Xr5+4pl37HyB8U=;
 b=D9NrIxoTFAkHp212D3TixCl82ZBkBvTADV3dEUo/bhbjV2Lwil12QytHOlLSjxR+Yp4o8rw9J5nbAn9OiZ1yPQe5Z1JjCupiGuPKfEoohTpcrbQYeky18apXyvEOsoXvOHrwW9gMEEjw/GpjghxpON0F9go29/NIkwYqkBOfDp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Mon, 2 Jan
 2023 15:40:45 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c370:cf8e:e9c3:bd7f]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c370:cf8e:e9c3:bd7f%5]) with mapi id 15.20.5966.017; Mon, 2 Jan 2023
 15:40:44 +0000
Content-Type: multipart/alternative;
 boundary="------------vrM0rjGsB4zUPpNMP7dY15wT"
Message-ID: <ca96be7a-3d74-7b98-e75d-1fad03eab97f@weidmueller.com>
Date: Mon, 2 Jan 2023 16:40:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
To: Martin.Jansa@gmail.com, Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: lukas.funke@weidmueller.com, stefan.herbrechtsmeier@weidmueller.com,
 wonsang.ryu@lge.co, =?UTF-8?B?66+86rK97KeB?= <dp.min@lge.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
References: <20221222150246.91423-1-uvv.mail@gmail.com>
 <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
 <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com>
 <5910a96e-28a2-4af6-2dc9-bc21e8bee9fb@gmail.com>
 <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
 <3d6e9c54-6d00-9400-d8ef-25109e95b775@gmail.com>
 <CA+chaQc=BWsEPXNp1gN4SzUeZ+0AEh2ori=Se36vVpuk8b3kYw@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <CA+chaQc=BWsEPXNp1gN4SzUeZ+0AEh2ori=Se36vVpuk8b3kYw@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6969:EE_|AS4PR08MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd0e56e-ecbc-4660-d416-08daecd7b639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gEYXi+RJ22uK4+phjBESiIjhpkKaDTC2knkOBi+FsCek7yBZ71vK+qxVV6aqXbcf2XNIwKxKqJ0alHxXCAMtGCCnXtUqjM54eUf87WGK2vlt6ttYryfoAfKrbZkd1Txfsv2Lx2JzxA0Glq6c45NKfI0FLKwHZTxAce7Z93kGVMNl8UvjKEExVRqkW8gIcpBiUeKfnG5YFN8GD4L/D0WanJRVL9VptJh8UDtZoqcZfLqcAViQmPTD83DmtJkIvBVZE7kWwRDbfA/8GIJXOn6YTMCKQVXRIBG1Z4QtEnasYeHP3+DvOKqy470hnpHbooJrmLL8NN3SlSLjQiiIpYlCbx31jSaGatlMB+GhpKBSnHyg40LXUPu0fVHHNMWRVlP8Ly26b60rrwk04umQag6m5St3duSnYhltCAw1ODcJy5wOD6K2tOM1Lh2GIRuwcDQmXTCxO3W3NjfFmgHsWhG5Jwb3IEWOSMZSUUFp6TZFv2vFXrAiVaM8N6htowxwdLGByV5TkjXGO3WUHeSKe+J+V1r7buaXHQikakRQopSViry+KXmAG3/mCKDJUN7jI7S9EdZKg9S06yfTlG4g7jq4CnacsCUC6dSRnSAKqCf/SS5RukQKD2pPXdWPIbOlLBLHr6NYa/FE5ITW0L1YWq0QIVwowGvweG1InpGVLZHN/5z4CBgqyj2lEqjvAuJXXNV63P08k1dmzz6elNI4VD4DqTX85yVGMAY/YlDnDaOVv0LSrIzpHblZAF7bwi+imjLfAR73VHC8hDIKEjB3CVwWbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(451199015)(31686004)(36756003)(6916009)(31696002)(86362001)(2906002)(54906003)(316002)(38100700002)(38350700002)(186003)(26005)(53546011)(6506007)(33964004)(83380400001)(2616005)(6512007)(8936002)(52116002)(66946007)(5660300002)(66556008)(41300700001)(6486002)(478600001)(66476007)(4326008)(8676002)(22166006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2ozTkJjdXFGN2loYnY3Yis1SCtEbXdBYnBWUGJJSHhwbGRRMkNGd3hVd0Zh?=
 =?utf-8?B?aEtLRlhqRHRJTk5JWk1mVHMwczlJclJDNmR0dW0zZ3BrajVmejBrNTk1YnZl?=
 =?utf-8?B?dVQ2L2NkQ29ONkhyaGY2R2lFRjl0VE9pZ1BwaXRYaFVZNGR1S1FiUHM1S0Nl?=
 =?utf-8?B?TElpRlkrdTNkaUZpZm41R0MySldxZEFqUW9uT0FDN3pFSDRlMzFtOURGSk9m?=
 =?utf-8?B?dnlmaUxGMzdWK3ZpSTJxV0RFNjUyUndWbFBiRmNCVXF6bk1IWHNLM2JHYnE1?=
 =?utf-8?B?VUx3MDJjU3V3ZVRkWHZzbnRjOWNzNnQ3bHlRUExqNERmTjZXRlo2cGcvWVg1?=
 =?utf-8?B?ZjRmK2VOeEo4N3NmeHlzVjl0SXcyTmk2c1JxNy9TdGR4MTk1dTQrcXNYQ1Fl?=
 =?utf-8?B?S1dFZjhzRDlFUHRzb2w3bWpWVGwvQ3U4eEpybGk2Q3MwM0VMSit6KzFRZ0Fy?=
 =?utf-8?B?MHZoY3NheDB0MDNld2MySkttUmZLVHFxdFNCSEVhMTExM0d3UWNqNFBDUlM0?=
 =?utf-8?B?VEFQa2c5NXNCRXJkcGhueU11Ui9pOU1nc09ScjYvWi8rK3BTTmIwUGpqM2FT?=
 =?utf-8?B?M20yaFlGcjhhYjBQT3R2VHQrRU1uRTdxemk1NHEwN3EyNUdlM3MxRkIwS0l6?=
 =?utf-8?B?MzZ2TjU2RmtPWnIxQWpNUmZ0Tk8ra25VTVhxUm9pV1ZzVlhkaTBCMkRqZklN?=
 =?utf-8?B?SnQzbDYzcWlDdVBrajVkQy9UZk5RY2p2SEJjMFhQdDR0MHJjRkhLNGxQU3Jy?=
 =?utf-8?B?c2dodTlMUGcvN0doczhJQThIazF3Wkk2aVRXRk5IMnY4MmZjZlgyU1I3OWs5?=
 =?utf-8?B?OTBHeWpMdFhKZDM1NGg3S3JHazk0TGpORzI3R29FandTWDhzRS9TWXJwTk1H?=
 =?utf-8?B?NlpwNE1taHlDSGQvRlNQb1BqN1RaRTh0aU4vdW1rY2U1aUxmWWdTMVBqZFBm?=
 =?utf-8?B?TC9rQjh0L0dyWGUxQTVoVTZBU2VnNUF6QWE2S21mOHAxVkdXdGpJUmtJTUlV?=
 =?utf-8?B?NW5ES0pZTkJSODBDVEF5RDZ1eWtyWldRV3Q4cGJiOXdLa2pDSmxrN0plTUtI?=
 =?utf-8?B?MGdSWkw2aE9la3VoeTYwcWpvMFhuZlVEM0FETDNDQTdNMGwwUzgzUjJRdVd1?=
 =?utf-8?B?SXcrTXluWmYzQVUzb2M4RXVmbVBRVHRIbVJ2U3psZE83ZGJ2M0JJZk9UTHFq?=
 =?utf-8?B?a3ZiNVhQQ1J3TVhLR21PNXZjcklwcFhYaDZwOXBtM1E0K3F5Y1ZsQThURHpF?=
 =?utf-8?B?STRYMjFyNVdaU2VBb3B5S04xeHhuNUg1VDArNXZ6SDVhTTQwQ1FnWTc1YWVG?=
 =?utf-8?B?RTM5MXp0VUR4dWVXakFyV2tIL0RDQTQ4OUszRWNsL0JyN0VRRWhmZUE1WUxO?=
 =?utf-8?B?WXo3a0phNisxQVVQVlAwQ0VyRlF2eUNMNHV2dmtjUjV2U2xyaWVzeGNNR1dx?=
 =?utf-8?B?SlA0d3laY0E0NGEvL1FTMk9Sc3M0OGE1UHg1SUdURUV5ekdsSHJtV1R2YUVj?=
 =?utf-8?B?bFhYMDV2ek1CN1dGK0t6M3lUajhJM2U1Ymo2TGZuRkdoUnpuQXJ1TGJ0Q3JJ?=
 =?utf-8?B?UDNFTU50MUFuQ05JVmh5OXYrTkg3a2FQYjdGd1cralFrY0tiSU10dzZ4eVBy?=
 =?utf-8?B?SlJ2ckJOTzNwTEFXS1BKVmYwT2J2UTNySUw3ZXp3VHJMaVdZaGtHSzY5a1hV?=
 =?utf-8?B?aTF1b01leUx6bGNrZllBMnY3VkhRaE9FVFhRaWxRZWRUUWRLZUs4NGl5eDhl?=
 =?utf-8?B?ZlBXQkMrWDhMTnZzYmRDSXYzanlIT21MS1dLWTUzR0xkTmUrbGtZakhSd3Zk?=
 =?utf-8?B?NW1mMW9FTmFNZ2hURmdJM0s3ci9Ua1Y0cFJ3R015Wit3SWFJSlFwREZkaG12?=
 =?utf-8?B?VVgwSFQySlEyRzloOFZWWTVVYnlXSjM3UjVJeWM2NkhYSWtmeUtMY1VVcUR3?=
 =?utf-8?B?cG1zZTc5TExRR1VsOFkzaExvbVlwVVJ2dlJMZ3orMWVLLzNtbTI4dHVWSVRJ?=
 =?utf-8?B?K2JiU3g2YURPSEtnZUpaTkc2MW5TcEpOcGJyYVdRWWN4UUw3WlRXb09CemhD?=
 =?utf-8?B?MnErMWcxWVVLdXo2Y3A3ZGEvMjllVkh6YUpNdUYwMGl6VXNRT0VrL3BFZVBH?=
 =?utf-8?B?TXpsMTZKalF5UGlHVUVGRXYwbnBsd3dqN01LTEpQNHprZnQ3a21qZ2tZUEF5?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd0e56e-ecbc-4660-d416-08daecd7b639
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 15:40:44.7926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cayAdk3ZF5Bhxxde2b4cFcY8/8qJswgxwji6LKxNBFub/TksOHOlkWSmtXocWL1r3P+V9cp+7ZDAe86DGMFEjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 15:40:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175317

--------------vrM0rjGsB4zUPpNMP7dY15wT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Martin,

Am 26.12.2022 um 10:59 schrieb Martin Jansa via lists.openembedded.org:
> On Mon, Dec 26, 2022 at 10:38 AM Vyacheslav Yurkov 
> <uvv.mail@gmail.com> wrote:
>
>     Martin, I did see that patch series, but I was not sure about its
>     state, therefore I didn't try it. If I understood correctly, that
>     partially solves the issue, but the proper solution should involve
>     the fetcher, that's why it's not yet merged to master. Am I
>     missing something?
>
>
> That's not my understanding.
>
> The proposed changes for recipetool had some cosmetic and functional 
> review comments and it doesn't work correctly for every possible go 
> dependency (e.g. the 3 issues I've mentioned from telegram recipe), 
> but it's very good starting point and we should be able to get it 
> merged in master (and then everybody can more easily contribute fixes 
> for the corner cases where it might not work well yet).
>
> Even missing documentation IMHO shouldn't block merging it at this 
> point, because there is a clear need this (as there are already 3 
> partial implementations to fix this issue, neither 100% complete and 
> nothing merged in master - the recipetool changes are IMHO the best of 
> 3 as it integrates with devtool as well and seems to be most complete).
>
> go fetcher in bitbake is another possibility for future, but 
> generating the long deps in SRC_URI is much better solution then 
> enabling network in every go-mod recipe.

Does an agreement exist if we should use a package manager class which 
creates a wget fetcher URI (ex. pipi) or a specific fetcher (ex. crate 
and npm)? At the moment both specific fetchers have different URI 
styles, create their specific tar commands and doesn't reuse the wget 
fetcher. Furthermore, the crate fetcher doesn't check the integrity 
during fetch. The fetcher inside bitbake have the advantage that you can 
fetch the latest version (ex. AUTOREV), but it brings the risk of code 
duplication and missing features. If we have an agreement and a common 
style its easy to replace the function with a specific fetcher.

Regards
   Stefan


--------------vrM0rjGsB4zUPpNMP7dY15wT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Martin,</p>
    <div class="moz-cite-prefix">Am 26.12.2022 um 10:59 schrieb Martin
      Jansa via lists.openembedded.org:<br>
    </div>
    <blockquote type="cite" cite="mid:CA+chaQc=BWsEPXNp1gN4SzUeZ+0AEh2ori=Se36vVpuk8b3kYw@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">On Mon, Dec 26, 2022 at 10:38 AM Vyacheslav
          Yurkov &lt;<a href="mailto:uvv.mail@gmail.com" moz-do-not-send="true" class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <div>Martin, I did see that patch series, but I was not
                sure about its state, therefore I didn't try it. If I
                understood correctly, that partially solves the issue,
                but the proper solution should involve the fetcher,
                that's why it's not yet merged to master. Am I missing
                something?<br>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>That's not my understanding.</div>
          <div><br>
          </div>
          <div>The proposed changes for recipetool had some cosmetic and
            functional review comments and it doesn't work correctly for
            every possible go dependency (e.g. the 3 issues I've
            mentioned from telegram recipe), but it's very good starting
            point and we should be able to get it merged in master (and
            then everybody can more easily contribute fixes for the
            corner cases where it might not work well yet).</div>
          <div><br>
          </div>
          <div>Even missing documentation IMHO shouldn't block merging
            it at this point, because there is a clear need this (as
            there are already 3 partial implementations to fix this
            issue, neither 100% complete and nothing merged in master -
            the recipetool changes are IMHO the best of 3 as it
            integrates with devtool as well and seems to be most
            complete).</div>
          <div><br>
          </div>
          <div>go fetcher in bitbake is another possibility for future,
            but generating the long deps in SRC_URI is much better
            solution then enabling network in every go-mod recipe.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Does an agreement exist if we should use a package manager class
    which creates a wget fetcher URI (ex. pipi) or a specific fetcher
    (ex. crate and npm)? At the moment both specific fetchers have
    different URI styles, create their specific tar commands and doesn't
    reuse the wget fetcher. Furthermore, the crate fetcher doesn't check
    the integrity during fetch. The fetcher inside bitbake have the
    advantage that you can fetch the latest version (ex. AUTOREV), but
    it brings the risk of code duplication and missing features. If we
    have an agreement and a common style its easy to replace the
    function with a specific fetcher.
    <p>Regards<br>
      &nbsp; Stefan<br>
    </p>
    <br>
  </body>
</html>

--------------vrM0rjGsB4zUPpNMP7dY15wT--

