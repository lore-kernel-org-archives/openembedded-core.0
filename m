Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UbptD-0005Qa-MM
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 12:22:12 +0200
Received: by mail-vc0-f171.google.com with SMTP id m16so5268048vca.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 03:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=AI1QbzCtFHxkPCof+ycoXB2/1lQ/jb4o7W9131L06/4=;
	b=ShQ40owwjBEObAb/n5lQnAz+1zUduFv2czBIgR/SX0afMErSY5mUlyXbdoUE16UuKm
	31l6BgxDYn/KUT/a7TbJKzx9EFyyljqF9qJajUi6kXPTvrqLlU81TLbankR1x4LKPpQR
	WkF/WkVUx1z769WjfYNaqiQQJCOnd1CK3uSBHWYGvDu/JofWXJBk1FR+KPS2uu0LPR74
	LHwSfny/jpBTV99y/9J+9rGNRjJ9yksXvbxBxstimpWbpTvAkgfgJbMaTMs3Lxwekiov
	nez1mgHY1Pj5A8Kv+y+RmrEfEX26qXHRt6ANQP8FkAA7Zvy2kUF08U9RZExhgvRxqjb/
	MMbQ==
X-Received: by 10.220.191.129 with SMTP id dm1mr3766508vcb.54.1368439425873;
	Mon, 13 May 2013 03:03:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 13 May 2013 03:03:24 -0700 (PDT)
In-Reply-To: <-7685674658700664845@unknownmsgid>
References: <1368413938-7757-1-git-send-email-net147@gmail.com>
	<CAJTo0LaFExB-DxJCJ-Sranagpbxc56sT9ahBwgtBLH0PVq3_9g@mail.gmail.com>
	<-7685674658700664845@unknownmsgid>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2013 11:03:24 +0100
Message-ID: <CAJTo0LaVF+sV6JxpaxfL2_daoP+y1CQe=-VqWbTFW+ZVNA8i5Q@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQme8RdpXD0rtPej3gdTJSoK+/p4zg6A9Gl/HWa05w0ptglaqi6ILi8P3miNqFWq14KEbQMU
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] connman: add iptables to RDEPENDS
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
X-List-Received-Date: Mon, 13 May 2013 10:22:28 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2013 10:23, Jonathan Liu <net147@gmail.com> wrote:
> I did a git pull which updated connman to 1.13 and rebuilt image from
> scratch clearing all temp files and work. The iptables dependency was
> missing when I checked with opkg-cl on the target.

I really can't replicate this - my connman packages just built with
latest git have a versioned iptables dependency from the link.  Check
your do_package logs, you should find lines like this:

DEBUG: connman: Dependency libxtables.so.9 requires package iptables

Ross


