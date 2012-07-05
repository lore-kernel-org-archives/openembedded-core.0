Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmsS4-00051F-Jl
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 22:15:00 +0200
Received: by yenl13 with SMTP id l13so7414919yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 13:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=19gRFOwlUZD6Wk+R2GSuDnLXCk+yLGvZppWhEu39H8o=;
	b=whBaLwE4d450d2jrrgekTtdkgzLRlQP7OT2zhOAn+l11bmHYwSEJQBI2yaVQllUwep
	V/DsmExFYgFYsVeA849KqTA0qyiBFuonGxS+HaJ2suTF2jk/+6v7wFiXYRDW9OUG3KUM
	czO2yRqW/HWvvirvyuW1kp0dY8zW1RdxSZug14vQDpxfFYPX21CbHrau9R19B3u5P2AZ
	JL5ThHog2dWtP5NNedfqlwAP0CmJixfhZ5Z7AhStk5Ysymfl/A4HRSPyrbijcOtYUkrx
	aGPaqNPwHv5XPlDd57MN5e3JI3rOFUpnhipgJ6pmBYlMTqQ/5e2DYXJhIRCYIIzjib7E
	eK5Q==
Received: by 10.68.225.42 with SMTP id rh10mr31108254pbc.116.1341518635214;
	Thu, 05 Jul 2012 13:03:55 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id ka5sm20325472pbb.37.2012.07.05.13.03.53
	(version=SSLv3 cipher=OTHER); Thu, 05 Jul 2012 13:03:54 -0700 (PDT)
Message-ID: <4FF5F32C.7080905@gmail.com>
Date: Thu, 05 Jul 2012 13:03:56 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAJ2CSBsPhAtmpoTpBRzfqghV6tnRQXmjpcY415h=XfXtHxQzHQ@mail.gmail.com>
	<4FF453EC.8030007@linux.intel.com> <1341413143.3906.31.camel@ted>
	<CAJ2CSBuRsmRDCaj5oY8xToURc3GkCJzRj8y6auzTUxA32AZBMQ@mail.gmail.com>
	<1341414137.3906.33.camel@ted>
	<CAJ2CSBtESa4NVB1YF_VSN3BOj-n8NipPN7krkuLHH-nRdEVfcg@mail.gmail.com>
	<20120704152111.GB15100@jama.jama.net>
	<CAJ2CSBvQJtFPBXf-QEVm7bO84W4_K2ziYAOR=1kiQfENyK_D_Q@mail.gmail.com>
In-Reply-To: <CAJ2CSBvQJtFPBXf-QEVm7bO84W4_K2ziYAOR=1kiQfENyK_D_Q@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: gcc errors while building core-image-sato-sdk
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
X-List-Received-Date: Thu, 05 Jul 2012 20:15:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 7/4/2012 11:51 PM, Damian, Alexandru wrote:
> I guess the root of the problem is when the autotools start up -
> we're having autoconf 2.68, which is not liked by gcc 4.7.1
> 

thats a red herring. You should instead find out why is it trying to
autoreconf

> configure.ac:33: error: Please use exactly Autoconf 2.64 instead of
> 2.68. config/override.m4:12: _GCC_AUTOCONF_VERSION_CHECK is
> expanded from... configure.ac:33: the top level autom4te: m4 failed
> with exit status: 1
> 
> 
> I'm gonna downgrade to autoconf 2.64 and see what happens.
> 

it wont help.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/18ywACgkQuwUzVZGdMxTGgQCfV0OhuBE+gaoqYyq8oCpyKUP1
K8gAniKed69w0iLjnZznAeGOoS8ovt9H
=x3RK
-----END PGP SIGNATURE-----


