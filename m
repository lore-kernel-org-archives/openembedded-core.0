Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id AFE6578207
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 21:33:41 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id e71so357440wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 14:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1ZPdaDi5qjkyZ9Nspo0dknU2MEcAPOSHTzufjVmYnBk=;
	b=f0lfx2VTvs5yUt6mLLx6DYCq+wgYgdFYujYiCu4TXwxV7uMBh7aLgr18vS9Dyh5oG0
	acteoTptYkcApY0eN5iIJbrQUC47JCbQhf9uCkVX/dOilboLZLS9116Gcw2V5KN9GiOF
	ReRBGo29KN+VY168imHuJSC6glG/iffHntYRcnrmnZydup7mhFgrG2ZNphpVljrbRYzV
	tU4cHyfWC9Nte3Y83fDUmHFMoQSwb7POc+Jbmbq/qlG9JwmRYIq4nWVxtGnEpfnLGyxx
	HDxLTOWWmyC16CSfQydzB0g3iuo8Fq+aRNjbr3XiRJ9uWWoYnljujiK45qDeD3sU8Cgg
	MOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1ZPdaDi5qjkyZ9Nspo0dknU2MEcAPOSHTzufjVmYnBk=;
	b=qB3SfCLggkLIZdtp67BGwL2tKD8LgzJ8Kzelu9fwisdZa1yCqhq8F+vnLHEjBaZx20
	vf3jzolE5UiznSO283dAHA2pK3PDTPp1dwmbu68XXTAHP0PNj6TWguw0oDTDo6j6Fkiy
	Z1C1jkGTJjetbWXREiNUvoedlF0ik/NAgJRgf5f0G1g5E9nav3wqek2vDTfinz5fTBkn
	Ol3EmKnhB0RnIwoMFWprSowhGug2tIZzaaLBnqzy5VKu9wsRuLRkFVk6AzPEros38ysg
	L4FFafeKfvcfz3jVfUXqDG6S+GBuWBqPcxaOLkDIC3zbpfBsvL9I6vIBmWMEdCWTwTET
	wpJw==
X-Gm-Message-State: AHPjjUjq4I6tv8x+FFehsicIK0n+e0J/od/+cFgqIhwvHnvZ3ii0n1e6
	PV4ZTtrPN5FLWHOB738bcNPOhkUHh2bcTZuuPvI=
X-Google-Smtp-Source: AOwi7QDZ3MC336tV6w+tITl/+pEvZdwg7zxY+NAJJG5QOcFihhWYhstXlJGaroHcAlci3HgqUI6OZ9A/IZBhoQv/8Ao=
X-Received: by 10.28.65.8 with SMTP id o8mr10596247wma.146.1505770422491; Mon,
	18 Sep 2017 14:33:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Mon, 18 Sep 2017 14:33:41 -0700 (PDT)
In-Reply-To: <41556f05-e92c-1962-99af-97d1812909d1@windriver.com>
References: <d8c3aa94-8f9f-2d06-0dac-9c46a1639505@windriver.com>
	<CAJ86T=XSXk4DGhJqDT4hmKO1BK0y-39rFc7r_codDWf72vAoCg@mail.gmail.com>
	<41556f05-e92c-1962-99af-97d1812909d1@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Sep 2017 14:33:41 -0700
Message-ID: <CAJ86T=VO8un10ov9_8orHkhec5z5z5GCO6dnvtikqchukT285A@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain / /bin/sh requirement / ldconfig backfill
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
X-List-Received-Date: Mon, 18 Sep 2017 21:33:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 18, 2017 at 2:20 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 9/18/17 4:05 PM, Andre McCurdy wrote:
>> On Mon, Sep 18, 2017 at 12:30 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>
>>> Because of this, there is no way (with a default configuration) to build
>>> meta-toolchain....
>>>
>>> Investigating further, ldconfig support moved from "USE_LDCONFIG" to a
>>> distribution configuration.  It does this via the "DISTRO_FEATURES_BACKFILL"
>>> (introduced in commit: a905df2dd8f43a2febffa64a39b6e508510326a0)
>>
>> The intention of that commit was only to change the way support for
>> running ldconfig on the target is controlled (ie changed from an
>> ad-hoc bitbake variable to a distro config option). It's enabled by
>> default now, but it was enabled by default before that commit as well.
>>
>> Did meta-toolchain work previously? If so, was USE_LDCONFIG being
>> forced to 0 somewhere?
>
> In many distributions, the default was 0.

Right. As mentioned in the OE 2.3 reference manual, if your distro
previously set USE_LDCONFIG to 0 then you now need to disable the
"ldconfig" distro config option instead:

  http://www.yoctoproject.org/docs/2.3.1/ref-manual/ref-manual.html#migration-2.3-miscellaneous-changes

