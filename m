Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2F67ED17
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 10:43:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g17so87387345wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 03:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=MCQIMGljigpiXDyitD8POIQ76e/9rsJ1ryPc2qdP3Tc=;
	b=Xa6GX+vV/7kWBtuKT86VoIyE3EtT6VOoIL+U+Aq1WX7BCAn3B3YTYi/DhO5TL6RBb+
	tkupFiMqVZH32Drd4CCE1qDj1BX1GN000pFHM98r71ETOMKRRFEMV1kzVWFOc7DfQzI4
	dw9hoqyLztuJLuvp+j3JdKyMwpmGSuro5vaBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MCQIMGljigpiXDyitD8POIQ76e/9rsJ1ryPc2qdP3Tc=;
	b=uMbxQWNYZZ7h5+jgF+pcWm7ZJ+H1xlef3Iii9jT0LXRrSzLjrs/3byh98w+8HykFEb
	Wr3nShYmHzdrEfVskKQgLgOquyDn7iwFu7FEACF40UhxoCL5MBquFwmpeUJN9LeJJrFM
	NFknkKgW9mhUoKdgTmiygA1uMt75EtSMvypNQdj5phqCnUEFCGB1jniQF1EAQLkx/kVG
	eG73BxBUrENsyPGgaDNvGVQSFQYaasgZHElsLpP0swnsubA8FnzOTP1ScnGVX2JH92AZ
	oGbhH1LtE6h1ZYFpoXfsLnY0ROJhuUY0qgIxU9YvMPXKiG+Lu2+rZ2x2Skh00uuMpNLN
	zcig==
X-Gm-Message-State: APjAAAW/ek2/C9mUa/q4ZGmxOBJsxyw/j2V7IE/+d//cRw90ZmE5Z42u
	SEgB2o2N9xTbSQpAOU+nqQukWA==
X-Google-Smtp-Source: APXvYqyfLnbiV7gVYEQriNnDXSRawfLfJ6mjpGM0IHW26hPWOQ5fcRGJd17WsDdlSndmPqyCCa3XLg==
X-Received: by 2002:a05:6000:12c3:: with SMTP id
	l3mr595414wrx.100.1565088225053; 
	Tue, 06 Aug 2019 03:43:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id e4sm1576643wrh.39.2019.08.06.03.43.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 03:43:44 -0700 (PDT)
Message-ID: <4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 06 Aug 2019 11:43:43 +0100
In-Reply-To: <e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 10:43:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-06 at 15:05 +0800, Robert Yang wrote:
> Fixed:
> $ bitbake stress-ng bash -ccleansstate && bitbake stress-ng
> ERROR: stress-ng-0.10.00-r0 do_package_qa: QA Issue: /usr/share/bash-completion/completions/stress-ng contained in package stress-ng-bash-completion requires /bin/bash, but no providers found in RDEPENDS_stress-ng-bash-completion? [file-rdeps]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
> index f7faf97..904eb0c 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
> @@ -11,7 +11,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
>  SRC_URI[md5sum] = "46aa41d37690324ceab4febfcc549018"
>  SRC_URI[sha256sum] = "d09dd2a1aea549e478995bf9be90b38906a4cdf33ea7b245ef9d46aa5213c074"
>  
> -DEPENDS = "coreutils-native"
> +DEPENDS = "coreutils-native bash"

Technically you just want to make this an RDEPENDS of the appropriate
package, which would give some small dependency improvement too.

Cheers,

Richard


