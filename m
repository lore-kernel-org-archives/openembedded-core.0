Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id E563B6E89A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 21:06:27 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id c11so7635563lbj.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 13:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=IHT94s3+5pbkB0j2n3HwS/c8oq5Rp5QmEjE9v8iJ43g=;
	b=accS9el8KkeG2xcHOyht5DCDGTI2DEp6l+X02HoOHBcXVhJExe7SEtLUGPKyVc6FQN
	ixOPzGkraDkhVDF8s54/1VliNyDCExtf3eWB8PwcZPMaEmyeKQjsDsuWnReeWbPlpW77
	Oeg/fdDENEmiwGOqSDiX6lsqSCcNfrvKOku2Eltk8hRwr+mdu9f/pOiVRK45/Vl4oLgD
	ufT6eLfAETenx83LWQPqJy85S/kov/q4/CUZOoJgdGn2/TsHP4KAxrOT8CCP866t0bQS
	ZDreUrFvVcHWrGzZaQiSydcFKD2nQGYLQ0xBlc1mYzo/u+bHGxjob2nOtx3CIQbDTgTE
	nbGA==
X-Gm-Message-State: ALoCoQmgvWh3NZWiaBj+9Db04WyigUY+BeSa5wFGwB+FbNSU7LvaPfziZCH5Pqhchv1zcqNuaaLq
MIME-Version: 1.0
X-Received: by 10.112.236.3 with SMTP id uq3mr31091858lbc.14.1392239188213;
	Wed, 12 Feb 2014 13:06:28 -0800 (PST)
Received: by 10.112.91.227 with HTTP; Wed, 12 Feb 2014 13:06:28 -0800 (PST)
In-Reply-To: <CAP9ODKpSTHUeGOkr=6zuXqRJUri-Tnrm9o0nb4LEx+-9FWjB4g@mail.gmail.com>
References: <1391613014-5792-1-git-send-email-fathi.boudra@linaro.org>
	<CAP9ODKpSTHUeGOkr=6zuXqRJUri-Tnrm9o0nb4LEx+-9FWjB4g@mail.gmail.com>
Date: Wed, 12 Feb 2014 23:06:28 +0200
Message-ID: <CAGNsrLDWToovXwCDKRzrLVf7obmG7Voz6tbMaMig5nZBNzTDWw@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Wed, 12 Feb 2014 21:06:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 12 February 2014 18:23, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Hello,
>
> On Wed, Feb 5, 2014 at 1:10 PM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>> bump SRCREV to include the relevant commits for aarch64 support
>> update COMPATIBLE_HOST to include aarch64
>> cleanup md5sum/sha256sum since we use git
>>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>
> This broke master in our autobuilder:
>
>  | .../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0r0/git/includes
> -I./includes/sys -DSTAP_SDT_V2
> -isystem.../build/tmp/sysroots/x86_64-linux/usr/include -Wall -Werror
>  -isystem.../build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
> -fstack-protector-all -D_FORTIFY_SOURCE=2 -c -o stap-buildrun.o `test
> -f 'buildrun.cxx' || echo
> '.../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/git/'`buildrun.cxx
>  | .../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/git/tapsets.cxx:
> In function 'void validate_module_elf(Dwfl_Module*, const char*,
> base_query*)':
>  | .../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/git/tapsets.cxx:1998:10:
> error: 'EM_AARCH64' was not declared in this scope
>  | .../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/git/tapsets.cxx:
> In constructor 'sdt_uprobe_var_expanding_visitor::sdt_uprobe_var_expanding_visitor(systemtap_session&,
> int, const string&, const string&, const string&, stap_sdt_probe_type,
> const string&, int)':
>  | .../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/git/tapsets.cxx:5613:31:
> error: 'EM_AARCH64' was not declared in this scope
>  | make[2]: *** [stap-tapsets.o] Error 1
>  | make[2]: *** Waiting for unfinished jobs....
>  | make[2]: Leaving directory
> `.../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/build'
>  | make[1]: *** [all-recursive] Error 1
>  | make[1]: Leaving directory
> `.../build/tmp/work/x86_64-linux/systemtap-native/2.4+gitAUTOINC+9190b3acfe-r0/build'
>  | make: *** [all] Error 2
>  | ERROR: oe_runmake failed
>  | WARNING: exit code 1 from a shell command.
>
> Regards,
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

It's fixed by a later commit: 508059f04842ed85d10bfbec8a9c688d57368860
https://sourceware.org/git/gitweb.cgi?p=systemtap.git;a=commitdiff;h=508059f04842ed85d10bfbec8a9c688d57368860

a patch is coming to bump the SRCREV.

Cheers,
Fathi

