Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 42D2A72FFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 15:53:17 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p185so1760885pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 07:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=zS4LyHrJCetil1WwVCKB0l6hOJXxAvi48bGmOeyMuGg=;
	b=NBsbvRCyYxjoRObGBzAKeZADe7vYDHD+DMoC+7tp41WjL955d/Q/RCbbqODqXEndtM
	SYdw6xo832pKuSuLLOXNBvTzuNcz8bBIciPVjQ5FP+rIa4VrCJ3qVwSu5ugtmfv33+qZ
	JWOSgjN6JIQV3n+nkC7VmoH9Icjzk+h/g69MNNi7minF9G6vGqmX1aLOa/R7cAUWD2fN
	zBhzLmPDCqmrtd3x+C7K3D+C6YC2nV/tC+UipOGrD9yIb1dxK/8K5nezxyAfvVP6+4gb
	P22oZ9B5b8sBX/9NP6D8XzlvIArh25ah+pnQ8Uhoo4SqWCNV07uQMU84oN+Vl4Zejt1m
	Te4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=zS4LyHrJCetil1WwVCKB0l6hOJXxAvi48bGmOeyMuGg=;
	b=RvMNCNp901ZvHvtErij5Hi0akP+uI0Ygf1AuI//TtWmx39CK4eNk7wUmcNRPjKu3oi
	Ao4jXAliKjFZh9Gfpg4mPr2dy8zX4RzCL1ZEYmBuClu0V1zP5Pf54zhaLGiUCOJs+mTi
	j5LBx/34zkJLP9pnDNAk43U1pQDdmSGLsWqNjy8tp/9GHvfoeIU185q8fVcD4+hviuzg
	70mQHhj7q+6zYrSaBad9qGuoDaicrv851Q0cONhu9jwSK3HgIRA8WWHug4W0Hh81pEoC
	3rKK9LbHM9P2kHPw+tx/cZjZalGPt/AQkVlptv3nSbGgr2ltU8QVPsNcd3oXVYjYUXI6
	A6yA==
X-Gm-Message-State: AMke39kArkkXYeOflNLIyGvOw5w8DZ+TMVfOpl4NX5mwF5ejawKvO7alLMBPSN2eSo8sew==
X-Received: by 10.98.220.200 with SMTP id c69mr5839039pfl.60.1487865198857;
	Thu, 23 Feb 2017 07:53:18 -0800 (PST)
Received: from [10.11.10.242] ([67.23.202.154])
	by smtp.gmail.com with ESMTPSA id
	c2sm10628004pfl.61.2017.02.23.07.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Feb 2017 07:53:18 -0800 (PST)
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
References: <cover.1487769155.git.mariano.lopez@linux.intel.com>
	<45b78fc683ff4d5cad5d6bc30df7014a49692a0f.1487769155.git.mariano.lopez@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d2c85190-1263-3bcf-457d-4a4186bf7456@gmail.com>
Date: Thu, 23 Feb 2017 07:53:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <45b78fc683ff4d5cad5d6bc30df7014a49692a0f.1487769155.git.mariano.lopez@linux.intel.com>
Subject: Re: [PATCH 1/1] selftest/eSDK.py: Cleanup when there is an error in setUpClass
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
X-List-Received-Date: Thu, 23 Feb 2017 15:53:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Mariano,


On 02/22/2017 05:12 AM, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>
> Lately autobuilders are experiencing hangs with selftest,
> it seems it is cause if an error happens in setUpClass
> method of oeSDKExtSelfTest class because HTTP server
> keeps running in background.
Any issue if Morty gets this?
- armin
> This patch will ensure tearDownClass will be run if there
> is an error in setUpClass.
>
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>   meta/lib/oeqa/selftest/eSDK.py | 46 +++++++++++++++++++++++-------------------
>   1 file changed, 25 insertions(+), 21 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/eSDK.py b/meta/lib/oeqa/selftest/eSDK.py
> index ee1ca6a..b68e997 100644
> --- a/meta/lib/oeqa/selftest/eSDK.py
> +++ b/meta/lib/oeqa/selftest/eSDK.py
> @@ -64,7 +64,7 @@ class oeSDKExtSelfTest(oeSelfTest):
>           runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
>   
>           cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
> -
> +
>           sstate_config="""
>   SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
>   SSTATE_MIRRORS =  "file://.* http://%s/PATH"
> @@ -73,37 +73,41 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
>   
>           with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
>               f.write(sstate_config)
> -
>   
>       @classmethod
>       def setUpClass(cls):
> -        # Start to serve sstate dir
> -        sstate_dir = get_bb_var('SSTATE_DIR')
> -        cls.http_service = HTTPService(sstate_dir)
> -        cls.http_service.start()
> +        # If there is an exception in setUpClass it will not run tearDownClass
> +        # method and it leaves HTTP server running forever, so we need to be
> +        # sure tearDownClass is run.
> +        try:
> +            cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
>   
> -        cls.http_url = "http://127.0.0.1:%d" % cls.http_service.port
> -
> -        cls.image = 'core-image-minimal'
> +            # Start to serve sstate dir
> +            sstate_dir = get_bb_var('SSTATE_DIR')
> +            cls.http_service = HTTPService(sstate_dir)
> +            cls.http_url = "http://127.0.0.1:%d" % cls.http_service.port
> +            cls.http_service.start()
>   
> -        cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
> -        oeSDKExtSelfTest.generate_eSDK(cls.image)
> +            cls.image = 'core-image-minimal'
> +            oeSDKExtSelfTest.generate_eSDK(cls.image)
>   
> -        # Install eSDK
> -        cls.ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(cls.image)
> -        runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
> +            # Install eSDK
> +            cls.ext_sdk_path = oeSDKExtSelfTest.get_eSDK_toolchain(cls.image)
> +            runCmd("%s -y -d \"%s\"" % (cls.ext_sdk_path, cls.tmpdir_eSDKQA))
>   
> -        cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
> +            cls.env_eSDK = oeSDKExtSelfTest.get_esdk_environment('', cls.tmpdir_eSDKQA)
>   
> -        # Configure eSDK to use sstate mirror from poky
> -        sstate_config="""
> +            # Configure eSDK to use sstate mirror from poky
> +            sstate_config="""
>   SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
>   SSTATE_MIRRORS =  "file://.* http://%s/PATH"
> -        """ % cls.http_url
> -        with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
> -            f.write(sstate_config)
> +            """ % cls.http_url
> +            with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
> +                f.write(sstate_config)
> +        except:
> +            cls.tearDownClass()
> +            raise
>   
> -
>       @classmethod
>       def tearDownClass(cls):
>           shutil.rmtree(cls.tmpdir_eSDKQA)


