Return-Path: <matt@madison.systems>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6767803F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 14:08:03 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id g13-v6so4580028lfe.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z0nqRtjc6bpavphMMyNbJytSLgDAIiegKvxg+2Emtrc=;
	b=lfB5kMP8mk3tFdhtkJFxyhtE/h2iseyM/dmVqrRsZXJfdg4n7Gi9/jZNlp6MwOXCDy
	rn/c5HBZfSNjJOxXSs1ycqOMCU9wmq11548kcW3/ozhPwqFqJbLBZadYtFfvlLNweWvP
	GKfk6+pjj/CSlGPHc/nK0KHqCo1AvOAJnTFGbptQEcQAIzFNq6nYhcLVvMAAcIwGz1nl
	TNE6odbJNkPz4tYugIdeIOmKCESqAEGgcKrhSiCLadLW4wvupetKhYyXBcgujdls7nnV
	apphBwpALUM5Bhh04fn0mrqgKc8qxbh6PkkDxRQJu+F3bJ8wr1aB+GVYzE+pxOXAp/EP
	2CEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z0nqRtjc6bpavphMMyNbJytSLgDAIiegKvxg+2Emtrc=;
	b=pxlRFGqt3eRWV0czFWQ9UQ7rTEL5M2npWbcgYy36k7F7SfxxqXKXaSQlQr4KIrrxvS
	mjNhQ3MvVzFuSzyj4sQQb8ILcEbj3d+J9pLyVHRw2No8MmoV+X5pACY4I/C4Jt3pKHKM
	ewltz2CCay2IlzFSAz3rUctfDd9W87r4Axh1L3XCxvfA54GXKgGwl0IWaLJ2zRWAHIxe
	qWRQRefHckkxs2ERUIv65Y2Aoq2l6CPWE1cBT6g12WBE3lXWY/JFFSgVEdac3735osjz
	1OGnoeELPmu+aeHuZ3e67VDXIBAJ4lDRzrWYWiGTwWKWCPDxpsomZuSinD30fZzyTXKd
	UICg==
X-Gm-Message-State: AElRT7FMmDIKD6aw6gtYOqqCPKEbSXUsYp/vaqwW4h8cbjliCOkfIFSB
	5qnyRuhAizpbCgwKqikSYs/JVK6KN8vf10aFLtPELA==
X-Google-Smtp-Source: AG47ELtvlaUjTBMPtG5NH/uDMPStA+mYsuGld01sBx9QzIV/LILxD1LsIm10NGpBYAZszAGBuQOBqracye0rZbe17vA=
X-Received: by 10.46.155.135 with SMTP id z7mr1441769lji.125.1521209284421;
	Fri, 16 Mar 2018 07:08:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:9c83:0:0:0:0:0 with HTTP; Fri, 16 Mar 2018 07:08:02
	-0700 (PDT)
In-Reply-To: <20180316125725.25370-1-otavio@ossystems.com.br>
References: <20180316125725.25370-1-otavio@ossystems.com.br>
From: Matt Madison <matt@madison.systems>
Date: Fri, 16 Mar 2018 07:08:02 -0700
Message-ID: <CAGgRHJqNGPw1HLTtP88mzzX7kbwqX5J=E19iP=D0WNXR-4ybLQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] glide.bbclass: Add class to easy Glide use
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
X-List-Received-Date: Fri, 16 Mar 2018 14:08:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 16, 2018 at 5:57 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> To use 'glide' this class does the integration and reduces code
> duplication.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/classes/glide.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta/classes/glide.bbclass
>
> diff --git a/meta/classes/glide.bbclass b/meta/classes/glide.bbclass
> new file mode 100644
> index 00000000000..52291bab8cf
> --- /dev/null
> +++ b/meta/classes/glide.bbclass
> @@ -0,0 +1,9 @@
> +# Handle Glide Vendor Package Management use
> +#
> +# Copyright 2018 (C) O.S. Systems Software LTDA.
> +
> +DEPENDS_append = " glide-native"
> +
> +do_compile_prepend() {
> +    ( cd ${WORKDIR}/build/src/${GO_IMPORT} && glide install )
                 ^^^^^^^^^^^^^^^^^
Any reason why you aren't just using ${B} here instead?

-Matt
> +}
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

