Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.41538.1605560898933967967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 13:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=PKvbeSfv;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.214.195, mailfrom: scott.branden@broadcom.com)
Received: by mail-pl1-f195.google.com with SMTP id u2so9016053pls.10
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 13:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=c/OnQq3KUt9z3TsVerq4zc01CSH2bTxQc4NdQGVshJ8=;
        b=PKvbeSfvsI/GskwisCqxLZ92R82Yjt54lzADFq333hDTNhwh4CQJDuUG4VLOdCV/wG
         CQzwC5wa3dOEcnscNERbjrozbWtWAu0zJE+UPxZzHUNOpHJ2K+ixfVz9aRO3ziQjd8Hg
         flKaSs80ylpn8uJ42xnV/ES+WIsqtszHI1p28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=c/OnQq3KUt9z3TsVerq4zc01CSH2bTxQc4NdQGVshJ8=;
        b=eHlkNvAT/VnLfdkn0tI/ud/jpLWR+KAK5C4MZYVaKEtYaSjOaVSPjyoFyKzIag5N2S
         cUnoF0tNtt9sUIS+5eOIw68bcBfvWaCXGXJ+sVVU0z5KoG4VbWYaN1X7m9CEiIlnO4sW
         elh1IOURB5LnL0Tv1Vzq4X2gVB6HugpfuERBATnO+y85KwgM3Q/cqdWcuxo+onmEbLwr
         Ol9OO9vY/aDuB10/ahcmteBPeFdKdZJ0ApdFuTdaWzajYlWJ83kP1k5K0H0eJdxxit/X
         mctDGdEIM+/FVhc4wTDUHP0Bd27DWXwh0KlITB+wboAbN0DkOFBtLLzlrCpyHyeJfr52
         ktwQ==
X-Gm-Message-State: AOAM530SQv81cSUBTLd3I4vXRXIucQZg2uGAVaqJ+tLAMTXEpLGrK46m
	GAsBL+tW0albz6PV1ZogqrDwPb5wm6pLdveKksqU7r+NUOr2ArUVKCtYR7H91grZGl2gLrfQd1N
	lvSiwDzzhR0yksrQJIOFeAMopVVhWxBfkiuF8+jjd5qkiubn44MuV7q3eYsij18XJW22yXyht9W
	2dOdDw8MOV9bdXKPr28E82o7P/hL8=
X-Google-Smtp-Source: ABdhPJy7ZmHDLOy8deyeOgrTgB+9nhP8JHMok/ykCRc/tApSjdQjNsDAujEWnr7uepgxb8QSxrL49g==
X-Received: by 2002:a17:902:8e84:b029:d7:eb0d:2fe6 with SMTP id bg4-20020a1709028e84b02900d7eb0d2fe6mr14877949plb.16.1605560897994;
        Mon, 16 Nov 2020 13:08:17 -0800 (PST)
Return-Path: <scott.branden@broadcom.com>
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id j11sm16060094pgp.82.2020.11.16.13.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 13:08:17 -0800 (PST)
Subject: Re: [OE-core] [PATCH v2] kernel: provide module.lds for out of tree builds in v5.10+
From: "Scott Branden" <scott.branden@broadcom.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 richard.purdie@linuxfoundation.org
Cc: lili.li@intel.com, openembedded-core@lists.openembedded.org
References: <20201114052701.8880-1-bruce.ashfield@gmail.com>
 <60863a39-ee36-9bbc-cb5f-ccce0a0d1e45@broadcom.com>
Message-ID: <a2a2c618-47f1-abf4-4dcf-624196acb3bf@broadcom.com>
Date: Mon, 16 Nov 2020 13:08:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <60863a39-ee36-9bbc-cb5f-ccce0a0d1e45@broadcom.com>
X-Groupsio-MsgNum: 144670
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000005d4e405b43fc7c1"

--00000000000005d4e405b43fc7c1
Content-Type: multipart/alternative;
 boundary="------------D9E95D647BBCB1040D652AA9"
Content-Language: en-CA

--------------D9E95D647BBCB1040D652AA9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


On 2020-11-16 11:50 a.m., Scott Branden wrote:
> This version works better for me.
*when the kernel is devtool checked out.  When the kernel is not checked out it fails to compile the external kernel module.
>
> On 2020-11-13 9:27 p.m., Bruce Ashfield wrote:
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> The upstream commit 596b0474d3d [kbuild: preprocess module linker
>> script], adds a dependency on module.lds for external module
>> building.
>>
>> Since module.lds is generated as part of 'modules_prepare', we
>> must make it available with the other kernel artifacts in the
>> kernel shared workdir, otherwise out of tree builds fail.
>>
>> This fixes errors like:
>>
>>     | make[4]: *** No rule to make target 'scripts/module.lds', needed by
>>         'build/tmp/work/qemuarm64-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.ko'.
>>         Stop.
>>     | make[4]: *** Waiting for unfinished jobs....
>>
>> We also ensure that kernel-devsrc has a copy to support on
>> target module builds that are often prepared with 'make scripts
>> prepare'. Those targets won't regenerate it, so the build fails.
>> If 'make modules_prepare' is used, the file will be regenerated
>> and overwrite our copy (as expected).
>>
>> Signed-off-by: Pan, Kris <kris.pan@intel.com>
>> Signed-off-by: Lili Li <lili.li@intel.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Tested-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>
>> v2:
>>   - I was right that we really only should be copying this in one
>>     location, but it wasn't clear that the main kernel build no
>>     longer runs modules_prepare so the do_shared_workdir task will
>>     *never* fine module.lds on a clean run.
>>
>>     So we just need the single copy after we've build our modules
>>     to ensure that the file is available.
>>
>>     Tested against a clean kernel and module build, just building
>>     the module. Dependencies are correct and the file is copied
>>     for the module to build.
>>
>>     We could do the same thing for Module.symvers, but historically
>>     it was generated during the main kernel build .. so we can leave
>>     it there for old kernel support.
>>
>>
>>  meta/classes/kernel.bbclass                | 1 +
>>  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index be93a258f6..af4c891de4 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -391,6 +391,7 @@ do_compile_kernelmodules() {
>>  		# other kernel modules and will look at this
>>  		# file to do symbol lookups
>>  		cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
>> +		[ -e ${B}/scripts/module.lds ] && install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
>>  	else
>>  		bbnote "no modules to compile"
>>  	fi
>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> index 81b1e36041..5f0dedbdf7 100644
>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> @@ -100,6 +100,12 @@ do_install() {
>>  	# be dealt with.
>>  	# cp -a scripts $kerneldir/build
>>  
>> +	# although module.lds can be regenerated on target via 'make modules_prepare'
>> +	# there are several places where 'makes scripts prepare' is done, and that won't
>> +	# regenerate the file. So we copy it onto the target as a migration to using
>> +	# modules_prepare
>> +	cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null || :
>> +
>>          if [ -d arch/${ARCH}/scripts ]; then
>>  	    cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
>>  	fi
>>
>> 
>>
>


--------------D9E95D647BBCB1040D652AA9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">On 2020-11-16 11:50 a.m., Scott Branden
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:60863a39-ee36-9bbc-cb5f-ccce0a0d1e45@broadcom.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      This version works better for me.<br>
    </blockquote>
    *when the kernel is devtool checked out.  When the kernel is not
    checked out it fails to compile the external kernel module.<br>
    <blockquote type="cite"
      cite="mid:60863a39-ee36-9bbc-cb5f-ccce0a0d1e45@broadcom.com"> <br>
      <div class="moz-cite-prefix">On 2020-11-13 9:27 p.m., Bruce
        Ashfield wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20201114052701.8880-1-bruce.ashfield@gmail.com">
        <pre class="moz-quote-pre" wrap="">From: Bruce Ashfield <a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield@gmail.com" moz-do-not-send="true">&lt;bruce.ashfield@gmail.com&gt;</a>

The upstream commit 596b0474d3d [kbuild: preprocess module linker
script], adds a dependency on module.lds for external module
building.

Since module.lds is generated as part of 'modules_prepare', we
must make it available with the other kernel artifacts in the
kernel shared workdir, otherwise out of tree builds fail.

This fixes errors like:

    | make[4]: *** No rule to make target 'scripts/module.lds', needed by
        'build/tmp/work/qemuarm64-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.ko'.
        Stop.
    | make[4]: *** Waiting for unfinished jobs....

We also ensure that kernel-devsrc has a copy to support on
target module builds that are often prepared with 'make scripts
prepare'. Those targets won't regenerate it, so the build fails.
If 'make modules_prepare' is used, the file will be regenerated
and overwrite our copy (as expected).

Signed-off-by: Pan, Kris <a class="moz-txt-link-rfc2396E" href="mailto:kris.pan@intel.com" moz-do-not-send="true">&lt;kris.pan@intel.com&gt;</a>
Signed-off-by: Lili Li <a class="moz-txt-link-rfc2396E" href="mailto:lili.li@intel.com" moz-do-not-send="true">&lt;lili.li@intel.com&gt;</a>
Signed-off-by: Bruce Ashfield <a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield@gmail.com" moz-do-not-send="true">&lt;bruce.ashfield@gmail.com&gt;</a></pre>
      </blockquote>
      Tested-by: Scott Branden <a class="moz-txt-link-rfc2396E"
        href="mailto:scott.branden@broadcom.com" moz-do-not-send="true">&lt;scott.branden@broadcom.com&gt;</a><br>
      <blockquote type="cite"
        cite="mid:20201114052701.8880-1-bruce.ashfield@gmail.com">
        <pre class="moz-quote-pre" wrap="">---

v2:
  - I was right that we really only should be copying this in one
    location, but it wasn't clear that the main kernel build no
    longer runs modules_prepare so the do_shared_workdir task will
    *never* fine module.lds on a clean run.

    So we just need the single copy after we've build our modules
    to ensure that the file is available.

    Tested against a clean kernel and module build, just building
    the module. Dependencies are correct and the file is copied
    for the module to build.

    We could do the same thing for Module.symvers, but historically
    it was generated during the main kernel build .. so we can leave
    it there for old kernel support.


 meta/classes/kernel.bbclass                | 1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index be93a258f6..af4c891de4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -391,6 +391,7 @@ do_compile_kernelmodules() {
 		# other kernel modules and will look at this
 		# file to do symbol lookups
 		cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
+		[ -e ${B}/scripts/module.lds ] &amp;&amp; install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
 	else
 		bbnote "no modules to compile"
 	fi
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 81b1e36041..5f0dedbdf7 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -100,6 +100,12 @@ do_install() {
 	# be dealt with.
 	# cp -a scripts $kerneldir/build
 
+	# although module.lds can be regenerated on target via 'make modules_prepare'
+	# there are several places where 'makes scripts prepare' is done, and that won't
+	# regenerate the file. So we copy it onto the target as a migration to using
+	# modules_prepare
+	cp -a --parents scripts/module.lds $kerneldir/build/ 2&gt;/dev/null || :
+
         if [ -d arch/${ARCH}/scripts ]; then
 	    cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
 	fi
</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">

</pre>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------D9E95D647BBCB1040D652AA9--

--00000000000005d4e405b43fc7c1
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
I/3RRboOeC9M13VNr5feU91O0iDoMreAgPQJ0Lo7YrodKYug0Tt/fFDjkW3v3VIbEr2liUN69U0C
AwEAAaOCAdEwggHNMA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEwgY4wTQYIKwYBBQUH
MAKGQWh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVyc29uYWxzaWduMnNo
YTJnM29jc3AuY3J0MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vZ3Nw
ZXJzb25hbHNpZ24yc2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEQGA1Ud
HwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hh
MmczLmNybDAlBgNVHREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAK
BggrBgEFBQcDBDAfBgNVHSMEGDAWgBRpcoJiMWeVRIV3kYDEBDZJnXsLYTAdBgNVHQ4EFgQUWOK7
qiyDSt/IDm/SRcNi/sTEiyswDQYJKoZIhvcNAQELBQADggEBAEe2edd4F9tpp0GPmrFrQ+xp9kY7
uxBzPdCw588bgVrPemjLwiwV37XTT4iWJtNhPfEpaguM6jeLm58LCvHq5/IBjcyHyf4URQVwAg7B
pqkH8/M+IBstu4/D+znPHB59X+c+au3Q8D+xoNFd7I30kaE+oJuBuFsGXRBc0Ci+FM86x9k7SF8U
aui1E7Y9wDfsRSCL2TSwU773f09WkrvVdlKxNqQZj2z7bQUUn+yfXdFfBz0LqlYNfn7xJOpQE3HI
H4jq6U9+b0Qf+J0n0wyysjXPSeQ7EKXVkT8dM2KSpIN86v5dd9LkAz3C1dmjuPRGEC8ZhI1IjMBt
0itrn6C23NsxggJvMIICawIBATBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWdu
IG52LXNhMTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0g
RzMCDFtD165RQeUC8DvoCDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgXbjCLQ1w
k778s6WbA2+k98gmYQvTKML+8fLA4kOWLV0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkq
hkiG9w0BCQUxDxcNMjAxMTE2MjEwODE4WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjAL
BglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG
9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBACjj1aVRJe8HEWA7ZuH7h/CW3wzC
Jaq2weUB5MlSEzr6wG1jfSV6/k4ZrHnoJx683WlfPGpgFUIi7QSrU1tFYmNNDGdjnvBhcccX6eQd
l2ESlh9TcvIRGiLmT7zyPJa7QXGsTrKRnefo8y2amWHSBzbqGj0/f4/FBSwsx78onLeRol01H7Xq
izXZYXPGkabKxzTMyDsNiJ5i+qhxWDYNLouzhc8+bv2I8Ni/r7VBy35TKcGGiBbQKXMCVG5eI0r4
pbEwVGmHHjTQywvuw0+NTwC1WpDQrrx1AE/GWIBdDOVqNTvF59ZgXeb5B7JvLcVP/S6EYDVrX1Px
3CpN3kV4hr0=

--00000000000005d4e405b43fc7c1--
