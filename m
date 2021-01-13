Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.3399.1610573628237416296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 13:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pE6kNtLh;
 spf=pass (domain: konsulko.com, ip: 209.85.161.51, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f51.google.com with SMTP id v19so892288ooj.7
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 13:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=Zj0/qWam75SV4xy8sueU1j1Ks+lemFhNRNFEYmUigRE=;
        b=pE6kNtLhvys7jJujTMBK69FVJyLV90fCKV/IaI1TQ76FTpaDCZX1A9S1d7HHc63eSg
         mhZXK3Qbv7t7RnbSvQr4Toy/KcOsyAqceKOaKYXjqNKphXxLDxQZljWwLTFO1m31nNPe
         GVYP0xLzL/f92pAM98WKG2DzMTzY1tQi+fxRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Zj0/qWam75SV4xy8sueU1j1Ks+lemFhNRNFEYmUigRE=;
        b=DrF+j8EWLMUZlF0hIzSoXrgqhZVtSiJVHHn2N0PBn3ZPsQbDeaN2oauCva64QTctTl
         +AG8FoLe//YJODw3PqnTeEeedk6hiqTg6PU51qvOppt9XDbRhRU85KJ1MQUQ7cTa612q
         HqS17izWi3xWs03g8V2Z3EyQL+JiomA4Cw47tVI13hQWeHE2qSvQQ97mJ3l8r2WDWRJA
         CXcfr+59t8ndF07msn6iLwuer9SFEZpfB97SaYYUnmVJUJWoRUY4gQjSghSBohjBh5Np
         HYRHXda2Yesg9PKkBBWWtpZgoQMtgaWswLntQxzNzGfZfUfzbfMF0mIY1OVSiktjv57v
         ILnw==
X-Gm-Message-State: AOAM533xR9KfkbMX9MDuy0oujpph0R1RkrfoyHNT7aFPacpXd8OYrbOZ
	C7AeZMAo7IyZlTuAjsN3+dZsaly5h3WdvXVkVm1mUXJpPe8asw==
X-Google-Smtp-Source: ABdhPJzgvPLpnxBaNfkZsDkgrqbahW8Xazc+gOnRavqSrI3q0DSvmXY2P1X8T4N1KF5XbJIo41Kn8ZrBm6rGfojHDQo=
X-Received: by 2002:a4a:3001:: with SMTP id q1mr2631354oof.88.1610573627267;
 Wed, 13 Jan 2021 13:33:47 -0800 (PST)
MIME-Version: 1.0
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 13 Jan 2021 21:33:37 +0000
Message-ID: <CAM9ZRVuEaZLvg4trA-LhNyz8=yMs=cYhRzSR-emzmEGo8BdMhw@mail.gmail.com>
Subject: OpenEmbedded Virtual Stand at FOSDEM 2021
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi folks,

OpenEmbedded has been accepted to hold a "virtual stand" at FOSDEM
2021 which is taking place online this year on Sat 6th Feb & Sun 7th
Feb, based around the CET timezone.

Most of you will be familiar with FOSDEM by now, but if not let me
give a quick bit of background on the event. This is the Free and Open
Source Developers' European Meeting and usually takes place in
Brussels in early February each year. The event won't be happening
in-person in Brussels this year due to the current pandemic but I
think it's still important to take advantage of this opportunity of
connecting with other contributors to OpenEmbedded & Yocto Project as
well as other members and projects within the wider open source
community. For more information see the FOSDEM 2021 website at
https://fosdem.org/2021/.

This virtual stand will consist of a Matrix chat room (likely with
Jitsi video chat) along with hosting space for static web pages &
video within the FOSDEM 2021 website. The details on all of this are
still being figured out but right now we've got enough information to
start planning our involvement. What we're looking for is:

* Any participants in the project who want to help host the Matrix
chat room between 09:00 and 18:00 each day of the event. This will
likely involve introducing the project to folks dropping in the chat
who aren't familiar with OpenEmbedded, answering basic questions and
chatting about example uses of the project. You don't need to be a
long-standing expert in the project to help out here! If you can do a
couple of hours or a half day please let us know.

* Any folks who would like to help build the static web pages for the
stands section of the FOSDEM 2021 website. FOSDEM is using the Hugo
static website generator so the content will be written as Markdown
files which are converted to html by hugo. Further information is
available in the README file at
https://github.com/FOSDEM/stands-website/blob/master/README.md. I'm
hoping that someone is willing to take the lead on this as I'm already
very busy in the runup to FOSDEM. I'm available to help set up git
repositories, test things out and review content.

* Any contributions of video content to go along with the static web
pages. I'm planning to record some short introductory video content
but other contributions would also be welcome. Details on how to
upload videos is expected in the near future but for now it would be
good to just collect folks who are interested so we can discuss this
further.

If you're interested in any of the above please reply to me and/or the
list. I look forward to virtually seeing many of you at FOSDEM 2021!

Thanks,

-- 
Paul Barker
Konsulko Group
