Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.48])
 by mx.groups.io with SMTP id smtpd.web08.2106.1606275542019950135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 19:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fGGtLzHf;
 spf=pass (domain: windriver.com, ip: 40.107.92.48, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aD3Oxv8UfbAlG1BOWgA81kzCyFm7XiiGGQpFjPulZYIVRSEfDyGVVt8/BN9xmC60OquydzWJydMqIPttcj9ixnxw/CjauXV5zgtLzlp984yVpHP9ghyWXBKkKTY0J25SQ2i7+aO6rPQBggJwJoTBSH4srBh0qzvYWDgJLczTfTBBm2c/R+9peJTzFMyBCtKZNyIp6qSU24Q0+UiXxcjnx76PlTgA6jkblXITcF1Gin3Kadz+pqCyEfBTvvwAbwofPtsqrpAuUel2K87lvhCxjj7NUYruUOOpA3amq3A4qHCJAaRQXCgbzglhAPB70ZJmh+jugCCW1p5q+LGMnUcWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmdHSi+ySR8LjuR8hm7vpoXhlfbY6LkJ1d7qu4879Do=;
 b=bm0zhr6N5+GmTXWCamSXhxJd8yiF3eBa+K9gLKAp/87m1V3qCal3qrblbHDySoPBTUxyMVgPR+wqQFsTQXZ+w4lwnusoYrMV6oKR/p8WtdtkcFuwFZebioNUT3OFEfLheF1lNVxO8u+WD933B+69AWRSRaaSTxp0NS6ns8HqaDiSsj6WTTbzMDGhSBYMpg/wfBcHG8u4mryTQHCWfyKe02xKlFAhSW7kS0TdaPgQJHyTWydEz8Es3gtKPme1FWuJo34jglXbBKwRrlRp0AWiwJ/TUgEaEz8/2vqfxv/r8SJzHupdf4KSScKj+yWsDSEuKysvU2UACE0HvjSRewKF6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmdHSi+ySR8LjuR8hm7vpoXhlfbY6LkJ1d7qu4879Do=;
 b=fGGtLzHf0riBMFUtfyU3aOhR3C2Btmwl0EzxDTaALBFLFGqUK7tmaQPNw0M40Bu8ts+R6+/spjCTG4jxsSJHp+3lD393ZNFRYg9popRp3MbCkfts4FZOOhvpV3Qr+BL8X7A0I4kP0AAfmIyNFlFMr08Ui8XYwAVMdbSglFiGNnk=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB2576.namprd11.prod.outlook.com (2603:10b6:805:5b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 25 Nov
 2020 03:38:59 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3589.025; Wed, 25 Nov 2020
 03:38:59 +0000
Subject: Re: [OE-core] [PATCH] toolchain-scripts: set PS1
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <16483E8531A55CE5.5807@lists.openembedded.org>
Message-ID: <ea18b971-4275-6e20-9c6b-922d57cf316f@windriver.com>
Date: Wed, 25 Nov 2020 11:37:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16483E8531A55CE5.5807@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0051.apcprd04.prod.outlook.com
 (2603:1096:202:14::19) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.142] (60.247.85.82) by HK2PR04CA0051.apcprd04.prod.outlook.com (2603:1096:202:14::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 03:38:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c81a6eb3-b7c7-4e2f-368b-08d890f3a504
X-MS-TrafficTypeDiagnostic: SN6PR11MB2576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2576FBDA9B291677805593A095FA0@SN6PR11MB2576.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xj/A5lPD/l/TIhnLRu8D4MK2boOzOmeC7Dnrdlu1L4yxupIhKxonJ8FdxkjjgJN0L8jt/BH8vbFSWXr5/jp7INLLEGJudeMsJT4//kqdBVqcNg/oIfVeWtqqrdnOZRXCs89Ig3BDlKPyM2cxbYUHyaiJXD6aWI6pK/rz+o0ZeVtHnMRGW+JeFpZF49O70uKOHm5QyQXrNmaau2v+9ahG9VEUcuOUT67iEk3Kivai71INIf0uRcpRkH6hdei5bdEG4IerMv8TpGZdEit+YTgWYMs06Ufels9RA76fLHVZJSX0lwHHPcLa9rAFEMpqf0ZyXaqUyt2dZbT1sjj4Ae1djgQBVEPknJBBlAjl3E2DdDpL6DDUfaaJw7TBCr+wFlbjMmUdXRCGQZpkRjCR6fxXSgndmENeQCYo5XOS99A1wMbaq4MdgGrhib8AMHKbwlOC2e6SNzgAfLt9idzEjh1ejOB6q8rtaPGmaIvn/q1nzUo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(39830400003)(136003)(5660300002)(2616005)(6486002)(53546011)(16526019)(66476007)(956004)(86362001)(6916009)(36756003)(66556008)(26005)(31686004)(186003)(83380400001)(166002)(66946007)(6706004)(16576012)(31696002)(8936002)(33964004)(2906002)(478600001)(966005)(52116002)(6666004)(316002)(8676002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qMiwgOERztyHEwvTrQzvoEuEGQ4uoAe8JpQDSmW+bXDzlj2MR3u1bxS1R5NA+OcH6dTWi2QKhACwCKuJK8kSH7CiNOf7Uq1duNAji/EX50To9cRjErqPDG29XQPkR7IKwmkyuVZeM4ltYcj2nxmpFTudU08aGw8KAih180xZpDeDgqTK7JaBF9qihNgCDOxpUAYaZ11aBkPypAFNZvikFWIiKCX+oechL6fwisN8xWYKc2XgfgDe9zdH8T2RbN13QuYNamX0drs7YjFfg8vACHCFslgjUh6yQzHfkq8XB5TmJspve1vWtw/R7ByvBw4tro22PG+w0StxgYDF1m6e+t5la7b31/w8ISAHRXfvDKTdAcysTBFrVbjQi+pwlr3N2hyqAyvqWNESadCcJpRPKQYUa1QebccA0+bXf+yTZPuQZIXxm9GtJ+yWlk0V2kXpnB9/jkbgE9UBqx7ThGwVs/G1uX90INushJ894VsyMldQFbzVv+K/boVrbNOA+phA1vNd1NWbaWwC3AoIch5saGnS++gpjcq8o5Y95J9FFisRO2ZcJTMOGemnP0KYpzdbSggrG0NC3RV8qTczE99C05Q5ndHRl8qFqZXzYyW3pyR75GAKRizs9huz58chsApmcabvWzpB4RieL7InlhOgzNE7SX+JAI/qZFmPZw/IQo549Qa2H8EB7tF6s/oNfm2SijDYWOxjksUEuuIlLbDv0XdL5R3mQLGSLhzZ+49oIMPIfSh0N9dv23ti3Nsaq4cgDanLhPyUHu/LMqgfXtNsgGv/UD99s17dEvFjlZqIp/kjLQ2gtLLwoYzcyoqbWEQAAw9a/6lLYU1fJd6eAYMjBTST4c7CXNoSbunaKSw2TDmGQZ3jHNWm7iaMl0JLnSpH3tPVzxJahz6a6DNNR6Xaew==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81a6eb3-b7c7-4e2f-368b-08d890f3a504
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 03:38:59.5812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeZRbsit6FhNmPYkzZwkuG6nGZCpmPzbheyFH0uWZ+FhLvZexXUUO7gYI8uOSp9JGDVchaFtA8buIW6wLE1D7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2576
Content-Type: multipart/alternative;
 boundary="------------52AE472F4764D661837D6AD6"
Content-Language: en-US

--------------52AE472F4764D661837D6AD6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/20 4:33 PM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Introduce a variable SDK_PS1 to configure PS1 after source
> environment-setup-script. The prompt string by default looks like:
>
> SDK-poky-glibc-x86_64--cortexa57-qemuarm64$
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/classes/toolchain-scripts.bbclass | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index db1d3215ef..274dfcf7e2 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -8,6 +8,9 @@ TARGET_CC_ARCH_append_libc-musl = " -mmusl"
>   # default debug prefix map isn't valid in the SDK
>   DEBUG_PREFIX_MAP = ""
>   
> +# PS1 setting after source the environment-setup-script
> +SDK_PS1 ?= "SDK-${SDK_NAME}$ "

Any comment on the default format of SDK_PS1 or the whole patch, please?

Thanks,
Kai


> +
>   # This function creates an environment-setup-script for use in a deployable SDK
>   toolchain_create_sdk_env_script () {
>   	# Create environment setup script.  Remember that $SDKTARGETSYSROOT should
> @@ -45,6 +48,7 @@ toolchain_create_sdk_env_script () {
>   		EXTRAPATH="$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i"
>   	done
>   	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH' >> $script
> +	echo 'export PS1="${SDK_PS1}"' >>$script
>   	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
>   	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
>   	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
>
> 
>


--------------52AE472F4764D661837D6AD6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/17/20 4:33 PM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16483E8531A55CE5.5807@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Introduce a variable SDK_PS1 to configure PS1 after source
environment-setup-script. The prompt string by default looks like:

SDK-poky-glibc-x86_64--cortexa57-qemuarm64$

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 meta/classes/toolchain-scripts.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index db1d3215ef..274dfcf7e2 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -8,6 +8,9 @@ TARGET_CC_ARCH_append_libc-musl = &quot; -mmusl&quot;
 # default debug prefix map isn't valid in the SDK
 DEBUG_PREFIX_MAP = &quot;&quot;
 
+# PS1 setting after source the environment-setup-script
+SDK_PS1 ?= &quot;SDK-${SDK_NAME}$ &quot;</pre>
    </blockquote>
    <p>Any comment on the default format of SDK_PS1 or the whole patch,
      please?</p>
    <p>Thanks,<br>
      Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:16483E8531A55CE5.5807@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
+
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script.  Remember that $SDKTARGETSYSROOT should
@@ -45,6 +48,7 @@ toolchain_create_sdk_env_script () {
 		EXTRAPATH=&quot;$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i&quot;
 	done
 	echo &quot;export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}&quot;$EXTRAPATH':$PATH' &gt;&gt; $script
+	echo 'export PS1=&quot;${SDK_PS1}&quot;' &gt;&gt;$script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' &gt;&gt; $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'&quot;$libdir&quot;'/pkgconfig:$SDKTARGETSYSROOT'&quot;$prefix&quot;'/share/pkgconfig' &gt;&gt; $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'&quot;${multimach_target_sys}&quot; &gt;&gt; $script
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------52AE472F4764D661837D6AD6--
