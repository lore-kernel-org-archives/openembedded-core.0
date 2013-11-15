Return-Path: <kirgene@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2336D767
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 13:11:15 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id i7so2059203qcq.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 05:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=TWJp5Kn+gD7AczkRRJpAj8ubMuvB3SjnsFeV9Durh3g=;
	b=CHREJ+s9T5Kha8IBTSmbpeQ7QYUzHkob2hkbssnt1nE/zFiBgT3UDNGJoCVxfaD9V4
	elzkNG/WXV5F23v6EoGVKXHbPwOH+ruRhT5oOKg8oifhClEKj46pcahwIl8/qDb+UyGD
	aSHoe1cdRQTRicM5ww7pS3ETiDQIT6GWkLEy0lQwZwm3R9ruy3DWd+/h/pnY0gDAD8Q6
	hHJJZEqbUEBN2KSzw2BlZRYD4KEw6Pn8WsoK923s5Tibbpy9eT2ANAdHROlD8ECxvwdR
	kiQ+KSSmIXVSGvMDuuHpNAVBuqysrdg9lhYM50eMPSYvG6spNdbV85Eny6RYVsUR/XoL
	sxuQ==
MIME-Version: 1.0
X-Received: by 10.224.7.10 with SMTP id b10mr10768350qab.12.1384521077386;
	Fri, 15 Nov 2013 05:11:17 -0800 (PST)
Received: by 10.96.55.197 with HTTP; Fri, 15 Nov 2013 05:11:17 -0800 (PST)
Date: Fri, 15 Nov 2013 15:11:17 +0200
Message-ID: <CADV-EXEqygBs7=WWcvO5GbjDkd-a2qGzyzGuQKdtUP7UAj=mBQ@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Continuous kernel rebuild after upgrade
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
X-List-Received-Date: Fri, 15 Nov 2013 13:11:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/11/14 Yevhen Kyriukha <kirgene@gmail.com>:
> Hi,
>
> After upgrading oe-core and bitbake to the latest revision
> (616354f13732d13c17434d5b60b166f691c25761 and
> 616354f13732d13c17434d5b60b166f691c25761 respectively)
> I'm having broblems building my kernel.
>
> Kernel rebuilds everytime I run "bitbake <some_recipe>".
> It starts rebuilding from "do_unpack" task.
>
> I noticed interesting things:
> If I interrupt the build process and then start building again, kernel
> is started building from the point of interruption.
> But if kernel building completed successfully then next time when I
> run bitbake it starts rebuild.
>
> My previous version of bitbake and oe-core are
> 565b3e31e0226c6e193ee0b031bd5e7bef25591e
> and ae28ee3f7a060b9e0d13154a84f2444a98490b5b respectively.
>
> Best regards,
> Yevhen

Here is error log of python build script:

http://pastebin.com/EvPuYSQE

Best regards,
Yevhen

