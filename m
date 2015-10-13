Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 25AAE65C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 16:45:20 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so96681295igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 09:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to
	:content-type;
	bh=aEQwSNM3LS3aGQwcezGEIl5uz+fX4iUiNvd5goftFAY=;
	b=VvRjuWw67pptQ44IsaPa9jssTg2Bpk5lLXwd2FjIH+JMCe6jwS6f/5icafbPSu4/67
	lDPlqHGzHWHTcerWLpzOry2qvzDmXIf8rF72IGAgTJlZt1zX8rs40J5PYwCYBPpi/xFK
	Ajpydjd1Sd3//yElUEF6KaP7Fqo2pTg7l+xFm7Q+krC/3PVUr6oQ3rwZAqJj9gE0sTab
	sitgYzdZ5cmiLvLPOL7M2vbJsNjdkX09acSojf+Ng80XVw1jQGuMnChqewFTNhSBuqqr
	kcoAX3lqFqQFFedq1Q1PYSOsqqIY86ccjcP8I5IGJBHx0Z851P/yDBQ1YtwuEpKkTozY
	rgKQ==
X-Gm-Message-State: ALoCoQkOzgR+yenaL/Z/WYbe0IYg8SBlON6jqtS8aXrxal/xUVNV+FMqhk4sLvaQbpixXvF/h4z3
X-Received: by 10.50.126.42 with SMTP id mv10mr20969369igb.26.1444754720578;
	Tue, 13 Oct 2015 09:45:20 -0700 (PDT)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com.
	[209.85.223.174])
	by smtp.gmail.com with ESMTPSA id 1sm1848972ion.38.2015.10.13.09.45.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 09:45:19 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofl186 with SMTP id l186so27460139iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 09:45:18 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.27.136 with SMTP id b130mr37516438iob.28.1444754718985; 
	Tue, 13 Oct 2015 09:45:18 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 13 Oct 2015 09:45:18 -0700 (PDT)
Date: Tue, 13 Oct 2015 13:45:18 -0300
Message-ID: <CAP9ODKrxCLF1m-UR9_TYQboUQtWODG8erwgnmjFiWd_O57CEEw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: glibc build error when it is rebuild due hash mismatch
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
X-List-Received-Date: Tue, 13 Oct 2015 16:45:21 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

From time to time I see following error:

| /usr/bin/install -c -m 644
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/option-groups.h
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/glibc/2.22-r0/image/usr/include/gnu/option-groups.h
| /usr/bin/install -c -m 644
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/lib-names-hard.h
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/glibc/2.22-r0/image/usr/include/gnu/lib-names-hard.h
| msgfmt -o rw.mo rw.po
| /bin/bash: msgfmt: command not found
| Makefile:84: recipe for target 'rw.mo' failed
| make[2]: *** [rw.mo] Error 127
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory
'/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/glibc/2.22-r0/git/po'
| Makefile:234: recipe for target 'po/subdir_install' failed

and it seems to happen when a rebuild of glibc is triggered due a
change in the sstate hash. The host is a very minimal system so it
explains why it does not provide the msgfmt in host and also might
explain why it is not being catch in Yocto Project AB.



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

