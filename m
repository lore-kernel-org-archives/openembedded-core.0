Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RGYuz-0005V5-5F
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 18:23:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2011 09:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="64785101"
Received: from unknown (HELO [10.255.15.35]) ([10.255.15.35])
	by orsmga002.jf.intel.com with ESMTP; 19 Oct 2011 09:17:09 -0700
Message-ID: <4E9EF804.6070800@linux.intel.com>
Date: Wed, 19 Oct 2011 09:17:08 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1318976197.git.josh@linux.intel.com>
	<36d6035f30aedab85ce5acf79d5a935151514f1f.1318976197.git.josh@linux.intel.com>
	<20111019084629.GC3522@jama.jama.net>
In-Reply-To: <20111019084629.GC3522@jama.jama.net>
Subject: Re: [PATCH 1/2] gst-plugins-good: update to 0.10.30
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
X-List-Received-Date: Wed, 19 Oct 2011 16:23:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/19/2011 01:46 AM, Martin Jansa wrote:
> On Tue, Oct 18, 2011 at 03:24:11PM -0700, Joshua Lock wrote:
>> Signed-off-by: Joshua Lock <josh@linux.intel.com>
>> ---
>>  ...good_0.10.28.bb => gst-plugins-good_0.10.30.bb} |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-multimedia/gstreamer/{gst-plugins-good_0.10.28.bb => gst-plugins-good_0.10.30.bb} (84%)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
>> similarity index 84%
>> rename from meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
>> rename to meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
>> index 6c837a7..96855aa 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
>> @@ -18,5 +18,5 @@ do_configure_prepend() {
>>  	rm ${S}/m4/lib-link.m4 || true
>>  }
>>  
>> -SRC_URI[md5sum] = "6ef1588921f59d85c44ee2e49a3c97a0"
>> -SRC_URI[sha256sum] = "adfbce68b9fbadb7a7aeda2227af6afe1928ef025af4158726617b9d6834b028"
>> +SRC_URI[md5sum] = "62fd7a3ef187c4f99b3d7c352d58dae9"
>> +SRC_URI[sha256sum] = "b12cba90b27d8423cd0a808939098d19db3996cfb9bf528507c6321782e095f6"
>> -- 
>> 1.7.6.4
> 
> Can you please fix:
> NOTE: Running task 2693 of 2701 (ID: 9, /OE/shr-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb, do_package)
> NOTE: package gst-plugins-good-0.10.30-r2: task do_package: Started
> WARNING: For recipe gst-plugins-good, the following files were installed but not shipped in any package:
> WARNING:   /etc/gconf/schemas/gstreamer-0.10.schemas
> NOTE: package gst-plugins-good-0.10.30-r2: task do_package: Succeeded

Sure, I'll take a look now - pretty sure that's not new but thanks for
raising it.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


