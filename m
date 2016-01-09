Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5197321C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 09:24:03 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id z14so72704276igp.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 01:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2Nwl4rZaje70B5WYBkRrIIHS14Cf/da/mdG6S1+CnmE=;
	b=HLgHM6miKz7QPY+hrP7D3rh2hfGjtqPHnzKiMGXUfpHwDKNIXEkQjRVLxXK2A5gmJ0
	X1XQ6OYolcnxTwc44us3feM/vFjP3bYGqkC+SLqUQQBDhCEvXYmHVW9p27RYErSWrbGM
	IYpIjicH/fU1q7THVmYFAV/IHDhKcfstLgeSeFTu03zinP82zC5dRCpWQmqrARfvoyCp
	YJ2j99ys5Aurkla2bGi+osQHTW6B7XVl9UghzJBRvgBIE8RVJaLW6Gy/XFhzeSLF6vF4
	RwiF7eI9Q0ey33aA4WP0X6vIPgNPJZZDwP84PHWAyiZr+wQJfFOdOWP7l0mUBQpBUG5P
	8MTA==
X-Received: by 10.50.79.196 with SMTP id l4mr3122947igx.11.1452331444496; Sat,
	09 Jan 2016 01:24:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Sat, 9 Jan 2016 01:23:35 -0800 (PST)
In-Reply-To: <CAJTo0LZeEtWA9qNQjNvqDPyW8d6hUjziJr_VuQsdEn4Y5dGcvw@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
	<CAJTo0LZeEtWA9qNQjNvqDPyW8d6hUjziJr_VuQsdEn4Y5dGcvw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Jan 2016 01:23:35 -0800
Message-ID: <CAMKF1sp5CX-n2SqZdhJzkmU4TVzhJXOPPW21apdTkRydn-2jqA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Sat, 09 Jan 2016 09:24:04 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 6:53 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 January 2016 at 14:00, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> Hm, for some reason, this doesn't work for me.
>>
>> Lots and lots of "files installed but not packaged", all locales.  eg
>> /usr/lib/locale/hu/LC_MESSAGES/glib20.mo in glib-2.0.
>
>
> So under musl the translations are being installed to /usr/lib/locale,
> whereas under glibc its /usr/share/locale. This is showing some problems in
> bitbake.conf: that sets localedir to ${libdir}/locale but then sets
> FILES_PN-locale to ${datadir}/locale.
>

I have pushed a fix for this to pull branch as well here
https://github.com/kraj/openembedded-core/commit/db21a7a31e9c37f7c2dd0a914599d7b3467ae2d9

> Ross

