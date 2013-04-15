Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1URjGf-0002J6-BV
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 15:16:22 +0200
Message-ID: <516BF98C.2080603@communistcode.co.uk>
Date: Mon, 15 Apr 2013 13:58:52 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <510124FE.6040901@intel.com>
	<lyd2wug4c0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51012A68.806@intel.com>
	<ly8v7ig2td.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51013136.7040807@intel.com>
	<CAJTo0LZ2ox=zgiAHS=DnbF9cv+vofjZpbqy8i0KEa6t1gezJPw@mail.gmail.com>
	<5102423C.4010408@intel.com> <511CF540.6090302@communistcode.co.uk>
	<CAJTo0LYa4cR+7-v91dhKieEttJOq0eMUEW3Yoz_aP9KaU06AfQ@mail.gmail.com>
	<511D0669.6020903@communistcode.co.uk>
	<20130221222728.GA1833@sakrah.homelinux.org>
	<512738BF.9000404@communistcode.co.uk>
	<51277D87.3090703@communistcode.co.uk>
	<512785CE.5020508@communistcode.co.uk>
In-Reply-To: <512785CE.5020508@communistcode.co.uk>
Subject: Re: systemd: /run directory not created
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 13:16:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ok, I have just come back to trying out the new systemd implementation, 
and this bug still exists.

Exactly the same error as before:

[    2.390730] systemd[1]: Failed to mount /run: No such file or directory

Can we shed any light on why this directory is failing to be created and 
what can be done to fix it. Having looked in my final target filesystem 
there are no links to the volatiles in /var/voltatile/* to /*, should 
there be? The base-files packages looks like it should do it but 
obviously something is going wrong.

   for d in ${volatiles}; do
     ln -sf volatile/$d ${D}${localstatedir}/$d
   done

Cheers,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



