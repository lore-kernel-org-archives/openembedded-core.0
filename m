Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6ECD47F4BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 17:48:00 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id i21so66487286ljj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 10:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p5FwewwfR1BMMj+eVbOKGCLQMG1OTtGGIwqRKOR680Y=;
	b=Xfb49W//BZ+lNo1zL6cnExMsN8s7DksmIbIWj2cZROlJzg0vOgn1OHPnvl93/fHq1Y
	N+0t8RsSkmsB9ji3P/8Q2DWrtcpGUuKGoBwea/v7SFcfQirCOssGEqqT1yWDd2wQpBJs
	oD9txli68r+5DkOJCLjah0mRZV/Wj2knoRJ2IiKnUaFvBg//nlMGsF2+0toqW3mzVlI2
	2SU18B3OLWyBi9Kql+M0F1Vy90BEVTKfmOvT9LjuWa4rN89nsGHe5rNu7/DDqtry9jYG
	LI2ZvIPy3aO0meiqENbadDl1wx0HxmuUkOdTOfVpIWdeBF183v+8a7Arw3QqX6MZQCCG
	k6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p5FwewwfR1BMMj+eVbOKGCLQMG1OTtGGIwqRKOR680Y=;
	b=c+jXb1IKVgLE4hMcB/G2tvJ8koaQuBW8SQfsMw0JhWAW1uMmS53OU4ipt/REzHtdly
	RJfghuU/1GjrN5xNCCCPUM7OceZ9AIKgrPgPVsi9sTnVgUeGNGz9r7A4y9D/56APCFVQ
	R5Wj4ZTKoA+EN9pQc4IgpX53IMXBI1fxK564lE6USkZ4bdtUZQQm1alsKyxTPePs2ygn
	Ylp9POV6ZDT97FUXP1S+JIpLhkpMy85ZRcOVLvXbASdrVaGtqYYD6ItwnKjzoSXfC/cf
	MuSGHPO0PALNwTco+Hcl5ue4vHZOqbmGO+DMrOOxNW5sp/z8iZTikVnpvOH10v8C3wog
	pk2Q==
X-Gm-Message-State: APjAAAWNOF6mM5smxbWZ6bVGuG5JUP7h1th3+hMRAOyGDT1PZ7cUIS9f
	JTXvbxIJU0jRdTvW6RIkC9EyB1Scj3KxErjf5Wo=
X-Google-Smtp-Source: APXvYqxNHcNXMzC7hUnDRqBTX26KlIEr+lC9crey88dta3/2vs5tXZCpCh/7mDU/zlZ5FNz9QoTnUI4+ndO2EE4hvO8=
X-Received: by 2002:a2e:480a:: with SMTP id v10mr1708410lja.94.1564595280932; 
	Wed, 31 Jul 2019 10:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=otbSH85m0WnBj0Q2z9Bj2ZGwzGzcM74-GuaXtt6PeReP60Q@mail.gmail.com>
	<3f13cb86-a12b-aba7-e8a1-517f25ba7f1e@balister.org>
	<CAPybu_2XioOxrcbyWe0-5uhR_jfa_emqejhDZrWQwq4NNuUqPg@mail.gmail.com>
	<b6c09802-7627-d312-0caa-f6506c0dcdb1@balister.org>
In-Reply-To: <b6c09802-7627-d312-0caa-f6506c0dcdb1@balister.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 31 Jul 2019 19:47:44 +0200
Message-ID: <CAPybu_3R5RUehy-8AxJZ9s3BDisotMXrc6MMaWENiWSeMHBUZw@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OEDEM 2019
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
X-List-Received-Date: Wed, 31 Jul 2019 17:48:01 -0000
Content-Type: text/plain; charset="UTF-8"

If there are enough people interested it would be great a BoF, even if
it is "unofficial"


On Wed, Jul 31, 2019 at 6:45 PM Philip Balister <philip@balister.org> wrote:
>
> On 07/31/2019 05:48 AM, Ricardo Ribalda Delgado wrote:
> > BTW, Is there anything for Embedded Recipes or Plumbers?
>
> No. But we are always interested in improving communication with the
> larger community. Any suggestions what you would like to see at events
> like these?
>
> Philip
>
> >
> > On Tue, Jul 30, 2019 at 7:33 PM Philip Balister <philip@balister.org> wrote:
> >>
> >> We are working with the Yocto Project on a two day Summit event. This
> >> should implement part of the ideas from the the last couple of developer
> >> meetings.
> >>
> >> Philip
> >>
> >> On 07/30/2019 12:58 PM, Ruslan Bilovol wrote:
> >>> Hi all,
> >>>
> >>> Is there any plan to hold an OpenEmbedded developer meting
> >>> in Lyon, France around this year's ELCE 2019 (October 28-30)?
> >>>
> >>> I see that OEDEM 2019 page isn't created yet and I didn't find
> >>> any news in mailing lists yet:
> >>> https://www.openembedded.org/wiki/OEDEM_2019
> >>>
> >>> Thanks,
> >>> Ruslan
> >>>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >



--
Ricardo Ribalda

