Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 955F07CBDD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:13:13 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id s16so2259539oih.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Wih1ty3m4WfD659ioPzULMR9hJeCNWh61o6VMIC5tAc=;
	b=nELQj0m+ESmqYyztUd/Lpo8sE69nSTcaAo65R5AWKcugM3YsNXb8g18EKTrbQAUnBd
	Wgc8uA9z+mCPZEDbOBCf02N5Ti6GVrfem09BiEBSohlLdOBjFO03wlfobCqvThDOB2dl
	xXEsKSXo1TvtNcI16LYDVk5KGbTREmHyje81I5gxVuQ5rbzfXvx/zHMIaXBgUutKWmOY
	gBQWsZcnO/avjLF6BIjy1Y5EemV5NaZHOWDksfcIgO8UN8j3q8jNWqOOrvrkyEtaJOPc
	5ELfaMfGgoWOW01FtnJ7fyePLZ0fSDCu+KbqDBLb45Hq/hIEM0lXU7Ekkredkze2TEjE
	ihEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Wih1ty3m4WfD659ioPzULMR9hJeCNWh61o6VMIC5tAc=;
	b=RgDHm7jTpF+62cr4zuty7590fHjpVsjpEcoGo0RB2wsdzrk5iRnIE2CqjE+v3iZJj/
	dGirRC011sHaeE2bkEL72JjkSuWM049wu+jTB05pAHoPqUOFCc6tdBcvtAo7HAwRwSFD
	Ua3wMCq+aZEh3VXM2FvrnWof2OnowO48kIKtP+f/xRv61e4V3b7clxUwvtbIKyuXsN00
	ONWvSlYcMu2+wqSpn3ysuhSKH7AvzNIcz32B7rR1ioSbn7OwNT3m4XUct9jvtkZCHbT/
	k8f3qdGIW4N6wnFRAwkow4p6CB+KLVg1JVFbbdzKfpTAeM/T9P2GmGRvmK0CNyi5Ubpf
	mTyA==
X-Gm-Message-State: AHQUAuY3ZAdlKcIl7xfrF+heN8+qiZ9gcunPJwZ8VzFYDpTy8tHXELtM
	HcWbV6MYm17CFtoPvqjMBlnw9vBnIpsONN4y7g==
X-Google-Smtp-Source: AHgI3IYFOSYld7C8s2/iSVHHT8D6WO+RN9Iu2Gip7Yjt9Ra9afIsd/VqXVK8HCNGOvnDrVGW9zGIpyeJA3YpYsITiG0=
X-Received: by 2002:aca:fc06:: with SMTP id a6mr3205954oii.0.1550855594374;
	Fri, 22 Feb 2019 09:13:14 -0800 (PST)
MIME-Version: 1.0
References: <20190222165450.30773-1-george.mccollister@gmail.com>
	<CANNYZj-Fx7W5MKb8hp9F5mPC05fhxq1S56_F9-PDr38yK1ofVw@mail.gmail.com>
In-Reply-To: <CANNYZj-Fx7W5MKb8hp9F5mPC05fhxq1S56_F9-PDr38yK1ofVw@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Fri, 22 Feb 2019 11:13:02 -0600
Message-ID: <CAFSKS=M3WckCq3mwaMVWUoo6HaBOR1tBbMyYrg5nJw6=E_0XZQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix CVE-2019-6454
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
X-List-Received-Date: Fri, 22 Feb 2019 17:13:13 -0000
Content-Type: text/plain; charset="UTF-8"

I believe this was discussed before and the recommendation was to wait
until 241 to be release. In any case I currently have no interest in
upgrading it. My main motivation is to patch this CVE in sumo but
maintainers seem to want it in master first (even though different
version of the patches are required).

-George

On Fri, Feb 22, 2019 at 11:04 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 22 Feb 2019 at 17:55, George McCollister
> <george.mccollister@gmail.com> wrote:
> > Apply patches from systemd_239-7ubuntu10.8 to fix CVE-2019-6454.
> > CVE-2019-6454 is an issue in which systemd (PID1) can be crashed with a
> > specially formed D-Bus message.
> > +
> > +For information see:
> > +https://usn.ubuntu.com/3891-1/
> > +https://git.launchpad.net/ubuntu/+source/systemd/commit/?id=f8e75d5634904c8e672658856508c3a02f349adb
> > +
> > +CVE: CVE-2019-6454
> > +Upstream-Status: Backport
>
> It would be better to update systemd to latest upstream release, are
> you able to do this?
>
> Alex

