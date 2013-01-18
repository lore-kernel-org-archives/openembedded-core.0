Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwBJ5-0003Tg-9r
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 13:44:28 +0100
Received: from mail-gg0-f199.google.com ([209.85.161.199])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 18 Jan 2013 04:29:01 -0800
Received: by mail-gg0-f199.google.com with SMTP id v5so957728ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 04:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=2i0GzbThucKDiAnuFYQ34LnYbY3c7jLZ9SvClItkkPg=;
	b=DUfttkXnIAPSIinT4rSO5XzGx6ZAKN0Ffu/c3pgEmeed2IEfwHs2IBWuQMqBMTwD1T
	S2GRrr4ylsGVpKomDSKxPDWtJr6TdILxOF4d/TNDi3e/2RtrAO5C9LBisTraPG0cRG21
	zROppOcVhpTpSMe4Gorijgfd676Sw9h3/gefu1sfyicX34aLJ9x/N4Om+aVTW9KHhJz5
	LmSd5gBeH1If6/oRbUPNStei1IqkhoAV97esaA5hrXTBFN0PfaCCY/sVkh72UmYs52o+
	cBJL0Zg8w4z50BPr1dy4ITNptBzemwAfy+oI7b43+rCdm49GvPlO9WcwFV5Ngf9yu3m6
	DUsA==
X-Received: by 10.52.17.70 with SMTP id m6mr8152957vdd.92.1358512140415;
	Fri, 18 Jan 2013 04:29:00 -0800 (PST)
X-Received: by 10.52.17.70 with SMTP id m6mr8152949vdd.92.1358512140317; Fri,
	18 Jan 2013 04:29:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Fri, 18 Jan 2013 04:28:40 -0800 (PST)
In-Reply-To: <20130118122314.GA23233@jama.palm1.palmone.com>
References: <cover.1358509450.git.constantinx.musca@intel.com>
	<3e9e32d745fa7a228acfcc04aac62e084e0540cd.1358509450.git.constantinx.musca@intel.com>
	<20130118122314.GA23233@jama.palm1.palmone.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Jan 2013 12:28:40 +0000
Message-ID: <CAJTo0LZGCdEPSAhCATzdsEGGwyoy=em4C-iE98VmHaxJJyetVA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmvThPvtBw8BmHpqTVrRqThnV6QcI0x/sfZtVqorqn97y48IrQRDYvezAUg+PlOK2d5TX0yrKafhg68q2zBSS9uWleFPY5DRcZLXQ1AAjVgzWcwx3AT+Nn5stKEigL9TtVDttRIgtpLwOx0/9GZcoV0X//Xz3humHJGOBVZApkpkHax5OuHcH+Q7cwXhWDcirm0ExRk
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] packagegroup-core-gtk-directfb: rename to packagegroup-core-directfb
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
X-List-Received-Date: Fri, 18 Jan 2013 12:44:41 -0000
Content-Type: text/plain; charset=UTF-8

On 18 January 2013 12:23, Martin Jansa <martin.jansa@gmail.com> wrote:
> It's also possible that someone still with task-core-gtk-directfb-base
> will decide that now it's right time to do upgrade..

And if they get a seamless upgrade to packagegroup-core-directfb which
doesn't have GTK+, they'll be quite surprised.  The contents of the
group changed, and not in a trivial manner.

Ross


