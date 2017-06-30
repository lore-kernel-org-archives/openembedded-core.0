Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id E326E78247
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 09:02:16 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id r36so20709083ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=21/EvSWug7i0L2sOK9gcByd6XKMAS2ZxR7aqB/PjKUE=;
	b=0RO3KYhglyHzA9T2WivMsefWiv3cMMNyWcWQ3FZQ8mwJ1EhcTOkBPHdWqqSgEI0CBe
	suY8LHgAdmPI2QauPt+NT4WcANfK3/wQ7Nz9XCg7JWjalwmf+FECW1IAQLRl9RtGNhG1
	tSnyyM8ae15jk7Om8T2SdGLb+4B69qBGB9t9Hd3G8n2KuRtuFuv8L0nQGEV9DylPNLTZ
	TuCVj6GVUCBEnYklRpmtB0aS9blIyZLdWZJNfnewLUV875ojyr2bCb2jEBdImD0nagFr
	4C7HK1yj+t0tzdieAiPF2UsLvbi5m9pFuj1mMZsqExDIIc6nEwjPhjJBBL6fstbl7FcJ
	d7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=21/EvSWug7i0L2sOK9gcByd6XKMAS2ZxR7aqB/PjKUE=;
	b=NspmIWfGWF6vJJetHbNVmDKl1jo8I621BVFv0PPndqtOGajngZ8EmlhNkuLDEvn3Ag
	F0PAhC/kI5Jjh7OkDMXuDAmfT4U5hcXywXFaPyNpPMG88LZUNa+JsW4OkrHcdVPpT908
	WdFnNKHKyc3wR4sUUPEEi+x9ZfB2+nEDPYCxnenMzihzxRQ99Nf8KF5MFm1iToD+pT9m
	oStSjrOIX8wZe2xBYuSVnq6MCEG1FjZyST3qTD9I8da30a1MMpc4W+xtVdeNrzZU5I/2
	G4G9eI+ZXTBkf20NtNzLFhTqc0M40km+f+6Y7zffkFFS5s/gYC7//bL/hrf+UrSDmTO1
	x1bg==
X-Gm-Message-State: AKS2vOzXM92PAWsT1SfldCwbpQg93c01yMIjI2K2ivn75PtbuViOySru
	NBHRzmN+aBhUoPv3
X-Received: by 10.107.4.213 with SMTP id 204mr20251383ioe.118.1498813336964;
	Fri, 30 Jun 2017 02:02:16 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FA66.dip0.t-ipconnect.de. [93.232.250.102])
	by smtp.gmail.com with ESMTPSA id
	j21sm1870208itb.15.2017.06.30.02.02.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 02:02:16 -0700 (PDT)
Message-ID: <1498813333.5259.4.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Fri, 30 Jun 2017 11:02:13 +0200
In-Reply-To: <20170630083717.GA788@linux.intel.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
	<823180ba-066d-747d-8112-a110633a03a8@ossystems.com.br>
	<20170628073121.GA11425@linux.intel.com>
	<CAP9ODKoxxaJv=QZXp5m=Qt14t36n1TPXS19D+Xs3eyrPDG79bg@mail.gmail.com>
	<20170629083942.GA14649@linux.intel.com>
	<20170630083717.GA788@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Fri, 30 Jun 2017 09:02:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-30 at 11:37 +0300, Ed Bartosh wrote:
> > I'm not sure I understand this. If you don't want fstab to be
> changed
> > you should not specify mount points in .wks
> > There is only one reason to have mount points in .wks: to make wic
> to
> > change /etc/fstab, which you apparently don't want. So, don't
> specify
> > mount points and you'll have what you want.
> > 
> > Having additional option for this looks redundand to me.
> 
> After thinking a bit more about it I'd propose to have global wic
> option
> to avoid rootfs content changes. Not just fstab updates, but any
> changes. For now this option (--no-rootfs-update ?) should prevent
> creating
> images if either mount points are specified or --exclude-path is used
> in .wks

Why does --exclude-path conflict with --no-rootfs-update? Is that a
conceptual problem or an implementation problem?

If I'm not mistaken, --exclude-path merely means "take this rootfs, but
exclude certain parts". That's in line with --no-rootfs-update == "do
not modify the content of the rootfs", as it just helps with choosing
where content goes (the "single rootfs" -> "different partitions"
approach).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




