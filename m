Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id 81FE5605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 11:54:53 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id e12so9371004vbg.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 04:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=gfnW9jlnr4hEZGr6eehhms+x4nAexrZHCbj821GqDw0=;
	b=Gzr3HkGcEr0dfIccgnwluVouYcGOZK0/Sh7AtsmwH+xwrv28ubic6zMbr/7ImWGFOM
	3aLmNFskVy2mGPKbtDSlz/ZQrp8LzYu3ywTfrFRKDThk2RM8xtMDfAACrlpW6l46tIxZ
	CmmwVb8lI//zUN50AAFMg1KdKWp7BCUiUHNEUU4mn+BcEAdru8MbQosge6GB7GbkMl6U
	eDSmPX/kfyebMILhSsKWneodT4V1X5/+5EOYljfSbvzqEOOP4aHTi7sVcfsfC+AIiPfl
	IqRPQVmX0kdXYE/LvxSVOeEWYZlb6XznLemqorFhoCCqRLgGVtKqJVwYb+fCp4citgxm
	hvaA==
X-Received: by 10.220.42.147 with SMTP id s19mr13619592vce.46.1372161294410;
	Tue, 25 Jun 2013 04:54:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 25 Jun 2013 04:54:34 -0700 (PDT)
In-Reply-To: <1372097947-27125-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1372097947-27125-1-git-send-email-paul.eggleton@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Jun 2013 12:54:34 +0100
Message-ID: <CAJTo0LYaEJ5LEZk1sfQai9NfxdKAppcXT-Pvb2cwdLLqWmvrTw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnkNpixVQWResXInYnNwA6VFyle+IBg7vsDFHzNoO2U0gX3NFeRssAKiPh7C8kqZCpSlVAW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [danny][PATCH] classes/package_rpm: avoid bash being pulled in unnecessarily
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
X-List-Received-Date: Tue, 25 Jun 2013 11:54:54 -0000
Content-Type: text/plain; charset=UTF-8

On 24 June 2013 19:19, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> The initial installation step for base-passwd, base-files and shadow
> will pull in bash if any of these packages depend on /bin/sh and a bash
> package has been built, which is undesirable if you are using busybox;
> so force the early installation of one or the other depending on which
> is going to be installed in the second step.
>
> Note: this fix is not needed for 1.4 (dylan) and newer, since there we
> use smart to construct the root filesystem without this initial step.

Merged to danny-next.

Ross

