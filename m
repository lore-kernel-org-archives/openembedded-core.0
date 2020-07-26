Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.75])
 by mx.groups.io with SMTP id smtpd.web12.32708.1595783486602239003
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 10:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NVsUB1kW;
 spf=pass (domain: windriver.com, ip: 40.107.243.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCq+Uq193symARpbu7BXX2fU3N79LveuIU8DQE+8qSc/QArPo8RedPr8BrT263ztm0D84LpBIHDYAKj1KVIdpUGKITBLsuT+1EoHZmQ7PL8Rkll4O7JNb/CS7Ize/6KYPMqkAsm1lXTH0pOqELu0J9OmZOmBaX7O1wA8ult0mUip72erlm5HvYZzuu1+d5Bpnv0zuB4h0kvZ8kIweN2oMdXng7LQswGXgS9kcQjXNnAh08/nDoU1CJoZoKEwObanEcbDp8Y6EWzsNJSdUONj7EHrGkPcxA0yAcxXLvRMwJfx6QX8kkuA+Fruo3F38XgGjYuuXDgZhWzkpP0EHal8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KohCf8ixxX00jtR/fQ4dZmGv2QCIs4rjI1Zf5FmtAo=;
 b=NjduNGjikOasz3S/CNDGeGboDIBRn7YssFU0apzdlbB4yRSLmgx89mx+C13fUQBviFYfWuCjK0X6aCuZBX1dvZYdNEyAFVS0TbvUPJo26hX3oYqV+GImaHxzH78qtYFOJURBJOa1OFaoLleb7CeZk1jGQm7fjfjNOt9Y8WUkaEQHE6CCfVzrXuHUSCYYJVbz2LVcQLJsZNiu9PEtND59tazoPq0fL3yUVN/XyCQdo+ZnmNVJ/2f4BOBJeSU2OdFw6LwOuSAgo8XcCsQZ8hohHLzWeogm/k6RI49ixahhamvb1ExcDxi0NmFEJdUL/hsXcM8lovvvOyDH9xxXaxQDOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KohCf8ixxX00jtR/fQ4dZmGv2QCIs4rjI1Zf5FmtAo=;
 b=NVsUB1kWq6RPTQPPDLWSFxxhPt2A/3+VWv2e/Jq9xmnlV8HHk4PZh7Elkr7cPxVMvq4tqZshpojOqwHZI14uG0q1KWWST+bQVusIE1q4Z5cXnYJOu24W8T6NVKBEinFekZeQz8Ph6B4o6y5/a4ip9LzDPwnb2Pmy9UmizXdd2Yw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN7PR11MB2579.namprd11.prod.outlook.com (2603:10b6:406:ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Sun, 26 Jul
 2020 17:11:24 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Sun, 26 Jul 2020
 17:11:24 +0000
Subject: Re: [OE-core][PATCH] llvm: upgrade 9.0.1 -> 10.0.0
To: akuster808 <akuster808@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200527134844.105405-1-trevor.gamblin@windriver.com>
 <CAMKF1soY7W40VRw-puspRKkmQ0FEiFk35=W_z=uz93Hj2mWVxA@mail.gmail.com>
 <f6d9c9c0-71e1-439e-f20e-00f7cc721c0e@windriver.com>
 <CANNYZj8J_ZrcQNLqPg0NRUfu042kCBJWmiDaxejTyuWnv9MMmw@mail.gmail.com>
 <5226bca8-5917-7783-c832-899256caea4d@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e2dcf5dc-9bec-9f14-2bb2-b24978b28478@windriver.com>
Date: Sun, 26 Jul 2020 13:11:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <5226bca8-5917-7783-c832-899256caea4d@gmail.com>
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend Transport; Sun, 26 Jul 2020 17:11:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f45e6b8-0ef4-4fb0-9459-08d83186ece7
X-MS-TrafficTypeDiagnostic: BN7PR11MB2579:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB25792B1E7B984D26D2F65DF99F750@BN7PR11MB2579.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6BFG3otSuacOqHhbBcG7H8+Nt7p5gUzYZk4caamhMLgREg/9U9Iz4Bxm+aQJnl9BmrIJZK3n28bKfAOrpYj7VcpNXjP4pOo7KkDRILpaoBQRFdJzB+Yjp0qJ/xXvdsBdHK7gvwnpW7718TEydX9mMv3aE9FAIFOG/9nAkHEYU1jnBCSOjOz8B+56h8/+zNvbCEcbWkhtsqxH6hbTCCRG/NWicOEyLxwj5yqUK7gi48tBYBZL05s1TyU57DkzYbpW/E7u1ngwI9O0Ym3mMoAbVrljCVlB1TBZHtwZJXDjRVNMNOFZGo4fRrtpm+O0IIWqeGugEkdPGC2aQK1HXRfWPDDgYAkHyUvLkVYSiXyxmFfKZXb3XCN8CDC5XcoATtMhXq0WuDxwMvnXjJf0Xyes5GqNWYOZ7JDPVT0zTntsCbHefMT78KsRdmL1mdktpRqoaMj8OiJCbaZUVX76+dvRMg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39830400003)(396003)(366004)(346002)(376002)(136003)(86362001)(2906002)(66556008)(66476007)(54906003)(52116002)(66946007)(83380400001)(16526019)(186003)(166002)(44832011)(16576012)(110136005)(83080400001)(33964004)(26005)(53546011)(316002)(2616005)(956004)(8936002)(8676002)(36756003)(31696002)(478600001)(31686004)(5660300002)(4326008)(966005)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	cyrDb0AVB0Wo9SIK63PO2xGtNtwCBQpitiW6uZPPdfpcJJyw+Ge8P6FUZKN8qK0I6127Ov6S8qyoBRcZo7nH4XKVlHhVcrtqAm5brrwDosq7pO524u8jbELtLYLp1XG8Y3pn3MBaSL/jQ6E5jQaZ3AqWpY9w2WVUOV9eG0Zb7HA9LbdF/OkHotX5Nxp7mk+y9M4sfXwenVTzZOaGC6BgKu4lvc2YPXmfYRvRnpU7gGLYvziKiNuCuc4BdX8w+G8tbWJREzWGYPoCDnaY8p5WmD+Q0tsf3m/CZB8mG6VWkrC46XCscAge6HOSeoKtEl3Dtgfs2NEBiah7/4CRigitFSLqgOyeTSla252eEOT0aDbFAh16nOxxINOjP0XbLPpFBZ1y8ZztvbRppD6ybaBlIHmj/mARKEdM9F1SvQtomcDU7KlCS0EE205L1sBXUuQKbd88oh9+Woq8sqoQR+uzs+1b4EbKjQisInm5wA0FVuo=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f45e6b8-0ef4-4fb0-9459-08d83186ece7
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2020 17:11:24.6401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqqPYRSrf5DIf9+kR+oRvdX3Noao7R381Z5av79fhSsnTbj19h2xm2I5nHUuFR0Ffm/Wl++N7Z+bPnx5aR1K5gAJQHsboGNbvtTqBdfhLAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2579
Content-Type: multipart/alternative;
 boundary="------------70D217E0E5D9B5EFEA22BB4C"
Content-Language: en-US

--------------70D217E0E5D9B5EFEA22BB4C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/25/20 10:58 AM, akuster808 wrote:
> Per release notes, riscv is now supported.
> https://releases.llvm.org/10.0.0/docs/ReleaseNotes.html#changes-to-the-risc-v-target
>
> If you have time, can you also double check Riscv so these two can be 
> removed, if not maybe we can wait until this is in core.
>
> |
> COMPATIBLE_HOST_riscv64  =  "null"
> COMPATIBLE_HOST_riscv32  =  "null"|
>
> There is a qemuriscv64 machine in core.

llvm broke during do_compile when I tested it against qemuriscv64. I'll 
submit the upgrade patch and look into the riscv targets issue as a 
separate patch.

Trevor

>
> -armin
>
> On 7/25/20 4:07 AM, Alexander Kanavin wrote:
>> Llvm 10.0.1 is now out, please rebase and resend the patches :)
>>
>> Alex
>>
>> On Fri, 29 May 2020 at 15:30, Trevor Gamblin 
>> <trevor.gamblin@windriver.com <mailto:trevor.gamblin@windriver.com>> 
>> wrote:
>>
>>
>>     On 5/28/20 9:57 PM, Khem Raj wrote:
>>     > On Wed, May 27, 2020 at 6:48 AM Trevor Gamblin
>>     > <trevor.gamblin@windriver.com
>>     <mailto:trevor.gamblin@windriver.com>> wrote:
>>     >> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com
>>     <mailto:trevor.gamblin@windriver.com>>
>>     >> ---
>>     >>   meta/recipes-devtools/llvm/llvm_git.bb <http://llvm_git.bb>
>>     | 6 +++---
>>     >>   1 file changed, 3 insertions(+), 3 deletions(-)
>>     >>
>>     >> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
>>     <http://llvm_git.bb> b/meta/recipes-devtools/llvm/llvm_git.bb
>>     <http://llvm_git.bb>
>>     >> index d24ed761bf..787cc3adcf 100644
>>     >> --- a/meta/recipes-devtools/llvm/llvm_git.bb <http://llvm_git.bb>
>>     >> +++ b/meta/recipes-devtools/llvm/llvm_git.bb <http://llvm_git.bb>
>>     >> @@ -19,9 +19,9 @@ inherit cmake pkgconfig
>>     >>
>>     >>   PROVIDES += "llvm${PV}"
>>     >>
>>     >> -MAJOR_VERSION = "9"
>>     >> +MAJOR_VERSION = "10"
>>     >>   MINOR_VERSION = "0"
>>     >> -PATCH_VERSION = "1"
>>     >> +PATCH_VERSION = "0"
>>     >>
>>     > It also needs updating LLVMVERSION in
>>     > meta/conf/distro/include/tcmode-default.inc
>>     > secondly, I would suggest to wait for 10.0.1 which is releasing
>>     in a weeks time.
>>
>>     Alright, I'll watch for that release.
>>
>>     Thanks!
>>
>>     >
>>     >>   PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
>>     >>
>>     >> @@ -29,7 +29,7 @@ LLVM_RELEASE = "${PV}"
>>     >>   LLVM_DIR = "llvm${LLVM_RELEASE}"
>>     >>
>>     >>   BRANCH = "release/${MAJOR_VERSION}.x"
>>     >> -SRCREV = "c1a0a213378a458fbea1a5c77b315c7dce08fd05"
>>     >> +SRCREV = "d32170dbd5b0d54436537b6b75beaf44324e0c28"
>>     >>   SRC_URI =
>>     "git://github.com/llvm/llvm-project.git;branch=${BRANCH}
>>     <http://github.com/llvm/llvm-project.git;branch=$%7BBRANCH%7D> \
>>     >>
>>     file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2
>>     \
>>     >>
>>     file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
>>     >> --
>>     >> 2.24.1
>>     >>
>>     >>
>>
>>
>> 
>

--------------70D217E0E5D9B5EFEA22BB4C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/25/20 10:58 AM, akuster808 wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:5226bca8-5917-7783-c832-899256caea4d@gmail.com">
      
      Per release notes, riscv is now supported. <br>
      <a class="moz-txt-link-freetext" href="https://releases.llvm.org/10.0.0/docs/ReleaseNotes.html#changes-to-the-risc-v-target" moz-do-not-send="true">https://releases.llvm.org/10.0.0/docs/ReleaseNotes.html#changes-to-the-risc-v-target</a><br>
      <br>
      If you have time, can you also double check Riscv so these two can
      be removed, if not maybe we can wait until this is in core.<br>
      <br>
      <pre><code><pre><span class="nv">COMPATIBLE_HOST_riscv64</span> <span class="o">=</span> <span class="s2">&quot;null&quot;</span>
<span class="nv">COMPATIBLE_HOST_riscv32</span> <span class="o">=</span> <span class="s2">&quot;null&quot;</span></pre></code></pre>
      <br>
      There is a qemuriscv64 machine in core.<br>
    </blockquote>
    <p>llvm broke during do_compile when I tested it against
      qemuriscv64. I'll submit the upgrade patch and look into the riscv
      targets issue as a separate patch.</p>
    <p>Trevor<br>
    </p>
    <blockquote type="cite" cite="mid:5226bca8-5917-7783-c832-899256caea4d@gmail.com"> <br>
      -armin<br>
      <br>
      <div class="moz-cite-prefix">On 7/25/20 4:07 AM, Alexander Kanavin
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:CANNYZj8J_ZrcQNLqPg0NRUfu042kCBJWmiDaxejTyuWnv9MMmw@mail.gmail.com">
        <div dir="ltr">
          <div>Llvm 10.0.1 is now out, please rebase and resend the
            patches :)</div>
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, 29 May 2020 at
            15:30, Trevor Gamblin &lt;<a href="mailto:trevor.gamblin@windriver.com" moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            On 5/28/20 9:57 PM, Khem Raj wrote:<br>
            &gt; On Wed, May 27, 2020 at 6:48 AM Trevor Gamblin<br>
            &gt; &lt;<a href="mailto:trevor.gamblin@windriver.com" target="_blank" moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;
            wrote:<br>
            &gt;&gt; Signed-off-by: Trevor Gamblin &lt;<a href="mailto:trevor.gamblin@windriver.com" target="_blank" moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;<br>
            &gt;&gt; ---<br>
            &gt;&gt;&nbsp; &nbsp;meta/recipes-devtools/llvm/<a href="http://llvm_git.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">llvm_git.bb</a> | 6 &#43;&#43;&#43;---<br>
            &gt;&gt;&nbsp; &nbsp;1 file changed, 3 insertions(&#43;), 3 deletions(-)<br>
            &gt;&gt;<br>
            &gt;&gt; diff --git a/meta/recipes-devtools/llvm/<a href="http://llvm_git.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">llvm_git.bb</a>
            b/meta/recipes-devtools/llvm/<a href="http://llvm_git.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">llvm_git.bb</a><br>
            &gt;&gt; index d24ed761bf..787cc3adcf 100644<br>
            &gt;&gt; --- a/meta/recipes-devtools/llvm/<a href="http://llvm_git.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">llvm_git.bb</a><br>
            &gt;&gt; &#43;&#43;&#43; b/meta/recipes-devtools/llvm/<a href="http://llvm_git.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">llvm_git.bb</a><br>
            &gt;&gt; @@ -19,9 &#43;19,9 @@ inherit cmake pkgconfig<br>
            &gt;&gt;<br>
            &gt;&gt;&nbsp; &nbsp;PROVIDES &#43;= &quot;llvm${PV}&quot;<br>
            &gt;&gt;<br>
            &gt;&gt; -MAJOR_VERSION = &quot;9&quot;<br>
            &gt;&gt; &#43;MAJOR_VERSION = &quot;10&quot;<br>
            &gt;&gt;&nbsp; &nbsp;MINOR_VERSION = &quot;0&quot;<br>
            &gt;&gt; -PATCH_VERSION = &quot;1&quot;<br>
            &gt;&gt; &#43;PATCH_VERSION = &quot;0&quot;<br>
            &gt;&gt;<br>
            &gt; It also needs updating LLVMVERSION in<br>
            &gt; meta/conf/distro/include/tcmode-default.inc<br>
            &gt; secondly, I would suggest to wait for 10.0.1 which is
            releasing in a weeks time.<br>
            <br>
            Alright, I'll watch for that release.<br>
            <br>
            Thanks!<br>
            <br>
            &gt;<br>
            &gt;&gt;&nbsp; &nbsp;PV =
            &quot;${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}&quot;<br>
            &gt;&gt;<br>
            &gt;&gt; @@ -29,7 &#43;29,7 @@ LLVM_RELEASE = &quot;${PV}&quot;<br>
            &gt;&gt;&nbsp; &nbsp;LLVM_DIR = &quot;llvm${LLVM_RELEASE}&quot;<br>
            &gt;&gt;<br>
            &gt;&gt;&nbsp; &nbsp;BRANCH = &quot;release/${MAJOR_VERSION}.x&quot;<br>
            &gt;&gt; -SRCREV =
            &quot;c1a0a213378a458fbea1a5c77b315c7dce08fd05&quot;<br>
            &gt;&gt; &#43;SRCREV =
            &quot;d32170dbd5b0d54436537b6b75beaf44324e0c28&quot;<br>
            &gt;&gt;&nbsp; &nbsp;SRC_URI = &quot;git://<a href="http://github.com/llvm/llvm-project.git;branch=$%7BBRANCH%7D" rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/llvm/llvm-project.git;branch=${BRANCH}</a>
            \<br>
            &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class="moz-txt-link-freetext" href="file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2" moz-do-not-send="true">file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2</a>
            \<br>
            &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2" moz-do-not-send="true">file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2</a>
            \<br>
            &gt;&gt; --<br>
            &gt;&gt; 2.24.1<br>
            &gt;&gt;<br>
            &gt;&gt; <br>
            <br>
          </blockquote>
        </div>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------70D217E0E5D9B5EFEA22BB4C--
