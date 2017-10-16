Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id EB46A71B40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 15:51:25 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i5so3013736pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 08:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3jy261l9s1U+xDrydZfrqwU7enh0wMFYPudeU+djTFQ=;
	b=cDd5oUk0nuxVeUdu5NAF9ab3TycY5pu75d8Mq7Ict//FV6DrfsNZpg77MtIEdwb32i
	d132njdQ18p1Cm17LP4AXMdCp8E+MO6HkUKiRFkDVefnNHBAAbsfezBQPDBvsOjOUJ55
	qhAGpXSI//hBm4T+j7vgRpoW0asVOSr9aotDMKemBGd/mDch1KERlUJr1Ni3oVT5oWNU
	BADrBHYDNfeGHKBha7MIKws0GE8gjcZGrVG+pHprUSaX/zRv3mcLNACb9rAp77BXUGry
	cmYQX4yAuYyhrUqM55LzDv/ZPbdsm7KLSrw6mhsJyS+fKxeywemFjH6fvjGKhlFByVXk
	Oshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3jy261l9s1U+xDrydZfrqwU7enh0wMFYPudeU+djTFQ=;
	b=DCv/EvdqXjF6ZrSG0EJFCzDg3lz26mBR3vaM09NbHGjg2YGJrOQrz0XIcFjbsBzveh
	m+ksZWdWdUhIxAYnc+sGwew52mhrYnEuKhTybqwbg5c2A8u4TVFl1JY5No/ao5jojYKx
	NxEAUPpatzOBz0dAcjA2VOSFHGQ+7CP9WHpPPjitL9KkX9nyPgiSThb3xsT51Gu/K7V0
	wntWaVs+4cOfFfAQh2ZkISDjvg/d9P4VeZgCmYGH9qKtNMzFIdYieWeXwT64k1bh9O4K
	bYjI6HpuODkNC8/8Q2aPLAKLDvv/blRYSsfwz3Prfof7rgckEM3PO/90Rc6PfmWE0okL
	A7Gg==
X-Gm-Message-State: AMCzsaUNfAhbYyw8rZIc+xyiouBFtxFzUMgm3mZuPr4TkcsKUAAjM/7p
	WzZ3a2OsnBPlNx4P8UVlHFfCTiXLT11yxHaM2iY=
X-Google-Smtp-Source: AOwi7QAY0Y5Ui48q0dR5uZe6/rGxbq75FtIaH+T18dg8KJiSlBkYGCGQnpgzaP5cYWT2UlyMLtXjMHVTB6g+7FBnbx8=
X-Received: by 10.84.177.129 with SMTP id x1mr9505719plb.161.1508169086670;
	Mon, 16 Oct 2017 08:51:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 16 Oct 2017 08:50:56 -0700 (PDT)
In-Reply-To: <CAP9ODKp1H_netdtLEs_thSGNJRfcOETwU6O+b4zfHe+ZSg=w2A@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-6-raj.khem@gmail.com>
	<06c9bf77-9781-f521-c450-c46f985c7dd3@gmail.com>
	<CAJ86T=Wr_u_x8Zn2n5SX2C8dyO1vbpMFX=3ufZA8X_gtG53p6w@mail.gmail.com>
	<CAP9ODKp1H_netdtLEs_thSGNJRfcOETwU6O+b4zfHe+ZSg=w2A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Oct 2017 08:50:56 -0700
Message-ID: <CAMKF1sqt+oPS4acyBVX7qm9bb_1k3nRW8MuSckrmwAJFE+qC6g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] gcc6: Upgrade to 6.4
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
X-List-Received-Date: Mon, 16 Oct 2017 15:51:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 16, 2017 at 4:53 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Sun, Oct 15, 2017 at 5:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Sat, Oct 14, 2017 at 10:21 PM, akuster808 <akuster808@gmail.com> wrote:
>>> why do we continue to maintain 2 versions of gcc?
>>
>> Probably the same reason why Buildroot continues to maintain 4
>> versions of gcc, it's useful for end users.
>>
>>   https://git.buildroot.net/buildroot/tree/package/gcc
>
> We keep all user space and toolchain up to date so upgrading the GCC
> is straightforward.  That said the gcc cannot vary from one machine to
> another so if a vendor wants to use an old release, it can be done
> using their distro.
>
> I am against maintaining two GCC versions as it increases the amount
> of testing needed. Instead I'd prefer to have clang merged on oe-core
> instead and easy its adoption / test.

In practice, there are a large set of applications that customers have porting
to do when major compiler version changes (e.g. 6 to 7), unless there
is a feasible path for upgrade people
will refrain from upgrading to newer versions of releases. Its not a
trivial task
to upgrade systemdwide compiler in any distro. So its a good strategy to have
two versions overlapping for few releases, this smoothens the migration for
large application bases.

