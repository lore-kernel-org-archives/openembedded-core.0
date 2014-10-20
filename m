Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-10.prod.phx3.secureserver.net
	(p3plsmtpa09-10.prod.phx3.secureserver.net [173.201.193.239])
	by mail.openembedded.org (Postfix) with ESMTP id 74D1D60097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 17:01:47 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-10.prod.phx3.secureserver.net with 
	id 5V1i1p0060BVjqb01V1jnq; Mon, 20 Oct 2014 10:01:47 -0700
Message-ID: <54453FF5.6060709@pabigot.com>
Date: Mon, 20 Oct 2014 12:01:41 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <54452125.1080108@pabigot.com>
	<CAJTo0La7QZ-RrUcouRgwyrB=Jug3DcDuzJdk09BU9+QBpHshGw@mail.gmail.com>
In-Reply-To: <CAJTo0La7QZ-RrUcouRgwyrB=Jug3DcDuzJdk09BU9+QBpHshGw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: viability of bluez5 in next OE development cycle?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Oct 2014 17:01:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2014 09:58 AM, Burton, Ross wrote:
> On 20 October 2014 15:50, Peter A. Bigot <pab@pabigot.com> wrote:
>> There's this bugzilla entry:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5031
>>
>> I see a NAKd patch set from about 26 Mar 2014 which tried to add
>> virtual/bluez.  The outcome was that a rework would be done and tested and
>> resubmitted latter. In the related discussion there was some concern that
>> dependent packages were still not ready to move even though the last bluez4
>> release was in June 2012.
>>
>> With a little local hacking I can get bluez5 working well enough for my BTLE
>> needs on beaglebone (mostly s/bluez4/bluez5/g and a PROVIDER for
>> bluez-hcidump).  Does anybody have plans to work this during the early 1.8
>> development cycle?  It looks pretty straightforward, but Idon't use BT in
>> enough variants and packages to be able to test the full set of required
>> patches.
> At the time the blocker was that some use cases (bluetooth headset, I
> think) was non-functional with BlueZ 5, because functionality needed
> to be added to PulseAudio and oFono.  Yes, this needs to be revisited
> in 1.8.

In case it's related: the bluez plugin in gst-plugins-bad_1.4.1 does not 
support bluez5, and gst-plugin-bluetooth was removed from bluez before 
bluez5 was released.  It's not clear to me how to disable the 
gst-plugin-bluetooth recipe when bluez5 is selected other than a local 
PNBLACKLIST.

Excepting that issue, the changes for virtual/bluez support are pretty 
straightforward, but since I have no ability to test bluetooth headsets 
I'll continue to leave virtual/bluez alone.

I have a couple small bluez5 patches that are not coupled to 
virtual/bluez which I'll submit once dizzy's out and the backlog for 
master starts draining.

Peter

