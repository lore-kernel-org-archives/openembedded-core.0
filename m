Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.79])
 by mx.groups.io with SMTP id smtpd.web11.8099.1599115627400811053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 23:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ESa5KkuY;
 spf=pass (domain: windriver.com, ip: 40.107.220.79, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0jYlsb5QNejeF91DMTijfY5rvP40E5ht6q5mmITlzcddCqp05k6pIjDMbzy6tp+crp1Y97FqATHud16RXzCDgmNhcNYZ0RVal6yZiyzOcB3V5y/HMipmFDbGnv3B8Onxbqmi88UpBTNpx6s+VSo6y3aU8r91Ix1rSbfb//GyHfIhTKGkE6oQovalfRBXoUza70YlbCdsV7J3n0gHMo/PSkVCpW3tNfxmKBIW6UbqMx1ZI2yRXJiTt86V3h1sxsGyz9LCPqDQiJP4fteDc42eIq7o1AIORz4q3ErysuFL+RvU+o5VD9FULqECd4t3LxyE8r7PPVFBcDtSKhMpNpKiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZpw5SA+fljOWXooWhZl3g89RlkE/heSQcY/wLJ7yDA=;
 b=kCvPlaj6hDRcsuRVuWDud2lTQUvnMdfZ3ECqJJon7wt/RcLfDwhU9eeVHOFBon4x5clgwahZCdEjAWK5sHyn1DpaU0WpHyncAfFnUOL/8OfEiGZwhWRJ+9e78CRMxWAnBwH5MmRYhKHwg2joModYgCSs0eY5zjmdB0ykCRd5UhJs4Za7pJnGbkA7TgGHhFXy8W/k3BcwHFO0rcy9PSAcbAOAi5hmJUlT5mA05EKaBIUjHwkWSuHVAgWfo9HOI6llKRN7veF8n8Abvk/7SRobaQ6pD2+dy7XGUMLnEHmpENdQjGSLAO92QGfggdWJJ4Wes2tadhabRJpy2adP/LTmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZpw5SA+fljOWXooWhZl3g89RlkE/heSQcY/wLJ7yDA=;
 b=ESa5KkuYYWpG6OzCrE3rBC0TyFXaDiDwa9mOfAouzxu3vbAjb5dfcf716rUpQx10VUri1RFAlgwA1FpMDmdnD3gf1VJAa1OqJUeNCPl8DHiDCt/Cp/P8dHGJA+v/Ov+VskmgDGP0mVjhKDYyXepaptgKeXab+xs4xP1EIpleJsk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3557.namprd11.prod.outlook.com (2603:10b6:a03:b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 3 Sep
 2020 06:47:05 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::6da1:47ca:a4e9:92e3]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::6da1:47ca:a4e9:92e3%5]) with mapi id 15.20.3348.015; Thu, 3 Sep 2020
 06:47:05 +0000
Subject: Re: [OE-core][PATCH] rpm: fix nativesdk's default var location
To: leimaohui <leimaohui@cn.fujitsu.com>,
 "Richard Purdie (richard.purdie@linuxfoundation.org)"
 <richard.purdie@linuxfoundation.org>
References: <20200716065632.33861-1-Qi.Chen@windriver.com>
 <a3f71396a0fa4f298cecd67fb3240e09@G08CNEXMBPEKD05.g08.fujitsu.local>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <1ce32dba-e532-1049-387d-58d7e1bbbe7f@windriver.com>
Date: Thu, 3 Sep 2020 14:52:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <a3f71396a0fa4f298cecd67fb3240e09@G08CNEXMBPEKD05.g08.fujitsu.local>
X-ClientProxiedBy: HK2PR02CA0216.apcprd02.prod.outlook.com
 (2603:1096:201:20::28) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by HK2PR02CA0216.apcprd02.prod.outlook.com (2603:1096:201:20::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3348.16 via Frontend Transport; Thu, 3 Sep 2020 06:47:03 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 729179de-ddeb-4850-3557-08d84fd52b4f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3557:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB35571868B5225E44C2050DF2ED2C0@BYAPR11MB3557.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PjFDDUpwi3fIrMAm0pf/ganTMg926p0FYzq1nqpxZ1UMoXH67Zt1r3SljKm5Hz8dhnwjr8vxQO2F155iuTqTJNowVn+e13WlF5wzDLr3JxHbxd5JwfgPumtu/OD0BPhywZ0Sd1Aui0bu33VHJg6v4dnkUgqPccslcp18LPWNYeaOMZcYxyO8DdafybgUwYrUaYloBjDxQTeegAJ/Gzf0wqk3nT3SyfUQMChXBl5RTh8x/SqKbZpm1gwFHNI49b2csGBebJo+wgVM9YDLlh1qt0Bwb4DMMS2P/i2yMRGNLUoGM9PUb88OuyR7nW926wr+cmoFWjr48SOcFmLJrUzunAhiWXF51xsEzS7/LNifcp4TBDcdOGy9YB4sNhYu/GdhI4nPVvZrD3WCA3EgFwYv7D+WGyGwyZbIR2vRnU+E4qZIpUgr+v310CSoJlo6+4MkFoxF0mTCilO+UiGNMgSwaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(396003)(366004)(376002)(52116002)(53546011)(66946007)(316002)(83380400001)(166002)(478600001)(6486002)(2616005)(31696002)(186003)(26005)(33964004)(86362001)(956004)(66476007)(66556008)(8936002)(6666004)(2906002)(110136005)(5660300002)(36756003)(966005)(16576012)(8676002)(31686004)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	eYwmnPJQbj++pX2Ced19KaS7Y0O2Imj4Vc1UM9/BKdXlSp7P9VKFvrzMuBb2/PrRY/oQhIKgohvd61ycxMNL0HcCACnn6Vdn3DaJcef7nkMbYbk+IvIZ6aLoRaBmpcPgv4TXDb7he9ckN31xvUsVHx8X6J/xpR2b7DkuZRtFe3JvTcinn1ZnS1m8G3/TJnCN77vPza/GX4GvwA7KqpkjB8HcZ0y5OcdP8M5heJ+W8mRPg+jg2m3Fh0dTKOBlc3PtQgidOKcO4BEZmelpprmMSh+BgZqHNDmL8KZW49V7aeMCmSNXf9HlF6pybfb6D7bVLQFmq4B/+wsOfrFZ+TtzeDBCAKvONgj5+CWAeJzuJz5BjFX3jv8utPinBLAuj5nKj/6vLA0DhJW1Ugr+qLheVWTkuUgIbj0m2PmHUOWDz+gRqr4D13HaHm4+TyCXLfjOrRxNiUuw+iAXL4BwhMecUnrxNl1IP2SVhPyewLgSPNo5gz1HO/BAAacyqGwokEyH3zE90pvMnA2AE0tqEyVLuyluA5XaM586p1AZ8P5C4S0cfXCwnLSCWv+Fi6+8NmUBdsxRTi+f/VIxf5PSOdTkWDPT5mauA4X5aTL68A30IK9iB0/zV5RGFAM3gAqtc+SXhOZ5Ww0F/siinchbQbHgiA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729179de-ddeb-4850-3557-08d84fd52b4f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 06:47:04.9073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyBfV62bgsm1vcp1HDczNTFYANFLSBSup//1c9OxsWZx31drZMOfRo0iDBuGCYOQIBbjlR+j/vuxeZ2xN2+lNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3557
Content-Type: multipart/alternative;
 boundary="------------3355F5C63629EF4E2123C9F4"

--------------3355F5C63629EF4E2123C9F4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lei,

The rpm in SDK uses a wrapper, and looking at the settings I don't think 
it's supposed to be used with '--root'.

export RPM_CONFIGDIR=`dirname $realpath`/../lib/rpm 
RPM_ETCCONFIGDIR=${RPM_ETCCONFIGDIR-`dirname $realpath`/../../etc/..} 
MAGIC=`dirname $realpath`/../share/misc/magic.mgc 
RPM_NO_CHROOT_FOR_SCRIPTS=1
exec -a "$0" $realdir/rpm.real "$@"

Besides, checking the macros file, it has already set %_usr, %_prefix, 
%_libdir to point to locations under SDK. I think that also implies that 
it's not supposed to be used with '--root'. And that's we should do the 
same for %_var.

Regards,
Chen Qi

On 09/03/2020 01:40 PM, leimaohui wrote:
> Hi,
>
> I'm sorry but I don't understand this patch.
>
>>     error: cannot open Packages index using db5 - Permission denied (13)
>>     error: cannot open Packages database in /var/lib/rpm
> I think these two error messages is just because invoking nativesdk-rpm without "--root=":
> -------------------------------------------------
> $ /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/rpm -qplv attr-2.4.48-r0.core2_64.rpm
> error: cannot open Packages index using db5 - Permission denied (13)
> error: cannot open Packages database in /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/var/lib/rpm
> drwxr-xr-x    2 root     root                        0 Jun 19  2018 /etc
> -rw-r--r--    1 root     root                      642 Jun 19  2018 /etc/xattr.conf
> ...
>
> Same as nativesdk-gcc adding "--sysroot=", nativesdk-rpm should be invoked with "--root=":
> --------------------------------------------------
> $ /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/rpm -qplv attr-2.4.48-r0.core2_64.rpm --root=/home/leimh/test-rootfs/
> drwxr-xr-x    2 root     root                        0 Jun 19  2018 /etc
> -rw-r--r--    1 root     root                      642 Jun 19  2018 /etc/xattr.conf
> ......
>
> But now with this patch, "--root=" doesn't work for nativesdk-rpm. Even I use nativesdk-rpm with "--root=", the database of nativesdk-rpm still is written to ${SDK_INTALL_DIR}/var/lib/rpm/,  not the directory that I set by "--root=".
>
>
> Best regards
> Lei
>
>
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Chen Qi
>> Sent: Thursday, July 16, 2020 2:57 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core][PATCH] rpm: fix nativesdk's default var location
>>
>> For now, the nativesdk-rpm's %_var in /usr/lib/rpm/macros is '/var'. This is
>> causing error when running `rpm -qplv A.rpm'.
>>
>>     error: cannot open Packages index using db5 - Permission denied (13)
>>     error: cannot open Packages database in /var/lib/rpm
>>
>> The rpm in SDK should be using its own database. So we should remove this
>> configure option, letting the SDK's native sysroot prefix to be there in %_var. In
>> fact, '%_usr' in macros has already got the prefix.
>> After this change, we have in the macros file lines like below.
>>
>> """
>> %_usr                   /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-
>> linux/usr
>> %_usrsrc                %{_usr}/src
>> %_var                   /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-
>> linux/var
>> """
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-devtools/rpm/rpm_4.15.1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-
>> devtools/rpm/rpm_4.15.1.bb
>> index cbe1acffe2..b5a0ac9382 100644
>> --- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
>> @@ -67,7 +67,7 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls --
>> disable-openmp"
>>   # Disable dbus for native, so that rpm doesn't attempt to inhibit shutdown via
>> session dbus even when plugins support is enabled.
>>   # Also disable plugins by default for native.
>>   EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --
>> localstatedir=/var --disable-plugins"
>> -EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --
>> localstatedir=/var --disable-plugins"
>> +EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --disable-
>> plugins"
>>
>>   BBCLASSEXTEND = "native nativesdk"
>>
>> --
>> 2.17.1
>>
>>
>
>
>
>
> 



--------------3355F5C63629EF4E2123C9F4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Lei,<br>
      <br>
      The rpm in SDK uses a wrapper, and looking at the settings I don't
      think it's supposed to be used with '--root'.<br>
      <br>
      export RPM_CONFIGDIR=`dirname $realpath`/../lib/rpm
      RPM_ETCCONFIGDIR=${RPM_ETCCONFIGDIR-`dirname
      $realpath`/../../etc/..} MAGIC=`dirname
      $realpath`/../share/misc/magic.mgc RPM_NO_CHROOT_FOR_SCRIPTS=1<br>
      exec -a &quot;$0&quot; $realdir/rpm.real &quot;$@&quot;<br>
      <br>
      Besides, checking the macros file, it has already set %_usr,
      %_prefix, %_libdir to point to locations under SDK. I think that
      also implies that it's not supposed to be used with '--root'. And
      that's we should do the same for %_var.<br>
      <br>
      Regards,<br>
      Chen Qi<br>
      <br>
      On 09/03/2020 01:40 PM, leimaohui wrote:<br>
    </div>
    <blockquote cite="mid:a3f71396a0fa4f298cecd67fb3240e09@G08CNEXMBPEKD05.g08.fujitsu.local" type="cite">
      <pre wrap="">Hi,

I'm sorry but I don't understand this patch. 

</pre>
      <blockquote type="cite">
        <pre wrap="">   error: cannot open Packages index using db5 - Permission denied (13)
   error: cannot open Packages database in /var/lib/rpm
</pre>
      </blockquote>
      <pre wrap="">
I think these two error messages is just because invoking nativesdk-rpm without &quot;--root=&quot;:
-------------------------------------------------
$ /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/rpm -qplv attr-2.4.48-r0.core2_64.rpm
error: cannot open Packages index using db5 - Permission denied (13)
error: cannot open Packages database in /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/var/lib/rpm
drwxr-xr-x    2 root     root                        0 Jun 19  2018 /etc
-rw-r--r--    1 root     root                      642 Jun 19  2018 /etc/xattr.conf
...

Same as nativesdk-gcc adding &quot;--sysroot=&quot;, nativesdk-rpm should be invoked with &quot;--root=&quot;:
--------------------------------------------------
$ /opt/poky/3.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/rpm -qplv attr-2.4.48-r0.core2_64.rpm --root=/home/leimh/test-rootfs/
drwxr-xr-x    2 root     root                        0 Jun 19  2018 /etc
-rw-r--r--    1 root     root                      642 Jun 19  2018 /etc/xattr.conf
......

But now with this patch, &quot;--root=&quot; doesn't work for nativesdk-rpm. Even I use nativesdk-rpm with &quot;--root=&quot;, the database of nativesdk-rpm still is written to ${SDK_INTALL_DIR}/var/lib/rpm/,  not the directory that I set by &quot;--root=&quot;.


Best regards
Lei



</pre>
      <blockquote type="cite">
        <pre wrap="">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> &lt;openembedded-
<a class="moz-txt-link-abbreviated" href="mailto:core@lists.openembedded.org">core@lists.openembedded.org</a>&gt; On Behalf Of Chen Qi
Sent: Thursday, July 16, 2020 2:57 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Subject: [OE-core][PATCH] rpm: fix nativesdk's default var location

For now, the nativesdk-rpm's %_var in /usr/lib/rpm/macros is '/var'. This is
causing error when running `rpm -qplv A.rpm'.

   error: cannot open Packages index using db5 - Permission denied (13)
   error: cannot open Packages database in /var/lib/rpm

The rpm in SDK should be using its own database. So we should remove this
configure option, letting the SDK's native sysroot prefix to be there in %_var. In
fact, '%_usr' in macros has already got the prefix.
After this change, we have in the macros file lines like below.

&quot;&quot;&quot;
%_usr                   /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-
linux/usr
%_usrsrc                %{_usr}/src
%_var                   /opt/windriver/wrlinux/20.29/sysroots/x86_64-wrlinuxsdk-
linux/var
&quot;&quot;&quot;

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 meta/recipes-devtools/rpm/rpm_4.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-
devtools/rpm/rpm_4.15.1.bb
index cbe1acffe2..b5a0ac9382 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -67,7 +67,7 @@ EXTRA_OECONF_append_libc-musl = &quot; --disable-nls --
disable-openmp&quot;
 # Disable dbus for native, so that rpm doesn't attempt to inhibit shutdown via
session dbus even when plugins support is enabled.
 # Also disable plugins by default for native.
 EXTRA_OECONF_append_class-native = &quot; --sysconfdir=/etc --
localstatedir=/var --disable-plugins&quot;
-EXTRA_OECONF_append_class-nativesdk = &quot; --sysconfdir=/etc --
localstatedir=/var --disable-plugins&quot;
+EXTRA_OECONF_append_class-nativesdk = &quot; --sysconfdir=/etc --disable-
plugins&quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;

--
2.17.1


</pre>
      </blockquote>
      <pre wrap="">


</pre>
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

--------------3355F5C63629EF4E2123C9F4--
