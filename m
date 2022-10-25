Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFF5C04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 16:08:10 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web12.8861.1666714080819457584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 09:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout04.t-online.de (Postfix) with SMTP id 5DC6F3B1D;
	Tue, 25 Oct 2022 18:07:58 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.37.70]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1onMT7-4SXhTM0; Tue, 25 Oct 2022 18:07:57 +0200
Date: Tue, 25 Oct 2022 18:07:51 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] mesa: update 22.2.0 -> 22.2.2
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <3TGBKR.FO53QNSRRENT@t-online.de>
In-Reply-To: <Y1gBSjnaB+frzv3i@mail.local>
References: <20221024150608.455173-1-f_l_k@t-online.de>
	<Y1gBSjnaB+frzv3i@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-evjd/asFBO4YKFa/+QqK"
X-TOI-EXPURGATEID: 150726::1666714077-896BD81F-EFD5C949/0/0 CLEAN NORMAL
X-TOI-MSGID: 466cca8f-3263-493b-b8a1-9e7fbc751b01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 16:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172137

--=-evjd/asFBO4YKFa/+QqK
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello,

now thats weird. The libegl.so symlink gets installed into the 
libegl-mesa-dev package for my builds. Do you build without 
DISTRO_FEATURE 'opengl' ?

Did it only break with enable PACKAGECONFIG for perfetto ?

Normally libegl.so should be shipped:
<https://git.yoctoproject.org/poky/tree/meta/recipes-graphics/mesa/mesa.inc?h=master-next#n312>

Am Di, 25. Okt 2022 um 17:31:22 +0200 schrieb Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org>:
> Hello,
> 
> This is failing on the AB:
> 
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/1856/steps/13/logs/stdio>
> 
> On 24/10/2022 17:06:08+0200, Markus Volk wrote:
>>  - add a PACKAGECONFIG for perfetto support
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../mesa/{mesa-gl_22.2.0.bb => mesa-gl_22.2.2.bb}             | 0
>>   meta/recipes-graphics/mesa/mesa.inc                           | 4 
>> +++-
>>   meta/recipes-graphics/mesa/{mesa_22.2.0.bb => mesa_22.2.2.bb} | 0
>>   3 files changed, 3 insertions(+), 1 deletion(-)
>>   rename meta/recipes-graphics/mesa/{mesa-gl_22.2.0.bb => 
>> mesa-gl_22.2.2.bb} (100%)
>>   rename meta/recipes-graphics/mesa/{mesa_22.2.0.bb => 
>> mesa_22.2.2.bb} (100%)
>> 
>>  diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb 
>> b/meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
>>  similarity index 100%
>>  rename from meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb
>>  rename to meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
>>  diff --git a/meta/recipes-graphics/mesa/mesa.inc 
>> b/meta/recipes-graphics/mesa/mesa.inc
>>  index 8a74e0a80a..bad8461fef 100644
>>  --- a/meta/recipes-graphics/mesa/mesa.inc
>>  +++ b/meta/recipes-graphics/mesa/mesa.inc
>>  @@ -22,7 +22,7 @@ SRC_URI = 
>> "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>>              
>> file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch 
>> <file://0001-nir-nir_opt_move-fix-always_inline-compiler-error.patch/> 
>> \
>>              "
>> 
>>  -SRC_URI[sha256sum] = 
>> "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa8c"
>>  +SRC_URI[sha256sum] = 
>> "2de11fb74fc5cc671b818e49fe203cea0cd1d8b69756e97cdb06a2f4e78948f9"
>> 
>>   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>> 
>>  @@ -179,6 +179,8 @@ PACKAGECONFIG[vulkan-beta] = 
>> "-Dvulkan-beta=true,-Dvulkan-beta=false"
>> 
>>   PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
>> 
>>  +PACKAGECONFIG[perfetto] = 
>> "-Dperfetto=true,-Dperfetto=false,libperfetto"
>>  +
>>   PACKAGECONFIG[unwind] = 
>> "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
>> 
>>   PACKAGECONFIG[lmsensors] = 
>> "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
>>  diff --git a/meta/recipes-graphics/mesa/mesa_22.2.0.bb 
>> b/meta/recipes-graphics/mesa/mesa_22.2.2.bb
>>  similarity index 100%
>>  rename from meta/recipes-graphics/mesa/mesa_22.2.0.bb
>>  rename to meta/recipes-graphics/mesa/mesa_22.2.2.bb
>>  --
>>  2.34.1
>> 
> 
>> 
>> 
>> 
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com <https://bootlin.com/>
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172134): 
> <https://lists.openembedded.org/g/openembedded-core/message/172134>
> Mute This Topic: <https://lists.openembedded.org/mt/94536553/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-evjd/asFBO4YKFa/+QqK
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Hello,</div><div><br></div><div><div>now thats weird. The libegl.so symlink gets installed into the libegl-mesa-dev package for my builds. Do you build without DISTRO_FEATURE 'opengl' ?</div><div><br></div><div>Did it only break with enable PACKAGECONFIG for perfetto ?</div></div><div><br></div><div>Normally libegl.so should be shipped:</div><div><a href="https://git.yoctoproject.org/poky/tree/meta/recipes-graphics/mesa/mesa.inc?h=master-next#n312">https://git.yoctoproject.org/poky/tree/meta/recipes-graphics/mesa/mesa.inc?h=master-next#n312</a></div></div><div id="geary-quote" dir="auto"><br>Am Di, 25. Okt 2022 um 17:31:22 +0200 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Hello,

This is failing on the AB:

<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/1856/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/1856/steps/13/logs/stdio</a>

On 24/10/2022 17:06:08+0200, Markus Volk wrote:
<blockquote> - add a PACKAGECONFIG for perfetto support
 
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  .../mesa/{mesa-gl_22.2.0.bb =&gt; mesa-gl_22.2.2.bb}             | 0
  meta/recipes-graphics/mesa/mesa.inc                           | 4 +++-
  meta/recipes-graphics/mesa/{mesa_22.2.0.bb =&gt; mesa_22.2.2.bb} | 0
  3 files changed, 3 insertions(+), 1 deletion(-)
  rename meta/recipes-graphics/mesa/{mesa-gl_22.2.0.bb =&gt; mesa-gl_22.2.2.bb} (100%)
  rename meta/recipes-graphics/mesa/{mesa_22.2.0.bb =&gt; mesa_22.2.2.bb} (100%)
 
 diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb b/meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
 similarity index 100%
 rename from meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb
 rename to meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
 diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
 index 8a74e0a80a..bad8461fef 100644
 --- a/meta/recipes-graphics/mesa/mesa.inc
 +++ b/meta/recipes-graphics/mesa/mesa.inc
 @@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
             <a href="file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch">file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch</a> \
             "
  
 -SRC_URI[sha256sum] = "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa8c"
 +SRC_URI[sha256sum] = "2de11fb74fc5cc671b818e49fe203cea0cd1d8b69756e97cdb06a2f4e78948f9"
  
  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P&lt;pver&gt;\d+(\.\d+)+)"
  
 @@ -179,6 +179,8 @@ PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
  
  PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
  
 +PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
 +
  PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
  
  PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
 diff --git a/meta/recipes-graphics/mesa/mesa_22.2.0.bb b/meta/recipes-graphics/mesa/mesa_22.2.2.bb
 similarity index 100%
 rename from meta/recipes-graphics/mesa/mesa_22.2.0.bb
 rename to meta/recipes-graphics/mesa/mesa_22.2.2.bb
 -- 
 2.34.1
 
</blockquote>
<blockquote> 
 
 
</blockquote>

<div>-- 
</div>Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a href="https://bootlin.com">https://bootlin.com</a>
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#172134): <a href="https://lists.openembedded.org/g/openembedded-core/message/172134">https://lists.openembedded.org/g/openembedded-core/message/172134</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/94536553/3618223">https://lists.openembedded.org/mt/94536553/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-evjd/asFBO4YKFa/+QqK--


