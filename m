Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SPhwL-0002HA-UL
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 00:22:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q42MCEm5024102
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 May 2012 15:12:14 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 2 May 2012 15:12:14 -0700
Message-ID: <4FA1B13C.8080006@windriver.com>
Date: Wed, 2 May 2012 17:12:12 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<DE7E5733-CC28-46DD-A4BC-C1AA663F925B@dominion.thruhere.net>
	<4FA145AD.4070606@windriver.com>
	<965C6250-6D1E-438E-8207-1E1D9DAF398A@dominion.thruhere.net>
	<1335995396.3181.10.camel@x121e.pbcl.net>
In-Reply-To: <1335995396.3181.10.camel@x121e.pbcl.net>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Wed, 02 May 2012 22:22:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/02/2012 04:49 PM, Phil Blundell wrote:
> On Wed, 2012-05-02 at 16:44 +0200, Koen Kooi wrote:
>> Op 2 mei 2012, om 16:33 heeft Jason Wessel het volgende geschreven:
>>
>>> On 05/02/2012 09:29 AM, Koen Kooi wrote:
>>>> Op 2 mei 2012, om 16:23 heeft Jason Wessel het volgende geschreven:
>>>>
>>>>> The user mode NFS server does not get built by default when you are
>>>>> using a purely command line driven development environment without SDK
>>>>> tools.  In order to accommodate simple test configurations and have
>>>>> all the tools built for the minimal validation with qemu-native,
>>>>> simply add the dependency to unfs-server-native.
>>>> So all images I build for e.g. qemux86 now have an nfs-server? Can we please move settings like that to the specific images?
>>>>
>>>
>>> This is part of the simulation environment.  Not all of the run qemu functionality works correctly without this.
>>
>> I repeat:  Can we please move settings like that to the specific images?
>>
>> I don't need nor want nfs servers in the images I build for qemu. And they work just fine without it.
> 
> Surely unfs-server-native isn't going to go in the images, is it?  The
> name rather suggests that it is a host-side tool.
> 
> The subject line for this patch is misleading, by the way.  Saying
> "qemu-native:" at the beginning makes it sound as though you are
> changing something about the qemu-native package, which turns out to not
> be the case as far as I can tell.
> 

There is nothing that is actually added to the target side image.  It is just a host tool. 

It was suggested to me that a better title for the patch is:

   qemu.inc: Ensure qemu compatible machines have the usermode nfs server available to them


Jason.


