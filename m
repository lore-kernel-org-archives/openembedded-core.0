Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id B33F07DA5D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 06:26:53 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id u131so441619vke.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2019 23:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hnKEd6B60p5WRLRAUzX2BSHFUYMBvPALt6QcDJ3pAH0=;
	b=cBJduADB0h02ESpesxpqrKaWiBgy+ZUoKtjuJTMupyXeSkQFVdyz/7a7P8zIRZLCu2
	Tk6Kbfkr+1ipuPTE5LP29zCJeW/t2Nkz/vjG/AtJqLqpAPBxFQPbXuJ0NMbRUS6PNmsc
	fX3B0xBcDpet14SrpjE0gtjwFFfSn3AFZtHy8X5Kj9xfhV0f7e432U8rlkTjHf4i+qc9
	pkpeW6tw/aIFuM2nW1seAQYLjylFqrzPrx7eFr9SGTyiA3kkSHeosTpBn5B13cQ0Py58
	0XVIGh3Yy4WyJob61TO4Q6VgzIWoQYxv7AID1y403sjNWaUCOk3Q2hFBOwNvFe4DuBru
	hkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hnKEd6B60p5WRLRAUzX2BSHFUYMBvPALt6QcDJ3pAH0=;
	b=nukb7l/VJsj51VskWF/Y/d5u99iMnogGptKJ0yrTr5mQOrL8PHWN3wG8cVafBX10dy
	ugoi1zGSpvkT23cL9Z9y3cVmMx2w5lk7a9i7TXrECeg9v9x0HhLQSa5sm9FueJXP0uQS
	kXaMGRDIteWG/9PLv3MpFuFhpwPc7T/NJUwCtAjGd3GDPVYSJAnjwa362IW4UgOI9VQ3
	cKtS29lZuEmPiponDFxtebEmtO27GBvVevTj6tTvA8+lXO15BxRsrs1Fm7KaNRNEFCO5
	9k48C+TFMJg9Ni2RvkPosWgvkO74c4ehhNZvr2XLpEIvVRRYo9q3PRhN9+OFsyz/E/FH
	nsxg==
X-Gm-Message-State: APjAAAVL5CW/SIR83jmHfwloUa5IZZWQOFiPPPTpofxYMl1/JNJubfMe
	O/oMUD3Seqki7cMCjabWeRcyBaelKXx4PWmXhUY=
X-Google-Smtp-Source: APXvYqzdgIjCQJ+X/hml+um50HjAL734dqiasTLlUEtGo2BCCbt2AjEutRojCAq1Ck5eQSsYYL4BsGb1WAu/MUdmeEg=
X-Received: by 2002:a1f:8708:: with SMTP id j8mr21654120vkd.64.1556519214498; 
	Sun, 28 Apr 2019 23:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190128205848.12834-1-jonas@norrbonn.se>
	<2acd4017b1a5bf6882bb54e2e559588b7d8cac67.camel@linuxfoundation.org>
	<eca0ac37-bd7a-b3d9-55a9-937215963f31@norrbonn.se>
	<ddfc998a62b9e3b4ae346a449845e5341cf0a3e2.camel@linuxfoundation.org>
In-Reply-To: <ddfc998a62b9e3b4ae346a449845e5341cf0a3e2.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 29 Apr 2019 07:26:42 +0100
Message-ID: <CAO5Uq5QPtZP6KvyAbrJ6J7pfwA=yHmx-mHz6o0rs2JAxNGyaYg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/6] systemd patches
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
X-List-Received-Date: Mon, 29 Apr 2019 06:26:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 31, 2019 at 5:33 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-01-31 at 14:19 +0100, Jonas Bonn wrote:
> [...]
> > So with that:
> >
> > a)  Does buildbot use connman, systemd-networkd, both, or something
> > else?  How do I find this out?
>
> We're building standard poky so there are no non-standard settings,
> other than for those images, enabling systemd. You can see the
> configuration and revisions used in the logs.
>
> On the host side, the autobuilders are configured with static tap
> devices which the user running the build has permissions for.
>
> > b)  I'll poke at the patch series again once I get a working
> > origin/master build so that I have sane state to work from.  The
> > systemd patches work fine on Thud... I suspect the problem lies
> > elsewhere.
> >
> > c)  Are others seeing similar errors with connman?
>
> Our builds work fine with current master, as soon as we add the patches
> they break. They break even with just the machineid changes. I haven't
> looked into why, I just know our regression tests go red with your
> patches :(.
>

Okay, I know what's going on... the issue is there's new services
enabled which weren't enabled previously, including
systemd-time-wait-sync.service which fails to activate because
systemd-timesyncd can never get time as we've no DNS server.
systemd-time-wait-sync.service then gets caught by the test for
"systemctl --state=activating" returning an empy list of units and our
test in settle() fails

The reason the machine-id change trips is because "systemctl
--preset-all" is now being run, which enables these services:

$ diff pass fail
0a1
> /etc/systemd/system/getty.target.wants/getty@tty1.service
2a4
> /etc/systemd/system/graphical.target.wants/console-kit-daemon.service
11a14
> /etc/systemd/system/multi-user.target.wants/machines.target
14a18,21
> /etc/systemd/system/multi-user.target.wants/remote-fs.target
> /etc/systemd/system/multi-user.target.wants/systemd-networkd.service
> /etc/systemd/system/multi-user.target.wants/systemd-resolved.service
> /etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service
18a26,28
> /etc/systemd/system/sockets.target.wants/systemd-networkd.socket
> /etc/systemd/system/sysinit.target.wants/systemd-time-wait-sync.service
> /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service

Which shows the problem where I came into this - images using systemd
currently don't get systemd-networkd, which is unfortunate if you you
were using that for your networking.

If I compare the list of services with the systemd 242 changeset
reverted, the list is rather more reasonable:

$ diff pass.241 fail
3a4
> /etc/systemd/system/graphical.target.wants/console-kit-daemon.service
25a27
> /etc/systemd/system/sysinit.target.wants/systemd-time-wait-sync.service

If I disable just systemd-timesyncd.service with a hack in systemd:

$ git diff
diff --git a/presets/90-systemd.preset b/presets/90-systemd.preset
index 11960e54236a..75636134c835 100644
--- a/presets/90-systemd.preset
+++ b/presets/90-systemd.preset
@@ -18,6 +18,7 @@ enable getty@.service
 enable systemd-timesyncd.service
 enable systemd-networkd.service
 enable systemd-resolved.service
+disable systemd-time-wait-sync.service

 disable console-getty.service
 disable debug-shell.service

Then the tests work fine with systemd 242 and this (rebased) changeset.

What I've so far failed to figure out is why
systemd-time-wait-sync.service gets enabled since I can't find a
preset for it, and as far as I can tell it has to be coming from
systemd. There's https://github.com/systemd/systemd/issues/10253
(which is closed) in this space where there's a reference to
systemd-time-wait-sync.service in there getting enabled, so I think
this has to be coming from systemd.

I could post the rebased changeset with the above hack (which would
fix images expecting systemd-networkd), or wait whilst I dig into
systemd to figure out what's enabling systemd-time-wait-sync.service?

--
Alex Kiernan

