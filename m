Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id C6A246AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 18:08:26 +0000 (UTC)
Received: by iesa3 with SMTP id a3so19325664ies.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 11:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=G8H/0IIAao4zSZwoHb+mwJqjQFWg7g9VHSXzGxhiXI8=;
	b=c/7r7eYgwzzrcUIpfcQVJOVwr0eESFwimN/xLu7O7UeFDzlMXL3We2zST5o/F58yKh
	5J1i76Q3ZJJ7nU3pemciBNCnNAqYeUMwNoefP7EG+yaYclMYhzfixvYYlDJQXcNWzfJ3
	2sddj8hmgIDONyllnKxQRLqT+W7jsH2dG43UrFKYZ5iChqbqRNrfTo4VEHEZ2A8IKPK3
	rx2KMJV74DyrW/56ZAzsDjd5hHr5YqFPxTE1jDjEwRjEEiqPUQinR5L1l67/QjWX031y
	LwUPMkuUNkawH0oX0A3dEhiM2ARUheWZUyW1tX+tn4igAQ/keHIkUxaJyOR2SuV6ziA5
	UTeQ==
X-Received: by 10.43.17.135 with SMTP id qc7mr41720924icb.14.1433354907865;
	Wed, 03 Jun 2015 11:08:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.166 with HTTP; Wed, 3 Jun 2015 11:07:57 -0700 (PDT)
In-Reply-To: <CAJTo0LanFDJR+AteOHRQ5hNd0T9bMNAa+Z4b9xfZe2kdP+28aA@mail.gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
	<CAJTo0LanFDJR+AteOHRQ5hNd0T9bMNAa+Z4b9xfZe2kdP+28aA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jun 2015 11:07:57 -0700
Message-ID: <CAMKF1spaRQoh1_uEFOOFN9fOwAwEdRXC8pqusSvzfVpPs9hU_A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Wed, 03 Jun 2015 18:08:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2015 at 10:09 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 3 June 2015 at 17:41, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Use git for repo for SRC_URI
>>
>> copyright year changed for weston compositor.c
>>
>> - * Copyright =C2=A9 2012 Collabora, Ltd.
>> + * Copyright =C2=A9 2012-2014 Collabora, Ltd.
>>
>> libinput license changes are
>> - COPYING: note that having linux/input.h in the tree does not make
>> libinput GPL
>> - Updated to 2015 where appropriate, added where missing.
>> - filter: add Simon's copyright
>>   This code was largely lifted from the X server in
>>   bb25b2ad297891430606c367bfabc but didn't take the copyright messages
>>   that applied to that code.
>>
>> upgrade libinput to > 0.8.0 (0.16.0) which is needed for 1.7.0+ wayland
>> For x86 emulators use fbdev backend
>>
>> Change-Id: I49c12853699a3a764d86869ec4d43b10ecda3379
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
> Please split this into three patches.

They are interdependent thats why they are together. Splitting wont
get us anything moreover it will break git bisect

>
> Ross

