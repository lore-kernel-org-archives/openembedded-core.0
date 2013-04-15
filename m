Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URliv-0001uH-J3
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 17:53:42 +0200
Received: by mail-vc0-f180.google.com with SMTP id m16so3969126vca.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Lc9pa/SIV8vyK4OHiuXvZmpriN923xEoNBvVbKHsifo=;
	b=komc/dUjXX4/y8UcXiV0RImybQdMjRPfFEy2iRyASENy6r6OFD0mc2ZSSpPzOHRe7z
	nj5//dWtgChAltQwEW+b7J31qF5aI5bmrihHSMRJxOfpPcIiGiCl5sy/IV2ckg1dWGTd
	aTE0Ukx7U2s1XHdjvOeoQxNw4EtM2XHllYoVww4qiJylXqlhGwlhf2dCvZHP3fxoSB3j
	YieHKf2DWgSze+0oYd8wXtZwjPEQD84GRWlHqq5u9L9PCleb5V6687V5h5nU0wWkQ1aU
	gUwTqsvF5c3765XMVPbd+aTdA6+BZvTa1xsClYrZvNkOjclz9t7i79bXTmWpL+Pmdzkt
	cEZA==
X-Received: by 10.220.119.200 with SMTP id a8mr16423366vcr.38.1366040172192;
	Mon, 15 Apr 2013 08:36:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 08:35:52 -0700 (PDT)
In-Reply-To: <341AED6F-8BBF-4203-B5D0-6F215C8E7F14@dominion.thruhere.net>
References: <1366020744-2958-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0Lbcv-GkQs-PWoW3mtJWzfp_WuNbwU=A1NVd9R7-=uF0tQ@mail.gmail.com>
	<66033B10-A10A-4660-85F5-D06E1B9C21D7@dominion.thruhere.net>
	<CAJTo0LZWt2W2w5FvOcPsh5OnrGWcnFCR2mjzYDWCkq8K7etJ6g@mail.gmail.com>
	<341AED6F-8BBF-4203-B5D0-6F215C8E7F14@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 16:35:52 +0100
Message-ID: <CAJTo0LYtwVYHNcTc=oKC0-nqpogR6UKVHdg2Pw7ex56j=o6GJA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkKhJ4hdDTL6rUuZWuqAt2ObdfmpTYwo6heTh6GTV2cXd3g6sbNxchrH+n8ZAl/+wpvUGI3
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: remove udev-extraconf from RRECOMMENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 15:53:42 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2013 16:31, Koen Kooi <koen@dominion.thruhere.net> wrote:
> It was deleted in favour of systemd.bb providing udev, angstrom hasn't udev the standalone udev since it was merged into the systemd repo.

Right, makes sense.

Ross


