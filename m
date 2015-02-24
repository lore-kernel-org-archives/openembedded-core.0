Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 84C2772007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 17:08:30 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id hy4so10486361vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 09:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ezBCbdKeMFJUqrWYtO5VvakDmeVv2AgS+BH7fJSCjNg=;
	b=lXRQKGdsqdbIQIz8VhrLMmmYV+j7+0phspTHbdya9cBL9pUSsLoLFCVT78vMv5ZRl5
	cTpb9fQXr4Vwilkl9QsF8KLgb3OvhpRUL9r7TnvKUdzVGSMFoS3kcYY9JUH1UjRfxWx2
	HnJfJkip65w4KVhZLen4Xxkns8hodEvhRSjUSbLX6vSa5M+n5QwF29hKgRO4BHAZ6N8r
	VFhMp7V2yB5WKtg8P/geYs5fH6Fb59T06mTqYBWdm69Il2EQ22WfSw7r8XpsCK1RzhV5
	aLZEbvHE/4w3u5CrcqrkhsZAbm+TmZ7iOGKBAa1F9o5UUwTdisSqN7mFsgoMilepBVhT
	5Mqw==
X-Gm-Message-State: ALoCoQki+2V/aogj/z4PYqcK+kj3VbhOrJbqM+JkrinAHGqfYt4dS7dO809U+uepI2jSQB+wfURQ
MIME-Version: 1.0
X-Received: by 10.52.72.5 with SMTP id z5mr16710655vdu.78.1424797711246; Tue,
	24 Feb 2015 09:08:31 -0800 (PST)
Received: by 10.52.124.76 with HTTP; Tue, 24 Feb 2015 09:08:31 -0800 (PST)
In-Reply-To: <2739283.cBzxHPFgeW@peggleto-mobl5.ger.corp.intel.com>
References: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
	<2739283.cBzxHPFgeW@peggleto-mobl5.ger.corp.intel.com>
Date: Tue, 24 Feb 2015 17:08:31 +0000
Message-ID: <CAPhnLPCWaaeaFgjkY1-NTyHGRa6DPcY1HiNi+HMHo_ZWtu3o7Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 24 Feb 2015 17:08:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 24 February 2015 at 16:00, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Beth,
>
> I know you're looking at rewriting some of license.bbclass in python - FY=
I
> here's an as-yet unmerged patchset from An=C3=ADbal that may contain some=
 of that
> already:
>

Yeah, I'm almost finished with it. I'll look at what is there, but for
now, can we avoid taking anything that touches manifest until I get a
moment to look at it?

> On Wednesday 29 October 2014 12:34:12 An=C3=ADbal Lim=C3=B3n wrote:
>> Now you can specify LICENSE_PRIOTIY that enables the distro to set the
>> license preferences for manifest creation.
>>
>> The major change is when you have OR'ed LICENSE only one is choose accor=
ding
>> LICENSE_PRIORITY preferences if LICENSE_PRIORITY isn't specified the lef=
t
>> one is choosen.
>>
>> The test was done building qemux86/core-image-sato with and without thes=
e
>> set of patches and then run diff recursive under common-licenses created
>> directory.
>>
>> You can find a tarball with common-license directories, resulted diff an=
d
>> local.conf at:
>>
>> https://bugzilla.yoctoproject.org/attachment.cgi?id=3D2223
>>
>> An=C3=ADbal Lim=C3=B3n (4):
>>   license_class: Reimplemented manifest creation in python
>>   license_class: Added support for INCOMPATIBLE_LICENSE into
>>     license_create_manifest
>>   license_class: Added LICENSE_PRIORITY support
>>   license_class: Fix remove + trim in license_create_manifest.
>>
>>  meta/classes/license.bbclass | 250
>> ++++++++++++++++++++++++++++--------------- meta/conf/documentation.conf=
 |
>>  1 +
>>  2 files changed, 164 insertions(+), 87 deletions(-)
>
>
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre



--=20
Elizabeth Flanagan
Yocto Project
Build and Release

