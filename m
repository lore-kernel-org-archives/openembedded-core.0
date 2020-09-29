Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.75])
 by mx.groups.io with SMTP id smtpd.web10.13969.1601356038231547039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 22:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bXHaI+gr;
 spf=pass (domain: windriver.com, ip: 40.107.69.75, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBrxdgete0qQj8R1LD1pla+U9cNLOeiH0EZsG7EO3xR3DCWZ93hHEOgNSFAcpZcyZPEvHZnvAc4KYkEmRvrUFT9Iex7kapMm5/o03S9Nf7S3famqbf7gzxDP06jUVycKjuEeD9udlSybFyoNwcaHlMI8d++BDZmBm9gmFeBuvBfYYhqoDDtXvo2b0zOqu19UZLjmanmwAgd7ept0EQtfs/Wupgrujf4U6HRjhxH9s4Wj+QhFgOsBK0a6SPEm8mO5MLTaHbE6iYC5Qr8ptOaBDqGYrEIrCqsSfQ4pI8N2adPCMr/vzR3jC4dm1svu3sAZd9ko/EJenaNHwHSOrlrgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ2oEqGaVRADEgdam3vJtg8nirzW5rMwerMh4IC2EnA=;
 b=jsrh6h/8/tx5nQAvx1OWqpCd1/dN00tfYbtPKs8q4QPLaAXPv2AntnSlQs5Ao3Lu63bRBX3TAfxttI/QEGOcBQTh3l8enf2SBvjj+e+Q4hA/VpD5HWkJUTmvijvGKmup6cD5hH1Ca27YJgUKeLLrTbwbngnSYItjKvBIWsfKkvWP4QvPd47rzjXYnVW6ZHfpZ5z5Pa8gFaLp0qOxQ1cHv//bwFSJF/+vqiNJja10g5oIlgBsGIgRTzQtJ8/OqVeHwUF4pYurVbjaCSRAuSsPPkC3zTaRZwx3oal/CwyXO533ekXGwqB7xVsMkEoYLv5qpijU3fUgrKMpJ6RI8Wj9/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ2oEqGaVRADEgdam3vJtg8nirzW5rMwerMh4IC2EnA=;
 b=bXHaI+grJIy0fLRPQ1JcblTBbTJNPD+G2A2T3pPcRnf2IvUvWJjeRpOil9YdqQmdVANTv81SheAarJkdx7xN8iEYJMtwYSWh0gOZSwm13btnbtXm6Jufd1+h2iLgG/He8Jf38wA8bHynqNStAL5CiVEzRvZiUkQD6j+Te06Xe+Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3557.namprd11.prod.outlook.com (2603:10b6:a03:b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 05:07:17 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1%7]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 05:07:17 +0000
Subject: Re: [OE-core][PATCH 3/3] nfs-utils: fix configure error on some hosts
To: Khem Raj <raj.khem@gmail.com>
References: <20200929032216.32161-1-Qi.Chen@windriver.com>
 <20200929032216.32161-3-Qi.Chen@windriver.com>
 <CAMKF1srVBciPuLDgfGKyEVhFX8sbLd=H=CSOTzq-c21XCHH+-g@mail.gmail.com>
 <16392890750B0920.5304@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <4eb695d2-7339-4cb0-cc6d-86e274ed7d38@windriver.com>
Date: Tue, 29 Sep 2020 13:13:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <16392890750B0920.5304@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0070.apcprd04.prod.outlook.com
 (2603:1096:202:15::14) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR04CA0070.apcprd04.prod.outlook.com (2603:1096:202:15::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3412.21 via Frontend Transport; Tue, 29 Sep 2020 05:07:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d14b293f-512d-4443-55f8-08d8643588f0
X-MS-TrafficTypeDiagnostic: BYAPR11MB3557:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB35574D126117E46992ACD23AED320@BYAPR11MB3557.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MtVvhc0hQAgTZq3rrDGALDpvKwYb7VqIx2ANgw9FwE03nZTHjpZUP4NX/KSSGOPIaeqnINGOABZrAvA3yxxmlKTOEVAfXjHdLU2YJU4tY6nI5LNMZ95d+1K/ytY3o7o6WTBm5Uwv5iLcWZDgh1MLlLUpeRqXNFza2sTXCYc0FmcIKy3M8As8gjeUI3Cz3usRb3ybmEAVRVaF0cplPpReJ4o2yO4R6C0fj0VmHisqTKUBCe4sl41HHTDBU5XOPDSkVuxRi0ksAKCLpAqqa+T8YLQNRIotk7Tja9+bmeIsueSzjNCR7n1ohlf0H9wCGQtRwXR581e/p2uA1qnqdKl+0khjXGeyycjNdnWr4lc8HM7vyXx+W0DGciWdpgPLYlaYFJMWBF7ttWilH4NNLGLFM/vLuKuJw28qtojYrgSnQW4THCXtmiB/WmFGdbYO5oW2NQxAvMVzsM2bg2zn/vNLam0rXvjY5alp6eUuGavb3WUjDJqYRzT2SvNOrX0mM3yXsAEdeRMi2gj0gWU63vLcEx7O8b8ZPYER6htR5zrTjww=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(396003)(136003)(6706004)(6916009)(2616005)(956004)(31686004)(66946007)(966005)(478600001)(186003)(6666004)(26005)(16526019)(86362001)(316002)(16576012)(4326008)(8676002)(66476007)(166002)(2906002)(31696002)(83380400001)(8936002)(52116002)(36756003)(6486002)(53546011)(66556008)(5660300002)(33964004)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	9/AXTYP9Y5CPhT99L5EhyTNp0UqgxW59Z93Qm6urWCveT1ED/SVZ/PJg3wJ2kDsQB3A1xRfqPW1Tk+oAk+vm9aixmLPYyd8oUojuD9oQjWD3u6HO9t41lOcLibH43cOn+/o/24EQHYtV/iHYhUIkWIx5eHasGiE4aYxEtDSg4JuumVrHhLrxI1A/Hs3hnTdHlqZmeOc1JMkfZZjO0H0olDBZ92dDW8qx89aT5qPuZU/aQeiBevtfsX5r3A3Am2eXDUPBeGlRfVS5zJ0soOgp4WgNhnTLq7/JLAeALu/2gewmJKNuxf66IESTkB4aug+QdOtPn7D7v6neNWiqAVmBR4KnW72+o+ggNxE2poqhQX6+wg/JmGniZDQnUtTNijcIQJV0qQJ8vWnJsaXrlXBbf+XjpWSJULKR5xFHfVQ9UOHp3OKeEmlpEz7orXost0gBFePA0J3frY0jqCqip71XekzvJukG/m7gXhQE3JNAdCuF3Gv56DAyQy9D0iCVtzC5ymEn/t+RzMO8RYIVIVMWnZGW/qkGMfz7q4ETe+eii5NUUeZiy43VxCFtzTjyY+cWO+KDrLNvPU+5b9l5Q6mWCS6PHv7B5OSUVOcBMoC41kYhpe92FvJUYbfB++4y9vx5/TryRJC/0CTgPs1R01hKVg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14b293f-512d-4443-55f8-08d8643588f0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 05:07:16.9149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pY2nk7Btr+mVAFyZm+dgaHKow80Z8b6/yfmw6b/u2qFx9qKCJEOzxr7akIHp58y+fi3HB9+5AXPSBETMxqQiow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3557
Content-Type: multipart/alternative;
 boundary="------------091D49B6907E5243EAE72254"

--------------091D49B6907E5243EAE72254
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Just found that it's already been fixed by the following patch.

commit 2e0b4c99f5d49c84a3a2992fb686d27693f3d8c6
Author: Taras Kondratiuk <takondra@cisco.com>
Date:   Fri Jul 10 10:41:16 2020 -0700

     nfs-utils: use rpcgen tool from HOSTTOOLS_DIR

     nfs-utils configure searches for rpcgen tool only in default locations:
     "/usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen".
     On some of our build machines the rpcgen is not present there and
     configure fails:
     | configure: error: Please install rpcgen or use --with-rpcgen

     HOSTTOOLS_DIR already contains a correct pointer to host rpcgen 
tool, so
     use it from there.

     Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Please ignore my patch.

Best Regards,
Chen Qi

On 09/29/2020 01:08 PM, Chen Qi wrote:
> On 09/29/2020 12:23 PM, Khem Raj wrote:
>> On Mon, Sep 28, 2020 at 8:22 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>>> nfs-utils' configure.ac hardcodes the rpcgen's searching path. However,
>>> on some hosts, rpcgen is missing but SDK provides one. We should avoid
>>> the hardcoding so that nfs-utils could be built correctly under SDK.
>>>
>> perhaps its better to always require --with-rpcgen there is no need to
>> look into host paths
>
> I agree. Thanks.
> I'll send out V2.
>
> Regards,
> Chen Qi
>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   ...gure.ac-avoid-hardcoding-rpcgen-path.patch | 31 
>>> +++++++++++++++++++
>>>   .../nfs-utils/nfs-utils_2.5.1.bb              |  1 +
>>>   2 files changed, 32 insertions(+)
>>>   create mode 100644 
>>> meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
>>>
>>> diff --git 
>>> a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch 
>>> b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch 
>>>
>>> new file mode 100644
>>> index 0000000000..5602e5be57
>>> --- /dev/null
>>> +++ 
>>> b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
>>> @@ -0,0 +1,31 @@
>>> +From b9049fbf051e559941298afd57ec43d6f6a5490d Mon Sep 17 00:00:00 2001
>>> +From: Chen Qi <Qi.Chen@windriver.com>
>>> +Date: Wed, 29 Apr 2020 08:56:05 +0000
>>> +Subject: [PATCH] configure.ac: avoid hardcoding rpcgen path
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> +---
>>> + configure.ac | 5 +++--
>>> + 1 file changed, 3 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/configure.ac b/configure.ac
>>> +index f9efdb7..8e8aeaa 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -152,8 +152,9 @@ AC_ARG_WITH(rpcgen,
>>> +       rpcgen_cflags=-Werror=strict-prototypes
>>> +       RPCGEN_PATH=
>>> +       if test "$rpcgen_path" = "yes"; then
>>> +-          for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
>>> +-          do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done
>>> ++          #for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
>>> ++          #do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done
>>> ++          RPCGEN_PATH=`which rpcgen`
>>> +               if test -z "$RPCGEN_PATH"; then
>>> +                       AC_MSG_ERROR([Please install rpcgen or use 
>>> --with-rpcgen])
>>> +               fi
>>> +--
>>> +2.24.1
>>> +
>>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb 
>>> b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
>>> index b8ad23a0d8..b06ce2d0af 100644
>>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
>>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
>>> @@ -30,6 +30,7 @@ SRC_URI = 
>>> "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>>>              file://bugfix-adjust-statd-service-name.patch \
>>> file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
>>>              file://clang-warnings.patch \
>>> + file://0001-configure.ac-avoid-hardcoding-rpcgen-path.patch \
>>>              "
>>>   SRC_URI[sha256sum] = 
>>> "0f1c8170e16a07d9836bbf0836d48d0c842b6f0e0e8b18748f099751851d30c4"
>>>
>>> -- 
>>> 2.17.1
>>>
>>>
>>>
>>>
>
>
>
> 
>


--------------091D49B6907E5243EAE72254
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Just found that it's already been fixed
      by the following patch.<br>
      <br>
      commit 2e0b4c99f5d49c84a3a2992fb686d27693f3d8c6<br>
      Author: Taras Kondratiuk <a class="moz-txt-link-rfc2396E" href="mailto:takondra@cisco.com">&lt;takondra@cisco.com&gt;</a><br>
      Date:&nbsp;&nbsp; Fri Jul 10 10:41:16 2020 -0700<br>
      <br>
      &nbsp;&nbsp;&nbsp; nfs-utils: use rpcgen tool from HOSTTOOLS_DIR<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp; nfs-utils configure searches for rpcgen tool only in default
      locations:<br>
      &nbsp;&nbsp;&nbsp; &quot;/usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen&quot;.<br>
      &nbsp;&nbsp;&nbsp; On some of our build machines the rpcgen is not present there
      and<br>
      &nbsp;&nbsp;&nbsp; configure fails:<br>
      &nbsp;&nbsp;&nbsp; | configure: error: Please install rpcgen or use --with-rpcgen<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp; HOSTTOOLS_DIR already contains a correct pointer to host
      rpcgen tool, so<br>
      &nbsp;&nbsp;&nbsp; use it from there.<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp; Signed-off-by: Taras Kondratiuk <a class="moz-txt-link-rfc2396E" href="mailto:takondra@cisco.com">&lt;takondra@cisco.com&gt;</a><br>
      &nbsp;&nbsp;&nbsp; Signed-off-by: Richard Purdie
      <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
      <br>
      Please ignore my patch.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 09/29/2020 01:08 PM, Chen Qi wrote:<br>
    </div>
    <blockquote cite="mid:16392890750B0920.5304@lists.openembedded.org" type="cite">On 09/29/2020 12:23 PM, Khem Raj wrote:
      <br>
      <blockquote type="cite">On Mon, Sep 28, 2020 at 8:22 PM Chen Qi
        <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a> wrote:
        <br>
        <blockquote type="cite">nfs-utils' configure.ac hardcodes the
          rpcgen's searching path. However,
          <br>
          on some hosts, rpcgen is missing but SDK provides one. We
          should avoid
          <br>
          the hardcoding so that nfs-utils could be built correctly
          under SDK.
          <br>
          <br>
        </blockquote>
        perhaps its better to always require --with-rpcgen there is no
        need to
        <br>
        look into host paths
        <br>
      </blockquote>
      <br>
      I agree. Thanks.
      <br>
      I'll send out V2.
      <br>
      <br>
      Regards,
      <br>
      Chen Qi
      <br>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">Signed-off-by: Chen Qi
          <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; ...gure.ac-avoid-hardcoding-rpcgen-path.patch | 31
          +++++++++++++++++++
          <br>
          &nbsp; .../nfs-utils/nfs-utils_2.5.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
          <br>
          &nbsp; 2 files changed, 32 insertions(+)
          <br>
          &nbsp; create mode 100644
meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch<br>
          <br>
          diff --git
a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
          <br>
          new file mode 100644
          <br>
          index 0000000000..5602e5be57
          <br>
          --- /dev/null
          <br>
          +++
b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch<br>
          @@ -0,0 +1,31 @@
          <br>
          +From b9049fbf051e559941298afd57ec43d6f6a5490d Mon Sep 17
          00:00:00 2001
          <br>
          +From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
          <br>
          +Date: Wed, 29 Apr 2020 08:56:05 +0000
          <br>
          +Subject: [PATCH] configure.ac: avoid hardcoding rpcgen path
          <br>
          +
          <br>
          +Upstream-Status: Pending
          <br>
          +
          <br>
          +Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
          <br>
          +---
          <br>
          + configure.ac | 5 +++--
          <br>
          + 1 file changed, 3 insertions(+), 2 deletions(-)
          <br>
          +
          <br>
          +diff --git a/configure.ac b/configure.ac
          <br>
          +index f9efdb7..8e8aeaa 100644
          <br>
          +--- a/configure.ac
          <br>
          ++++ b/configure.ac
          <br>
          +@@ -152,8 +152,9 @@ AC_ARG_WITH(rpcgen,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rpcgen_cflags=-Werror=strict-prototypes
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RPCGEN_PATH=
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test &quot;$rpcgen_path&quot; = &quot;yes&quot;; then
          <br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for p in /usr/local/bin/rpcgen /usr/bin/rpcgen
          /bin/rpcgen
          <br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do if test -f $p ; then RPCGEN_PATH=$p ; break; fi
          ; done
          <br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #for p in /usr/local/bin/rpcgen /usr/bin/rpcgen
          /bin/rpcgen
          <br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #do if test -f $p ; then RPCGEN_PATH=$p ; break;
          fi ; done
          <br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RPCGEN_PATH=`which rpcgen`
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test -z &quot;$RPCGEN_PATH&quot;; then
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AC_MSG_ERROR([Please install rpcgen or
          use --with-rpcgen])
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi
          <br>
          +--
          <br>
          +2.24.1
          <br>
          +
          <br>
          diff --git
          a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
          b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
          <br>
          index b8ad23a0d8..b06ce2d0af 100644
          <br>
          --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
          <br>
          +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
          <br>
          @@ -30,6 +30,7 @@ SRC_URI =
          &quot;${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="file://bugfix-adjust-statd-service-name.patch">file://bugfix-adjust-statd-service-name.patch</a> \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a class="moz-txt-link-freetext" href="file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch">file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch</a>
          \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="file://clang-warnings.patch">file://clang-warnings.patch</a> \
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a class="moz-txt-link-freetext" href="file://0001-configure.ac-avoid-hardcoding-rpcgen-path.patch">file://0001-configure.ac-avoid-hardcoding-rpcgen-path.patch</a> \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;
          <br>
          &nbsp; SRC_URI[sha256sum] =
          &quot;0f1c8170e16a07d9836bbf0836d48d0c842b6f0e0e8b18748f099751851d30c4&quot;
          <br>
          <br>
          --
          <br>
          2.17.1
          <br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </blockquote>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------091D49B6907E5243EAE72254--
