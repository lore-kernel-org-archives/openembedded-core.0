Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RGxmU-0003OK-3P
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 20:55:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Oct 2011 11:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="65233833"
Received: from jbkonno-mobl.jf.intel.com (HELO [10.7.199.153]) ([10.7.199.153])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 11:50:01 -0700
Message-ID: <4EA06D57.6000803@linux.intel.com>
Date: Thu, 20 Oct 2011 11:49:59 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1319135920.git.josh@linux.intel.com>
	<64effb846c8f9b1e6fe57a7e213d24d046439b99.1319135920.git.josh@linux.intel.com>
	<20111020184529.GK3522@jama.jama.net>
In-Reply-To: <20111020184529.GK3522@jama.jama.net>
Subject: Re: [PATCH 1/1] gst-plugins-good: correctly handle gconf schema
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
X-List-Received-Date: Thu, 20 Oct 2011 18:55:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 10/20/2011 11:45 AM, Martin Jansa wrote:
> On Thu, Oct 20, 2011 at 11:40:37AM -0700, Joshua Lock wrote:
>> Add the shipped gconf schema to the gconfelements package and inherit the gconf
>> class so that schema processing is handled via post* scripts.
>>
>> Signed-off-by: Joshua Lock <josh@linux.intel.com>
>> ---
>>  .../gstreamer/gst-plugins-good_0.10.30.bb          |    6 ++++--
>>  1 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
>> index 96855aa..728175b 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
>> @@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>>  
>>  DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
>>  	    speex libsoup-2.4 pulseaudio"
>> -PR = "r2"
>> +PR = "r3"
>>  
>> -inherit gettext
>> +inherit gettext gconf
>>  
>>  EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check"
>>  
>> @@ -20,3 +20,5 @@ do_configure_prepend() {
>>  
>>  SRC_URI[md5sum] = "62fd7a3ef187c4f99b3d7c352d58dae9"
>>  SRC_URI[sha256sum] = "b12cba90b27d8423cd0a808939098d19db3996cfb9bf528507c6321782e095f6"
>> +
>> +FILES_${PN}-gconfelements += "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"
> 
> where do we get ${PN}-gconfelements in PACKAGES?


The gst-plugins-package.inc modifies PACKAGES based on the built libraries.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


