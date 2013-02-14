Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1U6060-0000rK-O9
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 15:47:33 +0100
Message-ID: <511CF540.6090302@communistcode.co.uk>
Date: Thu, 14 Feb 2013 14:31:28 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50FFFF81.8010203@communistcode.co.uk> <510102F4.70108@intel.com>
	<CAJTo0LZfGGSdQwKMshr8PNUVZfk4Nwhr67-9iFbGw2=V=YqN8g@mail.gmail.com>
	<510124FE.6040901@intel.com>
	<lyd2wug4c0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51012A68.806@intel.com>
	<ly8v7ig2td.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51013136.7040807@intel.com>
	<CAJTo0LZ2ox=zgiAHS=DnbF9cv+vofjZpbqy8i0KEa6t1gezJPw@mail.gmail.com>
	<5102423C.4010408@intel.com>
In-Reply-To: <5102423C.4010408@intel.com>
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
X-List-Received-Date: Thu, 14 Feb 2013 14:47:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/13 08:28, Radu Moisan wrote:
>
> On 01/24/2013 04:52 PM, Burton, Ross wrote:
>> On 24 January 2013 13:03, Radu Moisan <radu.moisan@intel.com> wrote:
>>> ok, thanks Enrico, this clears the picture for me.
>>> Well then it looks like Jack's problems is coming from some other 
>>> place.
>> No - /run needs to exist for the mount to happen, and there isn't a
>> /run in the filesystem.  Whatever creates the root filesystem
>> structure should also create /run I guess.
>
> I agree, but what I meant was that my initial assumptions were wrong 
> with concern to Jack's problem. I run it on qemu and /run is there. 
> His problem related to /run creation while I was thinking about 
> mounting issue.
>
> Radu
>

Did this ever go anywhere? I have just tried again today with exactly 
the same result, all I did was change the DISTRO_FEATURES_INITMAN to 
systemd.

Regards

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



