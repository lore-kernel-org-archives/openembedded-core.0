Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SB3jE-0001Lt-GN
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:36:24 +0100
Received: by wibhj13 with SMTP id hj13so1740340wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ovsH0q/HKbtsySeYEHrx6G6DaffejH2icSJXDiWMdH4=;
	b=jQcpIVmwWAIW3b0oI3sVf+584ft3CDcR5THh3l8+AQ9Q/3v1OV+tJ6HhvwhIeXzPAV
	Dj/WA+9Ts9tjqmY22wGCMzKDe53CmRLCaRwAlTZsQO98GAhCb2ByIxViV/ENK0CRr5CJ
	Tw3B9i3N/IUcrTo9PwukUxe22diogG2CrAF4iPUd/NX/FBidnD2kqKQr2wtytJ2YJu+V
	yW3aYjcVXu4ut4MVQp/KWLHD3ndiYJUVZwvcNSINF+XcHajeOfu/Ihoup/3PbYrrihZd
	MjMYzGq5MRiIFz3Ua5j5DVn5W8WzRgNBIufZ+zYD9SEKCTfB2P9FWKSEg5IhDVT7t1Sz
	y8Qg==
Received: by 10.216.137.74 with SMTP id x52mr7017751wei.77.1332505648480;
	Fri, 23 Mar 2012 05:27:28 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fz9sm13492581wib.3.2012.03.23.05.27.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 05:27:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1332505323.9740.402.camel@ted>
Date: Fri, 23 Mar 2012 13:27:24 +0100
Message-Id: <989CC43B-0C42-48A4-8C93-3FFCBB8135E0@dominion.thruhere.net>
References: <1332485029-9148-1-git-send-email-Martin.Jansa@gmail.com>
	<1332494193.9740.382.camel@ted>
	<20120323093623.GB3879@jama.jama.net>
	<1332502793.9740.385.camel@ted>
	<20120323114938.GC3879@jama.jama.net>
	<1332505323.9740.402.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlL9LBB17NwpeylgypqeqfLrvYQS8bjnXOZIP30MMnko+yW4LrcA7SJqWdgDSas4iagNEIN
Subject: Re: [PATCH] kernel.bbclass: populate /etc/modules-load.d/ with module_autoload entries too
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
X-List-Received-Date: Fri, 23 Mar 2012 12:36:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt. 2012, om 13:22 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-03-23 at 12:49 +0100, Martin Jansa wrote:
>> On Fri, Mar 23, 2012 at 11:39:53AM +0000, Richard Purdie wrote:
>>> On Fri, 2012-03-23 at 10:36 +0100, Martin Jansa wrote:
>>>> On Fri, Mar 23, 2012 at 09:16:33AM +0000, Richard Purdie wrote:
>>>>> On Fri, 2012-03-23 at 07:43 +0100, Martin Jansa wrote:
>>>>>> * /etc/modules-load.d/foo.conf is used by systemd like =
/etc/modutils/foo was with sysvinit
>>>>>>=20
>>>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>>>> ---
>>>>>> meta/classes/kernel.bbclass |   10 ++++++++--
>>>>>> 1 files changed, 8 insertions(+), 2 deletions(-)
>>>>>=20
>>>>> Since these look identical couldn't we symlink them? I'm not a big =
fan
>>>>> of writing duplicate data to a package :/.
>>>>=20
>>>> OK I'll change it in v2
>>>=20
>>> Note that I'm wondering if we can just symlink the directory =
entirely
>>> rather than the files themselves. There may be a reason that is a =
bad
>>> idea but I don't know...
>>=20
>> There are different filenames (notice .conf in the end) so I have =
patch
>> doing symlinks for files not directories.
>=20
> I'd seen the modprobe.d conf files and thought here was some =
similarity.
> I have to admit I think systemd is nuts for requiring a copy of these
> files when it could have used the existing layout. It looks like =
change
> for the sake of change :(.
>=20
> I'm nearly tempted to suggest we should just patch systemd to use the
> other filenames...

The point the systemd developers want to make is to use the same path =
across all distros out there. Patching it would defeat the purpose. =
Unless we want to fork and maintain our own init system and scripts, =
like we do with sysvinit currently.

regards,

Koen=


