Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id D073561CB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 13:58:08 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l21so7492287qtr.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 06:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4UB2ZsrxYfZAFEg3DTuvcpPb4phk5mU2AzD02iaENtk=;
	b=OEV6bPK6Q5CYblhpNvCZKFOLxJVOliDHRP7+brqtodmeUMzkl34kbJr6gaEG6wF3Y9
	fk8BN6tJ4d0rJN1WcERSdb6PQ8GyHyXhVmchVjmIpfv5SJRwy2tVUFfeFbiojE9IvYjX
	z5ApvQ8l3VXQmQMgeXsD+zxOKVU+BRte/HOAxb65va2ajOEeexAperF9jHuogUm4Is9Q
	YBCWwa3vtTIdfo3pv1Z/SPcq8FDQuMPGlWnxwLBIA3hZ1rN83JUUgqRG2Ydd1KpedJYN
	fm9jq7Kl1N6kjooP5TrtRjQcJMgmZChhleIq2onYyIZxr4UyF902Lm8F51TFRWJ2PfMP
	+EsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4UB2ZsrxYfZAFEg3DTuvcpPb4phk5mU2AzD02iaENtk=;
	b=N1wPApAjsl5urmke7IZSSD1hYIaTdwpOAhryk9zXMLJRIlNZL9Wgn24MbWC++1TPBo
	q7MWeL4tduDqnMIMK8FFAkCDLLHDFVE2CGAcX2OSu0iMRjNbxdeT1/lJlHEaoQCnSSM5
	3ZT8F7LPz9JVUO3EsAK95BMNP+Qiyzw++0024mROUy9BPZ4GQwdIqgJJlYkt+iE0ygi4
	fPA0BSzecFwdxuDjA/JRmKN7Sm33iRBIKRMkcNM0aYQAnvGph2vPMaJ91tRCAocdAHin
	0rGuFkOH/xMfzLZ9pRVPAhIbzsiSX++s+/uwF5DHo5ALab8KZfL/6ie2IipBBtUz444b
	aKcg==
X-Gm-Message-State: ANhLgQ1yd/GAaWGP1ycR4Gx7GXm7BoW2gqdmvbQ1GSROUMSBoRrN2NNf
	Qi3MQWeIOFrql2XU3D6wESxUDuDR/S5yxr11A+I=
X-Google-Smtp-Source: ADFU+vv264OU73IeX8Pt6CWlkM5hwMufSf6W6zaVIlxiPg4zx7DacMmLuS4bhFCJTFqxye1Q2umKaM1N6Nu7gOOwnJk=
X-Received: by 2002:ac8:70d4:: with SMTP id g20mr12757155qtp.146.1584107889236;
	Fri, 13 Mar 2020 06:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200312230840.751166-1-raj.khem@gmail.com>
	<20200313081516.GA24555@localhost>
	<8f52d0044ca78ef655eec2113fca67eeed7f6963.camel@linuxfoundation.org>
In-Reply-To: <8f52d0044ca78ef655eec2113fca67eeed7f6963.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Mar 2020 06:57:43 -0700
Message-ID: <CAMKF1soOQcD-ULgNNqgmY0V8D55F+JqDPb=b6BJ-JHnZ6BG9Ww@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH] gcc: Upgrade to 9.3 bugfix release
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
X-List-Received-Date: Fri, 13 Mar 2020 13:58:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 13, 2020 at 5:27 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-03-13 at 10:15 +0200, Adrian Bunk wrote:
> > On Thu, Mar 12, 2020 at 04:08:40PM -0700, Khem Raj wrote:
> > > ...
> > >  ...le-sysroot-support-for-nativesdk-gcc.patch | 187 +------
> > > ...
> >
> > Why was part of this patch removed?
>
> It looked like this commit was dropped:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=5507707f0d36a612992758dabd58d68a72ab0cfc
>

yeah my rebase missed this since it was a recent change. Thanks for
catching this

> unintentionally. I've added it back into the patch in master-next.
>



> Cheers,
>
> Richard
>
>
>

