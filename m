Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TiCzO-0004VU-Al
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 00:42:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Dec 2012 15:27:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,254,1355126400"; d="scan'208";a="231948876"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.85])
	by orsmga001.jf.intel.com with ESMTP; 10 Dec 2012 15:27:49 -0800
Message-ID: <50C66FF5.1000100@linux.intel.com>
Date: Mon, 10 Dec 2012 15:27:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1355154246.git.laurentiu.palcu@intel.com>
	<d5c9acb38b6e2d962818f15119bb6748d1320dff.1355154246.git.laurentiu.palcu@intel.com>
	<CAP9ODKpggcjrxP+soQ-69cTWat8pg5sMq8XCKOsfNwCyqWpyRQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpggcjrxP+soQ-69cTWat8pg5sMq8XCKOsfNwCyqWpyRQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] populate_sdk_(deb|ipk|rpm): export NATIVE_ROOT and INTERCEPT_DIR variables
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
X-List-Received-Date: Mon, 10 Dec 2012 23:42:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2012 08:19 AM, Otavio Salvador wrote:
>
>
>
> On Mon, Dec 10, 2012 at 2:09 PM, Laurentiu Palcu
> <laurentiu.palcu@intel.com <mailto:laurentiu.palcu@intel.com>> wrote:
>
>     In order for the postinstall scripts to have access to the recent
>     improvements when generating the target SDK sysroot, export these
>     variables in populate_sdk.
>
>     Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com
>     <mailto:laurentiu.palcu@intel.com>>
>     ...
>
>     +       export NATIVE_ROOT=${STAGING_DIR_NATIVE}
>     ...
>
>
> Why you don't use STAGING_DIR_NATIVE directly? This seems to have no
> good reason for a variable with same content of a well known variable.
>
I believe that Richard already commented on this naming and agrees that 
we need both.

Sau!

> Regards,
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br <mailto:otavio@ossystems.com.br>
> http://www.ossystems.com.br
> Mobile: +55 53 9981-7854 http://projetos.ossystems.com.br
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


