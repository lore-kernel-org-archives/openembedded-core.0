Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 440FE7D443
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 09:30:03 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id v9so8307488iol.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4qnbLEXY7ZhxhZqlj2LifvVk6pIeTThF8XYF0U3GhpM=;
	b=mAm7nEgCFQm4mN452B9cCp4C5i8cPqaaM5eLd0oIigHX5yfIyi3ImF5I3820Oerh8g
	9g9NwfgSUA0U99G1zuIIIzf6TBQDIsetqwP+k/XbsdRvr8SccDxAVUJmB/lkOmGelmyq
	8l4/KPbo7z7wW3eccfD0kDJEfG4utclgAdCwyodWd6yGo6by/iHxBSOWJ2EtgUtHjuqm
	7ulq8cTCRI/zepdCfG/NvRPWzVWaiuxSnE+wxtwso1kbhk2zxSArEHoUJ01XGrEzKQmj
	tE9g218/gYvhkBymCgq3GwEGAsEavwuW7IZfpMDAAXfx4fgPBJZTHXzxOUseSXnhHDMM
	o8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4qnbLEXY7ZhxhZqlj2LifvVk6pIeTThF8XYF0U3GhpM=;
	b=mJJ2a62HPh5lPNgK7I0/+MluHC1MSXQpH+CCPF2Oh59TuynnxTwXpzSTAqRI18rUwr
	PVXHImk3sVXuXcbT9l00r6Z+UOHx1Hm3Vi6zrciQDViaiHQnNwLhtHpQHlurSawpmV0t
	TUL1YZk8WwhoM7SQ1BAJkXD/eA83VkpICwodwZltCGebQDGCk+icFCH3nQuwHVBkJpXS
	AahbZPUvY35tqDFbY68blNNWJl2Mmk1kxOEEWYhNpUpTfJSyrDWYMlEQsKf9cM5cCNXp
	07p/S4oIwZ8W17MHQloahjt5PYmMa8NNfsbtDLgVN4fSIPi0+znfL9DZX9uViTkdAEnm
	H1Ng==
X-Gm-Message-State: APjAAAW8Sgr7J5zJN5FavD413a3ZkGo8spPjAWaq1VWSdb5JPJC5GqYI
	J/Cv9+IAZeG2uFxknP0xyELIQtoZMI5DVCc4fVrsug==
X-Google-Smtp-Source: APXvYqyX7a4d9V6tNBIYYh4a79A579q44YBhhRtEidIcPzMVzK4mrdJbE1Zq6gkRimbum2Lu23RDyZScwDgFUWCc5f4=
X-Received: by 2002:a6b:c38d:: with SMTP id t135mr7158916iof.284.1556530205115;
	Mon, 29 Apr 2019 02:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
In-Reply-To: <d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 29 Apr 2019 11:29:52 +0200
Message-ID: <CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
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
X-List-Received-Date: Mon, 29 Apr 2019 09:30:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 10:49 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2019-04-27 at 13:37 +0200, Andreas M=C3=BCller wrote:
> > This should fix build on ancient hosts
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  ...uce-gcc-required-support-downto-c-11.patch | 34 ++++++++++++++
> >  ...001-Revert-parser-glue-Use-std-clamp.patch | 44
> > +++++++++++++++++++
> >  ...replace-std-clamp-by-std-min-std-max.patch | 33 ++++++++++++++
> >  meta/recipes-support/vte/vte_0.56.1.bb        |  7 +++
> >  4 files changed, 118 insertions(+)
> >  create mode 100644 meta/recipes-support/vte/vte/0001-Reduce-gcc-
> > required-support-downto-c-11.patch
> >  create mode 100644 meta/recipes-support/vte/vte/0001-Revert-parser-
> > glue-Use-std-clamp.patch
> >  create mode 100644 meta/recipes-support/vte/vte/0001-vte.cc-replace-
> > std-clamp-by-std-min-std-max.patch
>
> Unfortunately it doesn't seem to be quite enough:
>
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/461993/raw
> (from centos 7)
>
> | ../../vte-0.56.1/src/utf8-test.cc:27:22: error: =E2=80=98literals=E2=80=
=99 is not a
> namespace-name
> |  using namespace std::literals;
> |                       ^
>
> and:
>
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/461960/raw
> (from debian9)
>
> | ../../vte-0.56.1/src/parser-cat.cc:140:31: error: enclosing class of
> constexpr non-static member function =E2=80=98bool PrettyPrinter::plain()
> const=E2=80=99 is not a literal type
> |          inline constexpr bool plain() const noexcept { return
> m_plain; }
> |                                ^~~~~
> | ../../vte-0.56.1/src/parser-cat.cc:134:7: note: =E2=80=98PrettyPrinter=
=E2=80=99 is
> not literal because:
> |  class PrettyPrinter {
> |        ^~~~~~~~~~~~~
>
> Unfortunately I merged the upgrade into master as we'd had green builds
> before this (chance meant we didn't hit this failure) so this is a more
> pressing problem now...
>
> Cheers,
>
> Richard
>
Understood - hope to find time till tomorrow for this. Need to find an
old machine for test because otherwise further fixes might remain
incomplete again.

Andreas

