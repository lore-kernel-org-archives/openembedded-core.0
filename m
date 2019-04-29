Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 549D47D686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 08:49:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y197so14553248wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 01:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=edpMXSCnSynrphTKQDxrLecRq2Dxxv4Wk/4I52D9MZc=;
	b=SOvIrMmtct2o+lBr3Fp1F6+bui9m8aOZNLHbqzkP8l/vOOTdfwgsG7Xfz2U0kGO1Yv
	p4CBwFzu9qQRQOPz5pMoN7kkYXCCMXkukhsWH/oz/PUDAMnnQVvuRLaeAd/aoOELkB1r
	jZdAotZvuImvkulfFbaPew6ROTZNu6spdSMdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=edpMXSCnSynrphTKQDxrLecRq2Dxxv4Wk/4I52D9MZc=;
	b=cniO5ky8HGSjIxJt2QCEVJIe3rnvizOE1h7nbWKyYLygy+HarG8ICeYSdNNocqxAQb
	/AOV5mP6gUptwVOCrGBUFXCMp1rbeMHEDN+pMqmNyrdGImC7FwHlx0ZTBtyb2Z3x7/Lr
	jQ/oMQKyj7uJ7IEWu4KCbXqpVxz/BZnmKEFKGZ2YAcK6Y/tWhhS3PZaZwE111PUOuchZ
	eM2MW7RQJQMGfzEJce3B6zVWjEARA+5SgFsuj2jtCpUJB8yYXoMsqCFbCHyXCFFZRF2Y
	V29+4g705KVPK3plBkggpzgR6IeyC5hatkwjenK3OHyLc+NUeHBA14FaRn3Lg1LPshQ+
	Mwrw==
X-Gm-Message-State: APjAAAWsr2J/X7Wg9UK1Z1s2RGWNfZOefGeT2Wj0dXaoBWtosWqU7I2/
	udwIUMUcPdfsgML9LD5a9iF9CQ==
X-Google-Smtp-Source: APXvYqzuJESX+mz1YGOB9lCgLMBIdYbHCns5O5yZKhwU46aZj0ASyBuYo/F9ZAiL3wRbDB8Z6QSmuw==
X-Received: by 2002:a7b:cf33:: with SMTP id m19mr17482219wmg.101.1556527767022;
	Mon, 29 Apr 2019 01:49:27 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z16sm14208068wrt.26.2019.04.29.01.49.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Apr 2019 01:49:26 -0700 (PDT)
Message-ID: <d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 09:49:24 +0100
In-Reply-To: <20190427113714.30173-1-schnitzeltony@gmail.com>
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
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
X-List-Received-Date: Mon, 29 Apr 2019 08:49:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2019-04-27 at 13:37 +0200, Andreas Müller wrote:
> This should fix build on ancient hosts
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  ...uce-gcc-required-support-downto-c-11.patch | 34 ++++++++++++++
>  ...001-Revert-parser-glue-Use-std-clamp.patch | 44
> +++++++++++++++++++
>  ...replace-std-clamp-by-std-min-std-max.patch | 33 ++++++++++++++
>  meta/recipes-support/vte/vte_0.56.1.bb        |  7 +++
>  4 files changed, 118 insertions(+)
>  create mode 100644 meta/recipes-support/vte/vte/0001-Reduce-gcc-
> required-support-downto-c-11.patch
>  create mode 100644 meta/recipes-support/vte/vte/0001-Revert-parser-
> glue-Use-std-clamp.patch
>  create mode 100644 meta/recipes-support/vte/vte/0001-vte.cc-replace-
> std-clamp-by-std-min-std-max.patch

Unfortunately it doesn't seem to be quite enough:

https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/461993/raw
(from centos 7)

| ../../vte-0.56.1/src/utf8-test.cc:27:22: error: ‘literals’ is not a
namespace-name
|  using namespace std::literals;
|                       ^

and:

https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/461960/raw
(from debian9)

| ../../vte-0.56.1/src/parser-cat.cc:140:31: error: enclosing class of
constexpr non-static member function ‘bool PrettyPrinter::plain()
const’ is not a literal type
|          inline constexpr bool plain() const noexcept { return
m_plain; }
|                                ^~~~~
| ../../vte-0.56.1/src/parser-cat.cc:134:7: note: ‘PrettyPrinter’ is
not literal because:
|  class PrettyPrinter {
|        ^~~~~~~~~~~~~

Unfortunately I merged the upgrade into master as we'd had green builds
before this (chance meant we didn't hit this failure) so this is a more
pressing problem now...

Cheers,

Richard


