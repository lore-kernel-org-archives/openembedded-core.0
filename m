Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 401EC7380D;
	Fri, 27 Feb 2015 15:50:52 +0000 (UTC)
Received: by iecrp18 with SMTP id rp18so31765189iec.9;
	Fri, 27 Feb 2015 07:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=B/RTtltKQc3WSdqPEDx+MWV5QbH6Tfm1MWtdKbAVCZ4=;
	b=IIFZo6n9KKQV8zbCruInuH9CLsRQ6MWfiWASARQMkgUCCIqZgX1JeZCcEvUhFBuzhc
	kV8cIeshvNMND+l3TIRY9oo2PWcswD5IzD8NDwhFO1DlUw7Cq9hutY61ReTKjjfbV58C
	gStL5/ySmlwuZpTL198+IDROk+MdXnyOkCBpx8SVzuVDnjtmyQZZubQa2qe2NQmv/Xp1
	LiyOIVmJxU1d5OKwK/gO6Zxwzdml79SAGoDSt8XPiVk7lE4pYMUAvyIq0gxT1IOC1+2V
	WvP+UBMu0xnnhrR7DsL3iI+hqF8CWkWU7wD6D39lJ+wzhGqNMlx8WQOVkHfszoxkqJbA
	TrdQ==
X-Received: by 10.43.34.137 with SMTP id ss9mr16424415icb.11.1425052254044;
	Fri, 27 Feb 2015 07:50:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Fri, 27 Feb 2015 07:50:23 -0800 (PST)
In-Reply-To: <CAJTo0La-wVzOVVtibXyR-cnOqr-AO7BmZomXPcw=OXOh_zxyNA@mail.gmail.com>
References: <20150227074233.1D2E3502AE@opal.openembedded.org>
	<20150227132117.GL2309@jama>
	<CAJTo0La-wVzOVVtibXyR-cnOqr-AO7BmZomXPcw=OXOh_zxyNA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Feb 2015 07:50:23 -0800
Message-ID: <CAMKF1srBvdDRypEioCmOzJ1PeC9dKcXN_d8X2p4nCopJ7V97VQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Khem Raj : systemd: Upgrade 218 -> 219
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
X-List-Received-Date: Fri, 27 Feb 2015 15:50:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 27, 2015 at 5:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 27 February 2015 at 13:21, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> Fails to build in world builds, looks like missing dependency:
>
>
> Yep, in the upgrade the util-linux dependency was dropped.
>

missed my testing since its pulled in indirectly. Pushed a fix
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-5.0&id=70d1beede31ee50ded93ea55cff27b8886161af9

> Ross

