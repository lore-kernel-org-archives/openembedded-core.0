Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SqATg-0003Dz-6Q
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 00:06:16 +0200
Received: by pbbrq2 with SMTP id rq2so7023946pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jul 2012 14:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=ngu0p4EDhaA+d0790+t4uFp+Gujf+f0B42Y/C0XONDE=;
	b=o1zh5kymugRTzaKX3puRpYv8y8NE7XksFwfrv2EDDCB/njVAq+bWj8xm0giHB0goXf
	MJzHMfCvhDXwvW4UH/TXEzsRQoO74deJWkTxjshPeOu16S9iDrfLEYe585qezbimEiSB
	idteO35nAzlXdz/VfinwuwisqqeSh7O2RrDRk3aFkndJE1PARbgDYrklcd5aXiLqTUEx
	3CzrLhdqHL8twBwl210fnfUZJhrZpIuQCJGjgqb6uWOTsAU3ONLddbAVvBqZKfwTDFHY
	ZMJ8+aaUVnj42dj7bLFWmrg0zsNwcUNbryfPR61t/cs9stMkbs1u6WU6Onv8H5UseL7k
	xmmg==
Received: by 10.66.89.170 with SMTP id bp10mr11621412pab.12.1342302899284;
	Sat, 14 Jul 2012 14:54:59 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id rd7sm8686771pbc.70.2012.07.14.14.54.57
	(version=SSLv3 cipher=OTHER); Sat, 14 Jul 2012 14:54:58 -0700 (PDT)
Message-ID: <5001EAB7.4080106@gmail.com>
Date: Sat, 14 Jul 2012 14:55:03 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1207141456190.13961@oneiric>
	<CADkTA4Nah089oYXaHo3JDF_kmV-LQKz+hm8T6U9PBjtBvVDtxg@mail.gmail.com>
In-Reply-To: <CADkTA4Nah089oYXaHo3JDF_kmV-LQKz+hm8T6U9PBjtBvVDtxg@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: is "LINUX_VERSION" actually needed for a kernel checkout?
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
X-List-Received-Date: Sat, 14 Jul 2012 22:06:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 7/14/2012 2:26 PM, Bruce Ashfield wrote:
> On Sat, Jul 14, 2012 at 3:07 PM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
>> 
>> pawing my way through the kernel recipe file and checkout code so
>> i understand it once and for all, and i'm curious about the
>> setting of:
>> 
>> LINUX_VERSION ?= "3.4.4"
>> 
>> in linux-yocto_3.4.bb.
>> 
>> for my example, i'm testing with straight oe-core and building
>> for qemuarm, so i can see the following relevant lines from the
>> kernel recipe file that will affect my kernel checkout:
>> 
>> KBRANCH_qemuarm  = "standard/arm-versatile-926ejs" 
>> SRCREV_machine_qemuarm ?=
>> "9aca8fec49787efbe44d0f137f31ee59edd94c49" SRCREV_meta ?=
>> "a8cf77018b0faa0d29f1483ff4e5a2034dc8edd5"
>> 
>> SRC_URI = 
>> "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>>
>>
>> 
LINUX_VERSION ?= "3.4.4"
>> 
>> as i read the docs (and i could be totally off-base), the
>> KBRANCH variable identifies the branch i want for my checkout,
>> while the SRCREV_machine variable identifies the particular
>> commit on that branch that i want (typically, it's a merge of
>> standard/base into that branch).  and of course, SRCREV_meta is
>> the state of the meta branch i want for further configuration.
>> 
>> but at no time did i need to know the tagged kernel version that
>> my machine branch was based on, did i?  so for the purposes of
>> what happened above, i didn't *require* the value of
>> LINUX_VERSION, did i?
>> 
>> i can see that it will be handy in, say, creating meaningful 
>> directory names for building.  but beyond that, what else is it
>> used for?  (i haven't got to the meta/ directory processing yet,
>> so i have no idea whether it's suddenly necessary there.)
> 
> The kernel itself doesn't care .. but the rest of the system does, 
> since that is used for setting PV.
> 

I think we only have 1 recipe per release e.g. 3.2, 3.4 and so on so
adding an additional minor is confusing there may be it can be avoided
and when we say 3.4 it means 3.4 release branch of kernel.

unless we plan to have it selectable for users to use 3.4.1 and 3.4.2
it probably loses the significance

> 


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlAB6rcACgkQuwUzVZGdMxSIxQCfcFYddR+x8FIhH18Ae7lNYAma
nF0AnimKPeYQ/cKVDpr5ckrAIibr4dYa
=qNRw
-----END PGP SIGNATURE-----


