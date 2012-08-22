Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T4EBR-0001vr-EF
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:53:33 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2012 09:40:08 -0700
Received: by obceq6 with SMTP id eq6so1391058obc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 09:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=hv3Tod0HSzaM/p8NvYFKtQAuvpkqfv6MVIeqwpKfojE=;
	b=c82cyNccNJ35DKAKTKKr0vtiz4saRX4mPqomp+KX9NkkJ+T1ycY1b59mnyq+ZHioQU
	5NmXX8HThPH45SxN86ZFMqy4a3JrRqxz/RHonlnQ6XZpw7iTxN0DvjaRcGt/dOFYZ/pX
	su92FTZrC/KVOHAeioouy/O9N8DDR+vg6HOCyi7VExmIw+UmF7AEezo1milQ41ulxpYE
	9qa3a84qjr/8NguFmg5k95MruupOeyK/HZ9HqWVWnerl2bThGXTLNCT2cE+0zYHL0TOk
	gR8bnGIE0aeglofBb/7BZ1HaicW4anjijeN30knh6cpYHmThWi1GpIMFeRU/mIFzDNa5
	iZ3w==
Received: by 10.182.193.105 with SMTP id hn9mr15959828obc.11.1345653606816;
	Wed, 22 Aug 2012 09:40:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Wed, 22 Aug 2012 09:39:45 -0700 (PDT)
In-Reply-To: <CAJTo0LYvK_Nbj-ThQRNGQxh6P1wZqzPmm0pGNYNGnTucQEV1ng@mail.gmail.com>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
	<CAJTo0LarhQSinwUHXuruO-OiCBOw4j89ko2n4RvctREApS5NZA@mail.gmail.com>
	<CAJTo0LbJaRyPCexNT8nVhY-qvh19UxH9WSf22==GF8kjWuFaAg@mail.gmail.com>
	<CAJTo0LYvK_Nbj-ThQRNGQxh6P1wZqzPmm0pGNYNGnTucQEV1ng@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 17:39:45 +0100
Message-ID: <CAJTo0Lbhir=VLZZfeqn4UakxTkiFyeXK+zKfCtH2GMgrZ5aBpw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnQ5u1kjthIczbJgrcN2BmBb6JjeG1xfiNjdRYEoJ0xunCH9hyjVkcYGX/B5F5et6Sieoui
Subject: Re: RFC: One X Server To Rule Them All
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
X-List-Received-Date: Wed, 22 Aug 2012 16:53:33 -0000
Content-Type: text/plain; charset=UTF-8

On 22 August 2012 17:18, Burton, Ross <ross.burton@intel.com> wrote:
> -9892 ./usr/lib/libts-1.0.so.0.0.0
> +8344 ./usr/lib/libts-1.0.so.0.0.0
>
> Now *this* is weird.

Any ideas as to why this happened are greatly welcomed...

> +19532 ./usr/lib/xorg/modules/extensions/libdbe.so

Confirmed that this is 1990s HP legacy.  Gone.

Ross


