Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id D3709600E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 17:23:53 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id k200so5743434itb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 09:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=U1R/I1mnbcJVuzLS6Y3+o7qPTcwRVYgCR66X43FgeRo=;
	b=gbJXs7TYV1Ox4uUtqK2MmPRRRi1yP/+bF7MgmxHTlEjo6FY/AY2omY8TyOIy9owM0S
	TG0hGyw4zezMVbTMwARmoTmx+SHwO0bj9UVjqf5+gsZMOjNf1OudDJNx4my/ZYxLbDi5
	8QoKhCQwMiCt4394UTEOlM8vuQaTj8KCsDXJndDEK80xS60SnLPBGk0XsLYr5kEIc0zM
	zhbIRET+BoZtqzbaK0XuznuOg/IiTBD5mT0FIIFUEC2P8/0qIWrct4Mh+00KbeL7l2zF
	Wa5Z+quN38tb6twmk4EXlIq/H7+82HZJzYClTSnuO9Bzi/YneanGLKQjVzoKcrhoZ0Mp
	df/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=U1R/I1mnbcJVuzLS6Y3+o7qPTcwRVYgCR66X43FgeRo=;
	b=ZRGz7VS6DrvCvea8wgztFfvgZ3LoUooISrLwLhxZ0dNOmHQFI6/wc7Lu8t7t/Tpxnh
	s7HV8vZeBApSocl4R+Rg6Te9QRf7ppfhpOpHWaeLeB2zWjc24+ldJcn4ay0/3DsgLHS0
	H4Bb2jSZDzhHjWlxpFrKbzd8FsK5NtRb/fkUuEvyxF6WDpXxHkWyb2LFgU0CgHFJ8ftz
	SJzKYyiKO4RkhAW+cyC8tDDMgDxfYSbJyiTxmukdCO//ugk/yncytvL4jjRGRvM49Qli
	Obb6l4ZShireuIE808ck5K6YB8Weo1sfM/k/zkrBCVuKXzy4jA/g4E2eSrOypTks2V/Q
	76uQ==
X-Gm-Message-State: AIkVDXJc9tf9tNQ2G1NN7YSLiVHJymp/XrZk5U/96dUQ2k5wuJyX2MJ3J6fH9XWCRD4IazsG
X-Received: by 10.36.93.213 with SMTP id w204mr25113545ita.60.1484846633617;
	Thu, 19 Jan 2017 09:23:53 -0800 (PST)
Received: from pohly-mobl1 (p57A5686E.dip0.t-ipconnect.de. [87.165.104.110])
	by smtp.gmail.com with ESMTPSA id 184sm1723735itx.0.2017.01.19.09.23.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jan 2017 09:23:52 -0800 (PST)
Message-ID: <1484846629.23233.83.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ross Burton <ross.burton@intel.com>, Fathi Boudra <fathi.boudra@linaro.org>
Date: Thu, 19 Jan 2017 18:23:49 +0100
In-Reply-To: <1483977580-11236-1-git-send-email-ross.burton@intel.com>
References: <1483977580-11236-1-git-send-email-ross.burton@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: upgrade to 2.6.2
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
X-List-Received-Date: Thu, 19 Jan 2017 17:23:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-01-09 at 15:59 +0000, Ross Burton wrote:
> Patches dropped as they are merged upstream:
> - CVE-2016-6354.patch
> - 0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
> - do_not_create_pdf_doc.patch
> 
> Apply a patch from github to simplify cross-compilation and not need a
> flex-native to bootstrap.

After rebasing my pending "UEFI/OVMF" patches I noticed that this
particular version update breaks compilation of acpica-native:

| obj/dtparserlex.o: In function `DtInitLexer':
| dtparserlex.c:(.text+0x10e7): undefined reference to `yy_scan_string'
| obj/prparserlex.o: In function `PrInitLexer':
| prparserlex.c:(.text+0x1327): undefined reference to `yy_scan_string'
| collect2: error: ld returned 1 exit status
| ../Makefile.rules:14: recipe for target 'obj/iasl' failed
| make[1]: *** [obj/iasl] Error 1
| make[1]: Leaving directory
'/fast/build/refkit/intel-corei7-64/tmp-glibc/work/x86_64-linux/acpica-native/20161222-r0/acpica-unix2-20161222/generate/unix/iasl'
| generate/unix/Makefile.common:25: recipe for target 'iasl' failed
| make: *** [iasl] Error 2
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located
at /fast/build/refkit/intel-corei7-64/tmp-glibc/work/x86_64-linux/acpica-native/20161222-r0/temp/log.do_compile.32470)

That still occurs also after updating to the latest upstream acpica.

I searched for the error and found this about yy_scan_string:

        In case anyone else is getting symbol is not defined or other
        such errors when trying this: remember to include %option
        reentrant in the lexer file.
        
http://stackoverflow.com/questions/1907847/how-to-use-yy-scan-string-in-lex?ref=driverlayer.com/web

I tried that and then just got different compile errors.

Perhaps someone with more knowledge about flex can provide some
guidance?

Fathi, is that something that you or upstream have come across?

Ross, would it be possible to revert this patch so that the UEFI patches
can be merged? Obviously the problem still needs to be resolved.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




