Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id BF1316022E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 13:19:23 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id r145so117797272ior.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 06:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=sbPUBrY2LJR6puDSt5zH9VsW5y/ZFPe0nYEHLpAxChc=;
	b=WeJUa/GscLDudvFAjufbZdDt0XI3CV9Jln77xK/T+IjvZAyoB80hJhjZc9suP4W50e
	o6E3Nnq8Ex4cL4hhsMDBBnnjuT3ZxFQjMxrfV9v4qLMh7grH8jJm77Ta8G5Yd7Z1s88q
	zCIhNEPZeZijzidT3dbgMauc2umfIHbE91xdDXM7Kv/dzGLcHrxYC2oKjQGaYLWJQ5wE
	VDaXTtinZPQgMzvcmCKpbAUDfM8rB9SgqtKYmArIbgops3IgFaXG7foG2femw5kT6Jk9
	K4p5Xh1iWhiw/3RezKg+BHXlmrC725sX7Jr42k3621ZVGc/TnUDhOD3XhojOYlM0mryu
	ubNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=sbPUBrY2LJR6puDSt5zH9VsW5y/ZFPe0nYEHLpAxChc=;
	b=gSaCm2710ObqHcgbnKovyQAjPuQ9JDJ9DxByOjfKbE4OZTKNYfv6FCsSZelpviqh8O
	ky2ec4XuyJeABr4SL1DhT8aQ87jLDcucwidOUN0ctmVColz3mwGJdwBY3Nla2YjY0zcJ
	26Vsiqp9ou8r3FW35rI1WaF6n41fAXa4tbUeZ/sfF5apc7WhkCCIvlDzo9e+qi+Z0AWe
	/qnr3cq2sEgWNJSpewZ3RxnXG8ra9b2vzRSQPJNkf/8bRbcfaSd0jN3PwHWlU7DEqEi+
	/BzrLfdd7WXDRzHfRWfc1rUD3/zBHXLURI66tO7ZFGxAU1eR+iAPRCAHBHbxXfaJScTe
	hXAg==
X-Gm-Message-State: AE9vXwOqNjoGr8hT7yeXaqgFyJUeVC/nEdm0B/OHn9nOcheQW6OTjFhb4/A5d7yEGFCfJl4y
X-Received: by 10.107.170.148 with SMTP id g20mr9002538ioj.24.1474636764301;
	Fri, 23 Sep 2016 06:19:24 -0700 (PDT)
Received: from pohly-mobl1 (p57A56298.dip0.t-ipconnect.de. [87.165.98.152])
	by smtp.gmail.com with ESMTPSA id
	b137sm2811162ioe.40.2016.09.23.06.19.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 06:19:21 -0700 (PDT)
Message-ID: <1474636754.8561.6.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Fri, 23 Sep 2016 15:19:14 +0200
In-Reply-To: <2890fce9-ac23-d251-8b15-c8b11994e795@linux.intel.com>
References: <cover.1474619763.git.patrick.ohly@intel.com>
	<1474626443.7161.5.camel@intel.com>
	<2890fce9-ac23-d251-8b15-c8b11994e795@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] openssl: update to 1.0.2i (CVE-2016-6304 and more)
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
X-List-Received-Date: Fri, 23 Sep 2016 13:19:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-09-23 at 15:11 +0300, Alexander Kanavin wrote:
> On 09/23/2016 01:27 PM, Patrick Ohly wrote:
> >
> > There is one FAIL:
> >
> > ../util/shlib_wrap.sh ./dtlstest ../apps/server.pem ../apps/server.pem
> > Starting Test 0
> > Failed to load server certificate
> > Unable to create SSL_CTX pair
> > make[2]: Leaving directory '/usr/lib/openssl/ptest/test'
> > FAIL: test_dtls
> >
> > That's because server.pem wasn't installed. I'll fix that.
> >
> > However, ptest-runner returns with 0, i.e. success? Should it do that?
> 
> What does the failing test itself return? After checking the 
> ptest-runner source code, it shouldn't return 0 if one of the tests it 
> runs fails with a non-zero exit.

openssl's test/Makefile is the culprit:

alltests:               
        @(for i in $(all-tests); do \
        ( $(MAKE) $$i && echo "PASS: $$i" ) || echo "FAIL: $$i"; \                                                   
        done)                                                                                                      

If any test fails, it'll print FAIL, but won't cause make to fail and
thus the error never results in a non-zero exit code anywhere.

Here's a version which reports the problem via the return code:

alltests:               
        @(result=0; for i in $(all-tests); do \
        if $(MAKE) $$i; then echo "PASS: $$i"; else echo "FAIL: $$i"; result=1; fi; \                                 
        done; exit $$result)                

OpenSSL seems to rely on output checking. Not sure whether a patch
changing that would be accepted.

How are ptests used in the autobuilders? Does the return code of
ptest-runner matter, or is the output checked for ^PASS|SKIP|FAIL?

Speaking of the autobuilders and openssl-ptest in general, has no-one
noticed before that occasionally tests fail because file time stamps
imply that recompilation is needed? I got that a few times now and will
send a fix. I'm just wondering why that wasn't a problem earlier.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




