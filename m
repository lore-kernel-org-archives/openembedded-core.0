Return-Path: <preid@electromag.com.au>
Received: from anchovy.45ru.net.au (anchovy1.45ru.net.au [203.30.46.145])
	by mail.openembedded.org (Postfix) with ESMTP id B5D836FF7B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 06:07:05 +0000 (UTC)
Received: (qmail 31436 invoked by uid 5089); 1 Feb 2016 06:07:04 -0000
Received: by simscan 1.2.0 ppid: 31395, pid: 31397, t: 0.0317s
	scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.122?)
	(preid@electromag.com.au@203.59.230.133)
	by anchovy1.45ru.net.au with ESMTPA; 1 Feb 2016 06:07:04 -0000
To: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
References: <CALbNGRTiMGfhtvtt+q_SFsKMpMMP-Y7XKQHUc2upqTNXnYrEmA@mail.gmail.com>
	<569C9C0B.1080004@topic.nl>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <56AEF605.1090806@electromag.com.au>
Date: Mon, 1 Feb 2016 14:07:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <569C9C0B.1080004@topic.nl>
Subject: Re: Lots of [host-user-contaminated] warning
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
X-List-Received-Date: Mon, 01 Feb 2016 06:07:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/01/2016 4:02 PM, Mike Looijmans wrote:
> On 17-11-15 09:46, Andreas Müller wrote:
>> Hi,
>>
>> this bugs me for a while and I wonder if I am again the only one
>> facing this: I get floods of warnings for sourcecode files as
>>
>> WARNING: QA Issue: qtserialport:
>> /qtserialport-dbg/usr/src/debug/qtserialport/5.5.99+5.6.0-alpha1+gitAUTOINC+2575d33fab-r0/git/src/serialport/qserialport_p.h
>> is owned by uid 1000, which is the same as the user running bitbake.
>> This may be due to host contamination [host-user-contaminated]
>> WARNING: QA Issue: qtx11extras:
>> /qtx11extras-dbg/usr/src/debug/qtx11extras/5.5.99+5.6.0-alpha1+gitAUTOINC+d64ee96f0d-r0/git/src/x11extras/qx11info_x11.cpp
>> is owned by uid 1000, which is the same as the user running bitbake.
>> This may be due to host contamination [host-user-contaminated]
>> WARNING: QA Issue: qtxmlpatterns:
>> /qtxmlpatterns-dbg/usr/src/debug/qtxmlpatterns/5.5.99+5.6.0-alpha1+gitAUTOINC+94136d4280-r0/git/src/xmlpatterns/type/qbuiltintypes.cpp
>> is owned by uid 1000, which is the same as the user running bitbake.
>> This may be due to host contamination [host-user-contaminated]
>>
>> I checked PACKAGE_DEBUG_SPLIT_STYLE is not set globally - few recipes
>> set PACKAGE_DEBUG_SPLIT_STYLE to debug-without-src.
>>
>> Help appreciated
>
> I got rid of these messages by doing the following replacements in do_install and package install scripts:
>
> Instead of "cp -r -p ..." use "cp -r --preserve=mode,links ..."
> Instead of "cp -a ..." use "cp -R --no-dereference --preserve=mode,links ..."
>
> This fixes these QA warnings in a more structured way than running a blunt "chown root:root ..."
>
>
>

G'day Mike,

Was this on a recipe by recipe basis?
I've reported the following bug at https://bugzilla.yoctoproject.org/show_bug.cgi?id=8939
But told we need to update the recipes on a recipe by recipe.
I'm still learning bitbake, yocto and angstron relationships.
So far I at a loss on where to look.
eg: getting a problem with glib-2.22 which I can only find references to in openembedded-core.
But they suggest problem is in on of my extra layers.



-- 
Regards
Phil Reid


