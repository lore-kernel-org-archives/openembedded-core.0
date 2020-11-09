Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.60])
 by mx.groups.io with SMTP id smtpd.web12.8639.1604909922440470089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:18:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ProocAzS;
 spf=pass (domain: windriver.com, ip: 40.107.237.60, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY+b3zvsVWI49kVZCAJQN+QKee3pIHtLcI+ggji/tvsIOn/h8ELK1RPGetJ6xNgfqvWMzXQRytKof1YOTxjex2IZoM1SCqEo7NgOsfwSZjfwlpYM2U86uX24KF410wK0+5sazCt2e3+L8Pn1riho8+esWjKdTL6CPAgTZmyogGcHyDQfEQ1hveCYHNfFBw6eHyYHxqHy1gZGXXIN/f0dU/vyvfUQp2NjnrIPl01aqMLj6qwbSFMueauCTXusQtQ5aDgvvy/q9N31fU92KUUzltwg62VtfewfRXHuW2zQ5W1+5sDt2hvO+64lQScyrn7uFnbWbE6UHhJQrZyF2piWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/NiTMCwL6mClnkKg+22KHwjX+Qoza//FBtCbEkLrpA=;
 b=DWt6CW+G166iO/gPYp7v8VBWe0fckFPh+ga4O+5lZlHvITFoZBWWMzTyAnLU8xCm9/uWLjs7n/2+MwFIsogqjZpwTzN80T5wXNXxAHeLGJuczL6qX4ij4P1yvstAfd00c3Xsfw6XWmpJgpjgPsEiqAcg7S40EBVAsfhUTD+i2ISsj4SOzLvit7mxeWpKLpmpLxfwJJV21bxaxI4M9+9LSLCttlXK8QJ+HW0Pn7Qdn91ZF0n7SDT3JyLMTShyWofAant59gCXJF+2AhOhFcFFuYnVqmEtY6a4CMYH/kmKy1KPBfBchZo7RyPzmOufavT5LuVrNzQWUgtvsD/9A+pXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/NiTMCwL6mClnkKg+22KHwjX+Qoza//FBtCbEkLrpA=;
 b=ProocAzSRvaX479DK7v/0BV9ml1jUqyouM6YipyUYEr8s8zlGKJqGy/am32Kak4lYjLIx8Zc4WqamFu5yBoNNR7HqabUXxktYOgO5Xgh5EOcdT5nLO4UpFvxjxk05Sc38QnZVfOAIOc3tlEhSIB3ITCHcexQuWxk+KMHWtqVkJQ=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB2781.namprd11.prod.outlook.com (2603:10b6:805:62::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 9 Nov
 2020 08:18:40 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 08:18:40 +0000
Subject: Re: [OE-core] [PATCH] webkitgtk: remove '-fno-omit-frame-pointer' for x86
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20201109003123.31494-1-kai.kang@windriver.com>
 <CANNYZj9dT6GBpFCkfGobL1tJ8K1GRLe9VuJJPaNR4Ubnyr0cCg@mail.gmail.com>
 <15a325ef-c583-1afa-ae19-750a0927f2f9@windriver.com>
 <CANNYZj_ku_fWOyn_pkTsC0ygCRXT7QrTS8AedH-VEhvAcr+t4Q@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <8b13424d-115a-037b-cdd8-16c264a48ff7@windriver.com>
Date: Mon, 9 Nov 2020 16:18:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CANNYZj_ku_fWOyn_pkTsC0ygCRXT7QrTS8AedH-VEhvAcr+t4Q@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::30) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK0PR01CA0066.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 08:18:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3acdd714-34fe-48ab-8e36-08d884881091
X-MS-TrafficTypeDiagnostic: SN6PR11MB2781:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2781F377B0DBA08D0B074E6C95EA0@SN6PR11MB2781.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UzjBCqxLQ093pBxNavGxW38pvSEl5vUr44acNZ04afRyZJBPw1ALAfr9yWBBBrTnOOG2FMSSQaaUwZ0j5doAQaRUyKUWh7EWhYECcLuVfa2C98mDxzxY+cS15ipEZsfREUFpbqbUQjhBEX8DHoBy9ZI8pDpTbk+yf82wVfw38J+8aQzJUa2P6wuRH9YTrFE/9Beiabpa/PgzjF0sRMA0auZxlo7rq4L3xD1y0ScbDSdoVjc2ExVP8Z0ruQKf4jvZbiN/BHeXpVwYydc/sCjT6Cq3XvzIVUHcT3TVIh50tg3xzzNud7Ek6drqTVbw+mrNUnzY2F6zyozK9/S/VzI85g2P7ZsFZdw+0yYyJRBmfPTAgq4ZpEk1VPuhwTb4rwx6X6H23cWJOfQnUiLHs4EJhsDdzeeWpsjcloG6ts5OStEeUJsSCbaFgCKrPjrRqNn+coxiD9AZHdhbGa8KDj3XwEkiiIaTmUAcalk19UIm0vo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(83380400001)(36756003)(53546011)(6486002)(4326008)(26005)(8936002)(316002)(86362001)(31686004)(186003)(66946007)(66476007)(66556008)(6666004)(16526019)(166002)(956004)(31696002)(6916009)(478600001)(33964004)(2906002)(52116002)(6706004)(8676002)(966005)(5660300002)(16576012)(2616005)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kNtCxbOhVp+3wyLLWyauTlzVbQrkipjVv4a3YjgQjgg4aANPfxvudnaSqHVgQxSHgOdd7LlS1/K77igHCjrjGGmNQLeeo8xwf4GhdkB1Q+oLLBb+Q2GZiPJn99/dG8tCoOVevZ66kiNB23Ab2mrNlLcukhewlKKsdju4fUFO1i01k7+pfyoLlmrnWNlIsYeOcIGGsMOzk/H2QbKq5W0RiAJMqANT20vpelD6YiLlc48N3bA91bxX8ZKL34+o8HUs6cRrt0mPO03liSeFR88XmBX1rhU4a+UY96Ml7SawZZW7iuIjzf+h34stNggEZgMAP4VoEtNrl7z7+mbLyiDA29k/Yb98x7a3CHxJ2OyjJEHuq+3fiXeYjTqpVqe68M66avERUwkRw3a7mHYcNgRorqms/MJngx/1chMzrl/uklUp3HGGFmvDiu1UYRAXPrNmazVLFDPW0U70UEat8EGS/I6az/O2/j/7g0kSWvmOsiW8Zfhy5GLgumJQCGtjrsVWg+3f+LDFQ9PkrLJ6nL+TC/GKdtYq0mZ0EqGNzJcnZzEORZnWt5bD4MVndLbjUUA5/RHF+vE6wyrjtH8PRInHiferuDlq0z97exoOy6/dyWmOmzVC81hd+fZOv5KNpMwvlpEpcR9AhU5WVAAW4kITZg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acdd714-34fe-48ab-8e36-08d884881091
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 08:18:40.3087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gyyhmGRzeVxwMzEugZcTSMKM11q/czYNv+QW+ghGI8M4qmu4fNK4QJU62iR00vjxFB3IExNgMHdC+m/JeZs9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2781
Content-Type: multipart/alternative;
 boundary="------------7A5AC89A393DA81669A874ED"
Content-Language: en-US

--------------7A5AC89A393DA81669A874ED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/20 4:07 PM, Alexander Kanavin wrote:
> Right, but then adding _remove to the upstream recipe doesn't seem 
> right - rather you should use _pn-webkitgtk override in your custom 
> config.

I suppose '-fomit-frame-pointer' is common compile flag that other 
people may also meet this error.

Regards,
Kai

>
> Alex
>
> On Mon, 9 Nov 2020 at 08:52, kai <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     On 11/9/20 3:32 PM, Alexander Kanavin wrote:
>>     This is not seen on the autobuilder, which does world builds on
>>     qemux86. Something might be wrong on your side?
>
>     Just the option '-fno-omit-frame-pointer' which is not set by
>     default. We have a build with an extra config in local.conf:
>
>     SELECTED_OPTIMIZATION = "${PROFILING_OPTIMIZATION}"
>
>     which expands to
>
>     SELECTED_OPTIMIZATION = "${FULL_OPTIMIZATION}
>     -fno-omit-frame-pointer -fvisibility=default"
>
>     then it fails to compile webkitgtk. It could be reproduced with
>     upper config line.
>
>     Regards,
>     Kai
>
>
>
>>
>>     Alex
>>
>>     On Mon, 9 Nov 2020 at 01:32, kai <kai.kang@windriver.com
>>     <mailto:kai.kang@windriver.com>> wrote:
>>
>>         From: Kai Kang <kai.kang@windriver.com
>>         <mailto:kai.kang@windriver.com>>
>>
>>         It fails to compile webkitgtk for qemux86 if compile option
>>         '-fno-omit-frame-pointer' is applied:
>>
>>         |
>>         TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/webkitgtk-2.30.1/
>>         Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:
>>         | internal compiler error: in find_oldest_value_reg, at
>>         regcprop.c:438
>>         |    47 | }
>>
>>         Signed-off-by: Kai Kang <kai.kang@windriver.com
>>         <mailto:kai.kang@windriver.com>>
>>         ---
>>          meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>>         <http://webkitgtk_2.30.2.bb> | 1 +
>>          1 file changed, 1 insertion(+)
>>
>>         diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>>         <http://webkitgtk_2.30.2.bb>
>>         b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>>         <http://webkitgtk_2.30.2.bb>
>>         index 1acba6be1d..11fdb59034 100644
>>         --- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>>         <http://webkitgtk_2.30.2.bb>
>>         +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>>         <http://webkitgtk_2.30.2.bb>
>>         @@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
>>          # which is not enough for binaries larger than 32 MiB
>>          CFLAGS_append_arc = " -mlong-calls"
>>          CXXFLAGS_append_arc = " -mlong-calls"
>>         +CXXFLAGS_remove_x86 = "-fno-omit-frame-pointer"
>>
>>          # Javascript JIT is not supported on powerpc
>>          EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
>>         -- 
>>         2.17.1
>>
>>
>>
>>
>>
>
>
>     
>


--------------7A5AC89A393DA81669A874ED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/9/20 4:07 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_ku_fWOyn_pkTsC0ygCRXT7QrTS8AedH-VEhvAcr+t4Q@mail.gmail.com">
      
      <div dir="ltr">
        <div>Right, but then adding _remove to the upstream recipe
          doesn't seem right - rather you should use _pn-webkitgtk
          override in your custom config.</div>
      </div>
    </blockquote>
    <p>I suppose '-fomit-frame-pointer' is common compile flag that
      other people may also meet this error. <br>
    </p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj_ku_fWOyn_pkTsC0ygCRXT7QrTS8AedH-VEhvAcr+t4Q@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, 9 Nov 2020 at 08:52,
          kai &lt;<a href="mailto:kai.kang@windriver.com" moz-do-not-send="true">kai.kang@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <div>On 11/9/20 3:32 PM, Alexander Kanavin wrote:<br>
            </div>
            <blockquote type="cite">
              <div dir="ltr">
                <div>This is not seen on the autobuilder, which does
                  world builds on qemux86. Something might be wrong on
                  your side?</div>
              </div>
            </blockquote>
            <p>Just the option '-fno-omit-frame-pointer' which is not
              set by default. We have a build with an extra config in
              local.conf:</p>
            <p>SELECTED_OPTIMIZATION = &quot;${PROFILING_OPTIMIZATION}&quot;</p>
            <p>which expands to</p>
            <p>SELECTED_OPTIMIZATION = &quot;${FULL_OPTIMIZATION}
              -fno-omit-frame-pointer -fvisibility=default&quot;<br>
            </p>
            <p>then it fails to compile webkitgtk. It could be
              reproduced with upper config line.</p>
            <p>Regards,<br>
              Kai<br>
            </p>
            <p><br>
            </p>
            <p><br>
            </p>
            <blockquote type="cite">
              <div dir="ltr">
                <div><br>
                </div>
                <div>Alex<br>
                </div>
              </div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Mon, 9 Nov 2020 at
                  01:32, kai &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">From: Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
                  <br>
                  It fails to compile webkitgtk for qemux86 if compile
                  option<br>
                  '-fno-omit-frame-pointer' is applied:<br>
                  <br>
                  |
TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/webkitgtk-2.30.1/<br>
                  &nbsp; &nbsp;
                  Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:<br>
                  | internal compiler error: in find_oldest_value_reg,
                  at regcprop.c:438<br>
                  |&nbsp; &nbsp; 47 | }<br>
                  <br>
                  Signed-off-by: Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
                  ---<br>
                  &nbsp;meta/recipes-sato/webkit/<a href="http://webkitgtk_2.30.2.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">webkitgtk_2.30.2.bb</a>
                  | 1 +<br>
                  &nbsp;1 file changed, 1 insertion(+)<br>
                  <br>
                  diff --git a/meta/recipes-sato/webkit/<a href="http://webkitgtk_2.30.2.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">webkitgtk_2.30.2.bb</a>
                  b/meta/recipes-sato/webkit/<a href="http://webkitgtk_2.30.2.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">webkitgtk_2.30.2.bb</a><br>
                  index 1acba6be1d..11fdb59034 100644<br>
                  --- a/meta/recipes-sato/webkit/<a href="http://webkitgtk_2.30.2.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">webkitgtk_2.30.2.bb</a><br>
                  +++ b/meta/recipes-sato/webkit/<a href="http://webkitgtk_2.30.2.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">webkitgtk_2.30.2.bb</a><br>
                  @@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc = &quot;
                  -DENABLE_JIT=OFF &quot;<br>
                  &nbsp;# which is not enough for binaries larger than 32 MiB<br>
                  &nbsp;CFLAGS_append_arc = &quot; -mlong-calls&quot;<br>
                  &nbsp;CXXFLAGS_append_arc = &quot; -mlong-calls&quot;<br>
                  +CXXFLAGS_remove_x86 = &quot;-fno-omit-frame-pointer&quot;<br>
                  <br>
                  &nbsp;# Javascript JIT is not supported on powerpc<br>
                  &nbsp;EXTRA_OECMAKE_append_powerpc = &quot; -DENABLE_JIT=OFF &quot;<br>
                  -- <br>
                  2.17.1<br>
                  <br>
                  <br>
                  <br>
                  <br>
                </blockquote>
              </div>
              <br>
              <fieldset></fieldset>
            </blockquote>
            <p><br>
            </p>
          </div>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------7A5AC89A393DA81669A874ED--
