Return-Path: <afd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by mail.openembedded.org (Postfix) with ESMTP id A7B677F8B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 01:01:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8H11qnx048770;
	Mon, 16 Sep 2019 20:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568682112;
	bh=KroSkwyRy8MelPYPxPvmbK0Ktbi9NvDBz0i8JSl1Ock=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=jeU3Rffg2fVyCs9lzFf0lIjXOV5q0sN45SXG+/LiTYvCNpZ9tdWb7HerOHMsKfpWS
	bSCGbwNhcgecGifOfTDFXwPUYvOrJl4LC1MZ55sYc2CAVIupz2kzzAwGn4zR6WEzrQ
	HsqMaLGGTu9RXK0PGZnqeQjhzl4swUb7gZa9Seto=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8H11qxS115253
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Sep 2019 20:01:52 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 16 Sep 2019 20:01:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 16 Sep 2019 20:01:49 -0500
Received: from [10.250.95.88] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8H11pJ1059571;
	Mon, 16 Sep 2019 20:01:51 -0500
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko
	<denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>, Eric Ruei
	<e-ruei1@ti.com>
References: <20190913193614.4882-1-afd@ti.com>
	<20190913193614.4882-3-afd@ti.com>
	<85c976042f32c1ddf1a3384ac31c946573087bbe.camel@linuxfoundation.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <5c5d5847-6d89-2253-303f-bd65bfb22cee@ti.com>
Date: Mon, 16 Sep 2019 21:01:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <85c976042f32c1ddf1a3384ac31c946573087bbe.camel@linuxfoundation.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] gtk+3: Set depends to the virtual needed not explicitly on Mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Sep 2019 01:01:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/16/19 6:27 PM, Richard Purdie wrote:
> On Fri, 2019-09-13 at 15:36 -0400, Andrew F. Davis via Openembedded-core wrote:
>> The dependency is for EGL and GLES2 libraries. On some systems these
>> are not provided by Mesa, list what is actually needed so the system
>> can choose the correct provider.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>  meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
>> index 77b6c31536..7ec40dcbf5 100644
>> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
>> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
>> @@ -52,7 +52,7 @@ PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fon
>>  # this is provided by oe-core patch that removes epoxy/gl dependency from a X11 build
>>  PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,libepoxy"
>>  PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
>> -PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/mesa wayland-native"
>> +PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/egl virtual/gles2 wayland-native"
>>  PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
>>  
>>  prepare_gtk_scripts() {
> 
> This breaks things:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/1037
> 
> step1b: ERROR: Nothing PROVIDES 'virtual/gles2' (but /home/pokybuild/yocto-worker/qemux86-64-x32/build/meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb DEPENDS on or otherwise requires it). Close matches:
> 

Thanks for the heads up. Copy/merge error on my part, the correct target
is "virtual/libgles2", same typo on patch 4/4, will re-send updated v2.

Thanks,
Andrew

> Cheers,
> 
> Richard
> 
> 
> 

