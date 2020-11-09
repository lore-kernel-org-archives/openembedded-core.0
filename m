Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.56])
 by mx.groups.io with SMTP id smtpd.web10.8332.1604908309042434783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 23:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MbPWsCPG;
 spf=pass (domain: windriver.com, ip: 40.107.243.56, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFmLwEYC9mX6xw9Idmp2wS/a1sQSlk1WFUagOePBoZG/0LRGvHoJFFBhQRpInKAnQP1YZjWXIGbmX+KWX8v7Y/oaLxRLwkJLXfhBztGR4gV8h6rNmmKQ7Zxz+lLG0af8jXL9nz+jCGIYU85Fe2ms+bW1sTvuoRaEnQObaKjwhjnx1N0nVKr4xIVMWu+dd9xOb/YC72jyp4oaArOclkzDHKBsU1PxFc2rdFX0Ga5yElEAHnV2vC9JYB/IflXZ0avSvbXS8/GTw3hfLqLdXTU0Vx8gQ62AUGtj9ms/yO4hyvBbAtrrM0JaRG745wsy4rxHoBaJbwOnNEc7qCeJ+dQSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us3HtNs5l3lZRXMt36f9sdWlnxsg+nIbfRsUojI4sm8=;
 b=kp4bqN5MPPTeKp78a9hB9jxypgg+xKVeYDFoVIqnR2MJV6OuCL0KYJVVW9W+VD4IEIxUX4p2wy106VnlDCcwB9IwDD6YpxebqMVmavibVXNmYpaOG2nyu4dAanphYeYHFafSppB4QIwRUmsDMA3AfGT4z0QHaOU73uK9Z+gg0opiHl1MeqEEa0EUcG8Eh6lY2xfO43Z4c9lgmZ9HBXb+XIquPuvz268dwQNgLxmsfjrdwfUhgjQfyM7UGsHccRcsFxzlltxg9jW+/PIZ14KpQqF4QTlZ7+vUXF+aD2avUPPXRGrRcLK+vGO7u0E6f66A4JqJbxz93x9RjmWCuXp/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us3HtNs5l3lZRXMt36f9sdWlnxsg+nIbfRsUojI4sm8=;
 b=MbPWsCPGXbtOgS9lSPImL6lVg/tPnozXnc+0CQBnKLI5fj3f7fOm2erHDG4nSXQ+PSohnyq6k8farZwRANHT/FzfPI82m0zK2TMUnlhTI/IbrEsCtzOPz+28iYIVWvip9VIU+xhsmZJeQ56RPH7YJd3KNzmh7tck7dzf+Qylhqk=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB2830.namprd11.prod.outlook.com (2603:10b6:805:57::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Mon, 9 Nov
 2020 07:51:46 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 07:51:46 +0000
Subject: Re: [OE-core] [PATCH] webkitgtk: remove '-fno-omit-frame-pointer' for x86
To: openembedded-core@lists.openembedded.org
References: <20201109003123.31494-1-kai.kang@windriver.com>
 <CANNYZj9dT6GBpFCkfGobL1tJ8K1GRLe9VuJJPaNR4Ubnyr0cCg@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <15a325ef-c583-1afa-ae19-750a0927f2f9@windriver.com>
Date: Mon, 9 Nov 2020 15:51:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CANNYZj9dT6GBpFCkfGobL1tJ8K1GRLe9VuJJPaNR4Ubnyr0cCg@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 07:51:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fce04e46-6d35-4636-32c7-08d884844e74
X-MS-TrafficTypeDiagnostic: SN6PR11MB2830:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB283099AA665C2BA8CF18F57895EA0@SN6PR11MB2830.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qmk/6H0qht1CULsHDU3qBaFQ6pwqclmXoxnx0Njm5V9c7WDzTTznZkY1Ag2v7/YkNnL4lnmYAbX6NHuZeHZ8LqhjiKbZ2+Sjj33QD9ZQ65eDB+fslCkDOMXgnVQlpncLRgiLzyS5QipGsZvKaHya54a9LFGuc3iBKoSK0Eu9VUhUVloRniKFAjz0R4edIhwbpi4p6GU0LFxa1wC6alxLGeWzn+nNQYjl3s5eDBl7bJ+RyKf59Xpy3QeihrA+Pd+zUVOLYaOTOqVkpyUOcTkFLaytVspkd+FlDL7p35AjEO97W8azSHNuiGcwMJ7QB2zDNL2tDr65lFRDyvM1V1v23hfxHw32ih7OKc+1crO1lyX7xYqlOQLfNNmS62Y/ihMkBLrt8jwpuXkI0qEw1BHbEd7e55uooFnSVJOK9b8KEY1gUF/I357IRACYexyNZIps/Fi1RvIypdYdGuFAH52Mbrv+S5CplaFEqhBotQ52Tfg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39840400004)(376002)(346002)(52116002)(66556008)(316002)(5660300002)(6916009)(66476007)(2616005)(26005)(956004)(6706004)(6486002)(8676002)(53546011)(33964004)(8936002)(31686004)(166002)(83380400001)(31696002)(478600001)(16576012)(186003)(66946007)(16526019)(86362001)(6666004)(966005)(36756003)(2906002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xuhEXkiy1mRhL77hAlDi/5oGoqgqpYN75Vc5TQmAqn4xp698r1Bw/IMes02WQiCVay1FB4OoMUq+2CmDz9zE02maV70eRLDXjRuDGNRttVcBkaQKk0y4DPacYdexbAvYBvwe09psnleihJeSMJoK1MPvBwNMhDC0YK7vfiO0t9wNfp7nyGv1aKzMZTpVX5dHGheN0GR94j0vfSM/V+WOOwJCUnFGU0T3J8vlqaPNNFbNk4J2hSQ0PKve1Ht6o4zoMtnEaFepv7+kiW3a51fAy1EDKyR/oSv93wNAFr051u15r+o+kJT8o788ZOsrAl4XF/+nFrOfBTlsaRH0TYVK2Mi0X5NKup739zkzCw3tgfZoWowL/WQ2RaMbyLBoncIeJLkmEXAN6YMus5P0557+flxQt3QIe6UYHmf54RFncbf19KFrcAaO1/7gw4sHdjIY0X0mxdY4M6cVUTWAhExGM4Cnl7UkesBZPug54f7AHKvic2WkI9ODV8+tFwvl/eWPPPKD9XSriL5mPm2eVTVg973Cso9utaR0ZMwJguPqL9SHLzIdqz/izT0DXhcHZiCmkPi01V/uZa6rD0IZ9I3M8bjO44z1AwdlLEngmK+23lOEf7KhTHW8YHYyYzeg4R6HCE8KCAfElpPHv3meYZK8yQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce04e46-6d35-4636-32c7-08d884844e74
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 07:51:46.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ktsqdKMw3Uh8ANBCjVbG4M9eAAuFv61KexOBfJauCmaSHDjXmJxjtGXLYILioHnYUsqrIHfLpOwAOTZHgCtrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2830
Content-Type: multipart/alternative;
 boundary="------------25303CBF06781C81D068FFF9"
Content-Language: en-US

--------------25303CBF06781C81D068FFF9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/20 3:32 PM, Alexander Kanavin wrote:
> This is not seen on the autobuilder, which does world builds on 
> qemux86. Something might be wrong on your side?

Just the option '-fno-omit-frame-pointer' which is not set by default. 
We have a build with an extra config in local.conf:

SELECTED_OPTIMIZATION = "${PROFILING_OPTIMIZATION}"

which expands to

SELECTED_OPTIMIZATION = "${FULL_OPTIMIZATION} -fno-omit-frame-pointer 
-fvisibility=default"

then it fails to compile webkitgtk. It could be reproduced with upper 
config line.

Regards,
Kai



>
> Alex
>
> On Mon, 9 Nov 2020 at 01:32, kai <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     It fails to compile webkitgtk for qemux86 if compile option
>     '-fno-omit-frame-pointer' is applied:
>
>     |
>     TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/webkitgtk-2.30.1/
>     Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:
>     | internal compiler error: in find_oldest_value_reg, at regcprop.c:438
>     |    47 | }
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>      meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>     <http://webkitgtk_2.30.2.bb> | 1 +
>      1 file changed, 1 insertion(+)
>
>     diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>     <http://webkitgtk_2.30.2.bb>
>     b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>     <http://webkitgtk_2.30.2.bb>
>     index 1acba6be1d..11fdb59034 100644
>     --- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>     <http://webkitgtk_2.30.2.bb>
>     +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>     <http://webkitgtk_2.30.2.bb>
>     @@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
>      # which is not enough for binaries larger than 32 MiB
>      CFLAGS_append_arc = " -mlong-calls"
>      CXXFLAGS_append_arc = " -mlong-calls"
>     +CXXFLAGS_remove_x86 = "-fno-omit-frame-pointer"
>
>      # Javascript JIT is not supported on powerpc
>      EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
>     -- 
>     2.17.1
>
>
>
>
>
> 
>


--------------25303CBF06781C81D068FFF9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/9/20 3:32 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj9dT6GBpFCkfGobL1tJ8K1GRLe9VuJJPaNR4Ubnyr0cCg@mail.gmail.com">
      
      <div dir="ltr">
        <div>This is not seen on the autobuilder, which does world
          builds on qemux86. Something might be wrong on your side?</div>
      </div>
    </blockquote>
    <p>Just the option '-fno-omit-frame-pointer' which is not set by
      default. We have a build with an extra config in local.conf:</p>
    <p>SELECTED_OPTIMIZATION = &quot;${PROFILING_OPTIMIZATION}&quot;</p>
    <p>which expands to</p>
    <p>SELECTED_OPTIMIZATION = &quot;${FULL_OPTIMIZATION}
      -fno-omit-frame-pointer -fvisibility=default&quot;<br>
    </p>
    <p>then it fails to compile webkitgtk. It could be reproduced with
      upper config line.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj9dT6GBpFCkfGobL1tJ8K1GRLe9VuJJPaNR4Ubnyr0cCg@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, 9 Nov 2020 at 01:32,
          kai &lt;<a href="mailto:kai.kang@windriver.com" moz-do-not-send="true">kai.kang@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
          <br>
          It fails to compile webkitgtk for qemux86 if compile option<br>
          '-fno-omit-frame-pointer' is applied:<br>
          <br>
          |
TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/webkitgtk-2.30.1/<br>
          &nbsp; &nbsp;
          Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:<br>
          | internal compiler error: in find_oldest_value_reg, at
          regcprop.c:438<br>
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
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------25303CBF06781C81D068FFF9--
