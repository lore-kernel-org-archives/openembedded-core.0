Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UUIFm-00027Z-Qh
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 17:02:08 +0200
Message-ID: <51754CC4.9010604@communistcode.co.uk>
Date: Mon, 22 Apr 2013 15:44:20 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <51754581.3090005@communistcode.co.uk>
	<CAJTo0LYMc0F=OG-xUQztpveQdYAPKnj0W_8Vb-wRZRL7F5+bSQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYMc0F=OG-xUQztpveQdYAPKnj0W_8Vb-wRZRL7F5+bSQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: systemd post-install failure
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
X-List-Received-Date: Mon, 22 Apr 2013 15:02:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/04/13 15:40, Burton, Ross wrote:
> On 22 April 2013 15:13, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> Booting master today I had a systemd fault. Enabling debugging I captured
>> the (attached) output. The gist of which is:
>>
>> So, looking into systemd-system-update-generator, it seems this is what
>> takes card of the post install scripts, which I know we're having problems
>> with.
> Not quite - the system update generator would be used if we were using
> systemd's native systemd update protocol, which we're not.  This
> generator shouldn't do anything unless you've got a symlink
> /system-update (see
> http://freedesktop.org/wiki/Software/systemd/SystemUpdates for the
> details).
>
> Ross

Ah, ok then, I don't have a /system-update. So square one, any ideas why 
this would have suddenly flagged up? I was building and booting fine on 
Wed/Thurs. That was the only useful bit of the debug log I could 
determine...

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



