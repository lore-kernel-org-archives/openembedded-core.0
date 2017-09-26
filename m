Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id A8CD377F34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 01:19:18 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id z84so4736572pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 18:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=3tLYTtpP+djt5NjOJuaTUryoNxNc3Mx/j9KJgcPfxEE=;
	b=s98pdvaKJWXFXYzT/2QJGqmgZyv+YLeEtt1T8wVleqMDSNJ1Gvn3J+8Egu7Lewb+Kf
	7OR6k+BosJvg5G5uD6KpH+HymY5X/WV5vLcA5o8Vun1yKR2pDTj2UlMPbVEYunuGBBHG
	8dETLagSdLyQcexfQYajuDB3XFDqDHM6n/XdLPUbc8iokzu7vEj56XaX3aJFDxQmA7kv
	5ShOW2hM0kGUDTdTyvWdC4ZBMIfOV9o2kFi4oLnZCJdbmAUkRUUqKQS/uBvoJFRaTsaU
	1I50+l9UQCU+mFUB3lJwr3sItRsGy/J7swiVxfsCcLypOEpzz0LLgtbG+HeACMsSabQi
	fnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=3tLYTtpP+djt5NjOJuaTUryoNxNc3Mx/j9KJgcPfxEE=;
	b=mdrCRYx4kU3AsXChZ2h3mI6c+aWvE3rh0pLwRgLDzUKh5Mb/eIWI5pMZRcxmpnWUSS
	E8alzLGujdd9dWoLkJqNZRDpDYLeuNNzTjtPF0tnjWac6WUqe2CqfRun1E4rjNKjK1wE
	pibbMb7nN1/HuEYdSpQFOQrY6PachQV34KbUg8YSKzwiW6GQYOjHADMOLKJGK0dAaZGa
	rY4d4vZNRk/9OBKbLOUi4o1tFD/xjj7Tkmdrfkd4CrtK0aMe4kovknFcdvHE6HJJMDFb
	+WsjRmitBUeshLTTqcH/vJI3XbP589pbpfsucuusuHy29I9oQwM343Ggumys7pyIMbkM
	+fGQ==
X-Gm-Message-State: AHPjjUhXHiXmYfff9Q525uDSOFogW5mn6HyRim9wI+vHw6mw6EgKr2x4
	S6fXF3m52RyKd99m0FWvlmJMDQ==
X-Google-Smtp-Source: AOwi7QCpiim05/rg+h/D77OtnRYtoovMa+jiJPHBIkf48Wi6yBWFB2A4uX9rSsYx+CfFe2OqWrcIPQ==
X-Received: by 10.98.79.157 with SMTP id f29mr9300479pfj.9.1506388759556;
	Mon, 25 Sep 2017 18:19:19 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:41ca:f424:3692:4c93?
	([2601:202:4001:9ea0:41ca:f424:3692:4c93])
	by smtp.gmail.com with ESMTPSA id
	28sm13609164pfl.14.2017.09.25.18.19.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Sep 2017 18:19:19 -0700 (PDT)
To: libertad.cruz@intel.com, openembedded-core@lists.openembedded.org
References: <1506369018-2646-1-git-send-email-libertad.cruz@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d6f3bf2d-99f6-652f-3b60-96099e47b3db@gmail.com>
Date: Mon, 25 Sep 2017 18:19:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506369018-2646-1-git-send-email-libertad.cruz@intel.com>
Subject: Re: [PATCH] devtool.py: update testcase Ids in morty
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
X-List-Received-Date: Tue, 26 Sep 2017 01:19:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/25/2017 12:50 PM, libertad.cruz@intel.com wrote:
> From: libertad <libertad.cruz@intel.com>
>
> eSDK testcases Ids were modified on testopia, hence there needs to be a change in the devtool script.
>
> [YOCTO #11603]

The got merged into morty.

thanks,
Armin
> Signed-off-by: libertad <libertad.cruz@intel.com>
> ---
>  meta/lib/oeqa/sdkext/devtool.py | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/lib/oeqa/sdkext/devtool.py b/meta/lib/oeqa/sdkext/devtool.py
> index 65f41f68750..7eab49f94fb 100644
> --- a/meta/lib/oeqa/sdkext/devtool.py
> +++ b/meta/lib/oeqa/sdkext/devtool.py
> @@ -45,22 +45,22 @@ class DevtoolTest(oeSDKExtTest):
>          self._run('devtool add myapp %s' % self.myapp_dst)
>          self._run('devtool reset myapp')
>      
> -    @testcase(1473)
> +    @testcase(1605)
>      @skipUnlessPassed('test_devtool_location')
>      def test_devtool_build_make(self):
>          self._test_devtool_build(self.myapp_dst)
>      
> -    @testcase(1474)
> +    @testcase(1606)
>      @skipUnlessPassed('test_devtool_location')
>      def test_devtool_build_esdk_package(self):
>          self._test_devtool_build_package(self.myapp_dst)
>  
> -    @testcase(1479)
> +    @testcase(1607)
>      @skipUnlessPassed('test_devtool_location')
>      def test_devtool_build_cmake(self):
>          self._test_devtool_build(self.myapp_cmake_dst)
>      
> -    @testcase(1482)
> +    @testcase(1608)
>      @skipUnlessPassed('test_devtool_location')
>      def test_extend_autotools_recipe_creation(self):
>          req = 'https://github.com/rdfa/librdfa'
> @@ -74,7 +74,7 @@ class DevtoolTest(oeSDKExtTest):
>              raise e
>          self._run('devtool reset %s' % recipe)
>  
> -    @testcase(1484)
> +    @testcase(1609)
>      @skipUnlessPassed('test_devtool_location')
>      def test_devtool_kernelmodule(self):
>          docfile = 'https://github.com/umlaeute/v4l2loopback.git'
> @@ -88,7 +88,7 @@ class DevtoolTest(oeSDKExtTest):
>              raise e
>          self._run('devtool reset %s' % recipe)
>  
> -    @testcase(1478)
> +    @testcase(1610)
>      @skipUnlessPassed('test_devtool_location')
>      def test_recipes_for_nodejs(self):
>          package_nodejs = "npm://registry.npmjs.org;name=winston;version=2.2.0"


