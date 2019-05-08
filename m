Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 067B57DE52
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 13:41:22 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id s3so4112514itk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Qdeoz+yVquoFLjOAkTlEh+77/We4wql8Ra/ahQCA52w=;
	b=nEf3eV8ChODn0p7G+0TiGIzGF0h108xjCjoq2Sjwd0NoXvKZQmEYDj91pR2V37OQ3L
	GP2ePEf8Eu+Fpo9GQ/WPTxeikWL4egmhuxMjF1y+GBDEwzXIUM8ovNpUfyd5O+dN2B/i
	xlSqzlFgl165QZEsO7vlkFTYbRP0NoUCeuUJL0Tcd6ePHhAsWbCkued2m8+m1ouCmsl/
	/aKSpntEhTL58J4C2UX8OjX7PZddJ+V3YSsAbs+lSGrV7cYmDB+vPpC0QZRrAlNK2rqv
	1kGrxhjergXDZ27GYCEuPpuUNa3708Avb/mjeufNL12nFGZ07qv3RMY3a049ss2FQ5Gp
	UodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Qdeoz+yVquoFLjOAkTlEh+77/We4wql8Ra/ahQCA52w=;
	b=Ka2tAd04G8/1qHHnuHet4NT5C1xzYK/koVuMr6tmNpjHGUWm8G2CYUKlTtV0n7u161
	yhghpOe7hL/HfkLs+KjWvELS7AC0ZxMh9gbrZ3vh1tG7QX0lzjjl2AYYlk7mFpZwPrtL
	iQ1qOZSY8edS2GqX2IF+qM48pYK7DDmV96adc5XCrXOxDeO+wMDxBPv5oJ6yrugbEjyw
	GU+FjPevDBb4XBVvO17OCmtB4wtrhbxg/X3Z7lQ2iZmwAnHvid/Xsx7yc4coPEep2vBj
	QYBsdXU2H38sfdbma7Wv9TpT48jcw+SSTLjUsU9ghlzMqZixhy3CA/WiQDPqNz4uhvlX
	L6IA==
X-Gm-Message-State: APjAAAV37nh9nT/7XuK+f7l3CDBirvhsfFV1nbM8ImDNVOYNg2J4Z5GF
	1wSJChEL08XQIO2DQDXmpwFznwteIJE=
X-Google-Smtp-Source: APXvYqw9PKYmHo0unHp5vZvzf557kRXc2dmJLXzqf2znVAQNJLkRKHtsaVnQZe80DKOwJC09ClRcJw==
X-Received: by 2002:a02:b895:: with SMTP id p21mr29209795jam.80.1557322883793; 
	Wed, 08 May 2019 06:41:23 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	v136sm1345883itv.26.2019.05.08.06.41.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 08 May 2019 06:41:22 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <4791dc39bf06a746beab62f044a063698f5883ca.camel@gmail.com>
To: Mikko Rapeli <mikko.rapeli@bmw.de>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 08 May 2019 08:41:21 -0500
In-Reply-To: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
References: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] eoqa: use bash to execute SDK test commands
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
X-List-Received-Date: Wed, 08 May 2019 13:41:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-08 at 16:26 +0300, Mikko Rapeli wrote:
> The commands only work with with bash. If /bin/sh is
> dash like in Debian, the command execution fails with
> errors like:

This might possibly be related to 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11775 where it was
discovered that in order to use dash, the CWD must be the same
directory where the init script lives?

> 
> Standard Output: /bin/sh: 5: export: --sysroot: bad variable name
> 
> and all SDK tests fail.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/lib/oeqa/sdk/case.py                  | 2 +-
>  meta/lib/oeqa/sdk/utils/sdkbuildproject.py | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
> index d8611c8..5334237 100644
> --- a/meta/lib/oeqa/sdk/case.py
> +++ b/meta/lib/oeqa/sdk/case.py
> @@ -9,7 +9,7 @@ from oeqa.core.case import OETestCase
>  class OESDKTestCase(OETestCase):
>      def _run(self, cmd):
>          return subprocess.check_output(". %s > /dev/null; %s;" % \
> -                (self.tc.sdk_env, cmd), shell=True,
> +                (self.tc.sdk_env, cmd), shell=True,
> executable="/bin/bash",
>                  stderr=subprocess.STDOUT, universal_newlines=True)
>  
>      def fetch(self, workdir, dl_dir, url, archive=None):
> diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
> b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
> index 6fed73e..eafbd7a 100644
> --- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
> +++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
> @@ -42,7 +42,8 @@ class SDKBuildProject(BuildProject):
>      def _run(self, cmd):
>          self.log("Running . %s; " % self.sdkenv + cmd)
>          try:
> -            output = subprocess.check_output(". %s; " % self.sdkenv
> + cmd, shell=True, stderr=subprocess.STDOUT)
> +            output = subprocess.check_output(". %s; " % self.sdkenv
> + cmd, shell=True,
> +                                             executable='/bin/bash',
> stderr=subprocess.STDOUT)
>          except subprocess.CalledProcessError as exc:
>              print(exc.output.decode('utf-8'))
>              return exc.returncode
> -- 
> 1.9.1
> 
-- 
Joshua Watt <JPEWhacker@gmail.com>


