Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TaW3G-00042p-VS
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 19:26:35 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Nov 2012 10:12:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,280,1352102400"; d="scan'208";a="249534119"
Received: from unknown (HELO [10.255.12.202]) ([10.255.12.202])
	by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2012 10:12:28 -0800
Message-ID: <50AA768C.3030503@linux.intel.com>
Date: Mon, 19 Nov 2012 10:12:28 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1353304234.git.sgw@linux.intel.com>
	<a18406267008e5a694bc33da212bde6e8cce0038.1353304234.git.sgw@linux.intel.com>
	<CAP9ODKqqud-1kvFVWqgoe_CJgyro4=eBSNfV_g02FP77EAvFWA@mail.gmail.com>
In-Reply-To: <CAP9ODKqqud-1kvFVWqgoe_CJgyro4=eBSNfV_g02FP77EAvFWA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 16/17] cmake: Update to 2.8.10.1
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
X-List-Received-Date: Mon, 19 Nov 2012 18:26:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/2012 02:20 AM, Otavio Salvador wrote:
>
>
> On Mon, Nov 19, 2012 at 3:54 AM, Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>> wrote:
>
>     Rebase the patches due to macro name changes.
>
>     Signed-off-by: Saul Wold <sgw@linux.intel.com
>     <mailto:sgw@linux.intel.com>>
>     ...
>
>     -PR = "${INC_PR}.0"
>     -
>     -SRC_URI[md5sum] = "ba74b22c788a0c8547976b880cd02b17"
>     -SRC_URI[sha256sum] =
>     "2b59897864d6220ff20aa8eac64cac8994e004898a1c0f899c8cb4d7b7570b46"
>
>
> I find it hard to spot the checksums to be in the .inc file.
>
> I'd prefer to have them in the .bb recipes (even if in this case it'd be
> a duplication).
>
I am not sure why this is an issue, we already have about a dozen places 
where the SRC_URI and checksum info is located in the .inc file.

> In case you would like to avoid the duplication (which I agree) you
> might before, or later, merge the native handle onto the cmake_<ver>.bb
> recipe.
>
> What do you think?
>
Looks like there are bigger issues with trying to merge native into the 
standard recipe, mostly due to the fact that the target recipe inherits 
cmake, while the native version does not.

Sau!

> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br <mailto:otavio@ossystems.com.br>
> http://www.ossystems.com.br
> Mobile: +55 53 9981-7854 http://projetos.ossystems.com.br
>


