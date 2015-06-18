Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id D37617564B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 14:42:16 +0000 (UTC)
Received: by pabvl15 with SMTP id vl15so16756751pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=CdsAEhhuOyyZ7G3SwFF8eaRTIQhZXbP4dHyv9kwsP6w=;
	b=uIIZJkQ/uJAxo5iC+JioNuNJ1SWRieHCb6kSmVJh3SayBA74+0l8GdEQMJaCzE9Vxk
	Gpt7H9jejoOsbUz6MAzivshLpuIuuZ35wDZ+mymZQo363KegKQdl/T58uoGtH1mZg1tP
	nqoa9gsovFXuvjLae17N0udbar4/gKXztt5EgFQnbBGlt1TE1lGIFHKsLJBiT4gyiDdr
	jh59Q7J4GxLPt1e5Fs/eBBuc1fWVBJcL26wLqvTKRaWT4HF7yhYMllmPdkfWMOlrhVlt
	xA5ltgJFIevdwBBF4TQ/hNjPF2TwgTGrCWL0d5Q+GVA1b+FLOmigPkS887vZI8EOPOHQ
	NDGQ==
MIME-Version: 1.0
X-Received: by 10.70.127.140 with SMTP id ng12mr22077604pdb.94.1434638537382; 
	Thu, 18 Jun 2015 07:42:17 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Thu, 18 Jun 2015 07:42:17 -0700 (PDT)
In-Reply-To: <5582C4B8.4010408@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1434547172-24620-6-git-send-email-alexander.kanavin@linux.intel.com>
	<CAHiDW_EwLwe52-VXnJTctjMS5+4pevuOE1CZwHuEbc_xRQ=4Zw@mail.gmail.com>
	<5582AA4A.9000202@linux.intel.com>
	<CALbNGRQ5C5cMEPZEyYe03dJfMdAkyH-WiaWjoZCH77Y-DJ+f4A@mail.gmail.com>
	<5582C4B8.4010408@linux.intel.com>
Date: Thu, 18 Jun 2015 16:42:17 +0200
Message-ID: <CALbNGRRJjqzrfeJAY0ximXfCa0HpLxYB-2d51vfJDDvOgnfpkg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/22] Update libnotify to version 0.7.6
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
X-List-Received-Date: Thu, 18 Jun 2015 14:42:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2015 at 3:16 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/18/2015 03:35 PM, Andreas M=C3=BCller wrote:
>
>> I think gtk3 is not the problem here it is the API change libnotify
>> 0.6 -> 0.7 which cannot (or only by ugly hacks) be installed parallel.
>> Do we know what happens to meta-gnome/meta-xfce?
>
>
> The packages in meta-gnome that fail because of new libnotify are all fiv=
e
> year old, unmaintained 2.32.something versions.
>
> Let's just accept that meta-gnome needs to get a massive update to 3.x,
> those who don't like gnome 3.x need to seek alternative desktops and move
> on.
>
Cool: you send patches having no idea what efforts are caused and give
helping hints as 'let's move on'. From my experience guys like you
will not give any support in 'moving on' as the only scope is academic
'core-image-sato' building green for quemux86.

Over and out

Andreas

