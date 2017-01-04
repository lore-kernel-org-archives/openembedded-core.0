Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1E5F36FFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 16:09:16 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id d5so29845369uag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 08:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=omHRmrtAfrGcgmO+8uQaaX/sWJsFTfbYqlsogFIkUZA=;
	b=RBctdrrxtakUaap8U4gh9CLpjvQ3TJFnD+HjXrlmhQVIA3t7fRJOmd7AdGj76fhOSt
	8fH7m+/MQjIXJ3gwSXh3PdNIgTmOzGbq8NtAVhcNmTnSuu3NilWGcwjFLi7gM9sWDNU+
	LJBC3zasQfligiCbxY8rnmRpLHGgnvMIcvZ6Am+Xg5lJSVgDhW91Ra9mFiqh/Muq0Ece
	QvKF8Al2u9gBhjgQqQ3ceiIzsW2kQj/DoYH83ZTqzESK01AIsNQLnZxveWhhIdvqasXE
	AZwWATbLBlhB74kKnq2BPOrDEnoYp2RroTzaf6en4Nx+oyUYotrDsqkB1EXUkzZq5ebs
	YMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=omHRmrtAfrGcgmO+8uQaaX/sWJsFTfbYqlsogFIkUZA=;
	b=t3J98JYR/vAfM35kkF2h1aLfr6Q4PO4N7d21yB4orCA9nIU5zv8otxU7E4rlq+yOQ3
	YrtQ1u1mbJ0GuFMHmZTWJ9l/LHU6dh7FYaxIGhRLlHFI262UYRN6k3skoMCrcxbC6Fy7
	DWJ4R/xP24pGqqh8GjQ/Rd51znYjp1686983u7Ubdw7y9kNZ79oSHMevoabh1aO0rsIq
	U7oh30dWc21UYoRWkcLCuzxKr3vGRaXJNfgppCrjU32iG8L5xOPTM96eXdWtSY8irsuq
	gqrh4+F4GnTKJ6rS+IbPZPp//60dO62KOawhYX2GefqQ4DiwQNW1cV8igWr1GlyKc0I8
	48BQ==
X-Gm-Message-State: AIkVDXLTyo2EG9uxJVSQ40vlbr2gNoKo3/RVQ1gIBAfsZg6aHmMybSGCzsX13yqvbHk5dvbk6PhWxtGj6T+Hmw==
X-Received: by 10.176.0.197 with SMTP id 63mr43894364uaj.32.1483546157082;
	Wed, 04 Jan 2017 08:09:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Wed, 4 Jan 2017 08:09:16 -0800 (PST)
In-Reply-To: <CALbNGRSk37UCcv+DNSOkLO+8i93Vj4j9P+5-gf-_FCv1W-ahUQ@mail.gmail.com>
References: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
	<1483300393-10174-3-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lagj=bO9_n46JJ38JWwF9UFVLAtBzW8F+njMv7CpkjLhQ@mail.gmail.com>
	<CALbNGRSk37UCcv+DNSOkLO+8i93Vj4j9P+5-gf-_FCv1W-ahUQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 4 Jan 2017 17:09:16 +0100
Message-ID: <CALbNGRRoPfNKMUGfjuuhOE2OV+D90UwwJjGKLBZCnVYYNhZgFg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] alsa-utils-scripts: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Wed, 04 Jan 2017 16:09:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 4, 2017 at 5:00 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Jan 4, 2017 at 4:27 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>> This fails to build:
>>
>> | Making all in alsaucm
>> | make[1]: Entering directory
>> '/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/alsa-utils-script=
s/1.1.3-r0/build/alsaucm'
>> | x86_64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=
=3Dsse
>> -msse4.2 --sysroot=3D/data/poky-master/tmp-glibc/sysroots/intel-corei7-6=
4
>> -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.1.3/alsaucm -I../include  -Wall
>> -I../../alsa-utils-1.1.3/include   -O2 -pipe -g
>> -feliminate-unused-debug-types
>> -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/work/corei7-64-poky-lin=
ux/alsa-utils-scripts/1.1.3-r0=3D/usr/src/debug/alsa-utils-scripts/1.1.3-r0
>> -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysroots/x86_64-linux=
=3D
>> -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysroots/intel-corei7-6=
4=3D  -c
>> -o usecase.o ../../alsa-utils-1.1.3/alsaucm/usecase.c
>> | make[1]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.
>> Stop.
>>
>> On 1 January 2017 at 19:53, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
>> wrote:
>>>
>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> ---
>>>  .../alsa/{alsa-utils-scripts_1.1.2.bb =3D> alsa-utils-scripts_1.1.3.bb=
}
>>> | 0
>>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>>  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.2.bb =3D>
>>> alsa-utils-scripts_1.1.3.bb} (100%)
>>>
>>> diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.2.bb
>>> b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.3.bb
>>> similarity index 100%
>>> rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.2.bb
>>> rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.3.bb
>>> --
>>> 2.5.5
>>>
> Checked: If I am not mistaken target alsaucm.1 builds man-files.
>
> * Native rst2man missing?
> * Can you provide full log.do_compile?
>
Forget the logs. V2 is close

Andreas

