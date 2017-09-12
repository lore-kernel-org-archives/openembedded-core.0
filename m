Return-Path: <twoerner@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 77D2C784E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 23:03:17 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id u134so3241571ywu.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 16:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z/ZyBVpOpe//DHPKKoe3qZrXx+h7TvuUeUmDMa1Fu1I=;
	b=tWMp39nQM2cNSoKih7GwhJBu9O5PGjTJ4zcq5eq9QvDWtY5G15025hWGJh8Y/K4nDs
	ht4FlPlOym2N5bhAAGp9BW7tpPVFCTm85NFA/BHj+t1MOpBLWh5Swx7tLrK6IFbvzMNx
	WHLzRo31jMyWAlpuGoFsUG3Q9K2MWge+MFdO5eN/D75U2jO+oV+Vvl/4U/tSTI41wBVR
	FJQrFY8ANYlJOEcRTK6kCvLwC+pd+jntErNRNlGOIgRIBI38WqIYlT4SHsO2pK9hFP5S
	iImQaa1w6+U7d3eKdJ6FOYuWSMnwza7s6Mj2wK4Jo+kKygMeaSAA9Qka7QWGilNTvnGz
	IjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z/ZyBVpOpe//DHPKKoe3qZrXx+h7TvuUeUmDMa1Fu1I=;
	b=owLFbMPnIKdHpxno7ekVK6eNmUWtgdGtLGLYqPfiLA18gqrkixHsceblFgvBBYHUEw
	DQ8iygySIdO6u3pI2Md08JpRvK8xiEQy1CRenHPAZgvW0M61QL/N2V7z0eKf59CReriF
	eoPc97YTmVN7fwUlCyNsK9ws/l4aJazwV96oEP2+UcgonyjDzwFKeMXT4BgeJkPaC/Oz
	GwEfZVx8Oj79kUU4BVFKEjEhZRqOck2+q7GtDNckNR7tlY8zHPwgo50YHLBzhPXt3PCm
	dvOJegDmXeJbWBkVoiQDexomCUUOYi6ihiC3zcXbQcEYeLHT10EPVtuWMWaElZlHHV4B
	Jjbg==
X-Gm-Message-State: AHPjjUhIAsE/XLdYyroXkb4OBRR7VAQO0aAmgXWqoEuF1QQlVDw/eFkq
	tkeEtA16vXq0EfIEUHilypKmMBv8vcTemJ8+WrN/bw==
X-Google-Smtp-Source: ADKCNb7phYwbKojWFNQRtOWHIUAaIO9p/DqLpTY25Un+OY2hhFAZxYrCHNSNKrQJrPTqWEw/QOFFHXkcCHpaBFwkCDA=
X-Received: by 10.37.57.193 with SMTP id g184mr13484412yba.65.1505257399265;
	Tue, 12 Sep 2017 16:03:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.4.205 with HTTP; Tue, 12 Sep 2017 16:03:18 -0700 (PDT)
In-Reply-To: <CAP9ODKqE0+PwHNshx9W_3oJ3VgEEHGgnXQ=YLuazCBCuS4c8DA@mail.gmail.com>
References: <20170911213326.3480-1-california.l.sullivan@intel.com>
	<CA+chaQcHzfovU588PVbky_AOrmXgUrgu0qe7U+Uhe8Azh_VUVw@mail.gmail.com>
	<CAJTo0LZ_FCc-VOn9f+Z=cMPioWav+TmC4z=AXDuDe_+NHW2ywg@mail.gmail.com>
	<2482308.N8aakNJOlD@peggleto-mobl.ger.corp.intel.com>
	<CAHUNapQqFe+f-yd6H6ta+M7MaMUiEyaU2PjpNQSQn7S+Ug4hYA@mail.gmail.com>
	<CAP9ODKqE0+PwHNshx9W_3oJ3VgEEHGgnXQ=YLuazCBCuS4c8DA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 12 Sep 2017 16:03:18 -0700
Message-ID: <CAHUNapSuhAUQK7U+tNWH-Rb2qmOq_rDTsLvDnee2f9cK35szVw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Tue, 12 Sep 2017 23:03:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 3:58 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Sep 12, 2017 at 7:51 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>> On Mon, Sep 11, 2017 at 6:40 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>>> Is someone documenting all of this? I'm pretty sure this isn't the only one.
>>
>> Better still: an automated test (with comments including this
>> information, so the test doesn't get removed under the assumption the
>> thing it's testing is buggy)
>
> What kind of test do you imagine?

This would be bitbake?

Isn't there already a test suite for bitbake (if my previous statement
is correct)?

