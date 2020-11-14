Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.2262.1605327543130074386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 20:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=FRNZwTdR;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.216.65, mailfrom: scott.branden@broadcom.com)
Received: by mail-pj1-f65.google.com with SMTP id w7so1278053pjy.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 20:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=ovOiYO3hxC6gc+AbYiLNs6SjcM4PAGMVS5Tdc5FnnT0=;
        b=FRNZwTdRMoC44Q7kDZDtHAqOJKC2IlIKHN0asDqHAZiVjVUNJtiOtKu6HLEPObZB3Z
         3tdscVF9w6vdmqnBLJDRcSrcHIurAJO4DaV8SSz/wnAbmtaiEhYzhGy8AyiXvCcNcXzu
         QxToaii9vgCeea4ppIMFABk6hFnjE1JT2bSnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=ovOiYO3hxC6gc+AbYiLNs6SjcM4PAGMVS5Tdc5FnnT0=;
        b=ZyHDVTx1UjDLvpNs3wiyV0+fmmoQgCdDoyL0IEVJpAHs+w+WgFXNm17p0k2VA8lgEg
         1lkPpHzuJOa02LujTWZWA8xYxokd5vfV5gSw2EYYJs0qND9/1nMhiLJ5BgJsshEQIeql
         uacB0ezgQhZEQwx/87EfukQOdmZOby+RRkrd7QW2jNZnvVRgzM5lbL3bB5DPdLjjnc49
         rpECWXvDYHtMWbIAuQJQAepN/KjsyweBoXzz1GOsoqtbpIpOaPmF195X9Nu2SMLEM83+
         UzOF/LO1xkQ3+nVoxC+HHSt/bRJDe/oPNP7he5QlqcDPPxaS/tMapb3oFPhGAn5RBXL7
         CzXQ==
X-Gm-Message-State: AOAM533ciE7nB+YLWyIS1fwr/bLrEAiEmimtxk3P5nTna4BAiKwqxVHd
	ZoDVEQwXNokzqMEdjB7/9VCtruQVINXAb30Zlm91oYWW+FBt0UQfLwYeOfuhXRV69GfyM1PCz3B
	ETkZ/MHa0+E1NQc0rx4Lbpqww6QDsu0u6j+nHIqfw+ulrI5Hmf2au6NOSVLsPucCCTL/uXaP5wI
	/iXVHnaKu4O2KlYmZk/937ZjybtJs=
X-Google-Smtp-Source: ABdhPJyTKVacoAcocFoPI+iBIFr1xYbR0/hExgwY0JWQGVd7FwbVoZo2njbF+qz9yBGL2LlItGmfOA==
X-Received: by 2002:a17:90a:6042:: with SMTP id h2mr6562011pjm.77.1605327541806;
        Fri, 13 Nov 2020 20:19:01 -0800 (PST)
Return-Path: <scott.branden@broadcom.com>
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id l17sm12393066pjy.29.2020.11.13.20.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 20:19:00 -0800 (PST)
Subject: Re: [OE-core] [PATCH] kernel: provide module.lds for out of tree builds in v5.10+
From: "Scott Branden" <scott.branden@broadcom.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 richard.purdie@linuxfoundation.org
Cc: lili.li@intel.com, openembedded-core@lists.openembedded.org
References: <20201113063206.1716-1-bruce.ashfield@gmail.com>
 <da1c1435-f884-6d74-e6ad-292cf0a3f47e@broadcom.com>
Message-ID: <771b373d-927a-4ac6-8716-b51f2b6d355f@broadcom.com>
Date: Fri, 13 Nov 2020 20:18:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <da1c1435-f884-6d74-e6ad-292cf0a3f47e@broadcom.com>
X-Groupsio-MsgNum: 144581
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e8f76b05b40971cb"

--000000000000e8f76b05b40971cb
Content-Type: multipart/alternative;
 boundary="------------972AAC49714A6F7C0E10559E"
Content-Language: en-CA

--------------972AAC49714A6F7C0E10559E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Sorry, spoke too soon.  Doesn't seem to work from a clean build now.

On 2020-11-13 9:53 a.m., Scott Branden wrote:
> Thanks, works for me building external kernel modules.
>
> On 2020-11-12 10:32 p.m., Bruce Ashfield wrote:
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
>>  meta/classes/kernel.bbclass                | 1 +
>>  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index be93a258f6..ccd74e61e8 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -494,6 +494,7 @@ do_shared_workdir () {
>>  	# Copy files required for module builds
>>  	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>>  	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
>> +	[ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
>>  	cp .config $kerneldir/
>>  	mkdir -p $kerneldir/include/config
>>  	cp include/config/kernel.release $kerneldir/include/config/kernel.release
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


--------------972AAC49714A6F7C0E10559E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Sorry, spoke too soon.  Doesn't seem to work from a clean build now.<br>
    <br>
    <div class="moz-cite-prefix">On 2020-11-13 9:53 a.m., Scott Branden
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:da1c1435-f884-6d74-e6ad-292cf0a3f47e@broadcom.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      Thanks, works for me building external kernel modules.<br>
      <br>
      <div class="moz-cite-prefix">On 2020-11-12 10:32 p.m., Bruce
        Ashfield wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20201113063206.1716-1-bruce.ashfield@gmail.com">
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
        cite="mid:20201113063206.1716-1-bruce.ashfield@gmail.com">
        <pre class="moz-quote-pre" wrap="">---
 meta/classes/kernel.bbclass                | 1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index be93a258f6..ccd74e61e8 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -494,6 +494,7 @@ do_shared_workdir () {
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
 	[ -e Module.symvers ] &amp;&amp; cp Module.symvers $kerneldir/
+	[ -e scripts/module.lds ] &amp;&amp; install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
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

--------------972AAC49714A6F7C0E10559E--

--000000000000e8f76b05b40971cb
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
RzMCDFtD165RQeUC8DvoCDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgWE7gie5m
zL1kU+6ZcvRulOg2g/QX7EvFojB/DtbdrQYwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkq
hkiG9w0BCQUxDxcNMjAxMTE0MDQxOTAyWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjAL
BglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG
9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAGVmxVX2ILEvunxWPliXAfsB+dlq
lBbbLHItIqLVD8AMDyCVJ8P4Jb0pnKyrnq0s5QptyNCETbZAQrTabiiHImTC9mb49xi2Vm14qxph
slvEo71Dcz7Qr/ZQVYSwcDV6r4yfL3cLpnOKrxfWAnmJsWpjT9U224Mb6wddxHamKt2dNKsL64iB
iRDu5u1wtf74hSkiFlmE0IJLAO4CTOPG/CYX7E2ogKohmNHty7IKckrGy/HnP42spCC4r6KziUVL
mwR9rjF40pkWLWqapnBiRT3cQ1xP/9aGfRogVI2Yl6mliygHiTPwf9TnmMXprY6ua6avBv4gKtPQ
hAIiNoe9oI8=

--000000000000e8f76b05b40971cb--
