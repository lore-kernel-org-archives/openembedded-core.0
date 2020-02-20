Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7FA61341
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 22:02:32 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d9so2072862plo.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=9gBLYy76taIPaT/0aKPcm3N/qA8TR7BGctY1rNIJGzA=;
	b=lpFqhWhJgfx84Nw0aa+Kjxfi7am3p+42WmkHKhRntMnRNaMTHSiZdX9fxm1yBzeyad
	cr/k5gF6OsH2e8ciOg9XQGUXG4bs7pFOcJHBmr1MhjpsBBwYChC6SpsUoBu53kxYLua0
	lxwkc5mxW5vXEOFGrK6igmDvOISAd2lqo6x6TAoprQaiiaTOoPPJY65NUCAspHS8aRHK
	XpozYxeBo2pY6f770f12lQPMpJM92hEGSOXf5AiqefC3j/bvR7SrubIko2goVMt65G/b
	2iQhjg+XTFjoLqKIr+AkKXw51XPs3dZ5IxAPUxlCXMFLTNZQI1fpbKYuMvl2+E6wbxwB
	vNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=9gBLYy76taIPaT/0aKPcm3N/qA8TR7BGctY1rNIJGzA=;
	b=eIyuZosXGCt1K99rhWVZZs92o12K4Hhv4kXz+/iOplCo7rtC717r3aP5ZeawBbEVQx
	IaglLhBJwuR6wS9JjZtBijGwWiSXMcxMn3/zwQ3CccpBo4UbD68m/EFeKhGpWU9Eb9VW
	qe1RyVbe0EhMzjjsYgaZRSys0Rh0xMx1IYbxaCvhlgO334ZE6YuvWs086ngqeaVmXL2y
	LI4yn+4WmfwZqBuMPZcFi0EEMWLCoE6OZ2Eys419z8LyveQpisC64ontb23nfpktdAlA
	GcySYvvYTSyrzCoNsQoZGESR+kjJjDKJYZnaRhxB+hwFDXldbbWr0msRRKIFR81yj8pL
	VvzQ==
X-Gm-Message-State: APjAAAVEYrGeGUXCNQQudQhtHFy0Ys5UKVk/yZDWeabi481oXPm3HJ0f
	yF04EObTBx3lNzDNsj+ueh0=
X-Google-Smtp-Source: APXvYqwIiON4UDHTo72E9AmBM72ksTIa+UmivHv3SGam7IXsnB0b7C3cefkcB7bdJfXWBJI1ob44iQ==
X-Received: by 2002:a17:902:d216:: with SMTP id
	t22mr32852010ply.150.1582236153294; 
	Thu, 20 Feb 2020 14:02:33 -0800 (PST)
Received: from tyche ([2601:646:9200:4e0::ebc])
	by smtp.gmail.com with ESMTPSA id
	y10sm546707pfq.110.2020.02.20.14.02.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 14:02:32 -0800 (PST)
Message-ID: <388c484b4224861fda2d20f9499f6e81f17a8248.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Saloni Jain <Saloni.Jain@kpit.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2020 14:02:31 -0800
In-Reply-To: <BMXPR01MB32238BFD63B18E0B36FD811687130@BMXPR01MB3223.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB32238BFD63B18E0B36FD811687130@BMXPR01MB3223.INDPRD01.PROD.OUTLOOK.COM>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Rahul Taya <Rahul.Taya@kpit.com>,
	Aditya Tayade <Aditya.Tayade@kpit.com>,
	Anuj Chougule <Anuj.Chougule@kpit.com>
Subject: Re: [meta-oe][master][PATCH] strongswan: avoid charon crash
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
X-List-Received-Date: Thu, 20 Feb 2020 22:02:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-20 at 10:26 +0000, Saloni Jain wrote:
> From: Anuj Chougule <Anuj.Chougule@kpit.com>
> 
> This is a possible fix to charon that crashed early due to invalid
> memory access.
> Important frames from Backtraces :
> 8  0x00007f607246e160 in memcpy (__len=1704, __src=<optimized out>,
> __dest=<optimized out>)
>     at /usr/include/bits/string_fortified.h:34
> No locals.
> 9  memcpy_noop (n=1704, src=<optimized out>, dst=<optimized out>)
>     at /usr/src/debug/strongswan/5.7.2-r0/strongswan-
> 5.7.2/src/libstrongswan/utils/utils/memory.h:47
>         n = 1704
>         src = <optimized out>
>         dst = <optimized out>
> 10 chunk_create_clone (ptr=<optimized out>, chunk=...)
>     at /usr/src/debug/strongswan/5.7.2-r0/strongswan-
> 5.7.2/src/libstrongswan/utils/chunk.c:48
>         clone = <optimized out>
> 11 0x00007f606ebae810 in load_from_blob (blob=..., type=type@entry=CR
> ED_PRIVATE_KEY, subtype=subtype@entry=1,
>     subject=subject@entry=0x0, flags=flags@entry=X509_NONE)
>     at /usr/src/debug/strongswan/5.7.2-r0/strongswan-
> 5.7.2/src/libstrongswan/plugins/pem/pem_builder.c:399
>         x = <optimized out>
>         cred = 0x0
> ---Type <return> to continue, or q <return> to quit---
>         pgp = false
> 12 0x00007f606ebaf0e4 in load_from_file (flags=X509_NONE,
> subject=0x0, subtype=1, type=CRED_PRIVATE_KEY,
>     file=0x7f6069d21a20
> "/var/opt/public/sps/sps_necema/data/public/IPsec/secureboot_on/IPsec
> -internal_key.pem")
>     at /usr/src/debug/strongswan/5.7.2-r0/strongswan-
> 5.7.2/src/libstrongswan/plugins/pem/pem_builder.c:452
>         cred = <optimized out>
>         chunk = 0x7f6054005430
> 13 pem_load (type=CRED_PRIVATE_KEY, subtype=1, args=<optimized out>)
>     at /usr/src/debug/strongswan/5.7.2-r0/strongswan-
> 5.7.2/src/libstrongswan/plugins/pem/pem_builder.c:498
>         file = 0x7f6069d21a20
> "/var/opt/public/sps/sps_necema/data/public/IPsec/secureboot_on/IPsec
> -internal_key.pem"
>         pem = <optimized out>
>         subject = 0x0
>         flags = 0
> 
> Problem lies in frame 12 & 11.
> (gdb) f 12
> 12 0x00007f606ebaf0e4 in load_from_file (flags=X509_NONE,
> subject=0x0, subtype=1, type=CRED_PRIVATE_KEY,
>     file=0x7f6069d21a20
> "/var/opt/public/sps/sps_necema/data/public/IPsec/secureboot_on/IPsec
> -internal_key.pem")
>     at /usr/src/debug/strongswan/5.7.2-r0/strongswan-
> 5.7.2/src/libstrongswan/plugins/pem/pem_builder.c:452
> 452     in /usr/src/debug/strongswan/5.7.2-r0/strongswan-
> 5.7.2/src/libstrongswan/plugins/pem/pem_builder.c
> (gdb) info locals
> cred = <optimized out>
> chunk = 0x7f6054005430
> (gdb) print *chunk
> $21 = {ptr = 0x7f60728b7000 <error: Cannot access memory at address
> 0x7f60728b7000>, len = 1704}
> (gdb) f 11
> 11 0x00007f606ebae810 in load_from_blob (blob=..., type=type@entry=CR
> ED_PRIVATE_KEY, subtype=subtype@entry=1, subject=subject@entry=0x0,
>     flags=flags@entry=X509_NONE) at /usr/src/debug/strongswan/5.7.2-
> r0/strongswan-5.7.2/src/libstrongswan/plugins/pem/pem_builder.c:399
> 399     in /usr/src/debug/strongswan/5.7.2-r0/strongswan-
> 5.7.2/src/libstrongswan/plugins/pem/pem_builder.c
> (gdb) info args
> blob = {ptr = 0x7f60728b7000 <error: Cannot access memory at address
> 0x7f60728b7000>, len = 140052215328768}
> type = CRED_PRIVATE_KEY
> subtype = 1
> subject = 0x0
> flags = X509_NONE
> (gdb) print blob
> $22 = {ptr = 0x7f60728b7000 <error: Cannot access memory at address
> 0x7f60728b7000>, len = 140052215328768}
> 
> Source code snippet :
> static void *load_from_file(char *file, credential_type_t type, int
> subtype,
>                                         identification_t *subject,
> x509_flag_t flags)
> {
>         void *cred;
>         chunk_t *chunk;
> 
>         chunk = chunk_map(file, FALSE);
>         if (!chunk)
>         {
>                 DBG1(DBG_LIB, "  opening '%s' failed: %s", file,
> strerror(errno));
>                 return NULL;
>         }
>         cred = load_from_blob(*chunk, type, subtype, subject, flags);
>         chunk_unmap(chunk);
>         return cred;
> }
> 
> Local variable chunk is an uninitialised pointer in load_from_file()
> (frame 12 above) which is expected to get initialised through
> chunk_map() & then passed to load_from_blob() as a parameter.
> But somehow, the chunk pointer has not got initialised &
> got passed as it is to load_from_blob() in frame 11 above.
> As this contains a garbage address, when method load_from_blob()
> tried cloning the memory regions through chunk_clone() ->
> chunk_create_clone() -> memcpy() -> memcpy_noop(), it crashed with
> SIGBUS (frames 10, 9, 8).
> It could also be that chunk_map() has a bug which does not memmap()
> the full or correct areas.
> 
> Upstream-Status: Pending
> Tested By: Anuj Chougule <Anuj.Chougule@kpit.com>
> Signed-off-by: Anuj Chougule <Anuj.Chougule@kpit.com>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  .../strongswan/files/fix-charon-crash.patch        | 23
> ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 recipes-support/strongswan/files/fix-charon-
> crash.patch
> 
> diff --git a/recipes-support/strongswan/files/fix-charon-crash.patch
> b/recipes-support/strongswan/files/fix-charon-crash.patch
> new file mode 100644
> index 0000000..95e71a2
> --- /dev/null
> +++ b/recipes-support/strongswan/files/fix-charon-crash.patch
> @@ -0,0 +1,23 @@
> +strongswan: avoid charon crash
> +
> +Variable chunk is an uninitialised pointer,which
> +is expected to get initialised through method chunk_map()
> +& then passed to load_from_blob() as a parameter.
> +But somehow, if the chunk pointer did not get initialised & gets
> +passed as it is to load_from_blob(), it may lead crash as this
> +contains a garbage address.
> +
> +Signed-off-by: Anuj Chougule <Anuj.Chougule@kpit.com>
> +Upstream-Status: Pending
> +
> +--- a/src/libstrongswan/plugins/pem/pem_builder.c
> ++++ b/src/libstrongswan/plugins/pem/pem_builder.c
> +@@ -441,7 +441,7 @@ static void *load_from_file(char *file,
> credential_type_t type, int subtype,
> +                                                      
> identification_t *subject, x509_flag_t flags)
> + {
> +       void *cred;
> +-      chunk_t *chunk;
> ++      chunk_t *chunk = NULL;
> +

I wonder if chunk_map has issues where it returns invalid values, I
would rather check chunk_map and see what is it doing.

> +       chunk = chunk_map(file, FALSE);
> +       if (!chunk)
> --
> 2.7.4
> This message contains information that may be privileged or
> confidential and is the property of the KPIT Technologies Ltd. It is
> intended only for the person to whom it is addressed. If you are not
> the intended recipient, you are not authorized to read, print, retain
> copy, disseminate, distribute, or use this message or any part
> thereof. If you receive this message in error, please notify the
> sender immediately and delete all copies of this message. KPIT
> Technologies Ltd. does not accept any liability for virus infected
> mails.


