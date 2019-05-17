Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id E21997CFEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 06:01:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 198so5662125wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 23:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=D6pWJ0VNFDGDfzYu+HEz1MtzSbR6wW1oIx+MBneupi8=;
	b=Ssqoge187PrfwYf/h3bcufQFlPC0k2iRe7E3jB8JgPNVWtvq1c9aXH80uE4wXxcbr+
	aJKraThDFkWTAhXinYtfZ5xARxJY9SRVYy/icCHSTGKYuDX4DRKWE1WA/+VUcTetJNG1
	cU00vXZoXFXVFb0rLngcS/K5NQOh0Tnj16hlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=D6pWJ0VNFDGDfzYu+HEz1MtzSbR6wW1oIx+MBneupi8=;
	b=fdPao80S++TaeIhgQi+Gr3mBH9sfuWtJgYXJApTp3lEEwjnSpVybSPNg1ZSydpeC8P
	glHYZScglm5KvitNspWNrRX0T1zGOjB5zoXMIfqJ6gXUl3NqU5+La3Ak2xg4HMIS7j02
	3/SXCWNUQQXXEew2n/E5HPTrfQfDVnPLr2yUaBBNLWmlE4vAfotGpBzdL4DCitcF7vza
	xWuJlZ8mVmR4GC3Zn8CtGl2+Tni54c7pXoIL9RSSX3cfcblvy5nxdH1+tLX1CgTJwhbF
	NheYoVGCMGoSLdpHQ0PR3L1Ldxs4Ni+f1PPG/jYqAGxpHA2OmZq6mpZcpjjzmUTxD5KI
	cFAg==
X-Gm-Message-State: APjAAAX5v3hCFft/8K499huRFDREHBa8FtqqyAGxIJ1xTBodRY6fBF8f
	Y3aN3E7WeofhAPju/LtrBXSDlA==
X-Google-Smtp-Source: APXvYqxMqirc5SGG6Q6xYwNxSWm9PybZqhqR3K3po/D/D83xjrTP8C/b0FJwdaXVdHF+pJ3rLAZGrw==
X-Received: by 2002:a1c:20d7:: with SMTP id g206mr754527wmg.136.1558072899576; 
	Thu, 16 May 2019 23:01:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c131sm8392748wma.31.2019.05.16.23.01.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 23:01:38 -0700 (PDT)
Message-ID: <fe1b8cfea44ceae5c688b4603f4b72ed3aa64c8c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 07:01:37 +0100
In-Reply-To: <1558058834-5442-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1558058834-5442-1-git-send-email-ee.peng.yeoh@intel.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2 v3] oeqa/runtime/cases/rpm.py: Enable rpm install dependency testing
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
X-List-Received-Date: Fri, 17 May 2019 06:01:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ee Peng,

On Fri, 2019-05-17 at 10:07 +0800, Yeoh Ee Peng wrote:
> Convert manual testcase bsps-hw.bsps-hw.rpm_-
> __install_dependency_package
> from oeqa/manual/bsp-hw.json to runtime automated test.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/runtime/cases/rpm.py | 34
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/rpm.py
> b/meta/lib/oeqa/runtime/cases/rpm.py
> index d8cabd3..ce3fce1 100644
> --- a/meta/lib/oeqa/runtime/cases/rpm.py
> +++ b/meta/lib/oeqa/runtime/cases/rpm.py
> @@ -135,3 +135,37 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
>          # Check that there's enough of them
>          self.assertGreaterEqual(int(output), 80,
>                                     'Cound not find sufficient amount
> of rpm entries in /var/log/messages, found {}
> entries'.format(output))
> +
> +    @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
> +    def test_rpm_install_dependency(self):
> +        rpmdir = os.path.join(self.tc.td['DEPLOY_DIR'], 'rpm',
> 'noarch')
> +        if not os.path.exists(rpmdir):
> +            self.skipTest('No %s on target' % rpmdir)

This message doesn't sound quite right as you're checking for rpmdir
locally on the build server, not on target? Could you clarify that
please?

+            if not rpm_tests[rpm]:
+                self.skipTest('No %s on target' % os.path.join(rpmdir, rpm))

The same issue here, these files are not being searched for "on
target".

Cheers,

Richard




