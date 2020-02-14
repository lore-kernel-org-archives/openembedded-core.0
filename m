Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id F24B460C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 07:26:06 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id h8so9510928iob.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 23:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YbwIxmh6VPio8L22ZN/Msr7uvAEf4IeMeskNlPhOtEA=;
	b=qgqZQpn0hBZx7W5xMuYSP38cCGWkMXzm7UxPxQP0MJhv7w2D+Eui7VLOt8LEIyc7Jj
	9ym0JzUimdY94Lnjz2odxnbBKNy/T7OQz6RZv17PoTnIhN52n4H/03ZgCaQbc0AaO34e
	yhykHh5bYetgimwwfJNdJQiM7k6fT1fAH7mCj3bncT2PovXE+9NPuCDffBJehZbP+YEp
	oznCnePSnnkplauEpxEPpYHYC4KowFEEn8tw6MNxEra/65yWTgM+rDCIlT5o7nhUvN6s
	v7E7XQJPqLamfXwvqz2jNphmQ+6alsiv3ZVf1BPzKb4SmPUdYgubtYOva+oqWSOhzpy1
	QHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YbwIxmh6VPio8L22ZN/Msr7uvAEf4IeMeskNlPhOtEA=;
	b=a694EsWa1nAQPeWXIEqlvQPB21J4+k2I+UTbeb8nVxEdqQYNy8+kPF3zYBJNKiPRoe
	zL8H1FD/qwbXzzq6ThKeH5fMZhwhjVXfwdIcY+Epa9pv/tIG8UYNEvA47oCjY14Wzy9h
	Fu06c0qtGvV44rRvZmfpVIjEiDaRNRDfVvqRAUbRnnLLV1NUwRaI8RC8Bug6Jku6XgCd
	45l6ZUukPWc+b/4WA0t/e1ruVt5VgJQCXj6ynpXK5vNSiH6qFCNXLi+kr0lQ65uEmTjs
	XnXDYQpbemTP5O1B2Sqc2/5BYCyt1P93TXX0VRUP6+v9GIiKOMBz2MnjJvhzWeBmerD2
	UXNQ==
X-Gm-Message-State: APjAAAU51ZGI6+jqiBQs23/kkiun/BGurGHDsY0tfnpi2VYZL4mFP/tN
	QJlMD1vZf1UbiBRaN//wJt0V48E65u7lxw8JQLI=
X-Google-Smtp-Source: APXvYqwZpXppXOfeJofP8ln+wkKaLUNQo3W7AgmmmNtoJK0aNZ5vtG6AxSXsz3knSX4nvuc1alYFidfoJBAKUaYH1R4=
X-Received: by 2002:a6b:f80a:: with SMTP id o10mr1162423ioh.144.1581665168015; 
	Thu, 13 Feb 2020 23:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20200213061649.102346-1-alex.kiernan@gmail.com>
	<6557ee9b5ee8375cc9e7ee79336975f2cd8c4468.camel@linuxfoundation.org>
	<CAMKF1spmaJ1QWr1pod3eJGMWk2S1mADCd=t2LZeOq_L9PHv+YQ@mail.gmail.com>
In-Reply-To: <CAMKF1spmaJ1QWr1pod3eJGMWk2S1mADCd=t2LZeOq_L9PHv+YQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 14 Feb 2020 07:25:57 +0000
Message-ID: <CAO5Uq5Q_EF=-A=xUfAXLMNK4=0Rvw=1tLczfH+h7kn4up15H9g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: upgrade v244.1 -> v244.3
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
X-List-Received-Date: Fri, 14 Feb 2020 07:26:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 7:17 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Feb 13, 2020 at 3:40 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2020-02-13 at 06:16 +0000, Alex Kiernan wrote:
> > > Commits from v244-stable:
> >
> > I think this causes:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/1557
> >
> > (systemd-boot patch failures)
>
> right
> http://errors.yoctoproject.org/Errors/Details/390912/
>

Yeah... just trying to work out if there's a better way to handle the
efi-cc stuff w/o having an even larger set of reverts against
meson.build :|

-- 
Alex Kiernan

