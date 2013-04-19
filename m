Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UTAfu-0006S8-St
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 14:44:25 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Apr 2013 05:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,508,1363158000"; d="scan'208";a="321677744"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 19 Apr 2013 05:26:45 -0700
Message-ID: <51713804.9000002@intel.com>
Date: Fri, 19 Apr 2013 15:26:44 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
	<CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
	<6BD1F316-C3AE-41BD-B9ED-296278CEF5A7@dominion.thruhere.net>
	<CAJTo0LYeJwW-Lbf9bEZogCh1e97bwj7PTgFZV=3NbwN=PMWENg@mail.gmail.com>
	<CAJTo0LYRPtG_N1WCE37UTvGvy5HYt7ia1ym12iR874Ykb8QwTg@mail.gmail.com>
	<623CB95B-FD17-49A5-9547-71E0EFC316A7@dominion.thruhere.net>
	<5171293A.5010300@intel.com>
	<0E83C36A-8358-40B0-B022-A39DBFF44880@dominion.thruhere.net>
In-Reply-To: <0E83C36A-8358-40B0-B022-A39DBFF44880@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Fri, 19 Apr 2013 12:44:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/19/2013 02:38 PM, Koen Kooi wrote:
> 
> Op 19 apr. 2013, om 13:23 heeft Laurentiu Palcu <laurentiu.palcu@intel.com> het volgende geschreven:
> 
>>
>>
>> On 04/19/2013 12:13 PM, Koen Kooi wrote:
>>>
>>> Op 19 apr. 2013, om 10:52 heeft "Burton, Ross" <ross.burton@intel.com> het volgende geschreven:
>>>
>>>> On 19 April 2013 09:38, Burton, Ross <ross.burton@intel.com> wrote:
>>>>> On 18 April 2013 19:45, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>>>> [koen@rrMBP 1.0-r0]$ grep "configuration required on target" temp/log.do_rootfs
>>>>>> gdk-pixbuf-loader-png.postinst returned 1, marking as unpacked only, configuration required on target.
>>>>> ..
>>>>>
>>>>> This is "usual" for postinsts that are intercepted and handled in a
>>>>> single go - scroll further down the log and you should see the package
>>>>> manager running the intercept scripts (i.e. fontcaches once, gconftool
>>>>> once).  I expect you'll see there that the gconftool intercept is
>>>>> breaking for some reason.
>>>>
>>>> Actually gconf isn't using triggers but it should happen on the host.
>>>>
>>>> I wonder if we're hitting a problem where the postinsts are doing some
>>>> actions on the host and then triggers are "erroring" out and it's all
>>>> falling back to the target.  Can you share the complete rootfs log for
>>>> this gnome image?
>>>
>>> Here's the complete log: http://dominion.thruhere.net/koen/angstrom/beaglebone/log.do_rootfs
>> Do you think you can post the rootfs/var/lib/opkg/status file? This
>> would show us exactly what packages were postponed for first boot.
> 
> This is the build that finished just before Ross sent the gconf patch:
> 
> 	http://dominion.thruhere.net/koen/angstrom/beaglebone/Angstrom-systemd-GNOME-image-eglibc-ipk-v2013.06-beaglebone.rootfs.tar.xz (75MiB)
> 
> I haven't booted that yet, I'll do that when I get back from lunch.
From what you sent, I see the following packages postponed: udev-hwdb,
gnome-panel and gdm. We know about udev-hwdb... However, gnome-panel and
gdm are postponing the postinstalls for first boot explicitly:

if [ "x$D" != "x" ]; then
	exit1
fi

This explains, at least, why you still see postinstalls running at first
boot.

Running the postinstalls at first boot appear to hang because (and
that's just a feeling) gtk-icon-cache is run twice on target... which is
time consuming.

Thanks,
Laurentiu

> 
> regards,
> 
> Koen
> 
> 
>>
>> Thanks,
>> Laurentiu
>>>
>>> Todays build is still building :(
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
> 


