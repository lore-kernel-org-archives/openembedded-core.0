Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id AD4807DBB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 13:47:46 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id k64so8942279itb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 06:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FrkAEvu11iAnlDnBKVGTyi+hVoh2ie+Ifi+T9lFquuU=;
	b=EM2I3g5Gi10XUY3T962rU7fzQmKKzUy4Rih8Lz3x+EvNT+cC3CFn+WlNkP/FKshiA3
	f4Tcl6gm72YGOWLb64fs3ibtwI4u1nPTGaYVmn6d1wErr5XHhviXQdt6fZtDqTNUA9PW
	ziP9p9/mtpCmAj5g6PjnHX4LdhS5N3Ndao033fd2MO8V8VkvLHGaUAN6XstzvLEl2SSf
	C7kSuJsPTCS7K3AF1/MMlq+FLV5CtqLz8+72pKPghbZzEdMQIx3OcqHcjhk/ZHkmzrYu
	2cR4M/NNlExzaLnaFrD/YODaL2e1RP0Qbl6ZoVY7mOsK8DNrW/1hJg4G5+u7c4il/iqt
	rMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FrkAEvu11iAnlDnBKVGTyi+hVoh2ie+Ifi+T9lFquuU=;
	b=ASQD7ZHzUy65N612KWGZ+3WPsWKIPzvFz0ALtav2JN9y40CMQ+g1gFojPnFmSzugHH
	dmGApLRfWIEP1pSUJocv/wHSI2s97vbMtbOMRR/js30wxQpzVaE3pk6ocELXx+QoxWRc
	YXf6hFfU0kBkeBZQoFtAGFI80vSuiZPZ7I4fYmrJ5nxZuRrs1CY/tNMLO0BAPkzf46nS
	E+x4ZwqXHO4t9YobYTZCBGEQSKDBPHljJuazvSeXL/uk7PdQIidr0uTe/f4o8BcROfIB
	Fj6Nq9LXwmBvRVTklR0hvjrec8LnGPAiQ/cFGJvyNn3p5wNoCmCEFwdhzF12O09xQ5HG
	VqFA==
X-Gm-Message-State: APjAAAUN/eJF+wEqvr3pZMaibB/G2S6NQMI3AkSo+nuI5ebrAmdOL4i2
	hdCCwI1CQsKVu0TOOehMc2XXTxW7YkP6OsBqG8c=
X-Google-Smtp-Source: APXvYqzEeI8+3OGkplRdgphretZCMZnwhqm0XjfTGIHLhZ58T+l1i1tSgjKw09+TLWCVmaXXlfA65m7q2f1xKBem87E=
X-Received: by 2002:a24:78c8:: with SMTP id p191mr18765556itc.58.1556545667736;
	Mon, 29 Apr 2019 06:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
	<a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
	<CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
In-Reply-To: <CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 29 Apr 2019 15:47:35 +0200
Message-ID: <CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
To: Bas Mevissen <abuse@basmevissen.nl>
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
X-List-Received-Date: Mon, 29 Apr 2019 13:47:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 2:21 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Apr 29, 2019 at 12:56 PM Bas Mevissen <abuse@basmevissen.nl> wrot=
e:
> >
> > On 2019-04-29 11:29, Andreas M=C3=BCller wrote:
> >
> > (...)
> >
> > >>
> > > Understood - hope to find time till tomorrow for this. Need to find a=
n
> > > old machine for test because otherwise further fixes might remain
> > > incomplete again.
> > >
> >
> > Why not add the g++ option --std=3Dc++11 when test building this recipe=
?
> >
> > $cat test.cc
> >
> > #include <string>
> >
> > using namespace std::literals;
> >
> > int main()
> > {
> >         return 0;
> > }
> >
> >
> > $ g++ --std=3Dc++17 test.cc -o test
> > $ g++ --std=3Dc++11 test.cc -o test
> > test.cc:5:22: error: =E2=80=98literals=E2=80=99 is not a namespace-name
> >      5 | using namespace std::literals;
> >        |                      ^~~~~~~~
> >
> > -- Bas.
> Did that but on CFLAGS (copy & paste from another place in recipe) and
> since issues popped up I thought it was right :(
>
Looked into:

There is no easy way to get vte-native to build with c++11. Even if -
patches possibly introduce functional changes/errors (and the result
of oe-selftest is questionable with a massively patched vte).

So I see two ways to go:

1. set vte-native requirements to c++14. That worked here with
CXXFLAGS_append_class-native =3D " --std=3Dc++14" but looking into logs of
centos 7 there are several '--std=3Dgnu++11'. Have no idea where they
come from so chances are high this patch is going fail with c++14.
2. revert vte back to 0.52.2 and forget the idea to get recent
gnome-terminal back in near future. That requires vte 0.56.1 and was
the reason I sent the update here.

My preference is 2.

Cheers

Andreas

