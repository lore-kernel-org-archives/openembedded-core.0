Received: from [213.180.93.183] (helo=www.emagii.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1RYnZK-00082g-RY
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 00:40:02 +0100
Received: from www.emagii.com (localhost.localdomain [127.0.0.1])
	by www.emagii.com (Postfix) with ESMTP id 96A0428C21AE;
	Fri,  9 Dec 2011 00:24:15 +0100 (CET)
Received: from [10.175.196.242]
	(c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se [83.227.56.19])
	by www.emagii.com (Postfix) with ESMTPSA;
	Fri,  9 Dec 2011 00:24:15 +0100 (CET)
Message-ID: <4EE14724.7010202@emagii.com>
Date: Fri, 09 Dec 2011 00:24:20 +0100
From: Ulf Samuelsson <ulf@emagii.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <4EDF9468.309@emagii.com>
	<CAEsOVNfs+HayYVZ3Mm=k=ubnmUBeO88OKj1fKzZE0R5+Uw=6tQ@mail.gmail.com>
In-Reply-To: <CAEsOVNfs+HayYVZ3Mm=k=ubnmUBeO88OKj1fKzZE0R5+Uw=6tQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bitbake core-image-sato fails:
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 08 Dec 2011 23:40:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-08 22:14, McClintock Matthew-B29882 wrote:
> On Wed, Dec 7, 2011 at 10:29 AM, Ulf Samuelsson
> <openembedded-core@emagii.com>  wrote:
>> Got the following error message when building core-image-sato:
>>
>> | Collected errors:
>> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
>> task-core-x11-sato:
>> |  *     ofono *
>> |  * opkg_install_cmd: Cannot install package task-core-x11-sato.
>> NOTE: package core-image-sato-1.0-r0: task do_rootfs: Failed
>> ERROR: Task 8
>> (/home/ulf/projects/OE_atmel/sources/openembedded-core/meta/recipes-sato/images/core-image-sato.bb,
>> do_rootfs) failed with exit code '1'
> The rpm for ofono was not generated, and something in
> task-core-x11-sato depends on it. So rpm goes and tries to resolve its
> dependency (which adds other packages) and it can't find one for
> ofono. Some recipe in this task needs a DEPENDS += "ofono"
>
> -M

task-core-x11-sato contains:

NETWORK_MANAGER ?= "connman-gnome"

and connman-gnome contains references to ofono,
so this is probably a good candidate.

connman-gnome is not building at the moment, due
to the empty repo at kernel.org so I am going to
try adding it in the debug layer I have on top of OE.

BR
Ulf



