Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523FCECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 05:00:41 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.2759.1663131634417195694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 22:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E6adyf4L;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id f9so22613543lfr.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 22:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Vf45k7RR/WA43V44t2cPk4iDsZfNZwrlTuYsa0bfWak=;
        b=E6adyf4LYPOL1iTMI4xIekcL1XzASAhXm2h4x8u8GCOH+oqmToYtvwZXPU0m/LlkPi
         hCZRA98fZ9OI+lAxDSsazY835BD9H96GinfOMpkcicEjTJztDpgoJPQ8KzAFoqfscXQT
         IrNg0SxyccVVlmUvuEBzEWfhkouQp0VqmbzYacqFrXCXBKKUoCdWpGys0eCrc777CZ9y
         YqAaS2KCfQb+rNm6avADa9QzbQ3YMnmKKaxY3NDerOVtJwHbfoXKlRF8s8ABYiBtC3jY
         FJefdi6wEhg+RzO8akhmqIhe3Z02J71tyxzr9ideOFLiAJpqvvm+55zc2ODNWSkW0GK6
         bfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Vf45k7RR/WA43V44t2cPk4iDsZfNZwrlTuYsa0bfWak=;
        b=5ZXXGy4eIGPf5SFyq/LP8cGJs5hLWXxHBzLBJ7S+NpOW4Qo2c3oTJnlvC4oPMRTcRA
         cg7S54johi6wyfIQaxIDGnsVCRiEB55gv71dm7Tsaa2LP9nxik6hePqJDL8ZBP3lBf4L
         lAkZSjNxFqIKPb0VZuTt9R5eYRNSiQewSpcHToZxPHvUTvNYvfXhA1u6GW8y1ktJsGyK
         z9VjM4wfPLyR49nKCQCy9JbCbJE9fwQkO0+IVIfhT52b66lvRMlag+/a7JPy8kcohQVS
         tgwqIqX6P9BcjmLgnLUH5Ugv2uzMqztXfOt4+Ojcl1wyALqFq7yxywbY3PzuciJ71lSs
         LDQA==
X-Gm-Message-State: ACgBeo3b4yoYOviz9U7J01ons2MtuwoZfF9JuyHdffZvClBl8dPBJqtk
	BOgt8Ro+Zt6LQKxyh3VR9peCvyXXKR/Tp1ehjVU=
X-Google-Smtp-Source: 
 AA6agR4s4gsKoTNQoD94QTBaE8Ne0zQOA8tqi/qZUAOHHJSDie/Hp+hTnmVK0sNvL0/oSRkuh/An2ELz/OUrxvQisvY=
X-Received: by 2002:a05:6512:3612:b0:499:aea7:8bed with SMTP id
 f18-20020a056512361200b00499aea78bedmr6066321lfs.26.1663131632289; Tue, 13
 Sep 2022 22:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220831111401.3330342-1-alex@linutronix.de>
 <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
In-Reply-To: <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Sep 2022 07:00:21 +0200
Message-ID: 
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 05:00:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170631

Hello,

this is done for reasons of discoverability and consistency with
machine and distro definitions: they all should be under
meta-somelayer/conf/. This way both tools and humans can easily find
the config templates, and be certain that this is the only location..

Alex

On Wed, 14 Sept 2022 at 05:27, ChenQi <Qi.Chen@windriver.com> wrote:
>
> Hi Alex,
>
> Why must TEMPLATECONF be under a layer?
>
> Regards,
> Qi
>
> On 8/31/22 19:13, Alexander Kanavin wrote:
> > specifically that ../../layer.conf exists, and that second-from-last
> > component in the path is 'templates'.
> >
> > This requires tweaking template.conf creation in eSDK bbclass, as
> > we need to ensure that the path in it is valid, and exists
> > (which may not be the case if the SDK is poky-based).
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   meta/classes-recipe/populate_sdk_ext.bbclass | 3 ++-
> >   scripts/oe-setup-builddir                    | 5 +++++
> >   2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
> > index 56e24c4eed..925cb313fc 100644
> > --- a/meta/classes-recipe/populate_sdk_ext.bbclass
> > +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
> > @@ -438,7 +438,8 @@ python copy_buildsystem () {
> >       else:
> >           # Write a templateconf.cfg
> >           with open(baseoutpath + '/conf/templateconf.cfg', 'w') as f:
> > -            f.write('meta/conf\n')
> > +            f.write('meta/conf/templates/default\n')
> > +        os.makedirs(os.path.join(baseoutpath, core_meta_subdir, 'conf/templates/default'), exist_ok=True)
> >
> >       # Ensure any variables set from the external environment (by way of
> >       # BB_ENV_PASSTHROUGH_ADDITIONS) are set in the SDK's configuration
> > diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> > index 5d644168cb..bf832ee0ca 100755
> > --- a/scripts/oe-setup-builddir
> > +++ b/scripts/oe-setup-builddir
> > @@ -61,6 +61,11 @@ if [ -n "$TEMPLATECONF" ]; then
> >               echo >&2 "Error: TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
> >               exit 1
> >           fi
> > +        templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
> > +        if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir != "templates" ]; then
> > +            echo >&2 "Error: TEMPLATECONF value (which is $TEMPLATECONF) must point to meta-some-layer/conf/templates/template-name"
> > +            exit 1
> > +        fi
> >       fi
> >       OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
> >       OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170101): https://lists.openembedded.org/g/openembedded-core/message/170101
> > Mute This Topic: https://lists.openembedded.org/mt/93368468/3618072
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

