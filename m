Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id DB42378271
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:16:35 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id z62so23730503ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=KxvI396EPfNtmo2pvrbG7TUCfgPpuH2T4EHiMIdCu4U=;
	b=TFSORZcBabag4rnNpKkWUqGw8X1oUnW/ONjR8/+/KB3I1eBvVGJNyoMgcEjlmCwPg0
	Tgr2t4MDkNUuiNGsTpYJA7sO8NiDphZOiim1oQTrwFNk6eTFaCFM1nG2S+wBYP/5OfJu
	a6XNSo2/oZLkUvcfJhwSXK83wi9/r+ENI9MJASX2HDA9MovX8Yzhb/KVA9X2WaGqaGun
	F+SOR3WZWpZ3rOvp4nD6IfmUyAq+rkYSkpJJvsKrVuNPkvTk4HfRflO/IeKxnycq+hL6
	zsCH+5k8uBRsEuJlO3zgayrpnwv69vjfsbisOAB5CcQEYaKb6IgFIHeqeuIk0HpoMlXR
	dQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=KxvI396EPfNtmo2pvrbG7TUCfgPpuH2T4EHiMIdCu4U=;
	b=s9cvqjjCCvXAl4X5fcpqHcgUPl/cAIdbFbw/dkZsBLNPzMep4dnhOuoEujyvBHRKc3
	3X0MKpncbAFdV0Cq8U0NwZFhn5LyCv6C9/RFYE1o1gXH2uYlj4LKUJVLhppC0UJ1epUt
	8ngiYppo3ly5OTOcK29VQ0H1Bfz64j5Rscchcw6WBuWNDQZA6UPdqnR0eAq3GyQDP+2H
	mZsQxtQ8M90E+Z3zYhuvjnYeriRf9yTwM16cCdan++8Zg3G0S4+GpiIK3NVW+97utVVp
	iDLaZORt2Kk1gzMs6DBLS8J9y4G2G3jQFyKf+Z/KVIt0HA9toEsboOPKbWhnJiivBROe
	e1dQ==
X-Gm-Message-State: AKS2vOwS+9fN6Ki5OUJCiD5oDnl0u6KcO1vQ0badmKTo6s9ClMjqZgiD
	PmG7Q2dldyfFZMjh
X-Received: by 10.107.11.37 with SMTP id v37mr12851212ioi.39.1498828596735;
	Fri, 30 Jun 2017 06:16:36 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FA66.dip0.t-ipconnect.de. [93.232.250.102])
	by smtp.gmail.com with ESMTPSA id u15sm4155511iou.2.2017.06.30.06.16.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:16:35 -0700 (PDT)
Message-ID: <1498828593.5259.7.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Fri, 30 Jun 2017 15:16:33 +0200
In-Reply-To: <20170630122330.GA17125@linux.intel.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
	<823180ba-066d-747d-8112-a110633a03a8@ossystems.com.br>
	<20170628073121.GA11425@linux.intel.com>
	<CAP9ODKoxxaJv=QZXp5m=Qt14t36n1TPXS19D+Xs3eyrPDG79bg@mail.gmail.com>
	<20170629083942.GA14649@linux.intel.com>
	<20170630083717.GA788@linux.intel.com>
	<1498813333.5259.4.camel@intel.com>
	<20170630122330.GA17125@linux.intel.com>
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
X-List-Received-Date: Fri, 30 Jun 2017 13:16:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-30 at 15:23 +0300, Ed Bartosh wrote:
> On Fri, Jun 30, 2017 at 11:02:13AM +0200, Patrick Ohly wrote:
> > On Fri, 2017-06-30 at 11:37 +0300, Ed Bartosh wrote:
> > > > I'm not sure I understand this. If you don't want fstab to be
> > > changed
> > > > you should not specify mount points in .wks
> > > > There is only one reason to have mount points in .wks: to make wic
> > > to
> > > > change /etc/fstab, which you apparently don't want. So, don't
> > > specify
> > > > mount points and you'll have what you want.
> > > > 
> > > > Having additional option for this looks redundand to me.
> > > 
> > > After thinking a bit more about it I'd propose to have global wic
> > > option
> > > to avoid rootfs content changes. Not just fstab updates, but any
> > > changes. For now this option (--no-rootfs-update ?) should prevent
> > > creating
> > > images if either mount points are specified or --exclude-path is used
> > > in .wks
> > 
> > Why does --exclude-path conflict with --no-rootfs-update? Is that a
> > conceptual problem or an implementation problem?
> >
> 
> I thought that removing directories from original rootfs is a
> modification.

But it's not actually removed from the original roofs directory, right?
For me, "not modified" refers to that and the files in it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




