Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.14608.1604069150572414640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 07:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qfLDRhdH;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id dn5so6887878edb.10
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mz1ThpXp4KfFSQjnLWzPTCuSgA/aDsl3cv1GrXOZEY8=;
        b=qfLDRhdH5mqxuJQWeziiF9XzAmpa94QL2km3492h+tt1AXhFtXpAwFwN3rNagnEKuY
         bDl8qeyDLbslB+4MsF8/xVrse0iS5HW6igIdrGp5cNkXF5OjXVlMP4oTvRCyjbnDhgkS
         dRPpkoOxmva9MFBdWA25HrW/2BmHyc2NLm9IL8wim4hZ1JMzF4Ua0V+DPsc7RjNwVuYs
         o3fa80QiKG0zObQn5cRDc+IgFbwqiczL6l0Ezab2Q7bBsNfZy6AOGmwaa5+GJcziQIwH
         Y+RYlZIZoo3PNr51rOHmZHJkq1vsP3Xs0YQk1SK2EWMlTxcyKEZsTU3+L5YKspM16Ste
         vPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mz1ThpXp4KfFSQjnLWzPTCuSgA/aDsl3cv1GrXOZEY8=;
        b=piJa1uc+8xcc4ZJZZLEyLe8GLIP7jJ6Z9tXyhwO/LMPC+zt5owp9EZstPL2eACaRdR
         VgbHcM22d8Sal1jHym3ZwVV7gvcjC2ZM8YrPD4/NCrxs10TztFDyDkyhjbHGV18pWtNV
         LxMPrmpsOUSxaTaOz/3DZkUK/PCrYJp9CPy85EHF/AL1avEAF2uwA4BA7T/bird4qz1m
         hdWO/Srkz/OvvsZK3AE019pgO64WYCSq2JTnz0KNd7uaqc26090lbuEuzJAwLkIGVGxi
         qxm8R9tI++JTleotpPROoklbivaRKZRQC4a1aYjTlOtgNl9AjL0OBalDmY/18XSbCkeJ
         V7cQ==
X-Gm-Message-State: AOAM530oAm3sIfvh3+JGRqrO/P0hVmr9g9ir8zqaE96MEOO1A/AX6nuL
	buzgzpQjxj5JqXhOTumZqW9+u26U+hw51RBV7Ja3Fw==
X-Google-Smtp-Source: ABdhPJwA3k1arhfLuMpWX271pdbxRmUaYrKWNBkCc7pzh9MO8QJSmfoNv2h01UysVhts56oZern2jt4j2+WEWKkoa4E=
X-Received: by 2002:aa7:d28c:: with SMTP id w12mr2750888edq.248.1604069148991;
 Fri, 30 Oct 2020 07:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603760941.git.steve@sakoman.com> <20201027092433.mtsr6bucqhzitixf@jama>
 <CAOSpxdYOG8USSc3s4gwMpAbPHff+pXbzLOR_qVf71inXg5A7=A@mail.gmail.com>
 <CA+chaQfvFbARW_qpspY7pLiV8Y6ZkU7_Q=OOvC+iJBp+Dbv+rg@mail.gmail.com>
 <16422E7547289A57.31237@lists.openembedded.org> <20201030144147.twjh5a7czbr6pezy@jama>
In-Reply-To: <20201030144147.twjh5a7czbr6pezy@jama>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 30 Oct 2020 04:45:37 -1000
Message-ID: <CAOSpxdY5ZvBJJFAKBxW=0Dh10ePLZt4gTKsu0Hym0qzfB23rdg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/14] Pull request (cover letter only)
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks Martin!  I really appreciate the help in testing.

Steve

On Fri, Oct 30, 2020 at 4:41 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Oct 28, 2020 at 03:31:25PM +0100, Martin Jansa via lists.openembedded.org wrote:
> > The script just finished, I've uploaded the results here:
> > https://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/tune-test-dunfell&id=c87f58e4235fc5c2fe31037917fd999bf4142dca
> >
> > There is a lot of changes compared to master, but mostly because I didn't
> > have ARM_INSTRUCTION_SET set to thumb in this run.
> >
> > That helped to reveal one issue in
> > meta/conf/machine/include/tune-arm9tdmi.inc
> > which most likely exists in master as well (wasn't detected before just
> > because ARM_INSTRUCTION_SET).
> > https://git.openembedded.org/openembedded-core-contrib/diff/scripts/tune/log.fake-arm9tdmi.arm9tdmi?h=jansa/tune-test-dunfell&id=c87f58e4235fc5c2fe31037917fd999bf4142dca
> >
> > And the meta/conf/machine/include/tune-supersparc.inc is failing like it
> > did in master before removal in:
> > https://git.openembedded.org/openembedded-core/commit/?id=861519337b6e5e986c3c4b8ba253e8339caf0805
> > which you probably intentionally didn't backport to dunfell.
> > https://git.openembedded.org/openembedded-core-contrib/diff/scripts/tune/log.fake-supersparc?h=jansa/tune-test-dunfell&id=c87f58e4235fc5c2fe31037917fd999bf4142dca
> >
> > I'll trigger it once more with thumb enabled to better show what's the
> > difference from master.
>
> test with thumb enabled finished and looks OK
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/tune-test-dunfell&id=c8a0a19b8585661c39e1ba7e16d061d0ae2afc74
>
> There is a lot of changes compared to results from master, but those are
> expected.
>
> The arm9tdmi issue I mentioned before is reproducible in master as well,
> I've sent fix for master:
> https://lists.openembedded.org/g/openembedded-core/message/144002
> it could be backported later.
>
> Cheers,
>
> >
> > Cheers,
> >
> > On Tue, Oct 27, 2020 at 4:34 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > > Hi Steve,
> > >
> > > it's from this branch:
> > >
> > > https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune-test
> > >
> > > I've already started it on top of dunfell with these fixes backported,
> > > will report back when it's finished (will take at least rest of today to
> > > finish).
> > >
> > > Cheers,
> > >
> > > On Tue, Oct 27, 2020 at 3:03 PM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > >> Hi Martin,
> > >>
> > >> On Mon, Oct 26, 2020 at 11:24 PM Martin Jansa <martin.jansa@gmail.com>
> > >> wrote:
> > >>
> > >> > Did you run tune/test.sh script with these on dunfell or do you want me
> > >> to?
> > >>
> > >> No, I didn't.  I'm not familiar with that script.  Can you point me in
> > >> the right direction?
> > >>
> > >> > It looks OK, but would be good to confirm that it fixes all issues
> > >> > currently in dunfell.
> > >>
> > >> Agreed!
> > >>
> > >> Steve
> > >>
> > >
>
> >
> > 
> >
>
