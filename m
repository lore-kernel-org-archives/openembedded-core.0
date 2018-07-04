Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 79F3374793
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 11:38:00 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id s14-v6so5407545wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 04:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:references:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ogXgC9H/XCFBWF99mFv6lx78vC/Sb09aBUJPjnhtXvM=;
	b=hD0RrDYM+xfm8CzXL8aJKtmVLz3AyE1FBx/4Ij/5ksnS3x2nyWN605fQr9mDjHVpZx
	I5568aFZQJR66sOmKJnbKuzZVGX8KqHHPqDxnWNIOHOwvQb8OgWej0wWWFHsXjHoXzWJ
	UjJDICkk6XA1iOHO3RlPz11mP6dE8xoP3KSFNzHH64xhBgb9ehAoNjFlBgwyeBjWwB/R
	9ZpdeudTIBtUTZKRNxp7RaJDjuoE16Ms7XbTpDsQZVbeOPfJmMkAm3DBdNq7HPF+KlVB
	xQGpKMYE6ewKYyow8y9tkx5Vx/csmjHa/3FmGoSlOdtA8yIv8KEJ7PTcqa+ds+P+kjv6
	D49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ogXgC9H/XCFBWF99mFv6lx78vC/Sb09aBUJPjnhtXvM=;
	b=XLa6acudsb6tRZ+1uL+MjoNM3Fd/OlWBFHUDzUEdZD8IWHD61Md7RzwH5Efd3WyhGd
	9NBldrNlOwupkq+avdJ0fIw+Z/5O8kV2owuSc5uUQ5+AwT+NRwrMUJDsmA7XS8SSHorg
	7UwkF0EFVCQgwSFbchbCuHQPfOke8n7Ml2bDyCN96kRtsh/uhmaGKGDSUouvIWBNgSfP
	ubbewFfSWB9SxMOOU+FjWFSMS4QQmG2bSv77XTsrG5UfL8Apjl1a1iJvb/4mHTnkbJhE
	wGkc6I4+B/YccR3NOzj8T1NAA+U/k2duWXdiZ8esd3a3IuDUpFZ/x2eloBhVA6GXZhbp
	wI/Q==
X-Gm-Message-State: APt69E1Jlf16eD9XharM0cKkuy8QMmgh3k5yw12lRi39PC6vOdBZLqvs
	gBpRWyHhtevmkiK5uHRgjdsZNQ==
X-Google-Smtp-Source: AAOMgpeO0c/Mtdoue5yFamZpdIwyc8gyTLAJ7hR4trbGVpyQ56GxVvcOu4rFtG1krHuo0c62ZlcCjw==
X-Received: by 2002:a1c:944e:: with SMTP id
	w75-v6mr1309180wmd.105.1530704280826; 
	Wed, 04 Jul 2018 04:38:00 -0700 (PDT)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	e13-v6sm7799846wrd.9.2018.07.04.04.37.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 04:37:59 -0700 (PDT)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Ed Bartosh <ed.bartosh@linux.intel.com>,
	Ross Burton <ross.burton@intel.com>
References: <99949e3e-c252-9504-ea89-f379bab6f021@dresearch-fe.de>
	<CAMKF1soU6M4zv6Xu4ugwheBHGO49cZSnnOD-PWSWJsCaAJC28g@mail.gmail.com>
	<a212aa5f-27a7-3181-cab8-c07fa5eca72a@dresearch-fe.de>
Openpgp: preference=signencrypt
Autocrypt: addr=sledz@dresearch-fe.de; prefer-encrypt=mutual; keydata=
	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
Message-ID: <d45d83de-c360-6306-d35a-1388fdbd518a@dresearch-fe.de>
Date: Wed, 4 Jul 2018 13:37:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <a212aa5f-27a7-3181-cab8-c07fa5eca72a@dresearch-fe.de>
Subject: Re: devshell problems after distro upgrade openSUSE Leap 42.3 -> 15.0 (tmux only)
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
X-List-Received-Date: Wed, 04 Jul 2018 11:38:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

On 03.07.2018 08:04, Steffen Sledz wrote:
> On 02.07.2018 20:25, Khem Raj wrote:
>> On Sun, Jul 1, 2018 at 11:39 PM Steffen Sledz <sledz@dresearch-fe.de> wrote:
>>>
>>> After upgrading my build system from openSUSE Leap 42.3 to openSUSE Leap 15.0 a
>>>
>>>   bitbake foo -c devshell
>>>
>>> no longer switches to the related work directory. The devshell is opened in the original directory without any error or warning instead.
>>>
>>> Any hints what's wrong here or how I can debug this behaviour?
>>>
>>
>> which terminal are you using, probably some default behavior changes there ?
> 
> Main terminal is xterm. No special settings for the devshell terminal, so tmux is started like before.


After some more tests I can limit the problem to OE_TERMINAL="tmux". Other terminals like screen or xterm work well.

Installed tmux version after distro upgrade is:

# rpm -q -i tmux
Name        : tmux
Version     : 2.7
Release     : lp150.1.1
Architecture: x86_64
Install Date: Fri Jun 22 13:49:06 2018
Group       : System/Console
Size        : 721941
License     : ISC AND BSD-3-Clause AND BSD-2-Clause
Signature   : RSA/SHA256, Sun Apr 22 18:46:31 2018, Key ID b88b2fd43dbdc284
Source RPM  : tmux-2.7-lp150.1.1.src.rpm
Build Date  : Sun Apr 22 18:46:08 2018
Build Host  : cloud114
Relocations : (not relocatable)
Packager    : https://bugs.opensuse.org
Vendor      : openSUSE
URL         : https://tmux.github.io/
Summary     : Terminal multiplexer
Description :
tmux is a terminal multiplexer: it enables a number of terminals (or windows),
each running a separate program, to be created, accessed, and controlled from a
single screen. tmux may be detached from a screen and continue running in the
background, then later reattached. tmux is intended to be a modern,
BSD-licensed alternative to programs such as GNU screen.

tmux uses a client-server model. The server holds multiple sessions and each
window is a independent entity which may be freely linked to multiple sessions,
moved between sessions and otherwise manipulated. Each session may be attached
to (display and accept keyboard input from) multiple clients.
Distribution: openSUSE Leap 15.0

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

