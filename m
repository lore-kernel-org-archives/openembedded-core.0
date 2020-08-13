Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.80])
 by mx.groups.io with SMTP id smtpd.web12.1787.1597284187211896589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 19:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Krd4kouz;
 spf=pass (domain: windriver.com, ip: 40.107.243.80, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXfWgGa8c2dy4Tcq/l7OAi5YLNdnYRsM+oRLnPLtDFdw7pUQMDHITmhbdh3MOBzEg/pOZkDrexOus5LVubKZQnN9MYDCo4B8gA8rQ4qJhoAsh3Ep78fmc9joDIZ6hxC77AE06EVqpPdscpkFE0PE7PLuqnUYID4M8cSSLkPbDHY5PnfcXvh784ezlAqapdzsF77T2/7Bntajdgf0VbN80qenJLGzV7ZwpK+Rgc/6uKzmfNpx78lgt5OdKyRgges3nWu20R03CH3EJO51pM3uFzDS+f7iPdxUufHAFX/NpbgEG+sSBzyOjMzmdZYfxTZTVdSrr7mlaw83ccimyz/KqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YVIJDqz9CIGcmmyPhIgnmJgjJHMikzl5MwrmI5Flv0=;
 b=I6ghhDyJWtiYWN0fAFUdZ0wN4iAb5vozXLBowQn8lpTPXM4IhHT1ZDNN0LNShBJz6DLitxw26vSRoiQuH8gcxSKxjUaAz4IHpuIfVsDtBtKSHCtdtJBduDg9aUjWECuzdQCXHTFBMsr7vKf+7/Yq9Yg06yaUgG8jgPMZRJQ2zGOXW4kppI0XjEyaiwXQSCCdoEWbKQd57aQfKK4xirnoDLjXAQ7bih7oK9xq0IU9/g9tpQ2J2AopuTY/O77erthIvcgPIKe7bAqjg0EEE8g+4igMQFNTWXmB27pbUg4FCmj+2gAym0WHsjBBaXSMLWViSHtyHK2X4bOhioahzBRCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YVIJDqz9CIGcmmyPhIgnmJgjJHMikzl5MwrmI5Flv0=;
 b=Krd4kouzmemLMuiq0fM3oauBgMxYkJb14oXkJiuHCq8htMe90Uumo7Pd9eZBe2E3nIH4ZTVw7cd6aajGGm3WKzFgKWqkyD1XAbgHRgDhOsuqTNwhkKxOU77zgIlwNIDjgaZFwHwGlRO93TB+xFSH/q0bSGAGdjba/R3ZxHjRGNI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4104.namprd11.prod.outlook.com (2603:10b6:a03:18f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Thu, 13 Aug
 2020 02:03:04 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::e91c:b2c9:b293:dab2]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::e91c:b2c9:b293:dab2%7]) with mapi id 15.20.3261.026; Thu, 13 Aug 2020
 02:03:04 +0000
Subject: Re: [OE-core] [RFC PATCH 2/3] tcmode-default: use go-binary-native by default
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20200616170538.1049884-1-ross@burtonini.com>
 <20200616170538.1049884-2-ross@burtonini.com>
 <1a012137-cde9-d770-8a67-aa5ca65b608a@windriver.com>
 <CADkTA4Nb8P3SV9JdB71w_6BJPHnefkGYPDChE0+L=5VyOsB8PA@mail.gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <007f3bff-ecf0-6c41-44cd-149def9eb74a@windriver.com>
Date: Thu, 13 Aug 2020 10:07:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CADkTA4Nb8P3SV9JdB71w_6BJPHnefkGYPDChE0+L=5VyOsB8PA@mail.gmail.com>
X-ClientProxiedBy: HKAPR03CA0026.apcprd03.prod.outlook.com
 (2603:1096:203:c9::13) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HKAPR03CA0026.apcprd03.prod.outlook.com (2603:1096:203:c9::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3305.10 via Frontend Transport; Thu, 13 Aug 2020 02:03:03 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bf70b8d-8912-4953-9d68-08d83f2d03eb
X-MS-TrafficTypeDiagnostic: BY5PR11MB4104:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4104097469340A9865B006EBED430@BY5PR11MB4104.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(136003)(396003)(346002)(376002)(16576012)(6916009)(4326008)(186003)(8936002)(6706004)(31696002)(6486002)(54906003)(966005)(316002)(2616005)(83380400001)(2906002)(6666004)(956004)(33964004)(66946007)(26005)(66476007)(31686004)(52116002)(36756003)(16526019)(5660300002)(478600001)(86362001)(166002)(8676002)(53546011)(66556008)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf70b8d-8912-4953-9d68-08d83f2d03eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 02:03:04.8034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3KR7BtSWUYxDXRSLmXIhv6qVUA+jS+3VNKXlnCPlWqQxhh4boyP2SoSS9ne4wt9DEyx+r+q7rRYEoyT4wNyYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4104
Content-Type: multipart/alternative;
 boundary="------------0203828E4933C87D904E7C37"

--------------0203828E4933C87D904E7C37
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2020 01:13 AM, Bruce Ashfield wrote:
>
>
> On Wed, Aug 12, 2020 at 5:25 AM Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Hi Ross,
>
>     I've just tracked down to this patch about k8s build failure for arm.
>     I'm now setting the preferred provider to 'go-native' to avoid k8s
>     build regression.
>
>     go-native contains patches like
>     0001-allow-CC-and-CXX-to-have-multiple-words.patch.
>     These patches seem to make sense.
>
>     Do you have any idea how to deal with such situation?
>
>
> We've had lots of problems with 32bit arm and the new go compiler. I 
> just confirmed that k8s still builds 64 bit.
>
> And if this is the gnu-stubs.h issue, it's the same thing.
>
> It might be time to just exclude 32bit arm from some of the bigger 
> stack in meta-virt, since getting them to respect the cross go 
> compiler is getting harder and harder.
>
> That being said, I hunted down a few more incorrect 'go' calls in the 
> k8s build scripts, and can now build 32 bit again. But as for runtime, 
> I can't say if it works or not.
>

That's good news :)
But for excluding 32bit arm support, I have some doubt. Because as far 
as I know, there are some 32bit arm BSPs that are in use, e.g. 
xilinx-zynq and ti-am335x.

Best Regards,
Chen Qi

> Once I complete builds on other archs, I'll push the change to meta-virt.
>
> Bruce
>
>
>
>     Best Regards,
>     Chen Qi
>
>     On 06/17/2020 01:05 AM, Ross Burton wrote:
>>     From: Ross Burton<ross.burton@arm.com> <mailto:ross.burton@arm.com>
>>
>>     go-binary-native is faster and more portable than go-native, so use it
>>     by default.
>>
>>     Signed-off-by: Ross Burton<ross.burton@arm.com> <mailto:ross.burton@arm.com>
>>     ---
>>       meta/conf/distro/include/tcmode-default.inc | 4 ++++
>>       1 file changed, 4 insertions(+)
>>
>>     diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
>>     index ab4333144b..7103e10d3b 100644
>>     --- a/meta/conf/distro/include/tcmode-default.inc
>>     +++ b/meta/conf/distro/include/tcmode-default.inc
>>     @@ -66,6 +66,10 @@ PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
>>       PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
>>       PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
>>       
>>     +# Bootstrap Go using a binary release fromgolang.org <http://golang.org>.  If you want to bootstrap
>>     +# from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
>>     +# go-native.
>>     +PREFERRED_PROVIDER_go-native ?= "go-binary-native"
>>       PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
>>       PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
>>       PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
>>
>>
>
>     
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--------------0203828E4933C87D904E7C37
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/13/2020 01:13 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote cite="mid:CADkTA4Nb8P3SV9JdB71w_6BJPHnefkGYPDChE0+L=5VyOsB8PA@mail.gmail.com" type="cite">
      
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Aug 12, 2020 at 5:25
            AM Chen Qi &lt;<a moz-do-not-send="true" href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <div>Hi Ross,<br>
                <br>
                I've just tracked down to this patch about k8s build
                failure for arm.<br>
                I'm now setting the preferred provider to 'go-native' to
                avoid k8s build regression.<br>
                <br>
                go-native contains patches like
                0001-allow-CC-and-CXX-to-have-multiple-words.patch.<br>
                These patches seem to make sense.<br>
                <br>
                Do you have any idea how to deal with such situation?<br>
              </div>
            </div>
          </blockquote>
          <div>&nbsp;<br>
            <div class="gmail_default" style="font-size:small">We've had
              lots of problems with 32bit arm and the new go compiler. I
              just confirmed that k8s still builds 64 bit.&nbsp;</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">And if
              this is the gnu-stubs.h issue, it's the same thing.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">It might
              be time to just exclude 32bit arm from some of the bigger
              stack in meta-virt, since getting them to respect the
              cross go compiler is getting harder and harder.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">That
              being said, I hunted down a few more incorrect 'go' calls
              in the k8s build scripts, and can now build 32 bit again.
              But as for runtime, I can't say if it works or not.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    That's good news :)<br>
    But for excluding 32bit arm support, I have some doubt. Because as
    far as I know, there are some 32bit arm BSPs that are in use, e.g.
    xilinx-zynq and ti-am335x.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:CADkTA4Nb8P3SV9JdB71w_6BJPHnefkGYPDChE0+L=5VyOsB8PA@mail.gmail.com" type="cite">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>
            <div class="gmail_default" style="font-size:small">Once I
              complete builds on other archs, I'll push the change to
              meta-virt.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Bruce</div>
            <br>
          </div>
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <div> <br>
                Best Regards,<br>
                Chen Qi<br>
                <br>
                On 06/17/2020 01:05 AM, Ross Burton wrote:<br>
              </div>
              <blockquote type="cite">
                <pre>From: Ross Burton <a moz-do-not-send="true" href="mailto:ross.burton@arm.com" target="_blank">&lt;ross.burton@arm.com&gt;</a>

go-binary-native is faster and more portable than go-native, so use it
by default.

Signed-off-by: Ross Burton <a moz-do-not-send="true" href="mailto:ross.burton@arm.com" target="_blank">&lt;ross.burton@arm.com&gt;</a>
---
 meta/conf/distro/include/tcmode-default.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index ab4333144b..7103e10d3b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -66,6 +66,10 @@ PREFERRED_VERSION_qemu ?= &quot;${QEMUVERSION}&quot;
 PREFERRED_VERSION_qemu-native ?= &quot;${QEMUVERSION}&quot;
 PREFERRED_VERSION_nativesdk-qemu ?= &quot;${QEMUVERSION}&quot;
 
+# Bootstrap Go using a binary release from <a moz-do-not-send="true" href="http://golang.org" target="_blank">golang.org</a>.  If you want to bootstrap
+# from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
+# go-native.
+PREFERRED_PROVIDER_go-native ?= &quot;go-binary-native&quot;
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= &quot;${GOVERSION}&quot;
 PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= &quot;${GOVERSION}&quot;
 PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= &quot;${GOVERSION}&quot;
</pre>
                <br>
                <fieldset></fieldset>
                <br>
              </blockquote>
              <p><br>
              </p>
            </div>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr">- Thou shalt not follow the NULL pointer, for
          chaos and madness await thee at its end<br>
          - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------0203828E4933C87D904E7C37--
