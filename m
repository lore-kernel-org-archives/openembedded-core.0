Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC1DE73176
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 08:40:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0F8ecHw004517
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 15 Jan 2016 00:40:38 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 15 Jan 2016 00:40:37 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
	<66e32244aed8d33f1b49fbe78179f2442545c730.1451286789.git.liezhi.yang@windriver.com>
	<CALbNGRQ+sJBd7+_knzSc4AQTFXdPAJRgGAHnX7B_EZGLy0nj4w@mail.gmail.com>
	<5698AD59.4030400@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5698B084.1000508@windriver.com>
Date: Fri, 15 Jan 2016 16:40:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <5698AD59.4030400@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/40] gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for v4l2 and libv4l2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jan 2016 08:40:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 01/15/2016 04:27 PM, Robert Yang wrote:
>
>
> On 01/15/2016 04:21 PM, Andreas Müller wrote:
>> On Mon, Dec 28, 2015 at 8:14 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> From: Martin Jansa <Martin.Jansa@gmail.com>
>>>
>>> * WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2
>>> rdepends on libcap, but it isn't a build dependency?
>>>    WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2
>>> rdepends on libgudev, but it isn't a build dependency?
>>>    WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2
>>> rdepends on libudev, but it isn't a build dependency?
>>>    WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2
>>> rdepends on zlib, but it isn't a build dependency?
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>   .../gstreamer/gstreamer1.0-plugins-good.inc        |    8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
>>> index 0ce4b8f..edaafe8 100644
>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
>>> @@ -11,7 +11,7 @@ inherit gettext
>>>   PACKAGECONFIG ??= " \
>>>       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>>>       ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '',
>>> d)} \
>>> -    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
>>> +    orc cairo flac gdk-pixbuf jpeg libpng soup speex taglib v4l2\
>>>       "
>> Just noticed that this patch removes gudev from default PACKAGECONFIG.
>> Was that intended?
>
> I'm afraid no, should be a typo, I will send a patch for it.

To be clear, it's my fault, there were conflicts when I merged the
original patch, and I wrongly removed udev from PACKAGECONFIG when
resolving the conflicts.

// Robert

>
> // Robert
>
>>
>> Andreas
>>

