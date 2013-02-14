Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1U61Es-0003cU-S0
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 17:00:52 +0100
Message-ID: <511D0669.6020903@communistcode.co.uk>
Date: Thu, 14 Feb 2013 15:44:41 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <50FFFF81.8010203@communistcode.co.uk> <510102F4.70108@intel.com>
	<CAJTo0LZfGGSdQwKMshr8PNUVZfk4Nwhr67-9iFbGw2=V=YqN8g@mail.gmail.com>
	<510124FE.6040901@intel.com>
	<lyd2wug4c0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51012A68.806@intel.com>
	<ly8v7ig2td.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51013136.7040807@intel.com>
	<CAJTo0LZ2ox=zgiAHS=DnbF9cv+vofjZpbqy8i0KEa6t1gezJPw@mail.gmail.com>
	<5102423C.4010408@intel.com> <511CF540.6090302@communistcode.co.uk>
	<CAJTo0LYa4cR+7-v91dhKieEttJOq0eMUEW3Yoz_aP9KaU06AfQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYa4cR+7-v91dhKieEttJOq0eMUEW3Yoz_aP9KaU06AfQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 14 Feb 2013 16:00:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/02/13 15:31, Burton, Ross wrote:
> On 14 February 2013 14:31, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> Did this ever go anywhere? I have just tried again today with exactly the
>> same result, all I did was change the DISTRO_FEATURES_INITMAN to systemd.
> Odd, as I just built and booted a systemd image (core-image-sato, in
> poky master), and it worked fine.
>
> Ross

I have a custom distro definition that cuts a lot of features out. Can 
you find out which package is supposed to create run and I can check if 
it is pulled in properly on my setup?

I think something must be assumed somewhere and I don't have the 
features enabled to trigger it.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



