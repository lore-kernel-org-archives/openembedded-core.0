Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SfWMF-0002tV-T9
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 15:14:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jun 2012 06:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180510601"
Received: from unknown (HELO [10.252.120.111]) ([10.252.120.111])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2012 06:03:55 -0700
Message-ID: <4FDB32BA.9060004@intel.com>
Date: Fri, 15 Jun 2012 16:03:54 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1339678865-3610-1-git-send-email-laurentiu.palcu@intel.com>
	<4FDA19CD.3080003@linux.intel.com>
In-Reply-To: <4FDA19CD.3080003@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-gtk-directfb, qt4e-demo-image: Remove module-init-tools from IMAGE_INSTALL list
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
X-List-Received-Date: Fri, 15 Jun 2012 13:14:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

On 06/14/2012 08:05 PM, Saul Wold wrote:
>> As module-init-tools package does not exist anymore there's no reason to
>> > have it in the IMAGE_INSTALL package list. If RPM package manager is
>> > used, build will fail with:
>> >
>> > Unable to find package module-init-tools (module-init-tools)!
>> >
> Do we need to replace it with kmod?
> 
> Sau!
> 
kmod gets installed in the final image without adding it into the
IMAGE_INSTALL list. I couldn't, yet, figure out how... :( It's not in
the IMAGE_INSTALL and it's not in the RDEPENDS of any other package.
Maybe I missed something. If someone can put some light on this, I would
appreciate it.

Thanks,
Laurentiu


