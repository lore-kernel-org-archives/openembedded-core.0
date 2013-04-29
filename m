Received: from mail-ve0-f171.google.com ([209.85.128.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UWlMb-0006T4-QG
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 12:31:17 +0200
Received: by mail-ve0-f171.google.com with SMTP id oy12so1431751veb.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 03:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=uuilvrDTfnD4tT7d1Wu5dlGUtMzjXlCeHyuk5TVbFDU=;
	b=p2U0UNCs8nH3bAyRcyKUrlANLQPtNLvwY6AtxtjtpdrId4HGEh6pvbntVKq9Y052Qu
	s7ZIgcHFfycW22Y7HnVXKIGiIZNQeJP/NTtBlNLR91dZmhhd3cz9mfJd8xSDjcSWoJ4m
	/LoUNCfQ9+y7jm4QmQWZ4+Vf8MCVsykU8esUq7p+uzJzPcuMAfH0C5dgWU8NF0iVMh8z
	0PhBCFpXQLTseAdyrPrvEZ6sIm/sZOFfvD/v/AIJcLTdMk49IsQlk2s1U/SYtBIv/TL8
	thysNZYTHDjroe0uDm/iydR4sRm+j3I4spmwqifgfdumeSX734DmpML+lMNFNetEZF1H
	JvXw==
X-Received: by 10.52.117.212 with SMTP id kg20mr7452710vdb.55.1367230408503;
	Mon, 29 Apr 2013 03:13:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 29 Apr 2013 03:13:08 -0700 (PDT)
In-Reply-To: <56dc88629fbf58c9bfb0427320ac916f79e96364.1367133417.git.hongxu.jia@windriver.com>
References: <cover.1367133417.git.hongxu.jia@windriver.com>
	<56dc88629fbf58c9bfb0427320ac916f79e96364.1367133417.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Apr 2013 11:13:08 +0100
Message-ID: <CAJTo0LbYjdxRw-xWSc-Rzb-mnWB9okVSXsQtoukfLa8P7DUEtg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQk4oSasW2d3Y3Gqkjv2X5beGZlP4RdQp5TN0GiyoUrnET2peE2+aU6f7Bmb4wdlqlHfjjo8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] udev-extraconf:fix rootless X write to usb storage failed
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
X-List-Received-Date: Mon, 29 Apr 2013 10:31:21 -0000
Content-Type: text/plain; charset=UTF-8

On 28 April 2013 09:14, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Rootless X is owned by xuser, the problem is xuser could not have
> permissions to write to the usb storage when the file system is
> vfat(fat16/fat32):

Did I miss something, but why not use a disk group that the xuser has
access to?  I don't really like tying the automounter to the exact
configuration of the X server, especially when this will break again
if the user is using a non-root Wayland session.

Ubuntu can set the user to the current user because as you say, the
user environment is doing the mounting.  At the moment, we don't have
that.

Ross


