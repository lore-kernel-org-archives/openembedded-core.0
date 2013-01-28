Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tzubz-00089u-MB
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 20:43:24 +0100
Received: from mail-gh0-f197.google.com ([209.85.160.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 28 Jan 2013 11:26:33 -0800
Received: by mail-gh0-f197.google.com with SMTP id f15so4397332ghb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 11:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=cl5NULCfYSs4K7BbJAtkZhWGItOZN+fqJZY/kvKqkZs=;
	b=jS5G731hXl0w8cO3ktLzMoGFlSvfi2UBT5dmrYCL3YM5EjV/aetwlIOABwiBm3NO8x
	g/b4+b0pe3YEdzV58jsiqdAQEiut2uIa7CWsw9UTL0kBkEdKrFxBS+yVMWRxKuBPuMb5
	9TBWNqB6hl7XFce8KtD/V7f9fvuS//n2n4fRwZK1gLGfIXvNdJnRoFXFNwm7B7AKZcHA
	t7c/tqT42jK4nQ6bvJooBJo3zlRwXPZ1h6AOxPzIsWoRijqAj5r3ARHjrwihaqyQ7FO3
	EXGFlgFGHOTxmYcZlZkCI/a2ZECqL0p9W+u0nIjBPqjZvShZw6Gh4NMu9V1PtYQtcJi8
	PSbw==
X-Received: by 10.220.106.133 with SMTP id x5mr15898889vco.61.1359401263176;
	Mon, 28 Jan 2013 11:27:43 -0800 (PST)
X-Received: by 10.220.106.133 with SMTP id x5mr15898878vco.61.1359401263050;
	Mon, 28 Jan 2013 11:27:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Mon, 28 Jan 2013 11:27:22 -0800 (PST)
In-Reply-To: <20130128182717.GF16904@jama.palm1.palmone.com>
References: <CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
	<20130125193456.GE16904@jama.palm1.palmone.com>
	<16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
	<20130125202657.GF16904@jama.palm1.palmone.com>
	<CAJTo0LY77_koWo9=y3cYcJo+43-tE7_txf6uW0_pqr7hSi-QMA@mail.gmail.com>
	<20130128182717.GF16904@jama.palm1.palmone.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Jan 2013 19:27:22 +0000
Message-ID: <CAJTo0LaLw8Z+QizuObvx_GL-dqUe0kSOr2JhQsMmVnj62zG0rw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQm/riqlcMp2D6juNZzNFkBB/1shxzMko6bvlQyAPhOnVYdio8ObxyHuv+pNbktdRtrPcAh1MudQz2wlkp7K5ZIhPwB/hPEtrZcbSrIgLEimpE3EIAwX67O/MfQwu/sI6FAs2iVZUKXWduWeQ9jWNZfyyibwRm1bnbR/VBq9/MoT9bydI46b5j9E/eTHeQgzHipaZ3kn
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Mon, 28 Jan 2013 19:43:26 -0000
Content-Type: text/plain; charset=UTF-8

On 28 January 2013 18:27, Martin Jansa <martin.jansa@gmail.com> wrote:
> So I guess upgrade path from meta-systemd won't be ever provided (e.g.
> with RPROVIDES/RCONFLICTS/RREPLACES combo).

I'd prefer not too, but if we have to we can.

> I wouldn't mind PN-sysvinit, PN-upstart, PN-openrc

But what's the point when its a distro variable? With systemd daemons
are actively making code changes instead of it merely being a
different init file, so an image feature just won't work.

Ross


