Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.29442.1623676364880908403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 06:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 206A3100010;
	Mon, 14 Jun 2021 13:12:40 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [PATCH] musl: Set UPSTREAM_CHECK_COMMITS
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210612221006.2888173-1-raj.khem@gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <8825b363-ef7b-626c-908b-a2c6405410ff@bootlin.com>
Date: Mon, 14 Jun 2021 15:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210612221006.2888173-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Khem

On 6/13/21 12:10 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 6569d1b37b..bd9d5f1d4b 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -84,3 +84,5 @@ RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
>  LEAD_SONAME = "libc.so"
>  INSANE_SKIP_${PN}-dev = "staticdev"
>  INSANE_SKIP_${PN} = "libdir"
> +
> +UPSTREAM_CHECK_COMMITS = "1"


Thanks for the patch.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

I realize that the UPSTREAM_CHECK_COMMITS variable doesn't appear in the
documentation, and it's in relatively frequent use.

Would it make sense to propose to add a description based on the initial
commit
(https://git.openembedded.org/openembedded-core/commit/?id=591d57877d3d3e659d78c0ed33f4c515e3f6f8fb)?

Thanks in advance,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

