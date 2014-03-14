Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8C36EAB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 19:16:11 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id t19so6197985igi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=E773wWIeu4EpOqvWCTNHiaa1DsjddgoEOj7H0LO8ADE=;
	b=ydBiRRsB/qlacdcLQBLa0w1DotB1jKeTWUNG9/bxN5YaN/JrOV2V3detsXuMa0t5pj
	p68tgvM3Prylwavtg8HSE45k74C9OWVQNXjeJWtVScPEFW4a6PeU/QgtXTiQoBvMddm4
	6I592TUjASreORjsdr11DxKDGrpOQtNS7up17oNpq08CDiBBUBwVaiwv2dPezq6qM99d
	/tyMD9jSoVBbC5AlmYZygOmFNQZ6he2ZO/j3qq5OwY2pwnxP5bqsuVnUp1FGVGY0cN30
	6g33bMLDADtgKXFKWBZETWWbmST5GkXAOxDWLK1SirMP3mV+UxaFefP7B6dmUh7XWpbx
	BAhg==
X-Received: by 10.42.203.202 with SMTP id fj10mr7775907icb.51.1394824572894;
	Fri, 14 Mar 2014 12:16:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Fri, 14 Mar 2014 12:15:42 -0700 (PDT)
In-Reply-To: <5323545F.5080205@communistcode.co.uk>
References: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
	<53235105.4060205@linux.intel.com>
	<5323545F.5080205@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Mar 2014 12:15:42 -0700
Message-ID: <CAMKF1soPLaFmpo5Vu0r5j54ETigG-SsAduzv69BbNYOhix2r7w@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dylan] Backport request
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
X-List-Received-Date: Fri, 14 Mar 2014 19:16:12 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 14, 2014 at 12:11 PM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>
>
> On 14/03/2014 18:57, Saul Wold wrote:
>>
>> On 03/14/2014 11:34 AM, Paul Barker wrote:
>>>
>>> I'm stuck using Dylan for a project as I need a 3.2 series kernel.
>>> Building on my current development machine I ran into two failures:
>>>
>>> eglibc-initial, do_configure: Make 4.0 isn't recognised
>>>
>>> This can be fixed by backporting
>>> a678243d6e4add90c1e9459da42de34d3724db5d (already in Dora).
>>>
>>> linux-yocto_3.2: do_patch: Unsupported version of git (1.9.0)
>>>
>>> I fixed this by removing git-native from ASSUME_PROVIDED in
>>> meta/conf/bitbake.conf so that git-native-1.8.1.4 was built and used.
>>> That isn't something we should commit in Dylan but may be useful for
>>> others to know the solution if they run into the same problem.
>>>
>> Can't you use the buildtools tarball?  It includes the right version of
>> make and git.
>
>
> Indeed, this is what I do on my ArchLinux machines when something is too
> new; it's just a simple sourcing of an environment file before the build and
> you're good to go.

build system underneath might still inject bugs into your cross build
even though you got it building.

