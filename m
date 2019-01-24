Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C85647C1FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 12:46:37 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f7so6364931wrp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 04:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=tEUfapGJ2DMol+Zp9bWwZS3FZr//3umpHFH28EFWjPg=;
	b=Qf7urLKCGcEtrZPDDCwuhfN6mAAHoS39p3HWwavg7YprGPPy6507Imu6eNhSwuCbVB
	6Qspqg8+rIxUInUM33MMPuL02kpTh+DdD8jlGunxYjbpC2g1kILogvn4WbTwNk5NcQi2
	hMSsQEBcdMy4YyXyS27QRZQ9DugsYM31SRqC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tEUfapGJ2DMol+Zp9bWwZS3FZr//3umpHFH28EFWjPg=;
	b=YQiEB0k08PUXGVYxqyJ/V1wftkeviXWGCy7e8EktWRltkRGx/N2bE/4FwnWYGB6kPv
	LAtYjCQdzqRhXG9ub1p+MPrHWOprsktCI9WPe+nYas+GsCYNhnwzXW91TqK9/p6yAiUo
	v9EcEfzeNauWCEvEb9rVbjr99q3bw3fElLLt/S2fl9Wv8pDMTqn+pGoIgXSqx7fTwxZV
	hI65OZIhqlFxL1O6nq1CtBJiwFjBBU5Up9svECvknSNTrgkjfzkgH25TpMjhs+uVcJom
	Oi/gZrYIgxewpcbRLJSqb7ZM/tMBQ0qDTCNZDjPjoEQ0E6i+1VO6+MN1EGTgHtiIV9VB
	tS3w==
X-Gm-Message-State: AJcUukfThHL54J8jTT4WPsafPOPIfY1Xxb0fG3b+BTfTmGqxQSQVEUG5
	LwjyPtGTsoT1ICa12aWxFG+vj+ZlKQI=
X-Google-Smtp-Source: ALg8bN7ONqacikEZ1ENVElA4QI3gY22ij0o73IODcj2U5KpZ85Wg0gj3ZsQb2EtzAvqkQO8RvKelVQ==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr7371588wrm.223.1548333998299; 
	Thu, 24 Jan 2019 04:46:38 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c13sm115811053wrb.38.2019.01.24.04.46.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 04:46:37 -0800 (PST)
Message-ID: <7cb9cc96b5112286ae99e953eae706259af9ead0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2019 12:46:33 +0000
In-Reply-To: <86fa8d401929e7641976ac57b34ee4a872ee74c6.1548312985.git.liezhi.yang@windriver.com>
References: <cover.1548312985.git.liezhi.yang@windriver.com>
	<86fa8d401929e7641976ac57b34ee4a872ee74c6.1548312985.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/5] ccache.bbclass: Only let native recipes depend on ccache-native
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
X-List-Received-Date: Thu, 24 Jan 2019 12:46:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-24 at 14:57 +0800, Robert Yang wrote:
> Make native recipes depend on ccache-native should be enough since native
> recipes are on target/nativesdk recipes' dependency chain, this can reduce the
> size of DEPENDS.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/ccache.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index b545735..6caaca7 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -47,8 +47,11 @@ python() {
>      # quilt-native doesn't need ccache since no c files
>      if not (pn in ('ccache-native', 'quilt-native') or
>              bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
> -        d.appendVar('DEPENDS', ' ccache-native')
>          d.setVar('CCACHE', 'ccache ')
> +        # Make native recipes depend on ccache-native should be enough since
> +        # native recipes are on target recipes' dependency chain.
> +        if bb.data.inherits_class('native', d):
> +            d.appendVar('DEPENDS', ' ccache-native')
>  }
>  
>  addtask cleanccache after do_clean

This is not correct. Think about the case where the native recipes were
installed from sstate. The target recipe dependencies would then be
incorrect.

Cheers,

Richard


