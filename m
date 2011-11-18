Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RRUNU-0004hs-45
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 20:45:36 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 18 Nov 2011 11:39:07 -0800
Received: by iagz35 with SMTP id z35so7630577iag.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 11:39:06 -0800 (PST)
Received: by 10.42.161.132 with SMTP id t4mr3982683icx.16.1321645146302;
	Fri, 18 Nov 2011 11:39:06 -0800 (PST)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id dd36sm6443043ibb.7.2011.11.18.11.39.05
	(version=SSLv3 cipher=OTHER); Fri, 18 Nov 2011 11:39:05 -0800 (PST)
Message-ID: <4EC6B45A.9060107@intel.com>
Date: Fri, 18 Nov 2011 11:39:06 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: qemu needs > 2 GB of RAM to build?
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
X-List-Received-Date: Fri, 18 Nov 2011 19:45:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'm testing building core-image-minimal in a resource-constrained 
environment (a VirtualBox VM with 2300 MB of RAM allocated to it). With 
PARALLEL_MAKE set to -j4 (the VM does have two CPUs allocated), I'm 
finding that the build of qemu-native fails because the OOM killer steps 
in and kills gcc. This is happening during the linking phase of building 
qemu.

If this is true, I assume it would pretty much mean that no one can 
build our images without more than 2 GB of RAM. Is this true? Is this 
something for us to be concerned about?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


