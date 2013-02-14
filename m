Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U612J-0002t7-J1
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 16:48:05 +0100
Received: by mail-vb0-f44.google.com with SMTP id fr13so1587791vbb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 07:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=k+j3g2+i4I5r5OpK7vrIRS2tqfu65N1jmAH03RobLrY=;
	b=oTsv6NtgjurLj02d5/x5REanITdfdodGzeFcahqfrDtwf1tejsuKp9uT63ybTrZIoG
	KQ8EgwP5jn6noBs+4uxxbbkPCtnhtvR0qcXrT8CIs6JAeViolUbxZxNN6Gs6LShNWjQ3
	rbqJqtD5eWDx3kMGyXdxmMS2gybQPPRvo6mIPgzLMtACmL3LP7V1Qpt4gXqvC2s+afqm
	IrAfFmCpCq2rOuihrmTdkALUInn+EQtoS0EC8h++bOCmMctn3vj7GOJ9TBZoHU/KqJup
	oBhArkGosXw4qk4EzUyHF3YxiGl6kiaWt96nlD4/05wJdCG3+IPryX5RAplTVVS9nGhw
	sPuQ==
X-Received: by 10.58.231.196 with SMTP id ti4mr35105955vec.25.1360855904884;
	Thu, 14 Feb 2013 07:31:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Thu, 14 Feb 2013 07:31:24 -0800 (PST)
In-Reply-To: <511CF540.6090302@communistcode.co.uk>
References: <50FFFF81.8010203@communistcode.co.uk> <510102F4.70108@intel.com>
	<CAJTo0LZfGGSdQwKMshr8PNUVZfk4Nwhr67-9iFbGw2=V=YqN8g@mail.gmail.com>
	<510124FE.6040901@intel.com>
	<lyd2wug4c0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51012A68.806@intel.com>
	<ly8v7ig2td.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51013136.7040807@intel.com>
	<CAJTo0LZ2ox=zgiAHS=DnbF9cv+vofjZpbqy8i0KEa6t1gezJPw@mail.gmail.com>
	<5102423C.4010408@intel.com> <511CF540.6090302@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2013 15:31:24 +0000
Message-ID: <CAJTo0LYa4cR+7-v91dhKieEttJOq0eMUEW3Yoz_aP9KaU06AfQ@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQkMfylyAGlkuiBZIHdc9HNdBbUpsyNtPA5qo35ldb4V2fhxBcNj9rN8GJVBaRUSgRLdDCcz
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd: /run directory not created
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
X-List-Received-Date: Thu, 14 Feb 2013 15:48:07 -0000
Content-Type: text/plain; charset=UTF-8

On 14 February 2013 14:31, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Did this ever go anywhere? I have just tried again today with exactly the
> same result, all I did was change the DISTRO_FEATURES_INITMAN to systemd.

Odd, as I just built and booted a systemd image (core-image-sato, in
poky master), and it worked fine.

Ross


