Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.2445.1626375382196844962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 11:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Trw9FGvV;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d1so5296618qto.4
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 11:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=22CtTK+YaeB1yNnXVfdOlVR4LjBPYO/JN1GkEmBS/5U=;
        b=Trw9FGvVz3MEfh8ZrlrYiMXbiqYYFhpFzKoZ4dkvpZhmhp3SqhFioTXvZ/wcWwMce4
         4sxZtsWdDqtw8Osi7+Q9IrxW6rfAlN4Y7Hk5f3kuglZJA+UKZN6mL3QVRrSApfrq6Xoc
         HkUrjVX+yXc4jiVNUf7RLPlNMHHenuPmt3FVkwQy+rAVOndi8SSDtQuAPBc8GYP7BElG
         T+OHbgUxN/uRoy7GEQukuDYWUrSa6ekEh/5iSg8C0n0SmPiKxvZyK864tHEzpeCVOVBM
         dXhuhWZEPX5gg1+TXQAlOCOOwUqU5TB2Yn/5WRFDiNW1SATdHsQe4CKWkOx2JLZRmBCN
         p7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=22CtTK+YaeB1yNnXVfdOlVR4LjBPYO/JN1GkEmBS/5U=;
        b=KY34jPG3UunhubaQHf9HV4e3O6/HYi4Ix8E18N8o/id86+WFrvDqVTg4iimwSLBAtm
         WeQWsynEuEC2SSNT7i+dGROUBl+kwzfMdDWcTVyNr2ZLDmRnMERtTsCKsk5DG2cY5OW5
         Q1QIQFHemUZpZwB+kRxnwM0hHZ8tslUY5CKKxjFj7fn258D5NLZIwDU2Z6r27Eo4oTEL
         33ofaC7QXKgwiLZvym1VC+b/kNFmjPzrP7AnIC0Pm/plfPdCfAbYkmMjkGY7RAUeEG6+
         kzvhf2Z3cnJutf72pQpytXRGnsI/hvTY17Xn7A/Y1BMbDW092YT1FiW6DvPCIkXWeylO
         uV4g==
X-Gm-Message-State: AOAM533W8YikD2ou2oUgEBOXUxw3zRPg+WpucYxUfSJsO7UIr7uA1/JE
	7aGLnaq1N/QQEO61tSpdQ1CMxwAaMz0CB18cw+o=
X-Google-Smtp-Source: ABdhPJz1Ma4YAxO8pgkZSdUfWa6P7mC5y6RmingYqWViDsuIMkagL+JzHIWFleIykrZR50at/o7WxZZZ8kgSx06KsmM=
X-Received: by 2002:ac8:5d4f:: with SMTP id g15mr5333688qtx.289.1626375381264;
 Thu, 15 Jul 2021 11:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <1626076608-17034-1-git-send-email-wangmy@fujitsu.com>
 <CA+chaQfWtGf7gsUCLXcTuB985YYHM=FQszdX1d2y4fcjjEepOg@mail.gmail.com>
 <17064fad-db99-80e0-f9b7-ab8c4685ec7d@gmail.com> <AM9PR09MB46422B3F8BEFD4663D00D74DA8129@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB46422B3F8BEFD4663D00D74DA8129@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 15 Jul 2021 11:55:54 -0700
Message-ID: <CAMKF1sqeWORxEneNHxn7YiRAFkC=eUnb7p2U=tfeGRFDpsLeqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] python3-setuptools: upgrade 57.0.0 -> 57.1.0
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, wangmy <wangmy@fujitsu.com>, 
	Leon Anavi <leon.anavi@konsulko.com>, Derek Straka <derek@asterius.io>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 15, 2021 at 10:57 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> On 15.07.21 19:22, Khem Raj wrote:
> >
> >
> > On 7/15/21 7:43 AM, Martin Jansa wrote:
> >> On Mon, Jul 12, 2021 at 9:57 AM wangmy <wangmy@fujitsu.com
> >> <mailto:wangmy@fujitsu.com>> wrote:
> >>
> >>     reproducibility.patch
> >>     deleted since it's been merged upstream.
> >>
> >>     v57.1.0
> >>     -------
> >>
> >>     Changes
> >>     ^^^^^^^
> >>     * #2692: Globs are now sorted in 'license_files' restoring
> >>     reproducibility by eliminating variance from disk order.
> >>     * #2714: Update to distutils at pypa/distutils@e2627b7.
> >>     * #2715: Removed reliance on deprecated ssl.match_hostname by
> >>     removing the ssl support. Now any index operations rely on the
> >>     native SSL implementation.
> >>
> >>
> >> FWIW: this change
> >> breaks  meta-openembedded/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb:do_install:
> >>
> >>
> >> + people who might be interested in python3-cassandra-driver.
> >>
> >> | Installed
> >> /jenkins/mjansa/build/ros/ros2-rolling-honister/tmp-glibc/work/core2-64-oe-linux/python3-cassandra-driver/3.25.0-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/cassandra_driver-3.25.0-py3.9-linux-x86_64.egg
> >>
> >> | Processing dependencies for cassandra-driver==3.25.0
> >> | Searching for geomet<0.3,>=0.1
> >> | Reading https://pypi.org/simple/geomet/
> >> <https://pypi.org/simple/geomet/>
> >> | Download error on https://pypi.org/simple/geomet/
> >> <https://pypi.org/simple/geomet/>: [SSL: CERTIFICATE_VERIFY_FAILED]
> >> certificate verify failed: unable to get local issuer certificate
> >> (_ssl.c:1129) -- Some packages may not be found!
> >> | Couldn't find index page for 'geomet' (maybe misspelled?)
> >> | Scanning index of all packages (this may take a while)
> >> | Reading https://pypi.org/simple/ <https://pypi.org/simple/>
> >> | Download error on https://pypi.org/simple/
> >> <https://pypi.org/simple/>: [SSL: CERTIFICATE_VERIFY_FAILED]
> >> certificate verify failed: unable to get local issuer certificate
> >> (_ssl.c:1129) -- Some packages may not be found!
> >> | No local packages or working download links found for geomet<0.3,>=0.1
>
> But that not directly an issue of the setuptools upgrade, but a not well
> written recipe here.
> I'm more than lucky that this update revealed the issue, because
> otherwise no one would have really noticed that the original recipe of
> cassandra-driver is pulling sources while installing.
> So just in case I would rather pull in this upgrade than to mind the
> broken recipe from meta-python here (just my 2c)
>

i am fine with whatever the right fix is. Its normal that some base
infra component dependency
drives a change in another recipe if thats inline with expected design
then change the component
to work with new update.

> >> | error: Could not find suitable distribution for
> >> Requirement.parse('geomet<0.3,>=0.1')
> >>
> >>
> >
> > yes its reproduced on AB as well.
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1397
> >
> >>
> >>
> >>
> >>
> >
> >
> > 
> >
