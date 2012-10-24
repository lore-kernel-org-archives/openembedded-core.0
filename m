Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TR2Tf-00028Y-0E
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 17:02:44 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so791679ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 07:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=JwuLs/Rf05Xd+OL6SIWWb3gePefT7onAm4ynMpm1nXE=;
	b=cuD7/bCF6etyAAgbT915YvJddBl8z/9P4Uhr9rB84JOqWdC1Hvm/Aubwzcc+mm3SYw
	VVJZxhLryIruQTgnrCOaUjpNvJHgXWEg1OEGrIfZrnCAq7IbCrkfwDKaFw0hZi9jJ5HA
	4rY5sH+XJ+j5klZF8NHzChFmqsalZ57s8bE65Bo5DrdgKaIGmlylWu+WxP1//MTeR86h
	858poG20lMLZS5Dip1BYeVEtOlxSNMlGzLPFAMcM204Vm9N0rv+QjEfEcedHDL0tdHVy
	HWE7XuBaLPegNjo9/dDLTjs7EBx+tCUF6scaeoohdOa5aEGmNyYlO3IrP48V0StdGn9p
	n3Pg==
MIME-Version: 1.0
Received: by 10.50.169.100 with SMTP id ad4mr2674007igc.50.1351090147114; Wed,
	24 Oct 2012 07:49:07 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Wed, 24 Oct 2012 07:49:07 -0700 (PDT)
In-Reply-To: <1700131.q7Jk2zQzF1@helios>
References: <CALbNGRSX3AtHywq3RR3OryKbRWaqL=v2TE+xsuNsDQ3O2PY4hg@mail.gmail.com>
	<1351088462.3259.421.camel@phil-desktop>
	<CALbNGRS7m2mbZD2QhwTrkJAdL2-1Vc_pz8yfkXQ_ZJzESbr0jg@mail.gmail.com>
	<1700131.q7Jk2zQzF1@helios>
Date: Wed, 24 Oct 2012 16:49:07 +0200
Message-ID: <CALbNGRQoX5J5NvPRHc2VAx-D58UvxQmLhunEev09OaxkFwGJKA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] Latest head causes challanges
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Oct 2012 15:02:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2012 at 4:30 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 24 October 2012 16:24:08 Andreas M=C3=BCller wrote:
>> On Wed, Oct 24, 2012 at 4:21 PM, Phil Blundell <philb@gnu.org> wrote:
>> > On Wed, 2012-10-24 at 16:19 +0200, Andreas M=C3=BCller wrote:
>> >> I updated my layers this morning. Since that I have huge fallout:
>> >> Poking around I found /usr/libexec is missing on my machine. Any idea
>> >> what might caused this?
>> >
>> > 406bd38b4232f9f399ef5ffe0b4fac72ed605a23?
>> >
>> > p.
>>
>> Wow - I thought we are close to release...
>
> The master branch has already moved past release - danny is the release b=
ranch
> and does not have this patch.
>
> Cheers,
> Paul
>
To me this is a log off and go home. Since when do we care for FHS? I
thought everything is on it's way to /lib... And I thought on master
branch I am safe from strange changes these days...

Andreas


