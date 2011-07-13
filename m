Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh6VM-0006Ch-D1
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 22:58:00 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qh6RU-0002Xr-Ky from Tom_Rini@mentor.com ;
	Wed, 13 Jul 2011 13:54:00 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 13:52:21 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 13 Jul 2011 13:54:00 -0700
Message-ID: <4E1E05E4.4020307@mentor.com>
Date: Wed, 13 Jul 2011 13:53:56 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1310583292.git.tom_rini@mentor.com>
	<da0990e947463da6c333254055750f36967565ba.1310583292.git.tom_rini@mentor.com>
	<4E1E04A4.2060304@linux.intel.com>
In-Reply-To: <4E1E04A4.2060304@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 13 Jul 2011 20:52:21.0483 (UTC)
	FILETIME=[C2BEE3B0:01CC419E]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libsamplerate0: Update checksums
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
X-List-Received-Date: Wed, 13 Jul 2011 20:58:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/13/2011 01:48 PM, Saul Wold wrote:
> On 07/13/2011 12:05 PM, Tom Rini wrote:
>> Signed-off-by: Tom Rini<tom_rini@mentor.com>
>> ---
>>   .../libsamplerate/libsamplerate0_0.1.7.bb          |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git
>> a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
>> b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
>> index d08640f..194f885 100644
>> --- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
>> +++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
>> @@ -9,8 +9,8 @@ PR = "r0"
>>   SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
>>              file://libsamplerate-0.1.7-macro-quoting.patch"
>>
>> -SRC_URI[md5sum] = "6731a81cb0c622c483b28c0d7f90867d"
>> -SRC_URI[sha256sum] =
>> "78ed5d9ff1bf162c4a078f6a3e7432a537dd2f22dc58872b081fb01156027fcc"
>> +SRC_URI[md5sum] = "ad093e60ec44f0a60de8e29983ddbc0f"
>> +SRC_URI[sha256sum] =
>> "e0a646224a0323ac63f56ef009b2d7fee11452a7b8af139b19ae71d2890dbc9c"
>>   S = "${WORKDIR}/libsamplerate-${PV}"
>>
>>   inherit autotools pkgconfig
> 
> Are you sure about this one?  Did you maybe get a bad download from
> someplace?  I just checked the upstream source and it's still the 673
> md5sum.

Alright, crazy.  Locally, I've got a tarball with those checksums,
that's 'valid'.  Re-fetch, it's the normal sums.  Extract both, diff:
http://pastebin.com/5xW2z8Du  So, uh, consider this patch withdrawn.
Need a resend of the series?

-- 
Tom Rini
Mentor Graphics Corporation


