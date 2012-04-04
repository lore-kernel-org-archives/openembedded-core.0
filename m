Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SFNWR-0003Xq-09
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 12:33:03 +0200
Received: by bkcjg15 with SMTP id jg15so103692bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 03:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=l5paycF/RCncFpFrMTAFTMwvB+J3jwEeJiecdcnZuZI=;
	b=bKQBEdD5Nr/mc8NqYiJ5N8rBaSAz+sT1ojmdwxOs3Et5lRjBe2hME7SDKbEVsk1rsL
	AwdN3aX3/UuBQyABe9tjeXKHeCcM8WiYXikeX+esPng/jkPGBAzT+p8GoXGvdpKXzex5
	FsB55F0DDmAIeP2KowOyJJqxUndRUYt9m+ugpInrrqgNMfRAWtb0U4Jac+1e9XoG04+r
	F7cdY66f2msQbYDvYdP6mFl1XpFLLnZhibYENGVDMyF1kgXALlKeaAQDUjUipgs9c3ZR
	lR6Mw+g1HGTXS2CxuFV5UMa23nMfGY2aEFuCa7c5JUj2fqEa7Nw05dWOSCbhTlGs9CyZ
	SMAQ==
Received: by 10.204.154.139 with SMTP id o11mr7021868bkw.4.1333535032526;
	Wed, 04 Apr 2012 03:23:52 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de. [217.92.191.7])
	by mx.google.com with ESMTPS id x4sm673616bkv.8.2012.04.04.03.23.51
	(version=SSLv3 cipher=OTHER); Wed, 04 Apr 2012 03:23:51 -0700 (PDT)
Message-ID: <4F7C2135.6040904@dresearch-fe.de>
Date: Wed, 04 Apr 2012 12:23:49 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120328 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F7B38C7.6010909@mlbassoc.com> <4F7B3B8C.6000200@windriver.com>
	<4F7B3C75.5030200@mlbassoc.com> <4F7B3EAE.2000301@windriver.com>
In-Reply-To: <4F7B3EAE.2000301@windriver.com>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQk3hSkD0Zzad4Czio9MvijypaBL8UTpmr0AKAl4CAQJ+JkdQcWyALdEr3MsRKGLFIFTtf5c
Subject: Re: Schizophrenic package management
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Apr 2012 10:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2012 20:17, Mark Hatle wrote:
> On 4/3/12 1:07 PM, Gary Thomas wrote:
> ...
> (And RedHat based linux distributions don't have any concept of alternatives.
> They generally decide which binary package will provide the functionality
> and that is the defacto standard for a given release.  OE on the other hand
> is closer to Debian based systems in that regard.  We can build multiple
> packages that may provide the same functionality, then it's up to the
> package install time to determine which version of the functionality is
> used as the default.)

FYI: openSUSE 12.1 (rpm-based) uses

Name        : update-alternatives
Version     : 1.15.8.10
Release     : 9.1.2
Architecture: x86_64
Install Date: Fri Nov 18 12:16:48 2011
Group       : System/Management
Size        : 67090
License     : GPLv2+
Signature   : RSA/SHA256, Sat Oct 29 12:13:51 2011, Key ID b88b2fd43dbdc284
Source RPM  : update-alternatives-1.15.8.10-9.1.2.src.rpm
Build Date  : Sat Oct 29 12:13:28 2011
Build Host  : build16
Relocations : (not relocatable)
Packager    : http://bugs.opensuse.org
Vendor      : openSUSE
URL         : http://ftp.de.debian.org/debian/pool/main/d/dpkg/
Summary     : Maintain symbolic links determining default commands
Description :
update-alternatives creates, removes, maintains and displays
information about the symbolic links comprising the alternatives
system. It is possible for several programs fulfilling the same or
similar functions to be installed on a single system at the same time.
For example, many systems have several text editors installed at once.
This gives choice to the users of a system, allowing each to use a
different editor, if desired, but makes it difficult for a program to
make a good choice of editor to invoke if the user has not specified a
particular preference.
Distribution: openSUSE 12.1

> ...

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


