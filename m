Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id D687A6E750
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:58:48 +0000 (UTC)
Received: from [192.168.178.14] (chello080108088242.14.11.vie.surfer.at
	[80.108.88.242]) by ptmx.org (Postfix) with ESMTPSA id 545C0229DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 14:58:48 +0100 (CET)
Message-ID: <53358018.3090007@pseudoterminal.org>
Date: Fri, 28 Mar 2014 14:58:48 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1395868053-27393-1-git-send-email-otavio@ossystems.com.br>	<533419E9.3080509@intel.com>	<CAP9ODKrUyfcP1vzEgYupPM-rg2jeE1VgPsP++Nh=fDeBuTjc7A@mail.gmail.com>	<533569B6.9090103@intel.com>	<CAP9ODKqwkv4yvcKPqMeHSuwKQ3UUzZCWLK6==o46G6wsqDkc_A@mail.gmail.com>	<53357916.3090108@intel.com>	<CAP9ODKo6LmdrbUoXKjpwbVb4jcL5M4a4_tUAv1GdbwDSR-Cs6Q@mail.gmail.com>	<53357AFD.9080902@intel.com>
	<CAP9ODKoJKqKQhaTf93UPmDvqojY1UbiGuzPZuGjKj9QurgYzuw@mail.gmail.com>
In-Reply-To: <CAP9ODKoJKqKQhaTf93UPmDvqojY1UbiGuzPZuGjKj9QurgYzuw@mail.gmail.com>
Subject: Re: [PATCH] weston : refactor to identify EGL, cairoglesv2 support
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
X-List-Received-Date: Fri, 28 Mar 2014 13:58:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> If you want, I can add the egl there, and send v2. That's easy.
>> That would be great. And don't forget to --disable-egl in case wayland is
>> not in PACKAGECONFIG.
> This is the point I don't agree. I think user needs to drop egl when
> dropping wayland.
>


I concur. EGL is not just useful for Wayland.

