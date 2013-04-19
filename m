Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UT9gq-0000Ci-NN
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 13:41:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Apr 2013 04:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,508,1363158000"; d="scan'208";a="324836650"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2013 04:23:39 -0700
Message-ID: <5171293A.5010300@intel.com>
Date: Fri, 19 Apr 2013 14:23:38 +0300
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
In-Reply-To: <623CB95B-FD17-49A5-9547-71E0EFC316A7@dominion.thruhere.net>
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
X-List-Received-Date: Fri, 19 Apr 2013 11:41:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/19/2013 12:13 PM, Koen Kooi wrote:
> 
> Op 19 apr. 2013, om 10:52 heeft "Burton, Ross" <ross.burton@intel.com> het volgende geschreven:
> 
>> On 19 April 2013 09:38, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 18 April 2013 19:45, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>> [koen@rrMBP 1.0-r0]$ grep "configuration required on target" temp/log.do_rootfs
>>>> gdk-pixbuf-loader-png.postinst returned 1, marking as unpacked only, configuration required on target.
>>> ..
>>>
>>> This is "usual" for postinsts that are intercepted and handled in a
>>> single go - scroll further down the log and you should see the package
>>> manager running the intercept scripts (i.e. fontcaches once, gconftool
>>> once).  I expect you'll see there that the gconftool intercept is
>>> breaking for some reason.
>>
>> Actually gconf isn't using triggers but it should happen on the host.
>>
>> I wonder if we're hitting a problem where the postinsts are doing some
>> actions on the host and then triggers are "erroring" out and it's all
>> falling back to the target.  Can you share the complete rootfs log for
>> this gnome image?
> 
> Here's the complete log: http://dominion.thruhere.net/koen/angstrom/beaglebone/log.do_rootfs
Do you think you can post the rootfs/var/lib/opkg/status file? This
would show us exactly what packages were postponed for first boot.

Thanks,
Laurentiu
> 
> Todays build is still building :(
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


