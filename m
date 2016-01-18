Return-Path: <preid@electromag.com.au>
X-Greylist: delayed 398 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jan 2016 02:48:48 UTC
Received: from anchovy.45ru.net.au (anchovy1.45ru.net.au [203.30.46.145])
	by mail.openembedded.org (Postfix) with ESMTP id B4ADC601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 02:48:47 +0000 (UTC)
Received: (qmail 26944 invoked by uid 5089); 18 Jan 2016 02:42:08 -0000
Received: by simscan 1.2.0 ppid: 26909, pid: 26910, t: 0.0295s
	scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.122?)
	(preid@electromag.com.au@203.59.230.133)
	by anchovy1.45ru.net.au with ESMTPA; 18 Jan 2016 02:42:07 -0000
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CALbNGRTiMGfhtvtt+q_SFsKMpMMP-Y7XKQHUc2upqTNXnYrEmA@mail.gmail.com>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <569C50FE.7080203@electromag.com.au>
Date: Mon, 18 Jan 2016 10:42:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRTiMGfhtvtt+q_SFsKMpMMP-Y7XKQHUc2upqTNXnYrEmA@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Jan 2016 02:48:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 17/11/2015 4:46 PM, Andreas Müller wrote:
> Hi,
>
> this bugs me for a while and I wonder if I am again the only one
> facing this: I get floods of warnings for sourcecode files as
>
> WARNING: QA Issue: qtserialport:
> /qtserialport-dbg/usr/src/debug/qtserialport/5.5.99+5.6.0-alpha1+gitAUTOINC+2575d33fab-r0/git/src/serialport/qserialport_p.h
> is owned by uid 1000, which is the same as the user running bitbake.
> This may be due to host contamination [host-user-contaminated]
> WARNING: QA Issue: qtx11extras:
> /qtx11extras-dbg/usr/src/debug/qtx11extras/5.5.99+5.6.0-alpha1+gitAUTOINC+d64ee96f0d-r0/git/src/x11extras/qx11info_x11.cpp
> is owned by uid 1000, which is the same as the user running bitbake.
> This may be due to host contamination [host-user-contaminated]
> WARNING: QA Issue: qtxmlpatterns:
> /qtxmlpatterns-dbg/usr/src/debug/qtxmlpatterns/5.5.99+5.6.0-alpha1+gitAUTOINC+94136d4280-r0/git/src/xmlpatterns/type/qbuiltintypes.cpp
> is owned by uid 1000, which is the same as the user running bitbake.
> This may be due to host contamination [host-user-contaminated]
>
> I checked PACKAGE_DEBUG_SPLIT_STYLE is not set globally - few recipes
> set PACKAGE_DEBUG_SPLIT_STYLE to debug-without-src.
>
> Help appreciated
>
> Andreas
>
I'm seeing similar warnings as well.
I'm building from /home which I believe is susposed to be exempt from this test.
Not sure how to fix / avoid the problem.


-- 
Regards
Phil Reid


