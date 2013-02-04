Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U2V8F-0003pJ-Va
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 00:07:24 +0100
Received: by mail-ie0-f175.google.com with SMTP id c12so6502186ieb.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 14:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=rcv3jyNxKbk4EnP8lH8ZLFl8GcC1nqFxGWDg9NlzB7Q=;
	b=h182/SyWbwas0xfwxLTS0VVtKMR9sCdrJEUzZZXFoI+x5TwOcp02mcIJ6xx/GQoynq
	qftGb/e4Q8pQQwTMYfPXbu9ov9i5jfaJ54pIsXR9qoz3/ueFyAvKv9qGdxNTvcT293Ob
	p8MH7HOoSdWFLp8jOQ8DwO2eEtUOuX7yhDs4MNDN89fcOFphPKz2PrsqupRjRbTllwIn
	++pjVJBcIY/e5ROzAK+E1G9i1fqmIkl/PIV5p7Xa5VQGRjMJRNKRb7sjF2TwF71c4g1j
	Ebsw+3V5JoqB7xDe7Bb0SIa9skKC8/mJjr1ZTCJDBgKuq3jfkBSqDe4ku3JXYlp13+dl
	vraw==
X-Received: by 10.50.47.170 with SMTP id e10mr9582983ign.84.1360018294463;
	Mon, 04 Feb 2013 14:51:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Mon, 4 Feb 2013 14:51:04 -0800 (PST)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A86C5F5@039-SN1MPN1-002.039d.mgd.msft.net>
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A86C5F5@039-SN1MPN1-002.039d.mgd.msft.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Feb 2013 14:51:04 -0800
Message-ID: <CAMKF1sojwK+mcrsk1QooHSr6cPCO8XOfr+okpUN1q6e1DYEwqA@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Mon, 04 Feb 2013 23:07:24 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 4, 2013 at 12:13 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>> +
>> +KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
>
> Why change to ${CC} from "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX}?
>
> It breaks some kernel builds we have...

you did not tell what exactly breaks.


