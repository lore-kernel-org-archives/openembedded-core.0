Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T3Q0R-0001ax-EP
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 13:18:51 +0200
Received: from localhost ([127.0.0.1]:58345 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T3Pom-0002Zn-Qf
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 11:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=0te1MKUCZPJlW/hvzgKgdeZjkJ0=; b=sMch/cNxb4ZBVgD252SQmu4BLsDP
	XWWhwZsRXB1kQuIL/y60SVE0MOTcPrHqLaPbq4+v4J7aNWP+eMM8rGfqoKMET1Vu
	D16iP9uqUwq/e5hUl03wENu+cfkHlBDUewShIIHdjJRaezWpkE/OOeWlXNInG4GP
	2psOrGL5hYGnFEU=
Received: from [195.171.99.130] (port=18745 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T3Pom-0002Zk-OP
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 11:06:48 +0000
Message-ID: <50321AA0.7050404@communistcode.co.uk>
Date: Mon, 20 Aug 2012 12:08:16 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1345458715.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1345458715.git.paul.eggleton@linux.intel.com>
Subject: Re: [RFC PATCH 0/7] Split apart qemu-config
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
X-List-Received-Date: Mon, 20 Aug 2012 11:18:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 20/08/12 11:32, Paul Eggleton wrote:
> *** Note: this is an RFC series, please do not merge yet! ***
>
> Split apart qemu-config, replacing it with a task (task-core-device-devel)
> that is not specific to usage together with QEMU. oprofileui is now split
> into client and server parts, and together with the prevous work to merge
> dbus-launch back into the main dbus package, this makes things work much
> more smoothly when this task is installed with x11  removed from
> DISTRO_FEATURES. Additionally it was found that oprofileui was not
> correctly depending on oprofile itself, and this has also been fixed.
> (This is a reworking of a patch series I sent out some time ago.)
>
> There is a remaining question however - is this task actually useful?
> For reference, it enables the following:
>
> 1) Use of distcc to accelerate compiling applications within the
>     emulated environment using direct compilation on the host
> 2) Accessing the root filesystem via NFS
> 3) Remote profiling via oprofileui
> 4) Running applications in the target from the Anjuta IDE

There has been no development work on Anjuta for 22 months now 
(according to git logs) so is this even supported any more? I gave it a 
go once, but never really got anywhere.

>
> 5) bash shell
>
> Whilst these might have minor utility on an individual basis, I can't
> honestly say that that the overall set seems particularly useful to me
> as a whole; and some of the parts are less useful than they used to be -
> is oprofile commonly used these days now that tools like perf are
> available? Is anyone actually using Anjuta for embedded development? For
> that matter, does anyone regularly build applications within QEMU
> emulated targets?

Personally, I have never used QEMU for developing embedded software due 
to the fact that the hardware for the proposed application to run on is 
always quite specific.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



