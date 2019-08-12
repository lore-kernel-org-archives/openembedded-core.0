Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 375C57E553
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 15:32:53 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id v15so12587649wml.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=H26qji6oIPyrKYseaLXPSPn1kUwg34jFs9zlVTWQG04=;
	b=NTgcLsrrG2QY2l0qqO5laE/8G8GJjZaQv3q1VbqEkhj/p/440TUogntEiAb6i8smNK
	+ocEBxvD8AATmmeZMxtUjkqkoKM0z1cb9RVOpxrhp5bcdzge6DYG7eC9gp4OeaKjE9mp
	X3j/9+ds/XDUucZu8YDLJvY1Mou0nZoj4SP2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=H26qji6oIPyrKYseaLXPSPn1kUwg34jFs9zlVTWQG04=;
	b=QAIIg4Zqp8nOfk2EJBgMfAm+ShCuKbhbKTunqEhLNcvLNyWGddUrbHJ1vvoVSiNQop
	Uq0UA7N5tIkYaYoB9LI/Nt7NTLc3mH/fulZUXiU/PGBDLPy+qqO79hY/Lh5ZapVcwDog
	TEkgc7fCXzjWNiCl8m4fgH/7m33uWtrFiseb+dYwheLJakb64u3MC7fxUd5ESMFlUELD
	8NxE91p2WpFkTeIY/aZ+1HhWvWzaJZ/uo//BIlNGC2LBAqA3Y/JuhJnTlzlVhSF6FYPp
	751+zgwdiFCG9VLdkHTZdGxs6lbOKA9B2RhXKzFKKwaAHI87N7Vxl/sAUeEbcYmhmVaF
	w3nw==
X-Gm-Message-State: APjAAAXqai7zYtd4QTn4NUq3rp0xzLP8w1dHVkBJfmhWsKe5MnujRxhc
	RWvKfbpZuNpnEditshH5jw84NA==
X-Google-Smtp-Source: APXvYqzz68sHBayGybflS6FS++NkXl10XpkGP7q5H4Rykv34JsM+xJBGit5Djl50B7ADcBOkToXe2Q==
X-Received: by 2002:a1c:9696:: with SMTP id y144mr28260412wmd.73.1565623974015;
	Mon, 12 Aug 2019 08:32:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q18sm131871649wrw.36.2019.08.12.08.32.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 08:32:53 -0700 (PDT)
Message-ID: <57ae67cb61919ab6416b555fdd8a3ef323737721.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@mikrodidakt.se>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 12 Aug 2019 16:32:51 +0100
In-Reply-To: <1ffd556dac8fdc3fad8db8391b2b5a5f232d7331.camel@linuxfoundation.org>
References: <a3cde6526f42e115340654402a3e89bed42facd8.camel@linuxfoundation.org>
	<3d17555f-62a3-ecfb-45be-afd08cc1156f@mikrodidakt.se>
	<1ffd556dac8fdc3fad8db8391b2b5a5f232d7331.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Joshua Watt <JPEW.hacker@gmail.com>
Subject: Re: Hash Equivalency - What this means for developer productivity
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
X-List-Received-Date: Mon, 12 Aug 2019 15:32:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-09 at 00:12 +0100, richard.purdie@linuxfoundation.org
wrote:
> I've just seen this with dnf on the autobuilders and an rpm build.
> The most interesting bit was:
> 
> [pokybuild@centos7-ty-1 temp]$ pwd
> /home/pokybuild/yocto-worker/genericx86-
> lsb/build/build/tmp/work/core2-32-poky-linux/dnf/4.2.2-r0/temp
> [pokybuild@centos7-ty-1 temp]$ cat log.task_order 
> do_populate_lic_setscene (19174): log.do_populate_lic_setscene.19174
> do_fetch (89722): log.do_fetch.89722
> do_unpack (93503): log.do_unpack.93503
> do_patch (97696): log.do_patch.97696
> do_generate_toolchain_file (114754):
> log.do_generate_toolchain_file.114754
> do_populate_sysroot_setscene (107361):
> log.do_populate_sysroot_setscene.107361
> do_package (108444): log.do_package.108444
> do_packagedata (28709): log.do_packagedata.28709
> do_package_qa (21415): log.do_package_qa.21415
> do_package_write_rpm (21400): log.do_package_write_rpm.21400
> do_package_write_deb (94084): log.do_package_write_deb.94084
> do_package_write_ipk (94059): log.do_package_write_ipk.94059
> 
> i.e. do_populate_sysroot_setscene let it skip do_configure,
> do_compile
> and do_install and just run do_package. Which is very clearly badly
> wrong!
> 
> I'll poke into this further tomorrow but I have some idea of how this
> 
> might happen...
> 

This turned out to be worlds of pain and I ended up redoing the way
part of runqueue works, for the better as it turns out as the code is
much simpler. Its given me quite a headache trying to digure out how it
was breaking and reproducing it.

The new code is in master-next and I'm trying it on the autobuilder. it
shouldn't have the above problem any more, what other issues I may have
added remains to be seen!

Cheers,

Richard


