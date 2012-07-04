Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SmUSO-0005ab-E0
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 20:37:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Jul 2012 11:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164056889"
Received: from unknown (HELO [10.252.120.218]) ([10.252.120.218])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2012 11:26:39 -0700
Message-ID: <4FF48ADE.6060302@intel.com>
Date: Wed, 04 Jul 2012 21:26:38 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
	<1341298228-4412-5-git-send-email-laurentiu.palcu@intel.com>
	<20120704172309.GF15100@jama.jama.net>
In-Reply-To: <20120704172309.GF15100@jama.jama.net>
Subject: Re: [PATCH 04/10] libdrm: upgrade to 2.4.35
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
X-List-Received-Date: Wed, 04 Jul 2012 18:37:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


On 07/04/2012 08:23 PM, Martin Jansa wrote:
> On Tue, Jul 03, 2012 at 09:50:21AM +0300, Laurentiu Palcu wrote:
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> 
> Is there specific reason that it wasn't upgraded to latest 2.4.37?
> 
> Maybe it was because intel test is failing in 2.4.37:
> http://cgit.freedesktop.org/mesa/drm/commit/?id=8fad46b614a156e3a0e65cd0af4c132a5820d29e
> 
Actually, I simply forgot to check if there was a newer version upstream
than the one I had (I probably had an older list from the package
reporting system). I did, however, realize there were some new versions
upstream when I upgraded directfb, libx11, etc (patches on their way as
I write these lines)... These were upgraded to the latest versions.

So, libdrm will be upgraded to the latest too.

Sorry about the confusion,
Laurentiu

> just wanted to be sure before rebasing glamo patch in meta-openmoko
> layer for 2.4.35..
> 
> Cheers,
> 
>> ---
>>  .../drm/{libdrm_2.4.34.bb => libdrm_2.4.35.bb}     |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-graphics/drm/{libdrm_2.4.34.bb => libdrm_2.4.35.bb} (62%)
>>
>> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.34.bb b/meta/recipes-graphics/drm/libdrm_2.4.35.bb
>> similarity index 62%
>> rename from meta/recipes-graphics/drm/libdrm_2.4.34.bb
>> rename to meta/recipes-graphics/drm/libdrm_2.4.35.bb
>> index bf489cf..3677b8d 100644
>> --- a/meta/recipes-graphics/drm/libdrm_2.4.34.bb
>> +++ b/meta/recipes-graphics/drm/libdrm_2.4.35.bb
>> @@ -8,5 +8,5 @@ SRC_URI += "file://installtests.patch \
>>              file://GNU_SOURCE_definition.patch \
>>             "
>>  
>> -SRC_URI[md5sum] = "293cb2b31392d52caa02ab0861dfc2c9"
>> -SRC_URI[sha256sum] = "a468570e7c85107b7c2f8eaceeebaa8f8a0da86482618f445bb74fa0b0d0f8d0"
>> +SRC_URI[md5sum] = "a40f5293dc0a7b49d2a1e959d7d60194"
>> +SRC_URI[sha256sum] = "c390aee132f05910edb09398b70e108c6b53f9b69b21914a9ea3165eed6f1b21"
>> -- 
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


