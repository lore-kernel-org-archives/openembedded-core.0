Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrB4M-0008Rd-Jx
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 18:28:36 +0100
Received: by mail-vc0-f171.google.com with SMTP id n11so16617323vch.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 09:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zp+jLcQi54Jh8N35ihaaO6AZynqNYTM2QAekburrZM8=;
	b=W6kq1zJGGeEjy5sdm4Q8aSl8+imtu4p6c7lwsqv5SvIVb9i1zweIGbqUIIujhzT6z/
	9uYtm0a6ALMrJaijbm/IJ0areShUOSs3ddk4alH02iaW1PlNb1UwUzn8FakNUbOwdu95
	owPz0gEwswOWCkOsy9XJ43WkCPNaDEdQ+nxrgwL35S5NdkrBP3k+u2splBwJmyoizpa7
	LLgC7kcpnOwTJxpXhwXsjuwH+JgjENo1z2KBAgNtzejOP3P46pJpODkjSN18p4WltUs8
	zELF8YY6254alx6Q33DFR+CmxXO0dTSYnQimceMuzZQk6RYkgaNu2VzzCh67BvdkSIW4
	69Lw==
MIME-Version: 1.0
Received: by 10.52.29.175 with SMTP id l15mr67200779vdh.2.1357319608994; Fri,
	04 Jan 2013 09:13:28 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Fri, 4 Jan 2013 09:13:28 -0800 (PST)
In-Reply-To: <CAF6bG8daZ1x-XxCoTqrLh=1=8BjT4iwQxYuTem1M1hUR9qnyAw@mail.gmail.com>
References: <1354273734-7103-1-git-send-email-cazfi74@gmail.com>
	<50C8062C.9050408@linux.intel.com>
	<CAF6bG8daZ1x-XxCoTqrLh=1=8BjT4iwQxYuTem1M1hUR9qnyAw@mail.gmail.com>
Date: Fri, 4 Jan 2013 19:13:28 +0200
Message-ID: <CAF6bG8dSSu=-EREvr2NJ=FT1s=fnuHC8+zsbRNpxs1frPXzVLw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: update to upstream version 8.20
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 17:28:36 -0000
Content-Type: text/plain; charset=UTF-8

On 13 December 2012 00:48, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 12 December 2012 06:21, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>> | mips-poky-linux-gcc  -meb -mabi=32   -mhard-float -march=mips32
>>> --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips
>>> -std=gnu99  -I. -I./lib  -Ilib -I./lib -Isrc -I./src    -O2 -pipe -g
>>> -feliminate-unused-debug-types -c -o src/false.o src/false.c
>>> | src/factor.c: In function 'factor_using_division':
>>> | src/factor.c:766:11: error: unable to emulate 'TI'
>
 ...
>  As for your mips build failure, I'm investigating it so that I can at
> least report bug for upstream to fix.

 For the record, this issue was handled in upstream ticket
http://debbugs.gnu.org/cgi/bugreport.cgi?bug=13353
and is now fixed in upstream.


  - ML


