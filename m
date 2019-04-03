Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id 87BA06BA9C;
	Wed,  3 Apr 2019 10:38:40 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id c16so14994218otn.4;
	Wed, 03 Apr 2019 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VFv8LDx/18EkEM4EZir4mSV0yMR1yVLENjVIE2jfZeg=;
	b=AWB1MN8lV40rK1RUR+SQYW9QDbP/Ut315CjpfStgigBmX6tp/IB2t1ClUcdKnSLiqx
	xiuCmzK6IkzkpOgrGZfw+Ynt/EvGn2LeGWiwpHR4/E9oINXO4EK+iP9PdbUlTwO0+dVV
	DpQfQgam5sUFT2MDagS2SbfwtuOxj6L2+FwfhIXFUTT5YwQ7Fzh/dyI4ZO7Mt7F+sN3b
	9fX1YQwnBYfYCRKbbjAkp48FQliMq4M9FZRk1BY1iOfKnBSogus/mvwvlQEtWqbsoFff
	oea4ZKA46NCDwBLStCAMvjyZdq+M98bzJo1WaVU4pRrHkleDNhHcQc1EIZDcQRBr+mRk
	wKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VFv8LDx/18EkEM4EZir4mSV0yMR1yVLENjVIE2jfZeg=;
	b=TDmq7srJFxtZvg0VmuWMm62OHD77w/KGEbyLi05IJfVJGxgRNDNyYigG7pE8ZWooCp
	NwnctaamnwRP4I7ZwtIl1Q4HJ+im5mFQgCOI0wIC0EMaGGFQ7Ast6IKDHkj9ZHQpHEt6
	Vs6kOg4fvOXbiBbmOvnXCDdG+/ZaecDMveGJseBGypKlQpXhJHbRYdjtHLBEz3OqUgCn
	1hDh+S795JJZWGIHGWyObWbLYDa/QtQchDhUH9iTHpSByQeaNeSGPKp0Wi51ETKKGbYn
	jOsW0u7A2DlJfGR+10YfScWkMwGWfWVAR4bV4uirCvLuhuXLYZ/OCvOlDZLLanl8F1Zc
	d9gw==
X-Gm-Message-State: APjAAAVd38uowb1PQdkhCCHR3FXZgJMZ4PPaD9+0HwZs/StUHadmU9y3
	TXirykdadjPNGI0UUg2ZjD7ogGspWwkZnqMA2G8=
X-Google-Smtp-Source: APXvYqzcbyjJ773jnU1dnra6on/C/L7Ka3KmvMtIa+IFcxmN+MGvg/GUqtmrPGJwDIx14BgYaSPsW07ZdGtdEl4lw+k=
X-Received: by 2002:a05:6830:1497:: with SMTP id
	s23mr52887517otq.236.1554287921431; 
	Wed, 03 Apr 2019 03:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<20190402065121.GA31468@localhost>
	<20190402194614.GY4664@bill-the-cat>
	<CAJTo0LZ5qeDA+rQ5Eh3_LCbGtQyo732LrDkiZ=O4sh52cjXU=w@mail.gmail.com>
In-Reply-To: <CAJTo0LZ5qeDA+rQ5Eh3_LCbGtQyo732LrDkiZ=O4sh52cjXU=w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Apr 2019 12:38:29 +0200
Message-ID: <CANNYZj9u4uYCnAAT5rrTWv9VvECb5GWq122NPz49qnoUeLTFDw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Adrian Bunk <bunk@stusta.de>, Tom Rini <trini@konsulko.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: [oe] Git commit process question.
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
X-List-Received-Date: Wed, 03 Apr 2019 10:38:40 -0000
Content-Type: text/plain; charset="UTF-8"

Just to make clear, the AUH workflow does require the maintainer to
sign off and edit a commit message via 'git commit -s --reset-author
--amend' for every commit, so AUH does not get in the way of useful
commit messages.

Alex

On Wed, 3 Apr 2019 at 12:31, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Tue, 2 Apr 2019 at 20:46, Tom Rini <trini@konsulko.com> wrote:
> > > The kernel does not have "upgrade foo to the latest upstream version" commits.
> > >
> > > With the Automatic Upgrade Helper this is a semi-automatic task, and
> > > most of the time there is no specific motivation other than upgrading
> > > to the latest upstream version.
> >
> > But since that's just filling in a template the body can also be a
> > template perhaps with useful AUH data (run at ... by ... ?) ?
>
> Apart from making the commit message longer what does this achieve?
> The commit already has a timestamp and author.
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

