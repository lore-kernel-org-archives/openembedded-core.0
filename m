Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.81])
 by mx.groups.io with SMTP id smtpd.web10.6062.1598323747991472196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 19:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=avOrCiMH;
 spf=pass (domain: windriver.com, ip: 40.107.76.81, mailfrom: li.zhou@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlayOZw1Mda/0FJCtfmxexFXdMd/eI4SseKlIHe4ogiMaA8bAE1vrL7DJ4lXX54iAqbu/wna8ZVObB9EE1SONWOR/xvmHcFvl1SZx9ZJCP8lfibGkWDIKrcrdPQUAdg9wlxW9ZA3e/IxMZI27mC7HCjeLWgHDg3I47bFHJV9ygzdgGzVbf+8TmguminijwTC4OovbhfGXLUbgxM+PPADN8qYdsw50bcgsbm2FRanM+VUp7T1TjwyOjGSfEWrGVurNWqi6Hvth7wVfGXihANivpS4x/O91nwASw7pgci6EWM3xir2N7k8FeC4ldjIIgh50mg9tETjqP1dU0S26wyDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78Uv1I4tuBOOx5ljiO00Mkb3K/znCiOZdrPwRS98nXc=;
 b=ATsjV6bTffnHYjYJQy6OxnUw0xrATazDn47sWysUBAxJwPhvlQklkqrdOHs/EnYaYGaJ1+b5ZHTXr6ZN7EwxDPOkt6+t8VIiZJ3q9sW4FpykQUaKGsi5qGk8ls6QgO9lDomYYdLztP9dlg1mG3wBitoP/Yim7bNoo+/Xu3Rcu1ZZw7RZY+hwcLpD5cO/u8tRphLaFuN1Rec48GSbDTWr1Zwta/bY1GhLbZBC7iB9/HBd1IMbsAcF6zo3pHKapmtinRgKDQp8KO+FtpvjhSYIw5f5jn887Hiq2iDVbt2jH/dWeGy7uz7ONhWOaR3Q49/8pEXGohsosg5R7hhsRpnVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78Uv1I4tuBOOx5ljiO00Mkb3K/znCiOZdrPwRS98nXc=;
 b=avOrCiMHGq1gDH1ABZ02qnyLe0PiQt8QpmDQ6zV4rTCBJduARBS3ZoCUmu2fSnKJhiWb/adq2zlw2u156NKrdkADCodm4MdMUTCIeZ1SlCUi1icspGwOcYhL/dsfICG1mxc/6LRx+4X0Zm30Zi3htQFT7vOhJreYX9NpUJ0PrAM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com
 (2603:10b6:301:4e::14) by MW3PR11MB4650.namprd11.prod.outlook.com
 (2603:10b6:303:54::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 02:49:06 +0000
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::f44f:12f4:ecff:1400]) by MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::f44f:12f4:ecff:1400%12]) with mapi id 15.20.3305.031; Tue, 25 Aug
 2020 02:49:06 +0000
Subject: Re: [OE-core][PATCH V2] connman-conf: make connman-conf only available for qemuall
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1597978383-189322-1-git-send-email-li.zhou@windriver.com>
 <CA+chaQfKoniG=ErQ9iN34xa5GvtQgrzpANnGG_1CfhC3_gCQ_w@mail.gmail.com>
From: "Li Zhou" <li.zhou@windriver.com>
Message-ID: <2ee0e9e6-ddfa-bf18-f00f-4fe5faa5d8f1@windriver.com>
Date: Tue, 25 Aug 2020 10:48:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
In-Reply-To: <CA+chaQfKoniG=ErQ9iN34xa5GvtQgrzpANnGG_1CfhC3_gCQ_w@mail.gmail.com>
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To MWHPR1101MB2318.namprd11.prod.outlook.com
 (2603:10b6:301:4e::14)
Return-Path: li.zhou@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by HK2PR03CA0062.apcprd03.prod.outlook.com (2603:1096:202:17::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10 via Frontend Transport; Tue, 25 Aug 2020 02:49:02 +0000
X-Originating-IP: [147.11.103.217]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e5d6f7f-e90a-40e6-b4c6-08d848a16ec6
X-MS-TrafficTypeDiagnostic: MW3PR11MB4650:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB465094ABD8C3CCB1044EA164F8570@MW3PR11MB4650.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a42z6qKWzhpcZgIeY/XyVE8FvgSXEMtRbmu8o2nFoKFZSCO6p7ktGEpkiFIAbPyRFtMx6ckwwaDvDE/nBRddZUfl58pGoOpoeyvc07ct0EoJtTaNbXyWilM8L3KT3jfTafrghDungTCx2/ayw3t+vuRM267+LS0YOBINRWInKq2HQ6A1VrTkxzBXJpYlzmb1mAqNgyCjS3eCin5s/9NDw3RY6YsqPoDxPT+MREgc8s8ZAzPzJ0951H3emGsdHD1xWZB83PGK0yx8sfdSx+8O/6Y2PR457SjcdpfSnNvHvMW/Ozs56h/BVAhb6uneHHcKbvInPtyHZKA4hBYyoY2jB3De6kQrIlTWctZA71whCIFIKkk5BS1WeMtKovvh50lIUhSF5dm1hzEcLX+lhZiyvxIxwO8tPxBdGv+aThwZeAM3qJmwbCbA3flwjlncNszKn7lKyCrKtg1qtATdI74alg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39850400004)(346002)(396003)(136003)(26005)(83380400001)(478600001)(5660300002)(2616005)(52116002)(16576012)(4326008)(6486002)(33964004)(6666004)(8676002)(186003)(53546011)(86362001)(956004)(166002)(31696002)(36756003)(83080400001)(6916009)(8936002)(66946007)(316002)(66556008)(2906002)(31686004)(966005)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zFbLyL3eTd6D4xmrJ54RWtwNel5ULMm2ww/utmiXl/TrTg/M4EaDZA4IpQAb7LQtlah6X5vnemcEtDuUCOAQmDRLieREUju/PUrupv/9TdvJfYhnY8OPlM7GgV5Hpb+Dt24AknlhD0dhjBsH0ISEg8Q5sGxfYRsTPAVOkOvEFigxY7pg++3XEXR5qC+AyM5hIo1pdB+pXFQjQptwGTTZVqOjTMLzCSgzda92zzxt5uPcsk6QJjex2Il0RFg+pehxuW8pmiyZ4vl5320GMXWqzXXe2W6wxKZG4QBDvy4xj/Nqhb9AtaX3C5EDwVZIWRKk6CPtnA+ngUBBdVE0SSgLow/Lv2FiC75MbSGOmVp0NoxhhHNSFBeK82xZX69LnmPjyNyEl9pwlDjWUg7F4vLhrpASCuRAbUnmCPCkDD4UnEOYo4LX5qwLoKvgwFFfQzpqd/CDyn9KfwmpYfOK25bZIHIjPOVKXOqagGV6+FvOqNjC7f0dh5vTDGrMIxt1c5+S/lS+eBvNaANqwUTASfr/RtP78Hze9Bs/lQel6cscQzisCpXXD8m6/JPfEcFKRLiSBk08CJxHQUVNE5NEzlucdUFfbm7C3Nc44PfvTq9ZNXphOJ1xxIm35rLYVCMptiNm2w+EzTb22Bga/dpaOmTGmA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5d6f7f-e90a-40e6-b4c6-08d848a16ec6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 02:49:06.0285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3Vt4tr8ho1HC+Mc0xyOE6nItB13SwMj54VAyZ19RFrJNlp6WtmlukgEBxI0+Drr+61ler0596ZeDvL+Q8ZVoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4650
Content-Type: multipart/alternative;
 boundary="------------4392424B106BFF2AAADC9324"
Content-Language: en-US

--------------4392424B106BFF2AAADC9324
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I change this because we can see below in connman-conf.bb:

SUMMARY = "Connman config to setup wired interface on *qemu* machines"
DESCRIPTION = "This is the ConnMan configuration to set up a Wired \
network interface for a *qemu* machine."

On non-quem machines, "bitbake connman-conf" can return successfully, 
but the rpm package for connman-conf can't be generated because it is 
null (SRC_URI_append_qemuall = ...).

At this time, our users add connman-conf in IMAGE_INSTALL list and get 
such error:

No match for argument: connman-conf
Error: Unable to find a match


I myself think that it will be better to report error when "bitbake 
connman-conf" on non-qemu machine, since connman-conf is designed only 
for qemu.

It will be welcomed if you have better suggestion for the solution.

Thank you.


On 8/21/20 4:06 PM, Martin Jansa wrote:
> Why is this an issue?
>
> connman-conf recipe doesn't take long time to build and if you don't 
> want to install it on target you can use BAD_RECOMMENDATIONS variable.
>
> We're using connman-conf to configure networking on various target 
> machines - not only on qemu*. If this is merged I'll just undo this in 
> our layer - and that's fine, but if there are more people using 
> connman-conf like this, then we should re-consider this commit (or at 
> least better explain why it's needed in commit message).
>
> On Fri, Aug 21, 2020 at 4:54 AM Li Zhou <li.zhou@windriver.com 
> <mailto:li.zhou@windriver.com>> wrote:
>
>     connman-conf is only for qemu machines, so use COMPATIBLE_MACHINE
>     to limit that it is only available for qemuall, or else it can be
>     built successfully without the package connman-conf generated.
>
>     Signed-off-by: Li Zhou <li.zhou@windriver.com
>     <mailto:li.zhou@windriver.com>>
>     ---
>      meta/recipes-connectivity/connman/connman-conf.bb
>     <http://connman-conf.bb> | 2 ++
>      meta/recipes-connectivity/connman/connman_1.38.bb
>     <http://connman_1.38.bb> | 2 +-
>      2 files changed, 3 insertions(+), 1 deletion(-)
>
>     diff --git a/meta/recipes-connectivity/connman/connman-conf.bb
>     <http://connman-conf.bb>
>     b/meta/recipes-connectivity/connman/connman-conf.bb
>     <http://connman-conf.bb>
>     index 9a519ec..3a6c525 100644
>     --- a/meta/recipes-connectivity/connman/connman-conf.bb
>     <http://connman-conf.bb>
>     +++ b/meta/recipes-connectivity/connman/connman-conf.bb
>     <http://connman-conf.bb>
>     @@ -34,3 +34,5 @@ do_install() {
>      }
>
>      SYSTEMD_SERVICE_${PN}_qemuall = "wired-connection.service"
>     +COMPATIBLE_MACHINE = "null"
>     +COMPATIBLE_MACHINE_qemuall = "${MACHINE}"
>     diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb
>     <http://connman_1.38.bb>
>     b/meta/recipes-connectivity/connman/connman_1.38.bb
>     <http://connman_1.38.bb>
>     index 027c41e..734b8ae 100644
>     --- a/meta/recipes-connectivity/connman/connman_1.38.bb
>     <http://connman_1.38.bb>
>     +++ b/meta/recipes-connectivity/connman/connman_1.38.bb
>     <http://connman_1.38.bb>
>     @@ -12,5 +12,5 @@ SRC_URI_append_libc-musl = "
>     file://0002-resolve-musl-does-not-implement-res_nin
>      SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
>      SRC_URI[sha256sum] =
>     "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
>
>     -RRECOMMENDS_${PN} = "connman-conf"
>     +RRECOMMENDS_${PN}_qemuall = "connman-conf"
>      RCONFLICTS_${PN} = "networkmanager"
>     -- 
>     1.9.1
>
>     
>
-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


--------------4392424B106BFF2AAADC9324
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I change this because we can see below in connman-conf.bb:</p>
    <p>SUMMARY = &quot;Connman config to setup wired interface on <b>qemu</b>
      machines&quot;<br>
      DESCRIPTION = &quot;This is the ConnMan configuration to set up a Wired
      \<br>
      network interface for a <b>qemu</b> machine.&quot;<br>
    </p>
    <p>On non-quem machines, &quot;bitbake connman-conf&quot; can return
      successfully, but the rpm package for connman-conf can't be
      generated because it is null (SRC_URI_append_qemuall = ...).</p>
    <p>At this time, our users add connman-conf in IMAGE_INSTALL list
      and get such error:</p>
    <p>No match for argument: connman-conf<br>
      Error: Unable to find a match</p>
    <p><br>
    </p>
    <p>I myself think that it will be better to report error when
      &quot;bitbake connman-conf&quot; on non-qemu machine, since connman-conf is
      designed only for qemu. <br>
    </p>
    <p>It will be welcomed if you have better suggestion for the
      solution.</p>
    <p>Thank you.<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 4:06 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CA+chaQfKoniG=ErQ9iN34xa5GvtQgrzpANnGG_1CfhC3_gCQ_w@mail.gmail.com">
      
      <div dir="ltr">Why is this an issue?
        <div><br>
        </div>
        <div>connman-conf recipe doesn't take long time to build and if
          you don't want to install it on target you can
          use&nbsp;BAD_RECOMMENDATIONS variable.</div>
        <div><br>
        </div>
        <div>We're using connman-conf to configure networking on various
          target machines - not only on qemu*. If this is merged I'll
          just undo this in our layer - and that's fine, but if there
          are more people using connman-conf like this, then we should
          re-consider&nbsp;this commit (or at least better explain why it's
          needed in commit message).</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, Aug 21, 2020 at 4:54
          AM Li Zhou &lt;<a href="mailto:li.zhou@windriver.com" moz-do-not-send="true">li.zhou@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">connman-conf
          is only for qemu machines, so use COMPATIBLE_MACHINE<br>
          to limit that it is only available for qemuall, or else it can
          be<br>
          built successfully without the package connman-conf generated.<br>
          <br>
          Signed-off-by: Li Zhou &lt;<a href="mailto:li.zhou@windriver.com" target="_blank" moz-do-not-send="true">li.zhou@windriver.com</a>&gt;<br>
          ---<br>
          &nbsp;meta/recipes-connectivity/connman/<a href="http://connman-conf.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">connman-conf.bb</a> |
          2 ++<br>
          &nbsp;meta/recipes-connectivity/connman/<a href="http://connman_1.38.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">connman_1.38.bb</a> |
          2 +-<br>
          &nbsp;2 files changed, 3 insertions(+), 1 deletion(-)<br>
          <br>
          diff --git a/meta/recipes-connectivity/connman/<a href="http://connman-conf.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">connman-conf.bb</a>
          b/meta/recipes-connectivity/connman/<a href="http://connman-conf.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">connman-conf.bb</a><br>
          index 9a519ec..3a6c525 100644<br>
          --- a/meta/recipes-connectivity/connman/<a href="http://connman-conf.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">connman-conf.bb</a><br>
          +++ b/meta/recipes-connectivity/connman/<a href="http://connman-conf.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">connman-conf.bb</a><br>
          @@ -34,3 +34,5 @@ do_install() {<br>
          &nbsp;}<br>
          <br>
          &nbsp;SYSTEMD_SERVICE_${PN}_qemuall = &quot;wired-connection.service&quot;<br>
          +COMPATIBLE_MACHINE = &quot;null&quot;<br>
          +COMPATIBLE_MACHINE_qemuall = &quot;${MACHINE}&quot;<br>
          diff --git a/meta/recipes-connectivity/connman/<a href="http://connman_1.38.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">connman_1.38.bb</a>
          b/meta/recipes-connectivity/connman/<a href="http://connman_1.38.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">connman_1.38.bb</a><br>
          index 027c41e..734b8ae 100644<br>
          --- a/meta/recipes-connectivity/connman/<a href="http://connman_1.38.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">connman_1.38.bb</a><br>
          +++ b/meta/recipes-connectivity/connman/<a href="http://connman_1.38.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">connman_1.38.bb</a><br>
          @@ -12,5 +12,5 @@ SRC_URI_append_libc-musl = &quot;
          <a class="moz-txt-link-freetext" href="file://0002-resolve-musl-does-not-implement-res_nin">file://0002-resolve-musl-does-not-implement-res_nin</a><br>
          &nbsp;SRC_URI[md5sum] = &quot;1ed8745354c7254bdfd4def54833ee94&quot;<br>
          &nbsp;SRC_URI[sha256sum] =
          &quot;cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b&quot;<br>
          <br>
          -RRECOMMENDS_${PN} = &quot;connman-conf&quot;<br>
          +RRECOMMENDS_${PN}_qemuall = &quot;connman-conf&quot;<br>
          &nbsp;RCONFLICTS_${PN} = &quot;networkmanager&quot;<br>
          -- <br>
          1.9.1<br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <pre class="moz-signature" cols="72">
-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511</pre>
  </body>
</html>

--------------4392424B106BFF2AAADC9324--
