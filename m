Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGhlU-0005gX-1w
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 03:17:32 +0200
Received: by ewy5 with SMTP id 5so1608350ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 May 2011 18:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=qC8ys2TEc+BxQq7+1U8lBD+XgAlqmw1VIghg9R3vIT8=;
	b=oNnmHJ9vhA6iGJ4iQWXL5gtRoX02qthHbJ9kqRL9cRDwXplChmnFtkbVKMjLMp++Js
	z2uMO3LHweWeN8ScKE08bOUnCQ7ksciZ9xCpBaenNgLLbIq3dKRCoNphC9GaYJmu8ToJ
	3KUSDjJ3dxT9RMv/Mpy3rwwLiK86rRvp8+0SI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=qCXkDQE1UTlytY5agORuxAW+U6O4I61gwiO77+Zu5DdmucIqD/vA4LbVWfgXRpZWXz
	ImSGbb9Y0he/F+WLZ5igviPyDCmwvOx6+FrRbldXE7Vzn1ohPVbDN81L3GobzYojBxCU
	LSl7Rq4SizGe+ELdQJfrSCMmXeKgfLrdK4Mko=
Received: by 10.14.125.4 with SMTP id y4mr3109095eeh.109.1304298895448; Sun,
	01 May 2011 18:14:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Sun, 1 May 2011 18:14:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 May 2011 18:14:25 -0700
Message-ID: <BANLkTi=9fddo=qaHhom4cw9mBLrNP1rs8w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: How to patch yocto kernel
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
X-List-Received-Date: Mon, 02 May 2011 01:17:32 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I am trying to test this patch

http://uclibc.org/~kraj/perf-tool-Fix-gcc-4.6.0-issues.patch

to fix the build using gcc 4.6.0 but the kernel patching for yocto is
not as usual as other recipes
since it uses entire set of tooling around it.

I tried to look around for documentation and few references I found

https://wiki.pokylinux.org/wiki/Wind_River_Kernel

discourages putting patches in metadata. and in another document it
says it uses git to do patching but does not explain how.

So if someone can explain in simple terms how to patch a linux-yocto
would be really helpful from a
developer POV or any documentation will be helpful.

How do people develop/test patches on linux-yocto I understand
eventually they are desired to be part
of linux-yocto git but that comes after they are tried and tested locally

I would have preferred to have the usual SRC_URI patching atleast for
local testing. As of now
it seems not to use normal OE recipe procedures.

Thanks
-Khem


