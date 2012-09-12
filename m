Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBnqY-0006oi-2W
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 16:23:18 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 12 Sep 2012 07:10:41 -0700
Received: by obblz20 with SMTP id lz20so2689459obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 07:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:cc:content-type
	:x-gm-message-state;
	bh=YNTFzr9yaU06SFHCrSxW1Iw7+bclFVRrWcN0HgmwNEc=;
	b=PtgZqa1KPhPL90fNtTBDfgDTxMTFQQ6c8yTAmbbH5wGZnnGZaVIu2yJVBVIqp3dvrD
	5ZNtKLzZP+3bXslnnmjGELxxGJNy5zR+STwc5a7a6RfoQJfHgrgvzvxqzcxiSMWEHMW8
	+N6NMDLzSLfgcdk7/RQ8sVhnrz8lHgYZo/7QozBExZELaln9GWVUr+dECQkw4HAOtj2X
	M1iSRF8ni3jx4Jh6OamMBCHcsth6BrjguEKsZj0pQUw/6Pm24jLvlfFE/fq+LVlza8SG
	XZAXHexhcXJK5gyZ8IXHH2VBN+E9duvvAjzR4CTOjjDgxmqqDoRg6HYrFmmojHwyd0ET
	xApw==
Received: by 10.182.154.70 with SMTP id vm6mr23136680obb.50.1347459040671;
	Wed, 12 Sep 2012 07:10:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 12 Sep 2012 07:10:20 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Sep 2012 15:10:20 +0100
Message-ID: <CAJTo0LbTipjuhpvyxgL1Z=WTn0yHNcLB4tQqcQeXCUth8ygWkA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQkEAY/w8kvG3FrqBPEDBAm8KmbREgiZmokGOErzvmSTW0HgucHSGv2/VSQDen0GK+eccz4q
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: libx11-diet removal
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
X-List-Received-Date: Wed, 12 Sep 2012 14:23:18 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2012 14:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I don't think there are many such users so I've merged the series. We've
> had this mess around for a long time, keep talking about fixing and now
> someone gives me a patch series so I really just can't resist ;-)

Thanks, Richard.

The final question is do we keep libx11-diet?  It is substantially
smaller but the stubbing does knock out some non-deprecated
functionality - as far as I'm aware both GTK+ and Qt fail to
initialise with libx11-diet.

Two options:
1) delete it from oe-core
2) whoever actually uses it can have it, moving it from oe-core

I'll do (1) soonish unless someone speaks up in it's defence...

Ross


