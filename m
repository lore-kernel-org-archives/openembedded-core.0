Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8F95E6DEDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 18:12:01 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so1878456iec.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 10:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=+tSPnF7BFyq/6G3KEffzOsPpeKUh7CP7IWUINJyLbTU=;
	b=GL9kagSh823CHc+m92fLkVZEdqImyFAdhT8Jir2FDsNCFkBvOuH2WAGeogf6FGomVe
	sKRGnOynVRI0s5j/SU8OILwJIV7Y6Hi2gPGZIE6Jdy1Kex9mVkvGAC0z5CGBOVQXxOLF
	glok+7ThlREEUErqqS9ZxWtvTZFX4U8R5kHkO36msYqugIPeKpLcIMKE8AGXBKCKTzQM
	RMCoHXO5w/ewwMrSD7ZdgVVnbKg0ysBjlWfMGboqQs+wk9Wuzdj4UrJuJ1B/D3HqN+5Z
	YN9Gk/9iXzqrVXiclyyBuSBx1VNxd3z2FQD2eyX4SxANqoU3wbpgx6QPwvd+fyQ3D3Um
	J7aQ==
X-Received: by 10.42.20.6 with SMTP id e6mr5558999icb.29.1393611121919; Fri,
	28 Feb 2014 10:12:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Fri, 28 Feb 2014 10:11:31 -0800 (PST)
In-Reply-To: <CAJTo0Lb+qvbPH+U0nioZ0m8OF6a-hzaYxPh=-LmDmjJSskheHA@mail.gmail.com>
References: <1393587200-16322-1-git-send-email-david.nystrom@enea.com>
	<66416D1B-68E3-487C-B0BA-EE211FF59DA0@gmail.com>
	<CAJTo0Lb+qvbPH+U0nioZ0m8OF6a-hzaYxPh=-LmDmjJSskheHA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Feb 2014 10:11:31 -0800
Message-ID: <CAMKF1sqpKsA_-929=wiPvNE0L1v+e2VSb5GEA6eqk2K-wbM8sQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: Add util-linux-libuuid to DEPENDS
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
X-List-Received-Date: Fri, 28 Feb 2014 18:12:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2014 at 9:29 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
> It's a build failure, so not at all. :)
>
> On 28 February 2014 17:24, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Feb 28, 2014, at 3:33 AM, David Nystr=C3=B6m <david.c.nystrom@gmail.c=
om> wrote:
>>
>>> -DEPENDS =3D "util-linux"
>>> +DEPENDS =3D "util-linux util-linux-libuuid"
>>
>> it should be RDEPENDS if at all.

moreover its native package.

>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

