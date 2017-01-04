Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 76AC7700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 16:00:17 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 96so30787689uaq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 08:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TEcukovCN7ZOxHwXFqVlhxjfEhQ0HXD/0308AVrPU0M=;
	b=b0ksv8Cmz01VogqljNaL7/L09lrJg4F6sPD+bonNUVAY3iObGhZhchuvNXjMYj+gUG
	QKSvCW3CsyJrOPTt9xZff0Pm9SzHdFCfsDANQRo3G5U9Y5hRCiqf20fSfcHoYeIkvEFU
	OWLreSJs22LUNrVyFvjei80yCOEGTIj4sBBz4qPBvuztPqMjRUQ55BftW3i5se12CaYC
	HGiWdNRAkl/o5Mwgj+k+QJG2EPNN17wT9/Qn0tMoImGM7Ix4dYqE38CgGBQqafs7q5l2
	RMSBcrXkXKHXh2lxUdFSNVfsJac/+V7LqJoEVzEJso3G2E/BG34GcZNs1Sy2yzbh9FLc
	1SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TEcukovCN7ZOxHwXFqVlhxjfEhQ0HXD/0308AVrPU0M=;
	b=VO/8U3Ys3Gcyaif/FIY4GPlBwOLfs+3Za+8JFVxGQUVHxb4M0ZbffmNLhvBtossInZ
	qIWsuKN+TZb0kUToq0RvGKJZDrltQhtLap0wdumHCn50BGtBgF1oI99CNh1NZoIEyB9Q
	uWF5pPtL3ZEsRFa3ZWgRB1lGCtaiIlOKJd9vMsCUw5qQ418bIkI+K/rlA0Y8Vel7K683
	YW2nkT+ZfQL7dL5SY1JJgysmUwjN2flkVtux/+NJ3GXdrbLLP9oAkwnuPtq6qeWDiHel
	0+am9V61Sn5xH7gIpBsXSG5R04BukOm9EO7dXwwYtQ4dYjmvgFXJG8mvm6Qh0cYmIsnI
	dRJw==
X-Gm-Message-State: AIkVDXJDW4HVIgpkoObrYiyiW9hDRttvmi33c/zgaFK0R4GebUTctS3RcyyvyHHXTFEdQWsIZWs2pg2+D9tfUw==
X-Received: by 10.159.37.207 with SMTP id 73mr1018590uaf.67.1483545617423;
	Wed, 04 Jan 2017 08:00:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Wed, 4 Jan 2017 08:00:16 -0800 (PST)
In-Reply-To: <CAJTo0Lagj=bO9_n46JJ38JWwF9UFVLAtBzW8F+njMv7CpkjLhQ@mail.gmail.com>
References: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
	<1483300393-10174-3-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lagj=bO9_n46JJ38JWwF9UFVLAtBzW8F+njMv7CpkjLhQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 4 Jan 2017 17:00:16 +0100
Message-ID: <CALbNGRSk37UCcv+DNSOkLO+8i93Vj4j9P+5-gf-_FCv1W-ahUQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Jan 2017 16:00:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 4, 2017 at 4:27 PM, Burton, Ross <ross.burton@intel.com> wrote:
> This fails to build:
>
> | Making all in alsaucm
> | make[1]: Entering directory
> '/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/alsa-utils-scripts=
/1.1.3-r0/build/alsaucm'
> | x86_64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3D=
sse
> -msse4.2 --sysroot=3D/data/poky-master/tmp-glibc/sysroots/intel-corei7-64
> -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.1.3/alsaucm -I../include  -Wall
> -I../../alsa-utils-1.1.3/include   -O2 -pipe -g
> -feliminate-unused-debug-types
> -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/work/corei7-64-poky-linu=
x/alsa-utils-scripts/1.1.3-r0=3D/usr/src/debug/alsa-utils-scripts/1.1.3-r0
> -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysroots/x86_64-linux=3D
> -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysroots/intel-corei7-64=
=3D  -c
> -o usecase.o ../../alsa-utils-1.1.3/alsaucm/usecase.c
> | make[1]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.
> Stop.
>
> On 1 January 2017 at 19:53, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
> wrote:
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../alsa/{alsa-utils-scripts_1.1.2.bb =3D> alsa-utils-scripts_1.1.3.bb}
>> | 0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.2.bb =3D>
>> alsa-utils-scripts_1.1.3.bb} (100%)
>>
>> diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.2.bb
>> b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.3.bb
>> similarity index 100%
>> rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.2.bb
>> rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.3.bb
>> --
>> 2.5.5
>>
Checked: If I am not mistaken target alsaucm.1 builds man-files.

* Native rst2man missing?
* Can you provide full log.do_compile?

Andreas

