Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 88BA47DFE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 16:08:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d18so14542858wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=NVz3zQHjWkRaHfS2gX/haS9S9TD8tGf0/bUpGiD97TI=;
	b=PcCAEN4+nW8J2O2u7aXzhjM+0JtwmOK13G/CzyOdW6i0b6RXEphwt8SeTk4yNm3IzL
	eJ8tr62q+mfmk176UyN4iQWQcBkxTQp4NSReiN6scUoPd++1Oo98h+OAD+TgrWmnaqmJ
	EdDc2FkdBE6hwN9dY5jvlMR/U73pdOc9PZaUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NVz3zQHjWkRaHfS2gX/haS9S9TD8tGf0/bUpGiD97TI=;
	b=kQGb5wunWY4ycMVnjxDY55IPTdlDhpUXdPQG0hi3HWHwAIjjAGeftPCHm6VP+J+0KZ
	ZloMcpmOuB2slc7QmzWyffp7is+igXMcdS5V5LdupU01VKAmr/Izj/7WFFCscbS/z/xs
	0EPeOSp2pploQqF+Gw+4dOXaevnjpW+mN4zk4dMC2/Iw+kLsk44lLgxgTtrOqGafywyb
	AJQY69mflmbq8v05nJK7k++cq5fMNne37WSIxnpSeZaqjsPhXvV6amaR/aaRZSx/Jzv9
	amVsEypRYLljJsxnIuaACMTwIQsngGvKbP3UZJ3LGGZgnjoL0FOzsvN2Vp4iGuOkrjL3
	8A4A==
X-Gm-Message-State: APjAAAUo6rMgTUnlRuv07bHSz8/F1W3uHI4cMvBYiB4sWnOFdRGeCHQ9
	QHG1LlAQc8VIv8Pzz371vcN59A==
X-Google-Smtp-Source: APXvYqy+WXRVq9lctH9QRgHw2c9nH7g3MR5zAnBxs1L4t/8N7qS7GjtTfBeVo3n7J8PtHfs6KssXpw==
X-Received: by 2002:adf:e2c7:: with SMTP id d7mr54214512wrj.272.1561392508312; 
	Mon, 24 Jun 2019 09:08:28 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x129sm10059899wmg.44.2019.06.24.09.08.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 24 Jun 2019 09:08:27 -0700 (PDT)
Message-ID: <f3e5e0a4cfa0892ce122342361f9ab881ba68287.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 17:08:26 +0100
In-Reply-To: <20190624111324.8921-2-ross.burton@intel.com>
References: <20190624111324.8921-1-ross.burton@intel.com>
	<20190624111324.8921-2-ross.burton@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] oeqa/buildoptions: check that Fortran code actually cross-compiles
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
X-List-Received-Date: Mon, 24 Jun 2019 16:08:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-24 at 12:13 +0100, Ross Burton wrote:
> Don't just test that we can build the cross-compiler, but test that it actually
> can cross-compile some Fortran.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/buildoptions.py | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
> index 3ad65b40341..6a5378d3ff6 100644
> --- a/meta/lib/oeqa/selftest/cases/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
> @@ -162,17 +162,14 @@ class ArchiverTest(OESelftestTestCase):
>          self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under %s/allarch*/xcursor*" % deploy_dir_src)
>  
>  class ToolchainOptions(OESelftestTestCase):
> -
>      def test_toolchain_fortran(self):
>          """
> -        Test whether we can enable and build fortran and its supporting libraries
> +        Test that Fortran works by building a Hello, World binary.
>          """
>  
>          features = 'FORTRAN_forcevariable = ",fortran"\n'
> -        features += 'RUNTIMETARGET_append_pn-gcc-runtime = " libquadmath"\n'

Please don't remove that. We need to check libquadmath builds.

>          self.write_config(features)
> -
> -        bitbake('gcc-runtime libgfortran')
> +        bitbake('fortran-helloworld')

Doesn't this stop testing libgfortran builds too?

Cheers,

Richard


