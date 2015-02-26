Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 07DC37374F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 16:34:21 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id im6so4330771vcb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 08:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=sVIU/nytdE/uuLjE5k/kCQ2JpGbBmj1oiheWe1n0cBc=;
	b=OWnUQV3JplPUkeZA3D29dxfdbVwoZ2+3sE96f33N/uJn1pYLxK7riBYivqXFW/rJoZ
	vxQPoZB11lOgXWRjsHqDyPFcUfMENLvImSZn1jMyvvRPicaBxC2IkhoQiMn3mdZeIgFw
	CTOMtJ2Qn3ZGzXU5xE14dfjxhi+CHFlW6zXyoiH/keITkqgTH0f0ZlP2gy+yEqQNWTdU
	UvzkrJ6wel/vW3F8WPcCp1mZhxtSiCi8S3gy322pIQayaP5wNNyrJbBK/rGZ9K7Y0Je8
	SGfTyGA8LPEs454M0CFZGSyJqBdMGq2cs3rSWKVfFD7/NqdgrwoHHrZxnUlbRc3fvNEZ
	+w5A==
X-Gm-Message-State: ALoCoQn/WTm0F+lcjYgSBown3bVUT5vCY5pF/NgBoZrbVl+kBke4/58LMO6g3vTg5egkZCQH2crQ
MIME-Version: 1.0
X-Received: by 10.52.11.73 with SMTP id o9mr9278084vdb.70.1424968462155; Thu,
	26 Feb 2015 08:34:22 -0800 (PST)
Received: by 10.52.124.76 with HTTP; Thu, 26 Feb 2015 08:34:22 -0800 (PST)
In-Reply-To: <CAPhnLPCWaaeaFgjkY1-NTyHGRa6DPcY1HiNi+HMHo_ZWtu3o7Q@mail.gmail.com>
References: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
	<2739283.cBzxHPFgeW@peggleto-mobl5.ger.corp.intel.com>
	<CAPhnLPCWaaeaFgjkY1-NTyHGRa6DPcY1HiNi+HMHo_ZWtu3o7Q@mail.gmail.com>
Date: Thu, 26 Feb 2015 16:34:22 +0000
Message-ID: <CAPhnLPBS-v5YKmBQgb2UmuNKK7gBwcFCZURVe0E02x0rfJbfqQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] license_class: Added support for LICENSE_PRIORITY in manifest creation
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
X-List-Received-Date: Thu, 26 Feb 2015 16:34:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 24 February 2015 at 17:08, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
> On 24 February 2015 at 16:00, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> Hi Beth,
>>
>> I know you're looking at rewriting some of license.bbclass in python - F=
YI
>> here's an as-yet unmerged patchset from An=C3=ADbal that may contain som=
e of that
>> already:
>>
>
> Yeah, I'm almost finished with it. I'll look at what is there, but for
> now, can we avoid taking anything that touches manifest until I get a
> moment to look at it?

Actually, this contains almost exactly what I was writing. So yes, I ACKing=
.

>
>> On Wednesday 29 October 2014 12:34:12 An=C3=ADbal Lim=C3=B3n wrote:
>>> Now you can specify LICENSE_PRIOTIY that enables the distro to set the
>>> license preferences for manifest creation.
>>>
>>> The major change is when you have OR'ed LICENSE only one is choose acco=
rding
>>> LICENSE_PRIORITY preferences if LICENSE_PRIORITY isn't specified the le=
ft
>>> one is choosen.
>>>
>>> The test was done building qemux86/core-image-sato with and without the=
se
>>> set of patches and then run diff recursive under common-licenses create=
d
>>> directory.
>>>
>>> You can find a tarball with common-license directories, resulted diff a=
nd
>>> local.conf at:
>>>
>>> https://bugzilla.yoctoproject.org/attachment.cgi?id=3D2223
>>>
>>> An=C3=ADbal Lim=C3=B3n (4):
>>>   license_class: Reimplemented manifest creation in python
>>>   license_class: Added support for INCOMPATIBLE_LICENSE into
>>>     license_create_manifest
>>>   license_class: Added LICENSE_PRIORITY support
>>>   license_class: Fix remove + trim in license_create_manifest.
>>>
>>>  meta/classes/license.bbclass | 250
>>> ++++++++++++++++++++++++++++--------------- meta/conf/documentation.con=
f |
>>>  1 +
>>>  2 files changed, 164 insertions(+), 87 deletions(-)
>>
>>
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>
>
>
> --
> Elizabeth Flanagan
> Yocto Project
> Build and Release



--=20
Elizabeth Flanagan
Yocto Project
Build and Release

