Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0746FDEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 10:09:44 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id m20so5297732qcx.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 03:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5owjhV3WViKZPfobj/4g+Gh0KpG1DPJO+iRKaNbJcdA=;
	b=ZsdzDa+X71hah9BKU41W5wt//DsN3MkqEVkneNPxV8r2HDjQ66uLBfwvhLcnr5b2sG
	FYh5Gre6BrXlpJLfW7OvsWQKkkPQADtKmGbvyqn65cIt0UFJgHefWKuU3DyrvoJnhdJv
	MT8CeW807xyUwwPCVjBQReGizwYElI7bhd4ZeBnIaCXfUIBFEGZO3Bs3Lx74H4aXT7jS
	YXWMiVo6WJ55yNc9jU3b1siwDmcPGS/8urA5okeGYEADvnJ0ijozKSBXC8qdmH1pAnsI
	Er41ryFk6uMj3eEK0zFebHF+iYx28ODpZlOLChcV5ObLPN9pAjYMefZSHCAWXeKjUsqv
	o9+Q==
X-Gm-Message-State: ALoCoQmhi8EtMG8CuboBupPsVKFU9ybNYOe537ELiylLuHoiHRJt/ruGA8jOxW0ZHxjqyneYteFz
X-Received: by 10.140.27.239 with SMTP id 102mr34173569qgx.59.1412676585680;
	Tue, 07 Oct 2014 03:09:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Tue, 7 Oct 2014 03:09:25 -0700 (PDT)
In-Reply-To: <1412644323-15125-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412644323-15125-1-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Oct 2014 11:09:25 +0100
Message-ID: <CAJTo0La4eAU8KbST6B6vLyxSLNs+df7e__mCdEYy4ssA7mu6Mw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] nss-myhostname: blacklist because of conflict with systemd
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
X-List-Received-Date: Tue, 07 Oct 2014 10:09:49 -0000
Content-Type: text/plain; charset=UTF-8

On 7 October 2014 02:12, Martin Jansa <martin.jansa@gmail.com> wrote:
> +PNBLACKLIST[nss-myhostname] = "CONFLICT: systemd provides sysroots/qemux86-64/usr/lib/libnss_myhostname.so.2"

How about we don't build throw a SkipPackage if nss-myhostname is
building with the systemd DISTRO_FEATURE, as the conflict is because
systemd has its own copy of nss-myhostname in the source tree?

Ross

