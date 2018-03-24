Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 30D5D78766
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 17:11:06 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id v194-v6so6143707itb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 10:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a5mDJi0d4uRwjWQiP5d7IhpdZvAEzpOH7uCGQLs3gpI=;
	b=njC6aEe9r28+diq6eBH3F/6ZDqxmBTr18oZoN1DvTHP7VO3vjhP/Ms8RAmIUcq/cdO
	+uTsLBw8p6d1PeTv/+8WoBHVlgSZg4+bMF7XloSV4GzLqeZrBueBYA8ZbBs09xbeR8Ux
	Jm6DZYg2291fYkRhpqG3QPgG9ZkqEhdHIb2G2jPSpYNWns9TTyvQ+iB6ytbt/dXOkEfy
	Q/6UvBXwFTZu6lhHi5s3TcMECeV0Ll2joHGe6dl4cPoxrexfSxA4xTyg+Vjr/Ok0ycfk
	ozgod63DPO9zIrcMjoBRe9IyzAK5PNzNdn8khViK8BHXyl1uyuCBW1R2MqJj7zPT7juv
	uQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a5mDJi0d4uRwjWQiP5d7IhpdZvAEzpOH7uCGQLs3gpI=;
	b=PkIl1ZlGcjgAFVWJjkG9lk9nIYrMjj2Vvfy7H4c6yY3iLq2nEsafP8VhPG8ZiKi3m9
	/cLjliJpJLyXHDQXMF67MSGUNlYtWDlYIZe409V3BdjhiIFYJzBYB2BAsKYUsqua+3Hp
	yhs1Glw1nSpumPKLp34cJt86l1h0FwbzZvshsUqnwiXvbquNTbbVSWD+go952wZNDKSm
	Vw+75xo7dHsVoy5ssRsFFxtmUWn112DCZcULJ23wCL8G6QGf5hiFIkJiI6os6Ft/sURD
	CRGz4eXOWyyK3RG2NDmsdNpjLn9+PBMHMeH3lOoPoppSpmpQS/qkWFF9meCLwxw9JJEz
	Rv/w==
X-Gm-Message-State: AElRT7HJoahIt69LcbGA2yRzWB2x3UjeuUxdGTRDGuso9u1AcoOWXmnH
	m9uiIr05JQRR+xWwVZlDhAqFIppc4BLOfd1fT6BRug==
X-Google-Smtp-Source: AG47ELsJ1MJVl0C6wAbJwihD8XnSDzz4NlFnFVun2QWHuSrHkQXXJlraSL1M+3XanmBJXqfFipn0hiK92ppPMdQZrbQ=
X-Received: by 2002:a24:22c2:: with SMTP id
	o185-v6mr17846721ito.60.1521911467617; 
	Sat, 24 Mar 2018 10:11:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Sat, 24 Mar 2018 10:10:47 -0700 (PDT)
In-Reply-To: <1521894988.11431.42.camel@linuxfoundation.org>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 24 Mar 2018 17:10:47 +0000
Message-ID: <CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Sat, 24 Mar 2018 17:11:07 -0000
Content-Type: text/plain; charset="UTF-8"

On 24 March 2018 at 12:36, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I think, at least in principle, pseudo could wrap that and intercept
> this particular syscall, check syscall_number (the numbering having its
> own set of issues) and then only handle the specific problem case we
> have.

And to make things easier I think we could even just ENOTSUPP renameat2
in the short term (i.e. for 2.5), before looking at a more
comprehensive intercepting
which could solve the Go issue.

> The unfortunate reality is we will have to figure out some solution to
> this as f27 is in the wild now. Explaining why this causes problems for
> debian/yocto to the upstream is also obviously a good idea.

I filed a bug with coreutils yesterday.  "Just intercept syscall()" they said.

Ross

