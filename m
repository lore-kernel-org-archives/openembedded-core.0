Return-Path: <matt@madison.systems>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 73590731F0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 12:17:37 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id z124so306696757lfa.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 04:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Lsc11TBQqKRFWACwSpAXMjBe32ugCmFYVhVQL7z/0Wo=;
	b=IQbOUIQz8/e2aLdM/fVgI3KgCjWrsI4ZByYNuIYApthZZ3NMvCphDN8yGn13gvxZ6r
	gKnO2DnZXJ0ahfJ9xGooXqXctxjEBbW91Hg2WAJH/lxrJ6Fan0fdBOE5y7X6229JPaGU
	96lvUxFkXX6eQ9Z2wpAYvvWCrRwBoKyN10c7tJkw5gak2LQysApKQJ/hBK5vuHa2YABo
	1koppSV64pdTcYmKud7A+oOXhrTYQXRzsxFtCgd4Cr3AD+XHNgAtRaXRbG8eqjyaBnz3
	REghwRvEtR31vUMgN7/8VRa+uSXdYj9oLBA2bwmEwV+HN1jzhH2s5HnimMtNSLdod/Yw
	REUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Lsc11TBQqKRFWACwSpAXMjBe32ugCmFYVhVQL7z/0Wo=;
	b=U/Mc6GfDKZqzvWRmvlXBk8lhwA5Yz9FJ8dV8KV1s8c4EcsaDQ0dg90jNDmnhLg7L4Z
	PN3xsfBx7xdKuNv7lzFnlztvuhu/V9Gb59lae5QDZeUkG/NnoOn44+1MPRNjH4P6JCFB
	HFf21rQzTWYNZqRutmU5/G+oLkEQ9YBP3vDslYHmfdSQxvNwZOTJybHwE6UfrjlL6goA
	yOchQBZw9cywjxxBgKnKmjpOZVQMUCu/Ct8bXRdWtgfNTzm8Z2rtBl5xGE9FjOfFiAZ2
	4s1o94GkgHER5CySBQ1BeFOf+YTGc0s2Mak+X8KwebefydDp05xKU2RWDfM/XkzKjwF9
	VGzQ==
X-Gm-Message-State: ALoCoQlChM1djQDPospUa64EviB5y4PwxAHNV/ydVIz+WyZKpQIKROciROVXq5jLib/R6UfuksRSouCzvch1hXLy9yvdul+tXA==
MIME-Version: 1.0
X-Received: by 10.25.0.84 with SMTP id 81mr23625173lfa.132.1452082657819; Wed,
	06 Jan 2016 04:17:37 -0800 (PST)
Received: by 10.25.26.7 with HTTP; Wed, 6 Jan 2016 04:17:37 -0800 (PST)
In-Reply-To: <568C4C15.9000808@linux.intel.com>
References: <1450449271-28582-1-git-send-email-matt@madison.systems>
	<568ADC82.4040009@linux.intel.com>
	<CAGgRHJp9ERz00TSoTB1sYUT=M=1XRN-+v5YAuiG0XwdHj2d3Xw@mail.gmail.com>
	<568C4C15.9000808@linux.intel.com>
Date: Wed, 6 Jan 2016 04:17:37 -0800
Message-ID: <CAGgRHJoNnw2UuH1FUaToYg+3d3S_rdHsLKT0mqEyoaFU31i3pQ@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] Debian multilib packaging fixes
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
X-List-Received-Date: Wed, 06 Jan 2016 12:17:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 5, 2016 at 3:04 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> Hi,
>
> I fixed the problem and add a 4 patch and sign-off your first tree
> patches also i tested your changes building images in machines: x86-64
> (sato, minimal, multilib), x86(minimal), arm(minimal) and mips(minimal).
> Details below...
>
> Can you send the 4 patches again?

Thanks, will send out V3 shortly.

-Matt

>
>         alimon
>
> On 01/05/2016 11:00 AM, Matt Madison wrote:
>> On Mon, Jan 4, 2016 at 12:56 PM, An=C3=ADbal Lim=C3=B3n
>> <anibal.limon@linux.intel.com> wrote:
>>> Hi Matt,
>>>
>>> Sorry for the delay in the response, i'll test again your patches with
>>> the new one and the same error appears when build
>>> core-image-full-cmdline or core-image-sato.
>>
>> No problem, I figured things would be slow around the holidays.
>>
>> I think the problem with this specific configuration has to do with
>> trying to add lib32-connman to an image build that already had a
>> dependency on connman (from packagegroup-core-x11-sato-base, for
>> example).  I modified the DpkgPM class in package-manager.py to run an
>> 'apt-get -f install' to fix the dependencies that APT thinks are
>> broken if the initial installation attempt fails.  That appears to
>> work around the issue adequately, and I see APT reporting
>
>
> I figured out the issue is related to addition of log check feature into
> rootfs image (that's good) but i didn't take into account DpkgPM because
> it assumes that can be missing dependencies and executes apt-get -f
> install, see the final patch attached.
>
> I'll make the changes to the AB multilib buildset for add package_deb to
> the CI cycle.

Great, that will help.

>
>
>>
>>    ignore old unsatisfied important dependency on connman-conf:amd64
>>
>> which is there because it cannot install both connman-conf and
>> lib32-connman-conf, since PACKAGE_ARCH is ${MACHINE_ARCH} in the
>> connman-conf recipe.
>>
>> For my particular application, I didn't have any conflicts between
>> 32-bit and 64-bit packages, so the patches I submitted were enough.
>>
>> I'm not sure what the right answer for this should be; hacking in the
>> additional 'apt-get -f install' works around the problem here, but I'm
>> not sure it solves the general problem correctly.   APT implements the
>> Debian policy, and it's complicated - to do it "right" , we'd have to
>> ensure that all of the packages get tagged with the right combination
>> of Architecture and Multi-Arch headers, and I think we'd have to
>> change how we write dependencies in the control files to use the
>> '<pkg>:any' notation when that's appropriate.  I'm not even sure if
>> that could be computed automatically; it could require a significant
>> amount of manual review.
>
> I agree, there are work here to do to make consistent with debian way
> but for now is a good start.
>
>>
>> Thanks,
>> -Matt
>>
>>>
>>>         MACHINE ??=3D "qemux86-64"
>>>
>>>         IMAGE_INSTALL_append =3D " lib32-connman"
>>>         require conf/multilib.conf
>>>         MULTILIBS =3D "multilib:lib32"
>>>         DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
>>>
>>>
>>> I'm reviewing if this an error in the meta data (because
>>> core-image-minimal builds) or in the class.
>>>
>>> Best regards,
>>>         alimon
>>>
>>> On 12/18/2015 08:34 AM, Matt Madison wrote:
>>>> This adds a third patch that fixes the problem where APT couldn't
>>>> resolve dependencies between when two packages of different architectu=
res
>>>> both depended on an allarch package.
>>>>
>>>> Matt Madison (3):
>>>>   package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
>>>>     function
>>>>   package_manager.py: fixes for multilib deb packaging builds
>>>>   package_deb.bbclass: add 'Multi-Arch: foreign' tag to allarch packag=
es
>>>>
>>>>  meta/classes/cross-canadian.bbclass |  2 +-
>>>>  meta/classes/package_deb.bbclass    | 37 +++++++++++++++++++++++++++-=
---------
>>>>  meta/lib/oe/package_manager.py      | 17 +++++++++++------
>>>>  3 files changed, 39 insertions(+), 17 deletions(-)
>>>>

