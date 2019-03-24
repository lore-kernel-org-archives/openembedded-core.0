Return-Path: <ngompa13@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id A4B1A6D196
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 05:41:43 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v20so6876979qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 22:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lxQ2JhKIM7RqnBCOgSfIkAGOnWjTgaxIeiLwQtHx0fQ=;
	b=hpOa9Iv0yAyiFyhfYhl/Xlmp9j9PgqWjEz/MB6JszRkxzUMDSd49DSK8zimeDjZkBl
	UhpKXzWfagVRflpYhJrruAcijnWW6vw3uOyyWUYXu99UYI/OvhKmQyaBBvbhUTLj7brR
	ZeW4jjuFUIBVfH6M+vao4In+BkCTOAVJq73g6CI6Tr5pfbzJxquWrWqHFJw3ek77AvA9
	UzQG4GH0K1GJ113brMp5WmPEF7C4vyizX6pBgQ+l3cobeytkVfBk/fhDwkQydOQlQCtb
	wKKRbuJO+KZzpOpJveEgbrqTmHXOOI8SVLhzS6q+yZHW1/yp4TvGCaI9EZDTggFYMNew
	RE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lxQ2JhKIM7RqnBCOgSfIkAGOnWjTgaxIeiLwQtHx0fQ=;
	b=Ock63lYj1Kc+RefnFxr1tS/fwBplAHoqRJH6HYT9FtSaJUY+jBVtoYefzdt1iWUMSI
	MHIwOSsy2zVmPmKemnxVpBEO/ETs7sdhIcyrMv7xMt5y89L302PDo5eACyHRt8OA4VOr
	sr0c+gjdxpWi7qP0q1qC1M9r6zOLJHk34A80FgGTFbnOIgJ4GRPhi1UWO6W4naWbQzsr
	H9bukgdvX6zFfnA+AWBIJXVLkdpLlgAtd0sbiQAroSPcvLDXrM8nPCkJjkXawB3u81Ue
	wk9ZeRFeWnSLcCTbBAy2G3cU4FBIphxaz0bYEl2q1xMFfSNE5/h3LV1RDUoJcKg9o2yM
	EuhA==
X-Gm-Message-State: APjAAAUWqoNyWpW80Lg+sUafzaHyhd9B78zK4nNIMwmMUn+ibLxmgjCm
	9N39kolfRZHqJGtvgsWXBCQ59Mt2XfxMZQdBOK4=
X-Google-Smtp-Source: APXvYqxAqyUjF89DISyPEkl5FEa5pfrQdr4Qr6vCkwShgDhkHOiXaSSsjcDpjT4PlwQf9Dl/ePVVqwEPrJixtloKjKk=
X-Received: by 2002:ac8:18e6:: with SMTP id o35mr15275497qtk.80.1553406104539; 
	Sat, 23 Mar 2019 22:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <27c741f4-1ac3-c837-df65-60a46712888a@cisco.com>
	<CAJTo0LYQCmNA9PppMauoPzn5HBVgzLfHAxfPyVZOTcTtdzgMRw@mail.gmail.com>
	<f347f66c-0a6d-9f49-98f2-a66f735a653e@cisco.com>
	<CAJTo0Lb=O0kLdbv9qYZLVXnfNd5Np=4HY8d7ASXSM5TiE33Ayg@mail.gmail.com>
	<155329719078.6500.854973581146180677@takondra-t460s>
	<8db32a05a6f93737792b95ce73b70b335ab06e8e.camel@linuxfoundation.org>
In-Reply-To: <8db32a05a6f93737792b95ce73b70b335ab06e8e.camel@linuxfoundation.org>
From: Neal Gompa <ngompa13@gmail.com>
Date: Sun, 24 Mar 2019 01:41:08 -0400
Message-ID: <CAEg-Je8F0cVBd5=gW=Wo=fr_GmEa=gSxrmKLuyyGoJnyXHyniw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Pierre-Yves Chibon <pingou@pingoured.fr>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why openembedded-core mailing list is now author of some patches?
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
X-List-Received-Date: Sun, 24 Mar 2019 05:41:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 23, 2019 at 6:25 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-03-22 at 16:26 -0700, Taras Kondratiuk wrote:
> > Quoting Burton, Ross (2018-10-12 07:04:38)
> > > On Fri, 12 Oct 2018 at 15:03, Ruslan Bilovol <rbilovol@cisco.com>
> > > wrote:
> > > > > This is basically due to SPF, and people sending email from
> > > > > non-authoritive hosts.  Concrete example: Richard Purdie's mail
> > > > > comes
> > > > > from a machine which the linuxfoundation.org SPF records
> > > > > doesn't
> > > > > recognise as an authorised sender.
> > > >
> > > > Hmm.. I've just sent an email from rbilovol@cisco.com to another
> > > > Gmail
> > > > address, and Gmail says SPF checks passed:
> > > >   SPF:  PASS with IP 173.38.203.51
> > > >   DKIM: 'PASS' with domain cisco.com
> > > >   DMARC:        'PASS'
> > > >
> > > > Does it mean oe-core mailing list's software is incorrectly
> > > > configured,
> > > > or there is something else missing on @cisco.com side?
> > >
> > > CCing yet more people, specifically Michael Halstead who admins the
> > > machines and actually knows what he is talking about (unlike me).
> >
> > The issue seems to be still there. It doesn't seem to be cisco.com
> > specific. I see actia.fr and globallogic.com too:
> > https://patchwork.openembedded.org/patch/159446/
> > https://patchwork.openembedded.org/patch/157540/
>
> The cause is the same though, the senders are sending from addresses
> which the SPF records at those domains say shouldn't be sending emails.
>
> I'm trying to catch these and fix them up in before committing them. I
> thought I had local hooks which would not allow them, clearly the hooks
> need more work as things are getting through those filters.
>
> We are looking at a different email list hosting solution which may
> help. Adding "From:" lines directly in the patches where the domains
> are problematic would also help. We could also in theory teach mailman
> how to do that for patches but its a question of people/time/resources.
>

Has anyone considered the (perhaps radical?) idea that the sending
changes as an email patch series should be replaced? For example, if
git.openembedded.org and git.yoctoproject.org were overlaid with
Pagure[0] frontends (it uses Gitolite internally, so you can have
multiple frontends in place for the same Git repos), it would be easy
enough to support pull requests, even from external Git servers. And
with that model, OE/Yocto can use CI properly (e.g. using Jenkins,
Zuul, or something else) rather than building more hacks on top of
emails.

Email is getting harder and harder to deal with for handling
contributions, and it's only more difficult as mail servers extend and
mutate emails as they work to try to combat all kinds of other
problems with email these days.

[0]: https://pagure.io/pagure


--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

