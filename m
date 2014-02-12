Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id BE4F76E8DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 16:23:07 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id f73so8809688yha.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 08:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5/IFOCwNFbddqNfOWS18J+EdEWKMpyaGBYOVw4yZuB8=;
	b=TW88Bi3NmMXlADU0lR3Q1doZXKAFnr8IrCFKxzhrn/DZLAm1YOQ8rqY6f9N8ZwESfG
	ySIQjXxvCK8Xtc/pabx7dgq3RyfBPcQ5lWZhZ9IgYxhrjzncnS/g11hVgRodJowH/aVr
	7w2HZNivHOGxXsiPXM9y8wwTPFxMLwFW0BSRdgysoCPEJkR6qU2KTnUWOJ5n6A+4mJoP
	hLT/SixX22jA9xbz1CC2QFAIGxmmkJvXE0R9K2MboF7Q9r5mN1FjvO0U1626Ffw68vRi
	gXqMnCEVjcv0wyjrEk9aMaHSbaItFwcIf/eHtdTjcY5c/i/IP0SytpW2vDRgjEIaks76
	XlFg==
MIME-Version: 1.0
X-Received: by 10.236.158.226 with SMTP id q62mr40945323yhk.2.1392222188659;
	Wed, 12 Feb 2014 08:23:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.161.3 with HTTP; Wed, 12 Feb 2014 08:23:08 -0800 (PST)
In-Reply-To: <1391613014-5792-1-git-send-email-fathi.boudra@linaro.org>
References: <1391613014-5792-1-git-send-email-fathi.boudra@linaro.org>
Date: Wed, 12 Feb 2014 14:23:08 -0200
X-Google-Sender-Auth: 9oK_m_0ZVlYPXafUGueTxwaLn6I
Message-ID: <CAP9ODKpSTHUeGOkr=6zuXqRJUri-Tnrm9o0nb4LEx+-9FWjB4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemtap: add aarch64 support
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
X-List-Received-Date: Wed, 12 Feb 2014 16:23:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Wed, Feb 5, 2014 at 1:10 PM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> bump SRCREV to include the relevant commits for aarch64 support
> update COMPATIBLE_HOST to include aarch64
> cleanup md5sum/sha256sum since we use git
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

This broke master in our autobuilder:

 | .../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0r0/git/includes
-I./includes/sys -DSTAP_SDT_V2
-isystem.../build/tmp/sysroots/x86_64-linux/usr/include -Wall -Werror
 -isystem.../build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
-fstack-protector-all -D_FORTIFY_SOURCE=2 -c -o stap-buildrun.o `test
-f 'buildrun.cxx' || echo
'.../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/git/'`buildrun.cxx
 | .../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/git/tapsets.cxx:
In function 'void validate_module_elf(Dwfl_Module*, const char*,
base_query*)':
 | .../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/git/tapsets.cxx:1998:10:
error: 'EM_AARCH64' was not declared in this scope
 | .../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/git/tapsets.cxx:
In constructor 'sdt_uprobe_var_expanding_visitor::sdt_uprobe_var_expanding_visitor(systemtap_session&,
int, const string&, const string&, const string&, stap_sdt_probe_type,
const string&, int)':
 | .../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/git/tapsets.cxx:5613:31:
error: 'EM_AARCH64' was not declared in this scope
 | make[2]: *** [stap-tapsets.o] Error 1
 | make[2]: *** Waiting for unfinished jobs....
 | make[2]: Leaving directory
`.../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/build'
 | make[1]: *** [all-recursive] Error 1
 | make[1]: Leaving directory
`.../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/build'
 | make: *** [all] Error 2
 | ERROR: oe_runmake failed
 | WARNING: exit code 1 from a shell command.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

