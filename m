Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PwOdh-000350-OZ
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Mar 2011 01:49:33 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PwOcE-0000Xo-G2 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Mar 2011 16:48:02 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sun, 6 Mar 2011 16:48:02 -0800
Received: from [172.30.80.235] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sun, 6 Mar 2011 16:48:01 -0800
Message-ID: <4D742B3C.9070601@mentor.com>
Date: Sun, 6 Mar 2011 17:47:56 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1299431945.git.sgw@linux.intel.com>	<c6b0c5720fa0fc2ba7a6792b7f52faad38dd47dc.1299431945.git.sgw@linux.intel.com>
	<EC897C7E-B45E-415F-A788-9F160A0A60E8@dominion.thruhere.net>
In-Reply-To: <EC897C7E-B45E-415F-A788-9F160A0A60E8@dominion.thruhere.net>
X-OriginalArrivalTime: 07 Mar 2011 00:48:02.0320 (UTC)
	FILETIME=[500DA100:01CBDC61]
Subject: Re: [poky] [PATCH 1/2] gst-plugins: Added hal to DEPENDS
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
X-List-Received-Date: Mon, 07 Mar 2011 00:49:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2011 11:34 AM, Koen Kooi wrote:
>
> Op 6 mrt 2011, om 18:19 heeft Saul Wold het volgende geschreven:
>
>> From: Saul Wold<sgw@linux.intel.com>
>>
>> Fixes [YOCTO #810]
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> meta/recipes-multimedia/gstreamer/gst-plugins.inc |    2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
>> index 4edca95..d1abd36 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
>> @@ -3,7 +3,7 @@ HOMEPAGE = "http://gstreamer.freedesktop.org/"
>> BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
>> SECTION = "multimedia"
>> PRIORITY = "optional"
>> -DEPENDS = "gstreamer"
>> +DEPENDS = "gstreamer hal"
>
> Since hal is being deprecated in favour of udev, do we really want to introduce it as a dependency instead of disabled it?

... and making sure the new set of magic works right.

-- 
Tom Rini
Mentor Graphics Corporation


