Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id EB1FA7DE75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 19:20:37 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i8so17369737oth.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 12:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oxeVhboNssWZzOPEw+x2dFtadXAMyctGSug9VjKbpEI=;
	b=pnu1//VyzOPDqVpnPD1N3PFzLzS5wr0TPvG7mg1HOXnxfBxbekMdYlSCzpOp13npoE
	7wTt4pidGzcaR8hgNDQLXnNdrpLAPeuzsFc+5KutiRorkgsjIPqEz2LN3QpYDkWqRTLD
	V90xVgqIb7quT36dtYD+D+jxsi0JjvWKLotGjkHfKFghGcoYrOlIP/605+1bhQCtRyeC
	46F9sGxax7UcHEYWupbPOAP+towLNcJ97v5oXpDj5G2Ab9yLtum2BdoYaGXXng9vTIyU
	Iyjy++2bkkCVon3VEC44zQrExzRgJYJ2oF4kTpnTFY16RHmXs/E0YDcmCQdc5Qbzw4JY
	hR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oxeVhboNssWZzOPEw+x2dFtadXAMyctGSug9VjKbpEI=;
	b=D2UvUwJqKR5yMosfyUbcnqDu9QjWc/eTXE1Wg1lzhv+ZE+i6cE0uPATdWLtAiweiOK
	1yS3XxcCpBWkV2j8u8uU6w2mBsC/EWJ1SThL4UIVMZIEEAkxBjCyYnugNcqbnvlXZ3Ge
	pXgNwxu2aWbIqEl2WqF/3jIxbdlG12Oa5WlMHQ/NMpyfeTwg69KhmEgrTcxDeWvtsgFp
	NfCdaWdyzt5eNHAbplSYK/lL+CAztINfDSL888IIyY49HfuJyZ5yOZKLh0UedPaia7qF
	FY07ykAkcyqjbLvwOZ6XnpNNjdDk2aCqf3OblnvJfdpQjq+G4QLAc82uc+RcNOOQpcPh
	qi9w==
X-Gm-Message-State: APjAAAWFR1YMEjlv694W7IJYKHneesEejaPiCVG00Z9EJr+9Eodgks41
	OPRqfiamiyOC5tMNxlVFb/9otFcUoGNmoOcHriMTRJgO
X-Google-Smtp-Source: APXvYqyEWyAKcnCHg6V59gA9dE1KsB9yvX+sDfpsjgzVi4kHSfYhNtS2HujoSQ+ZJknRMEy12q/VXXU4MMlNzDig/PI=
X-Received: by 2002:a9d:7dd5:: with SMTP id k21mr24225866otn.167.1558466438945;
	Tue, 21 May 2019 12:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
	<20190520141125.10805-32-alex.kanavin@gmail.com>
	<06cf651bb9729dab7f0ddec0f6cfc5f878773b06.camel@linuxfoundation.org>
	<CANNYZj_8kDSCn8w+JXQ_Z4O1AWpsRypcjRVOqNG15+Q_Cs_Y5A@mail.gmail.com>
	<5c6ea6fcd04fb7020e73f4fcd39f989c362ad072.camel@linuxfoundation.org>
In-Reply-To: <5c6ea6fcd04fb7020e73f4fcd39f989c362ad072.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2019 21:20:27 +0200
Message-ID: <CANNYZj8P+i+=QCfYYQtF-k6yZk+=xKhqdZD_JQ4OMkb2C=HPzg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 32/42] libdnf: upgrade 0.28.1 -> 0.33.0
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
X-List-Received-Date: Tue, 21 May 2019 19:20:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 May 2019 at 21:05, <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 21 May 2019 at 20:44, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Mon, 2019-05-20 at 16:11 +0200, Alexander Kanavin wrote:
> > > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > ---
> > > >  .../libdnf/{libdnf_0.28.1.bb =>
> > > > libdnf_0.33.0.bb}               | 2
> > > > +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >  rename meta/recipes-devtools/libdnf/{libdnf_0.28.1.bb =>
> > > > libdnf_0.33.0.bb} (95%)
> > >
> > > libdnf-native build failure:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/850
> > >
> > > Could be caused by the other fix? :/
> >
> > No, this looks different, and probably specific to the c++ compiler
> > on
> > Debian 9 host - what gcc version does it have?
>
> purdie@debian9-ty-2:~$ gcc --version
> gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516

Right, on my Ubuntu 18.04 gcc is 7.3, and apparently a bug that may be
triggering this has been fixed from 7.x onwards:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56480

I reported this upstream, meanwhile I guess we should defer the update
(the alternative - adding '-fpermissive' to c++ flags for libdnf is
really not a good way to 'fix' things :-/ )
https://github.com/rpm-software-management/libdnf/issues/733

Alex

