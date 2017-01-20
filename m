Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1C3DD77250
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 19:44:30 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id c7so28012257itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=j+nyOlqy+TNmGSXusMUzxmhuGRwIYMWLQ/mMqHgnwY8=;
	b=XTfOE2CGrfuIRVzwaLU0QAfQ6na8EUvzdHy1o+8Vc5cLtlEQcJCdSIlneQpEUCbEFq
	szXRJ4z6UWsx5R0XfSS54aOKPlKOXGWSUiVt5cPlyNoLupCRdHKUW+W5y3CF+V8zBt8z
	oMmCp/bij7+Z1VK4uwHiKKpVWIHaON2ZLH9r590BhyguhdvA/PXthVNVw3UaUjQaEL/6
	taqSh4WjKNxWMYZ6YEv1/sFzO56TBihrWSSRvJnbk7ERBFNLfkUN6dB7djdZUlkqcIfY
	Rno0UzkGO7AI8ZBTEqU4pjY3s6qYpC7WjYPtdDwNJJubxqw4rzdoJPD9L7IQVkjixvDh
	t3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=j+nyOlqy+TNmGSXusMUzxmhuGRwIYMWLQ/mMqHgnwY8=;
	b=oTF5NgMJtCOL/QzTGKevQ0De6cBnPJvP18iDLSCj//4wAGGz6ZJjEIcMVnsiqaSC6D
	uHb89EFPIpy8Op/1kU5hkvK3Zzaq5ZYgi1z3gA5/cuTVR8SWEN6KtNJ1JtcRcvsTiSu+
	r9JAHIr87fDB1pZXv6yBlnS7+iZJfZKBYMjbhKFRm/3rFB3z5Io/aHsYTXXB3BHEFUh+
	TtfITXxt0QS+Y+247VGGl6WyoKoQMxrp6BJr9XIB+6rDAyaxZAjorAWsY5wh/7FFUeYA
	6I21JG6OeXED7X2ljqKAVY/NFNLv7q+POCS+zBZEQVtCWkipMX+ZTWnDhVJP1yArS41q
	pJ3w==
X-Gm-Message-State: AIkVDXIaxUWO7EekWowlErJX/aZvDFQ+CmQQ+60JssLUtI+CURN9iRelgGxY7Itj6hzMZbjA
X-Received: by 10.36.190.68 with SMTP id i65mr5293956itf.118.1484941471322;
	Fri, 20 Jan 2017 11:44:31 -0800 (PST)
Received: from pohly-mobl1 (p57A56DD5.dip0.t-ipconnect.de. [87.165.109.213])
	by smtp.gmail.com with ESMTPSA id
	l31sm5003677iod.17.2017.01.20.11.44.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jan 2017 11:44:30 -0800 (PST)
Message-ID: <1484941467.20333.3.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Fri, 20 Jan 2017 20:44:27 +0100
In-Reply-To: <1484935979-328-1-git-send-email-anibal.limon@linux.intel.com>
References: <1484935979-328-1-git-send-email-anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] qemu: Upgrade to 2.7.1
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
X-List-Received-Date: Fri, 20 Jan 2017 19:44:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-01-20 at 12:12 -0600, Aníbal Limón wrote:
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -9,12 +9,11 @@ require qemu-targets.inc
>  inherit autotools ptest
>  BBCLASSEXTEND = "native nativesdk"
>  
> -PR = "r1"
> -
>  # QEMU_TARGETS is overridable variable
>  QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4
> x86_64"
>  
>  SRC_URI = "\
> +    http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
>      file://powerpc_rom.bin \
>      file://disable-grabs.patch \
>      file://exclude-some-arm-EABI-obsolete-syscalls.patch \
> @@ -24,6 +23,9 @@ SRC_URI = "\
>      file://0001-target-mips-add-24KEc-CPU-definition.patch \
>      "
>  
> +SRC_URI[md5sum] = "a315bc51ed443a08d2cf1416d76b9ab4"
> +SRC_URI[sha256sum] =
> "68636788eb69bcb0b44ba220b32b50495d6bd5712a934c282217831c4822958f"

Slight misunderstanding, I suppose. The *URL* is independent of the
version and could be added in qemu.inc, but the hashes are version
dependent and are better suited for qemu_2.7.1.bb. At least that's how I
would do it.

In contrast to Alexander, I would also keep
http://wiki.qemu-project.org/download/${BP}.tar.bz2 in qemu_2.7.1.bb
with SRC_URI =+ because then there can be a qemu_git.bb with a different
URL than the one above.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




