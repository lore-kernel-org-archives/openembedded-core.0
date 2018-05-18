Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2879971984
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 13:20:38 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id d73-v6so6127819iog.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=krp1TIs2a+izIe/S9r0hJt4QglJTMonALzyzMAttwQ8=;
	b=a/v/BoQfJGNE+UjEFs8uvCoXkCHj+F17N4ahVZghFeSKY+Wgh6Res98rk4LXHdNFnB
	K/JGlNiL1ICh1MhLdV2fPqxfWIna8skYI5iOBA7FrbgPxWkrdE1B+pPb17J0CXY83mRI
	x7vSErmVSa94WaMFCtdd5/NkOMMWx4A0I7/vFVPwgMmIO4GJyxu0sn0aAizR7Ai4kA6B
	USsL9eKLzeMg0ChMgAqo0ARGnTxEmVhMHy+3edTJSOYTXeIpK2va6BDiWV3Zzfyb6Bar
	GXMiJ30D36v0f/06Ecf0hfAJ5g8dJTV55j5LhsuzpVhCbs6FpbjDiuK5t3NFYdfFOxYN
	na/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=krp1TIs2a+izIe/S9r0hJt4QglJTMonALzyzMAttwQ8=;
	b=OWWbbH+ekTpFBKlpdaFBM1DYlxahCiq7NQE8cXOrchpCA4N6x9riYHrlYGf5Sxw6qO
	hMd1I180cZ0UazJoovjW8WZ9GBAui3mCY2mC0eoKhN5PSt3v0Opd1uxtFIorI8/jsHCl
	DF+8WeT1Nmb6Srz5JL3wpjh+lOSumHlzwC4t4AT9dvStWqOMEryiEk3tGjQzbIpWcVt9
	z6zVUvbdrk0sEFbFgT6IypA3MEg5jnyesgDTCjAobsAP4enqbY4rrfiMUxeCbrTyRS0a
	yB/AhkES9cGisgoye//MTVbt34vLxfurSCMdqO7x2Nj2+MFr9xndq+96egqGPKiaRHFA
	4LxQ==
X-Gm-Message-State: ALKqPwcdjD/gejkO9u7fNt41qBzD8WidkFMFYP/z/yuxTpr2KgnnFzNy
	EGO4PgEb1IdlnuwlIF8m8OCTbHBS9asZl8k7wr0pUQ==
X-Google-Smtp-Source: AB8JxZqIZgVWoB1X8r7NQ6ODx9TW3r5xt5YCuShIDRssj0XiBunGfM54i6vEIrltuHRsOXQAsDLpfBDmSTUAcEbytUg=
X-Received: by 2002:a6b:752:: with SMTP id
	79-v6mr10705905ioh.216.1526649639971; 
	Fri, 18 May 2018 06:20:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Fri, 18 May 2018 06:20:19 -0700 (PDT)
In-Reply-To: <CAAPZna3aoEwRF-YDB1E1SNEMDouf+mmJW=Y2EBApGVLwCQjJ2Q@mail.gmail.com>
References: <20180517191536.12283-1-fabio.berton@ossystems.com.br>
	<CAJ86T=XbsORQD062SHnacc6kk9+cvfpJGdnpe8m_70V8P1McxA@mail.gmail.com>
	<CAAPZna3aoEwRF-YDB1E1SNEMDouf+mmJW=Y2EBApGVLwCQjJ2Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 May 2018 14:20:19 +0100
Message-ID: <CAJTo0LYuxunVTMqQLmHoAUzTpZavXTHk=ASRMahzEYmYLWabxQ@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Add util-linux-umount to RDEPENDS
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
X-List-Received-Date: Fri, 18 May 2018 13:20:39 -0000
Content-Type: text/plain; charset="UTF-8"

Fixing busybox is a better solution. yes.

Ross

On 18 May 2018 at 13:24, Fabio Berton <fabio.berton@ossystems.com.br> wrote:
> Yes, I tested this patch seems to work.
>
> But bug report has:
>
> "Yeah, this appears to be a limitation of busybox, and needs to be fixed in
> busybox. We focus on util-linux proper, which has supported this option
> since generations"
>
> So, I add umount from util-linux because systemd focus on util-linux and
> systemd recipe already has util-linux-mount.
>
> If add patch to busybox is a better solution I can do this and send to list.
>
> Fabio
>
> On Thu, May 17, 2018 at 4:53 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Thu, May 17, 2018 at 12:15 PM, Fabio Berton
>> <fabio.berton@ossystems.com.br> wrote:
>> > Images with systemd fails on reboot with error:
>> >
>> >    [FAILED] Failed unmounting Temporary Directory (/tmp).
>> >
>> > This happens because busybox umount command doesn't has -c
>> > option. Add util-linux-umount that has this option to fix
>> > this issue.
>> >
>> > See details: https://github.com/systemd/systemd/issues/7786
>>
>> That bug report mentions a fix to busybox. Since the fix is available
>> in upstream busybox, maybe better to just backport the patch to our
>> version of buysbox:
>>
>>
>> https://git.busybox.net/busybox/commit/?id=426134128112738c97a665170b21153ef0764b7d
>>
>> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> > ---
>> >  meta/recipes-core/systemd/systemd_237.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-core/systemd/systemd_237.bb
>> > b/meta/recipes-core/systemd/systemd_237.bb
>> > index b7c2113255f..3b0f4580d49 100644
>> > --- a/meta/recipes-core/systemd/systemd_237.bb
>> > +++ b/meta/recipes-core/systemd/systemd_237.bb
>> > @@ -478,7 +478,7 @@ FILES_${PN} = " ${base_bindir}/* \
>> >
>> >  FILES_${PN}-dev += "${base_libdir}/security/*.la
>> > ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>> >
>> > -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})
>> > util-linux-agetty"
>> > +RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (=
>> > ${EXTENDPKGV}) util-linux-agetty"
>> >  RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
>> > 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
>> >  RDEPENDS_${PN} += "volatile-binds update-rc.d"
>> >
>> > --
>> > 2.14.2
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

