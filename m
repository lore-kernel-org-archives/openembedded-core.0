Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S2zub-0004rC-2O
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 07:54:49 +0100
Received: by dald2 with SMTP id d2so433643dal.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 22:46:18 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.129.4 as permitted sender) client-ip=10.68.129.4; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.129.4 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.129.4])
	by 10.68.129.4 with SMTP id ns4mr16149369pbb.151.1330584378819
	(num_hops = 1); Wed, 29 Feb 2012 22:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=CkEPmgRbtNNjHogWBx3GWn+/eZI1Oq5TnYC7Vq8G/UY=;
	b=aC687dmKOJHOq3/hsOCq7QTQ04q4QnM5kP4B7y/E0B2kK4GM9rbWaQSqLvI6w0W6gs
	tnAkDMTUVV5V1Q0mBdGvzxWon29H4/aUGKPQtgn1IcxBVhTPx7Qx+Rg3ulZn5SwVjHVV
	6CQJzwnF4BP5YRUpAt6DLRgGuh0p9JlTZOGn4=
Received: by 10.68.129.4 with SMTP id ns4mr13379681pbb.151.1330584378726;
	Wed, 29 Feb 2012 22:46:18 -0800 (PST)
Received: from [192.168.1.78] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id w8sm1282322pbo.23.2012.02.29.22.46.16
	(version=SSLv3 cipher=OTHER); Wed, 29 Feb 2012 22:46:17 -0800 (PST)
Message-ID: <4F4F1B36.7020504@gmail.com>
Date: Wed, 29 Feb 2012 22:46:14 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120224 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <COL120-W40B503FFC0574E4957B971DD6B0@phx.gbl>
In-Reply-To: <COL120-W40B503FFC0574E4957B971DD6B0@phx.gbl>
Subject: Re: BOTAN crypto library
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
X-List-Received-Date: Thu, 01 Mar 2012 06:54:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/24/2012 04:15 PM, simran singh wrote:
> Hello,
> 
> I hope this is right place to ask for help regarding this. I am trying
> to build the Botan crytpo library using
> system builder. I created a recipe for this and I am getting an error
> when I try to $make the library.
> This is the error I am getting:
> 
> | /usr/bin/ld:
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sysroots/
> ppce500mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: 20)
> | /usr/bin/ld:
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sysroots/
> ppce500mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: 20)
> |
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sysroots/
> ppce500mc-linux/usr/lib/crti.o: could not read symbols: File in wrong format
> | collect2: ld returned 1 exit status
> | make: *** [libbotan-1.10.so.0.1] Error 1
> | ERROR: Function do_install failed
> 
> I am guessing this has to do something with the linking of the
> libbotan-1.10.so.0.1 file. Please advice. I have attached
> the recipe that I created
> Thank you for any help.

so its using your host ld to link target library thats totally broken
Does botan's makefile system honor standard variables like LD, CC, CXX
etc. ?



