Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 934D765E03
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 20:57:49 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id x12so134085qac.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 13:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3LHstLiwGSSHyTyfNlaFhbroFDz6AphXsAbvvtR1M7I=;
	b=dKSN/0SxVWi+DYSYDR2HvQCzqmehRKCFo54A377QzcMhrdKusjKuUrrPP1nfVNIT6B
	jl26dJ2nu89FwxADxNQmqx3t5NcUNpDEL3yq2nV87l7F2KRDvszM2jqzabp48TLnv1gj
	iIi9LYb5rvdmVgYdlWtLbOMDjPVUuWLM2WYbAni5rpBQKNhSyHJ9ja86ZXp5ks16xAnl
	fKb2dgll531mg/RK2fouw6rg/P0zPMQqYigqQjCwgrOKDamxYnRKstAK5KajAVVDAEDX
	7gDS+CrgcAeX51N7hbcn+riOQ+8buBX2hwe1FPF6dQ554V1dDTRQZTObVd4pfl/0ggbs
	vKxw==
X-Gm-Message-State: ALoCoQlN+2UvacRHdclvK4tmj3gdpvCBJ7Rk+hz7sU8NX7WXGHsewLDAd7hVAdVAQum9A2Fq4t37
X-Received: by 10.140.81.209 with SMTP id f75mr74521247qgd.60.1405025870221;
	Thu, 10 Jul 2014 13:57:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Thu, 10 Jul 2014 13:57:30 -0700 (PDT)
In-Reply-To: <9941caf92c8d49ddd3cdea016fa8ec6263875185.1404885647.git.hongxu.jia@windriver.com>
References: <cover.1404885647.git.hongxu.jia@windriver.com>
	<9941caf92c8d49ddd3cdea016fa8ec6263875185.1404885647.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Jul 2014 21:57:30 +0100
Message-ID: <CAJTo0LZ7X4UUedddwb3q9XxkqZqTYF8-mHST7GRZ0y7OZUksvg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] xmlto: add version 0.0.25
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
X-List-Received-Date: Thu, 10 Jul 2014 20:57:56 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2014 11:16, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> +# To make sure these native packages ready before xmlto-native was invoked.
> +DEPENDS_class-native = " \
> +    docbook-xml-dtd4-native \
> +    docbook-xsl-stylesheets-native \
> +    util-linux-native \
> +    libxml2-native \
> +    libxslt-native \
> +"

Does this do what you want if xmlto-native is pulled in from sstate in
an empty tmp?

> +# xmlto needs getopt/xmllint/xsltproc at runtime
> +RDEPENDS_${PN}_class-target = " \
> +    docbook-xml-dtd4 \
> +    docbook-xsl-stylesheets \
> +    util-linux \
> +    libxml2 \
> +    libxslt-bin \
> +"

Don't bother with the -class-target override, they're general runtime
dependencies and not specific to the target build.

Ross

