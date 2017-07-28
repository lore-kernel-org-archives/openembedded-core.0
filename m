Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 28AEA784A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 18:30:26 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id t201so3225017wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 11:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yLhpyECAbKVyFCGtnKIYAUVSBtrIA/FOmXOHCtRZ4Ss=;
	b=RtVD+ThH5TSHp9KAsDmllAGlgvFrYW65zkadI+SZLRRSjL6TEoYevHeSQOGfrXWP3z
	9j0PJDg02ESOUys1fLFrwF3PBjKE09po/LXpQ/cq/lAlmUU418zh+yWigEpRR42Y/QbQ
	EnLRB0mreVHMru9VXM3n44r/lwpHQqjyiXKwLuZjOAImGF9jP86QlOCvzuVKL89y5WgQ
	DZ+y8JOxYSUMue2XpEUFDtlLvAIGj5KbEXMQVaGv0a62MUoxxMCtrLz80vpkdU7WCcGO
	y4VX08DJ3Vsr1F/vnraq61SSEQwStjLbftXWKy30UUHSWJWF/KVzeJThOzja07h+Dqhk
	/puQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yLhpyECAbKVyFCGtnKIYAUVSBtrIA/FOmXOHCtRZ4Ss=;
	b=KA01ihk+8ZH7QCwCFXY2S5M+dC3XVIK8/VKCFYMF5rIYCbyS8nzUuWIPHe/Sq7gZQR
	UceSNqjPGKWpR3/u0/NPb7OGotkLfR2F6CRRLKiY2VN0+ZBFrWCnpdzF4KTEY3RMqfOe
	bO9330o+b5uumHFGKEyEfyk+V09D1wo8/4by8N/RzBjnux7ZMe5VcWwuhNBhOcDL9vZS
	dO/DQUVL16YeG1eGXHYoOtAtmAWYS5hcA4+A3Cs9WcD/+PpVWXiRjDL3omX6N5anOpQI
	zw6bS9Ckx+TzqhjHIhoHAvURHfuTEQsu1HWVALUi9eZJ4oHizkdOJuedLXvKsQFVSqQy
	mfow==
X-Gm-Message-State: AIVw112kktoAJGEQb1dClGQjRd3ut3zMwKrUKHfX8L8QHvUnCTYEdbzt
	9n47S5bB2RDRYGtLImUbzR8s6ghO9Q==
X-Received: by 10.80.145.38 with SMTP id e35mr7752435eda.8.1501266627759; Fri,
	28 Jul 2017 11:30:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Fri, 28 Jul 2017 11:29:57 -0700 (PDT)
In-Reply-To: <20170728180734.1920-1-otavio@ossystems.com.br>
References: <20170728180734.1920-1-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 11:29:57 -0700
Message-ID: <CAMKF1srE9eFUEnaNTX9OWxr5u=VO1jZZpqXNqRh2FUvnWznE-Q@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-dep: Add 0.2.0 release
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
X-List-Received-Date: Fri, 28 Jul 2017 18:30:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 28, 2017 at 11:07 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This is the Golang dependency management tool under development; it is
> ready for production use and intended to be merged onto Golang
> 1.10. Until that, projects are starting to use it and making it
> available on OE-Core reduces the Golang integration work for new
> recipes.
>

Looks good. Thanks

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/recipes-devtools/go/go-dep_0.2.0.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-dep_0.2.0.bb
>
> diff --git a/meta/recipes-devtools/go/go-dep_0.2.0.bb b/meta/recipes-devtools/go/go-dep_0.2.0.bb
> new file mode 100644
> index 0000000000..2b116c9af2
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-dep_0.2.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Dependency management tool for Golang"
> +HOMEPAGE = "https://github.com/golang/dep"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=1bad315647751fab0007812f70d42c0d"
> +
> +GO_IMPORT = "github.com/golang/dep"
> +SRC_URI = "git://${GO_IMPORT};destsuffix=${BPN}-${PV}/src/${GO_IMPORT};nobranch=1"
> +
> +# Points to 0.2.0 tag
> +SRCREV = "6a17782ed25ba4ccd2adf191990cc32e65c3934c"
> +
> +inherit go
> +
> +GO_INSTALL = "${GO_IMPORT}/cmd/dep"
> +
> +INSANE_SKIP_${PN} += "ldflags"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.13.3
>

