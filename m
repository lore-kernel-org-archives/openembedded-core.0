Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyjAw-0000R0-7T
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 14:18:34 +0100
Received: from mail-qc0-f200.google.com ([209.85.216.200])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 05:02:57 -0800
Received: by mail-qc0-f200.google.com with SMTP id l42so416281qco.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 05:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=Ss7knu8K8MWv+MMFts8FsWcnsTAqk+1jE6y3EXCOR5Y=;
	b=G265Ex/xexjyNbmPM3QDrD3jb0sNDuWkw1JBN/1OiyweIeS0SRS177+62Z57K9T8k/
	zy1c0cRLnSl/4lRqHtuVuXFMAO5r5CiholzlibRqTDdHpHVl66Ovx4iwqbYfi9TgqQiu
	IZDfY7njbHVhuA9yDZGeEAJV1CgdwSPhK/Kf4sAT8lr8YsUyt6aSoH4mgPgugawoRE2K
	RLdJ/ztGWUsjBpvBJBS54FODtGs/GxEcO3B1l2T79hoNPcfMEmnRfDwYFKgGGdpDQRkL
	OKnEWKtO5EycnbLKYnnfoXb4auL86ape9QBfMJedGud8u164XWEd3xYM5Hjr4YC78S3h
	vnRg==
X-Received: by 10.52.32.39 with SMTP id f7mr4559041vdi.92.1359118976173;
	Fri, 25 Jan 2013 05:02:56 -0800 (PST)
X-Received: by 10.52.32.39 with SMTP id f7mr4559034vdi.92.1359118976100; Fri,
	25 Jan 2013 05:02:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Fri, 25 Jan 2013 05:02:36 -0800 (PST)
In-Reply-To: <5101F677.4040108@windriver.com>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<dc49f51db3966ad18b51e6c8c10ee792db58bbc0.1359014474.git.Qi.Chen@windriver.com>
	<CAJTo0LYpPTLBFczuC-QiPNm7W5u5nwQHf48SO5BKB5S+nHjHUA@mail.gmail.com>
	<5101F677.4040108@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 13:02:36 +0000
Message-ID: <CAJTo0LZxw31VoAVTwAogEtA2wc=_84+scF631fps1LbGKA_xig@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Gm-Message-State: ALoCoQli1P+jvpoIbXJjeGMGc0ndnpnDwKKLG0cyFlg0kPeh6Dry39ebY1QddAU198gPUl1cLIiDMR9eHUpNBla/gSlvdWUb1fq+aFeYF5DjCuaUjZr24gIbe58mhqe2kj/93dX0cYXDDB4tBvvtvIzwrykhMFQaHIhsidJp13YFCki8wj7t5R8fZlHbI7+wFRfi9aRkDCqm
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/12] dbus: inherit volatiles to support read-only rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 13:18:34 -0000
Content-Type: text/plain; charset=UTF-8

On 25 January 2013 03:05, ChenQi <Qi.Chen@windriver.com> wrote:
> I added this patch because I encountered an error when starting the sato
> image.
> That is, the machine UUID needs to be written to /var/lib.
>
> I'm not familiar with dbus. Is it not necessary?

The file is necessary and needs to be persistent for at least the
lifetime of a boot, so generating it on dbus startup and writing to a
tmpfs is fine.

My point was that the commit doesn't say *why* it does what it does.

Ross


