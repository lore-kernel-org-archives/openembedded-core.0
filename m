Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.75])
 by mx.groups.io with SMTP id smtpd.web12.6446.1590587636087805789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 06:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZmBp/k91;
 spf=pass (domain: windriver.com, ip: 40.107.94.75, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgIU9gEZN97gmONCAGfzyncL6hav5rZVV2I7WFryrUbMH9kODB2s6tE9FJDXO2WmqNfqJQaTRhcDVQQmQK9oY4+rizQ7evVgZvgvEJBwc5C4vOarSonWay4Mlhf4dNrjXuAD+If2z9DxpyTzt+34N3nphAg19xebQNEbG87mWuPznhh91HYauaH+Tm+4Rx2LieOXcIemP7JqVIBt+jBUHaExzFlnQDo88wouajM+KAlcXOPOl7eub8dspsL6DVMLtbo901cNhen2gg94D5TJ+R6ILJhISUfD2iozHelwEosHJ5SYqcfDLDANHDrsvlqqC5fdZ0NxU/aVugwaQAJe4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7P195LcT35BelDrCfNdPnkZ/4fkKtmUQiBGzmZ7N+FA=;
 b=EcohBSDPsT3b+MTxKNR28PKVBwxge/dAwtHGmHiAxgsdbWMur5uk3GyHXpvZDyjzZaOoINPxwrHZB7TqxNPQLupchG5L5aTg5/KnMqKjYQwr3sg4lTcrY70rFEv1M+NR6JRnSVDqPg3G/KFGTAgEQn21licUkgnZdJGHo6FdaNNWHw/bgTO8v/xoB2YH3jauTJpyj8oFAJCqal5FicVBqjSbmtMcpec+5DisiAahZ+kX5Sdv9k2Il1VG+aHYqswm6agc9bl5gXjb0GLZBFovsZI0KihE4SeELcfQAhUt785CCl1jSwofKH6mfPCfzt+QVTqVZfuGiiEMtuk8/AzpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7P195LcT35BelDrCfNdPnkZ/4fkKtmUQiBGzmZ7N+FA=;
 b=ZmBp/k91G2slt2Z++rlRSgvmJ6CgzxvJgn0WnJtD83JH7GtQriIfYb8NuVTFzkPTv2Hl40ZRaFdOddw/J8uHg98DDBV6q0xIuiA/N8twBls8R4GUQdetjZ4OJw6MUs06rpq1fRrKbXEzMQ+E+d3Sp6Bz+m5HAsUaT4P7TSQzhRE=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB3596.namprd11.prod.outlook.com (2603:10b6:5:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 27 May
 2020 13:53:55 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d%6]) with mapi id 15.20.3021.029; Wed, 27 May 2020
 13:53:54 +0000
Subject: Re: [OE-core] [PATCH] initramfs-framework/udev: remove mount.sh to avoid /run/media/XXX
From: "hongxu" <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org
References: <1612E6828C3E4451.32584@lists.openembedded.org>
Message-ID: <094753e8-e8fb-c5e2-2e9e-12953d04a07d@windriver.com>
Date: Wed, 27 May 2020 21:53:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <1612E6828C3E4451.32584@lists.openembedded.org>
X-ClientProxiedBy: BYAPR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:a03:100::32) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.148] (60.247.85.82) by BYAPR08CA0019.namprd08.prod.outlook.com (2603:10b6:a03:100::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Wed, 27 May 2020 13:53:53 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 404d7958-c510-460e-88b9-08d80245651f
X-MS-TrafficTypeDiagnostic: DM6PR11MB3596:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3596E5DCB24F792D65F4D65694B10@DM6PR11MB3596.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CcjOuwG65mOQQ0ikl5LGFEDhECFGcymoNErzLXvNhCk8ED78frv6y8CztbtDy4Q+1+xTJlwSLnSPBCLWQ+fZtdxQ8/gRc36EBNmwD6Zel6eDiguXQdymCrwPk83Iu+21IbTR5lDfEVQwbZf0Nh9jNhdLPvBH30pfzlGL6HsKnkCYSWFP83mLGBUVcLHMcqvmiVjQwDQW+nUOy8M+ZaejlksatALfPhp38FZh1/M41+fWsDmYbPwYguNNYZ0ubH3iCAFK+CHeRne8uTJP6Xh7c+uq1cjkCgw95jnnMob+w4QK5cvNAgRxjc7XX2Dmmi7rR/jmCGjIGx+5TG5ZevuyDRWXk7wjBsEtqhBBrSXuTzqs3Spz/m31VMwty5KnNC/DPDSyKsga/oVomnqU0oOx7yHQcscYdvDUGpRDQPB1WewfEXZ0VI/3f8l5N5KgGyJn/8o5PNM+qchOMDsYhYb9nIOE6RLKwaju6hrHiMCFO/Ja+jEY+4q+pH0dDpC8KYW18ILPEfg3BsEYgdDtgI71NPJ6m8RuTwWhqX7NCoj5GO4K4p3Wd/yECbWYHl/NCe0Z73QwepzMMyrp9iHeQny6pg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(376002)(366004)(346002)(136003)(166002)(8676002)(5660300002)(86362001)(44832011)(31696002)(8936002)(26005)(186003)(52116002)(16526019)(33964004)(53546011)(316002)(2616005)(6666004)(83380400001)(956004)(16576012)(2906002)(31686004)(478600001)(966005)(6486002)(36756003)(66946007)(66556008)(66476007)(6706004)(78286006)(13513002)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AFjpEmY42ZszYmgbz+RvrKVRrPvqT8qwxptmyuXWBtSYik9cPGrXNAH71i4GGNjKuxgcWL3jN3LPorjfttZ3hEAMX/sIKLttdWYj+e6JZJRdGMk4fXPQ8vd3CaKHt/+Hj1/tGeBsJavMpAQFYNCafI1DWeV5qyZcGgzMXPEyxnUNTLFGlDdZzvZoUBI/f4IA8f5uQCbhW+sNsKvOgk71eZ+duu/oN/Ut3MpBAlF5/U8zolX72EoQxdB8/U6hfXNHrk7RskgfmI+w8a3vQXfvgMX+ZYN2dOREYnP2zW2o1ISbKqHe9tJk+FR9Y2pyIE1D7l4jsWzzALnphtHutfcUKubiHzo1a2aJdJGkx86xYkb/+Psyf3PRWjg2I9MOkGSnMZEUZ76XP7UoU135EmLExAnEaCo3PICJBHq/aJWx7PMoFYLiVaGzo3JqDP1qtLCDMygWMsBPmPAZOU/BGi6ldkAGp+Vk6EzgOVH37SIzi2U=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404d7958-c510-460e-88b9-08d80245651f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 13:53:54.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5HdbmQWx+yQ9D1xI9mUXy93Qyx5v5xaFsPnKT6XexOsHHXkXdRXN8g9oTBuA8u0uxqpY7wwJQN9F9lIJWLlcdzIrmOAg9PkYsETNosZ/jM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3596
Content-Type: multipart/alternative;
 boundary="------------F92F7406CAED1CB9E3DAD43E"
Content-Language: en-US

--------------F92F7406CAED1CB9E3DAD43E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi RP,

I do not directly remove udev-extraconf which provides mount.sh
from initramfs-framework, since it also has other hook scripts
for use (such as network.sh). So I choose to remove mount.sh
before start udev

//Hongxu

On 5/27/20 9:43 PM, hongxu wrote:
> The udev invokes script hook mount.sh to mount /run/media/XXX. In
> initramfs-framework, if udev was not killed in time, the partition
> will be mounted to /run/media/XXX before switch_root.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-core/initrdscripts/initramfs-framework/udev | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> index 8b62080c68..3c4dd0ec9b 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> @@ -49,6 +49,9 @@ udev_run() {
>   	# Workaround if console=null, systemd-udevd needs valid stdin, stdout and stderr to work
>   	sh -c "exec 4< /dev/console" || { exec 0> /dev/null; exec 1> /dev/null; exec 2> /dev/null; }
>   
> +	# Avoid /run/media/XXX was mounted by udev
> +	rm -f /etc/udev/scripts/mount.sh
> +
>   	$_UDEV_DAEMON --daemon
>   	udevadm trigger --action=add
>   	udevadm settle
>
> 



--------------F92F7406CAED1CB9E3DAD43E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi RP,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I do not directly remove udev-extraconf
      which provides mount.sh<br>
    </div>
    <div class="moz-cite-prefix">from initramfs-framework, since it also
      has other hook scripts</div>
    <div class="moz-cite-prefix">for use (such as network.sh). So I
      choose to remove mount.sh</div>
    <div class="moz-cite-prefix">before start udev</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">//Hongxu<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 5/27/20 9:43 PM, hongxu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1612E6828C3E4451.32584@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">The udev invokes script hook mount.sh to mount /run/media/XXX. In
initramfs-framework, if udev was not killed in time, the partition
will be mounted to /run/media/XXX before switch_root.

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 meta/recipes-core/initrdscripts/initramfs-framework/udev | 3 &#43;&#43;&#43;
 1 file changed, 3 insertions(&#43;)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 8b62080c68..3c4dd0ec9b 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
&#43;&#43;&#43; b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -49,6 &#43;49,9 @@ udev_run() {
 	# Workaround if console=null, systemd-udevd needs valid stdin, stdout and stderr to work
 	sh -c &quot;exec 4&lt; /dev/console&quot; || { exec 0&gt; /dev/null; exec 1&gt; /dev/null; exec 2&gt; /dev/null; }
 
&#43;	# Avoid /run/media/XXX was mounted by udev
&#43;	rm -f /etc/udev/scripts/mount.sh
&#43;
 	$_UDEV_DAEMON --daemon
 	udevadm trigger --action=add
 	udevadm settle
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

--------------F92F7406CAED1CB9E3DAD43E--
