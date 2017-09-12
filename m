Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3A37840E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:23:48 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8CDNmYQ016822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:23:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1505222629;
	bh=5+uM3gqm7hcrts8ieuV+Vn3zfZDtNiAVH15lldULIjw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=JqN2EeaXfsEghsswfG9DCXv31B11rricBu8RDu22OKkNJEQJA66M6vseH9MJULTTJ
	9yNV7SGaV1dJa0p+5grtv+f4R5I2149ixvIpQDL4z+/dmkoezqvcRtNk5fkLz34zeV
	hGYXbtwNoV2WEA/vR/wPi+5Dd+LJed9CP1iAAbpo=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8CDNfLS021015 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 12 Sep 2017 15:23:42 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 1E2BDB6B867;
	Tue, 12 Sep 2017 15:18:39 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8CDNes5021012
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 12 Sep 2017 15:23:41 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1drlAC-0003Hg-Ma; Tue, 12 Sep 2017 15:23:40 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
References: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
	<20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
	<20170911134150.6jpsypaj4dgjv67t@linux.intel.com>
	<lyzia1fi13.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912085301.rfsiwojqn2nr6md5@linux.intel.com>
	<lymv60fdzx.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912114837.ytzatxdw2cqcwsyz@linux.intel.com>
	<lya820f6u6.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912125720.lj6rwuclmbrd6fx2@linux.intel.com>
Date: Tue, 12 Sep 2017 15:23:40 +0200
In-Reply-To: <20170912125720.lj6rwuclmbrd6fx2@linux.intel.com> (Ed Bartosh's
	message of "Tue, 12 Sep 2017 15:57:20 +0300")
Message-ID: <lyk214dp9f.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.79
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] wic: apply --extra-space + --overhead to squashfs
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
X-List-Received-Date: Tue, 12 Sep 2017 13:23:49 -0000
Content-Type: text/plain

Ed Bartosh <ed.bartosh@linux.intel.com> writes:

> I agree. --size is less suitable for your needs than extra space and
> overhead factor. I still don't like the idea of using them to reserve
> non-formatted space.

Btw, exactly this is done for extX already.


> Any other ideas how to do it?

Perhaps, Logic can be moved into the disk_size() method:

|    def disk_size(self):
|        method = getattr(self, "_get_disk_size_" + prefix, None)
|        if method:
|            return method(self.size)
|        elif self.fixed_size:
|            return self.fixed_size
|        else:
|            return self.size
|
|    def _get_disk_size_squashfs(size):
|        return self.get_rootfs_size(size)

But I did not checked whether this really works.


Enrico

