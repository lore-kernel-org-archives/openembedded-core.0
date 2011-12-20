Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rd3sH-0002lB-Qh
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 18:53:13 +0100
Received: by lami14 with SMTP id i14so2574632lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 09:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=KkTy94uXJLrDuyyBtcGY9NnsoZeD8NqiKrM0NpULlig=;
	b=aJglEBqhlJRX+2ywvHAYVFBX8pkg0IsgIkNtfMgktExRrp2598DcFpWcXUFwFtGf+y
	ARfc97IF7CfpGIsz6JL/IVAnoxcy3PH28dMmC/w+UtvrQBWI6JN3/sJ9JykoV09UP97G
	AVp+zp+ZSz0gCQFfNaFhPYTWSqO3mpeISwaJI=
Received: by 10.152.128.98 with SMTP id nn2mr2948434lab.14.1324403169359; Tue,
	20 Dec 2011 09:46:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.10.3 with HTTP; Tue, 20 Dec 2011 09:45:38 -0800 (PST)
In-Reply-To: <20111220161504.GA12791@jama.jama.net>
References: <1323851280-6342-1-git-send-email-raj.khem@gmail.com>
	<1323856946.25491.31.camel@ted>
	<CAMKF1sqLHP1cWfBswrqnwhAPj4Tt3XCV8GpQv7Dm71PX3F=rAw@mail.gmail.com>
	<1323951419.4568.17.camel@ted>
	<20111216212424.GA28832@sakrah.homelinux.org>
	<20111220090753.GC3946@jama.jama.net>
	<20111220093733.GD3946@jama.jama.net>
	<20111220161504.GA12791@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Dec 2011 09:45:38 -0800
Message-ID: <CAMKF1sqf6qFAD75F0Ya7qG0X0HSVCL8Ati5TtVMzafztRat9aA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2011 17:53:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 20, 2011 at 8:15 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> maybe it's because something was reused from work-shared?

its because --sysroot value changed. I think its getting it from sstate-cache
probably we should ignore --sysroot from the sstate-cache


