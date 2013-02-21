Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U8es0-0006YC-Fi
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 23:44:09 +0100
Received: by mail-pb0-f50.google.com with SMTP id up1so17925pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 14:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=q1TzYz7kBQ+PGTsy8emjEiw9pKdPVkjtdRrbWwyQwxo=;
	b=q4jtHCarQDFhEv4ITL/zqwkNv1ZE3IGBPZ2wEIn4RClHR8aWQzBzg7v2/w48XlmgWE
	39KOmz4acOPa6fs7Z78P/FZGD/Pn7kAAey71phvX4txEqPoR6g2pSfTFwtt+HNPFGZ7v
	oJmi4Ain+3A5CitILVrVc6i1dmDioPEgc/6/N2o6Z2FcdSBKiB9Ni4IeCObjU6yQ503q
	QmdqKnAgrWAv97xYfx4cA9aPYEM6Zq3oEoR2Bd2EY+AC2HKF8XKptXvZhdDp58ksQJrW
	Iyqe3ZK+zK3m+ezjGnQkksPZwS8eQ6aEUPHrGC2lq0Gtlqc4dG7oKKWFo99z7hLNejz6
	/FWw==
X-Received: by 10.68.22.73 with SMTP id b9mr10446575pbf.214.1361485671065;
	Thu, 21 Feb 2013 14:27:51 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id pg6sm118135pbb.0.2013.02.21.14.27.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 21 Feb 2013 14:27:50 -0800 (PST)
Date: Thu, 21 Feb 2013 14:27:30 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <20130221222728.GA1833@sakrah.homelinux.org>
Mail-Followup-To: Jack Mitchell <ml@communistcode.co.uk>,
	"Burton, Ross" <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <510124FE.6040901@intel.com>
	<lyd2wug4c0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51012A68.806@intel.com>
	<ly8v7ig2td.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51013136.7040807@intel.com>
	<CAJTo0LZ2ox=zgiAHS=DnbF9cv+vofjZpbqy8i0KEa6t1gezJPw@mail.gmail.com>
	<5102423C.4010408@intel.com> <511CF540.6090302@communistcode.co.uk>
	<CAJTo0LYa4cR+7-v91dhKieEttJOq0eMUEW3Yoz_aP9KaU06AfQ@mail.gmail.com>
	<511D0669.6020903@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <511D0669.6020903@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Thu, 21 Feb 2013 22:44:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/02/13 15:44), Jack Mitchell wrote:
> On 14/02/13 15:31, Burton, Ross wrote:
> >On 14 February 2013 14:31, Jack Mitchell <ml@communistcode.co.uk> wrote:
> >>Did this ever go anywhere? I have just tried again today with exactly the
> >>same result, all I did was change the DISTRO_FEATURES_INITMAN to systemd.
> >Odd, as I just built and booted a systemd image (core-image-sato, in
> >poky master), and it worked fine.
> >
> >Ross
> 
> I have a custom distro definition that cuts a lot of features out.
> Can you find out which package is supposed to create run and I can
> check if it is pulled in properly on my setup?
> 
> I think something must be assumed somewhere and I don't have the
> features enabled to trigger it.

its created by base-files package. If you need hint how it works
with systemd take a look at bbappend that angstrom has for base-files
in meta-angstrom


