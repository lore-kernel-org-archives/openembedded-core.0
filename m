Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.800.1631640094664423358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 10:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mLly+NKd;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.45, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f45.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso2750705wmb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 10:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QzYrQBRQbussMJ2s9I9yPqjryVwDqc6Jc90m9IBiX5Y=;
        b=mLly+NKdMGy8v6efU/q1GrMl5bYjci1JTpVZnROph7zMRWojlbaGKIlevS3qgAakEf
         PEzBnlOTTnQxTj39XymJpVZjJ2SSHgn51qvsqjMps1aJV+Z2GpjLYILt2YpDMM/aAXKg
         pUFTVNVi+1Y0nX53IzKZVK5c0MUY58rP5b0mud2YE1p6CjTzQIpQh/i253R0bric60Jh
         8vqLSn/XtRpq0dHjWmtGIYP/Fj3ynmX9hg0ifMuo58VhKPrkZSOpp4VSRfBZ6vhWpWbT
         Tct2unHWYoDBztVxKbngRfQLFLEBE0GaYVa5euO7T2bal+wfCT1NacTLeUvBwxU780IA
         KX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QzYrQBRQbussMJ2s9I9yPqjryVwDqc6Jc90m9IBiX5Y=;
        b=uSPCRHmE7BDeAYRbvj9LYIWSn+SXZCFXZFroBWtogOKeksbE42z8kxqoTxpz2UW/r+
         2bOBNEQe59OxqbAMZX7/rrf1OZzR6KudoYGwWk2orgMNFTBHJSt7wqzgo20F9wsuh5Ku
         N2fGZ0WWMcwR7a0IYc6GaUf+drmhlvI5hkuCdHfuRk6HY0vOV1nQK8mTbqAGDOJykiM3
         emu4zGSavrR0A8t+iNu/y7Z6MZ9F8vFudKYwkr7ilAcWlaXiZbYct48/IBklfQaDZTVD
         kOAZ40furaPCVdU2D22iJQH28znQonvyDs4Xgr71f+GOW9riE7b3hYNDb9qbbaR/7B8g
         EObA==
X-Gm-Message-State: AOAM531rulJyeObT4Sxl3LoYdqsCNEPmAJ85jDF65VZGZHaXJz36LIeG
	gHebt4A8Jlzj+pJrxbGTSEaD/y9DpkzIadHSeXromA==
X-Google-Smtp-Source: ABdhPJz+XVwW29P2oXNLezMQCnR34q6QP5PUBwwK/T4tQMCPo/mgUCz9PKPvm8dtne3Rm5iZCf6dRWJKVeUTJrb6OmE=
X-Received: by 2002:a1c:7e12:: with SMTP id z18mr304684wmc.60.1631640092569;
 Tue, 14 Sep 2021 10:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210913124526.26861-1-jainsaloni0918@gmail.com>
 <16A46989BBD4976A.22787@lists.openembedded.org> <CAOSpxdZt_mGQr5X_v1B1dAnYL6kyJod_1L7HU2B4yaNWM2f_7w@mail.gmail.com>
 <16A46B7AC64AA0C2.21276@lists.openembedded.org> <MA1PR01MB4108A8DAB05C5F6FE6C0042C87DA9@MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA1PR01MB4108A8DAB05C5F6FE6C0042C87DA9@MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 14 Sep 2021 07:21:20 -1000
Message-ID: <CAOSpxdYTzqM8rL3bfqX7kkNO-iB4D-VWaNVGYSnqmtL3znhbXg@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] db: Whitelist CVEs
To: Saloni Jain <Saloni.Jain@kpit.com>
Cc: "akuster808@gmail.com" <akuster808@gmail.com>, Saloni Jain <jainsaloni0918@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <Nisha.Parrakat@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 7:09 AM Saloni Jain <Saloni.Jain@kpit.com> wrote:
>
> Hello Steve, Armin,
>
> I ran a CVE check cycle after reverting the CVE_PRODUCT changes for berke=
ley_db and no other CVEs were reported in db either in patched or unpatched=
 state.
> Should there be any other patch reporting from db or was my scan successf=
ul?

 If you don't get any reported CVE's for db then your scan was
successful.  I've confirmed the same with my testing.

So instead of your original patch we should revert:  db: update
CVE_PRODUCT in master and then cherry-pick into the other branches.

I'll send a patch for this.

Steve

>
> Thanks & Regards,
> Saloni
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of saloni via lists.openembedded.org <saloni.jai=
n=3Dkpit.com@lists.openembedded.org>
> Sent: Monday, September 13, 2021 9:02 PM
> To: Steve Sakoman <steve@sakoman.com>; akuster808@gmail.com <akuster808@g=
mail.com>
> Cc: Saloni Jain <jainsaloni0918@gmail.com>; Patches and discussions about=
 the oe-core layer <openembedded-core@lists.openembedded.org>; Khem Raj <ra=
j.khem@gmail.com>; Nisha Parrakat <Nisha.Parrakat@kpit.com>
> Subject: Re: [OE-core] [poky][dunfell][PATCH] db: Whitelist CVEs
>
> Caution: This email originated from outside of the KPIT. Do not click lin=
ks or open attachments unless you recognize the sender and know the content=
 is safe.
> Hello Armin, Steve,
>
> Thankyou for the review!
> I am triggering a test run after reverting the changes, would update once=
 I have the results =F0=9F=99=82
>
> Thanks & Regards,
> Saloni Jain
> ________________________________
> From: Steve Sakoman <steve@sakoman.com>
> Sent: Monday, September 13, 2021 8:32 PM
> To: Steve Sakoman <steve@sakoman.com>
> Cc: Saloni Jain <jainsaloni0918@gmail.com>; Patches and discussions about=
 the oe-core layer <openembedded-core@lists.openembedded.org>; Khem Raj <ra=
j.khem@gmail.com>; Nisha Parrakat <Nisha.Parrakat@kpit.com>; Saloni Jain <S=
aloni.Jain@kpit.com>
> Subject: Re: [OE-core] [poky][dunfell][PATCH] db: Whitelist CVEs
>
> Caution: This email originated from outside of the KPIT. Do not click lin=
ks or open attachments unless you recognize the sender and know the content=
 is safe.
>
> On Mon, Sep 13, 2021 at 4:56 AM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
> >
> > On Mon, Sep 13, 2021 at 2:45 AM Saloni Jain <jainsaloni0918@gmail.com> =
wrote:
> > >
> > > From: Saloni Jain <salonij@kpit.com>
> > >
> > > Below CVE affects only Oracle Berkeley DB as per upstream.
> > > Hence, whitelisted them.
> >
> > I suspect that a cleaner solution might be to revert:
> >
> > db: update CVE_PRODUCT
> > (https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t.openembedded.org%2Fopenembedded-core%2Fcommit%2F%3Fid%3Dad799b109716ccd2f=
44dcf7a6a4cfcbd622ea661&amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C467b5=
0be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63=
7671421956436940%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DQMCJw%2FfFm82vPD%2BpDaS=
ck5W7hUutTs39r%2FJKxCUk9U8%3D&amp;reserved=3D0)
> >
> > which adds berkeley_db to CVE_PRODUCT
> >
> > I did a quick test and this eliminates all of the CVE's below. And of
> > course it makes sense to only check for oracle_berkeley_db since that
> > is the source code we are using.
> >
> > Also, this same issue is present in master, so any fix would need to
> > go there first and I will cherry-pick.
> >
> > Could you confirm that this approach works for you too?
>
> And for those who are wondering why the db CVE's don't show up in the
> weekly reports, it is because the script that Ross provided me many
> moons ago whitelisted db and db-native.
>
> I figured he had a good reason for that, so I left it in for
> consistency with the reports he had run :-)
>
> db and db-native are the only whitelisted packages for those who might
> be wondering.
>
> Steve
>
> > > 1. CVE-2015-2583
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2583&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DfSTScw44lUI4qycejRW2jLlbjqQvYZKUQhytyXGlNbQ%3D&amp;reserved=3D0
> > > 2. CVE-2015-2624
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2624&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DxW4VT6muPbocpKxehCFMF4ojU8akMPyWnbxRduTNs6Q%3D&amp;reserved=3D0
> > > 3. CVE-2015-2626
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2626&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DyO8cLnIGCFvWzcw%2B2H0oG5900jInxy%2BgjU9tQox6RIc%3D&amp;reserved=
=3D0
> > > 4. CVE-2015-2640
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2640&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3Do4N90heboZE7XV5uHDijGTXZkg6XchKW8H1ZzM34rGc%3D&amp;reserved=3D0
> > > 5. CVE-2015-2654
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2654&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DX1cVGqk6PCSeMU9EBMGsuXro4WcZUTUjF3a4HF7g6nM%3D&amp;reserved=3D0
> > > 6. CVE-2015-2656
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2656&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DoFOQcHH4nlSdBQ4HvGDSwWuRp%2BLswX0J9pa6F%2FyIBRI%3D&amp;reserved=
=3D0
> > > 7. CVE-2015-4754
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4754&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956436940%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DCw4zdD%2FJPFzjxCCSP5RgPj%2FAox%2BN%2FGEzCHlZtlGbZQ8%3D&amp;rese=
rved=3D0
> > > 8. CVE-2015-4764
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4764&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DLGOEPqGAa3ifKXxZW%2FVO5TmCHgdCmyt%2BN7ZA%2FQ8rguk%3D&amp;reserv=
ed=3D0
> > > 9. CVE-2015-4774
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4774&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3Di3MQaM9xd0ZgmpHsV8aYGycRbYaZvlPQxHveQyr4UYY%3D&amp;reserved=3D0
> > > 10. CVE-2015-4775
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4775&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DVnzYPX3J24diVtyedP81biRmwxdavDXK7pBjIWv6kd8%3D&amp;reserved=3D0
> > > 11. CVE-2015-4776
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4776&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DSzL3t6rsdE4h1kU%2FA6%2Bb%2Bf%2Fjqpgb0dlMdc4zlYrj1o8%3D&amp;rese=
rved=3D0
> > > 12. CVE-2015-4777
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4777&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3Dt3UohudchaM8ZJZV4oYvj4IJ38Bduh0oB1lHKUCewSg%3D&amp;reserved=3D0
> > > 13. CVE-2015-4778
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4778&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DmXwzFlWfd%2FG6%2F4d5t2NomyEo03fOlDBcDL1DDczlzZU%3D&amp;reserved=
=3D0
> > > 14. CVE-2015-4779
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4779&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3D5YucvGHDQkQAvElBlCwKZujJ6%2FG6qQw08cQ0k8u8sZA%3D&amp;reserved=
=3D0
> > > 15. CVE-2015-4780
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4780&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3D4UD6W4UiY7wiQqYTl%2B2CEeccElryBEqaNDlOcQ9mSvA%3D&amp;reserved=
=3D0
> > > 16. CVE-2015-4781
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4781&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DCBCSzSRLtN%2FBzl7gLmkvuhGfMTUP135%2B1ZPSQiz2D08%3D&amp;reserved=
=3D0
> > > 17. CVE-2015-4782
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4782&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DFKY1KcwEvkD4BEy6jQ7sbVZH1OBGMLztkDj4drnsBIA%3D&amp;reserved=3D0
> > > 18. CVE-2015-4783
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4783&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3Dd0wt3ZJ9UT92HENr1%2BYIsrlq7MlB3LX5z9lfW0nDtco%3D&amp;reserved=
=3D0
> > > 19. CVE-2015-4784
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4784&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3D7o5gRYxijUhG2D5boMYe1OD76%2FQ8klyVja%2BNjJ2%2Fkg8%3D&amp;reserv=
ed=3D0
> > > 20. CVE-2015-4785
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4785&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956446933%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DkIWv8xwCxETVe1JmQlR04rP65hJzZ1CKZhsdSnj9jHg%3D&amp;reserved=3D0
> > > 21. CVE-2015-4786
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4786&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DXgIihTf1yiXRL6olzZoCV%2BUgMM8ixLGE0AYs4qw5Ww8%3D&amp;reserved=
=3D0
> > > 22. CVE-2015-4787
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4787&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3D8oxzgSAyO2tev8BExeNuM07mfEtfg4DyC0IHv5PKU04%3D&amp;reserved=3D0
> > > 23. CVE-2015-4788
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4788&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DkXnkpBnx8S39wEwc27YF0nd6OivYK38gBbsTvsvjH7c%3D&amp;reserved=3D0
> > > 24. CVE-2015-4789
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4789&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DJCTC5XPdev3VaHt9PA0eExnT5B90EcwGVtqBHj1pqRg%3D&amp;reserved=3D0
> > > 25. CVE-2015-4790
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4790&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DROkJAKPAsVmzWbhUyABgaoELODz5%2Be3h8Csc9iBBPVk%3D&amp;reserved=
=3D0
> > > 26. CVE-2016-0682
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0682&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DKFPlP8B1g1L6RrkuYgH7tPnskayAhb3E9LGez5PWUBw%3D&amp;reserved=3D0
> > > 27. CVE-2016-0689
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0689&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DbWQe2GU072%2BDpA7w8Yh%2FM5B27iHH7g19lJH9SFNIDsA%3D&amp;reserved=
=3D0
> > > 28. CVE-2016-0692
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0692&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3Dv8T8c955i4zY0QKC%2FsCGmI6MxmdeKBsuT4YqPeR9v80%3D&amp;reserved=
=3D0
> > > 29. CVE-2016-0694
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0694&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3Dkb8X0QDr%2BH239JXs%2FKUxwIlGz%2BA2SPFwe1EDCkB0Mns%3D&amp;reserv=
ed=3D0
> > > 30. CVE-2016-3418
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-3418&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3D2jNdn5Ei%2F5%2BocXpopgUNlioCMGvee8ps1r9WvRIw%2BBs%3D&amp;reserv=
ed=3D0
> > > 31. CVE-2017-3604
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3604&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DNd8t%2BJJ%2FYn%2ByiV3CN3wa7%2B1YZVNT2%2By%2BJrWV7d4Wc%2FM%3D&am=
p;reserved=3D0
> > > 32. CVE-2017-3605
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3605&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DGExxG9UOd9F1AEkZ%2FHYaI42s4fPvsGU2NPNly9VoC8w%3D&amp;reserved=
=3D0
> > > 33. CVE-2017-3606
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3606&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956456927%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DSmwLj0q4CXfufByOslu3Ex3tA6%2BMy%2BsSnDqWA3WJJao%3D&amp;reserved=
=3D0
> > > 34. CVE-2017-3607
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3607&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3Dx%2BofQvZBVvcFCayuopxhBC3ow81fXBSbNUSVFV0f2Ss%3D&amp;reserved=
=3D0
> > > 35. CVE-2017-3608
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3608&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DwZSH49pD%2Bw%2BhqZrPfGi%2BzK%2B4y66w5ea8nFut7ZthqHM%3D&amp;rese=
rved=3D0
> > > 36. CVE-2017-3609
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3609&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DkOgCwCIKRRccp%2FilFi1KlVGyve%2BLOnaH1OacUqd%2Fl6w%3D&amp;reserv=
ed=3D0
> > > 37. CVE-2017-3610
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3610&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DZCDEQ1%2B2RQqUrwtru7Z1p1cYfNplNTx6iBoG70yB9d4%3D&amp;reserved=
=3D0
> > > 38. CVE-2017-3611
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3611&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3D%2F1qT%2BVz8YlvB0OYolO2skqnL0gldW2CARgVqViDmbJE%3D&amp;reserved=
=3D0
> > > 39. CVE-2017-3612
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3612&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DO7yjSBYHBed7kL9ZUlBLDcB9Mb3mMzBFp4vcg5RUX4Y%3D&amp;reserved=3D0
> > > 40. CVE-2017-3613
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3613&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DMx5LWkNdzMvyRrmJY7Se5my%2B6E9dYXY1Twbl1tQv39s%3D&amp;reserved=
=3D0
> > > 41. CVE-2017-3614
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3614&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DPpdDjvTxr3uAsl2spHZMpn81X3puECgncJD28%2By76mQ%3D&amp;reserved=
=3D0
> > > 42. CVE-2017-3615
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3615&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DRt7KrbK76tTP8Ujz0pWhkMNWN3KdcJNfApuixIIAgrQ%3D&amp;reserved=3D0
> > > 43. CVE-2017-3616
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3616&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DWMOxG6LvJ5oDW3onPdUudoOGhR1ydmm%2FNM22p4knfrY%3D&amp;reserved=
=3D0
> > > 44. CVE-2017-3617
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3617&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DBxOhS4rBYTPJaBbD4oB8s%2B1GmnYZ7r%2FMcgq6UGMIopc%3D&amp;reserved=
=3D0
> > > 45. CVE-2020-2981
> > > Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-2981&amp;data=3D04%7C=
01%7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DNAo7A0M9DfJCg4Ayz0hKetVs7vU6owOO%2Bg6iDTgxMJM%3D&amp;reserved=
=3D0
> > >
> > > Signed-off-by: Saloni <jainsaloni0918@gmail.com>
> > > ---
> > >  meta/recipes-support/db/db_5.3.28.bb | 92 ++++++++++++++++++++++++++=
++
> > >  1 file changed, 92 insertions(+)
> > >
> > > diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-supp=
ort/db/db_5.3.28.bb
> > > index b2ae98f05c..000e9ef468 100644
> > > --- a/meta/recipes-support/db/db_5.3.28.bb
> > > +++ b/meta/recipes-support/db/db_5.3.28.bb
> > > @@ -39,6 +39,98 @@ SRC_URI[sha256sum] =3D "e0a992d740709892e81f9d93f0=
6daf305cf73fb81b545afe7247804317
> > >
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ded1158e31437f4f87cdd4ab2b=
8613955"
> > >
> > > +# Below CVEs affects only Oracle Berkeley DB as per upstream.
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2583&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956466923%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Dqfs66cBsbBauNX8iC%2F9Ii2Oq35s12T9EYc415eJzbAQ%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2583"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2624&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DjXXNq74r4MFYvx30viObvu7c5F6S6WXUDAklwCeEhuo%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2624"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2626&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DOMKc6RkLzlSpE%2BMeNW7MYTt8xnAcxs65u7lVNaAm0M4%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2626"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2640&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DD%2BxdYSDrv%2BXV7hBhY73aeu8%2BhNn5qweWDUv8Yy6Bqow%3D&amp;reserved=
=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2640"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2654&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D691iFpIxrO8mhrP2OzZSGdFAG6f%2BPli4iy61VIieaxg%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2654"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-2656&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DlaiW9gSHlQBl8DpGSM5i56RGE8li5bib25vBRpf56UQ%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-2656"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4754&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Dyl28kS0qy5I0fAGlIRe2IvF73qVd%2FVi4XWhLHJVFv0c%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4754"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4764&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Dyf5HunyI7%2Fd0gQw1lk%2FC5oQmGTwGFuREMkSJB%2BoRT1g%3D&amp;reserved=
=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4764"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4774&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D8iOL7TJs0WSIpDubsmCyPUq%2F%2F4figBq3gCP6Gm7vKj0%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4774"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4775&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Dp1df2rDNtaPc%2BOkhabyRTMpDxI1ZhOIdcrf4QtulOmY%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4775"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4776&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DiICHEmfynDGXtoK%2FF7PNIXCiOn6rOLvRvd5hQSHqLTg%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4776"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4777&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D2tRQSJmqg48Y8Ifr43FEAqOhQ97HJ4z5zItGkUj0tXM%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4777"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4778&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DuHnx0Vc%2BvZuwr4envYA1hOfdOHtPJn49gze1yBWFxo0%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4778"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4779&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956476914%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DGmVsx%2FnDu8U3dd4xF5lPUbTsedaCDDwJ5GSf4ctIZfA%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4779"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4780&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DhOHXVNaUXRUAsIbsussTJJJeBb5T%2ByUCt%2BKt0iZBEAI%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4780"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4781&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D%2F7qozIiOGzvZt4BXGtNaSxVlK3poteQGgSgBVJ%2BmF6g%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4781"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4782&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D%2FNYUlRPOFTnV0E69%2FleienOYTjTzUlUjKua1leNv9MQ%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4782"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4783&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Di0nQuzdT5PRaFxQvWJxK%2FOhoDGgUKH0hjZI0B1Tg47w%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4783"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4784&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Dd96RPRCv%2FebxsPAqLGV%2FtYRmUtqW9%2BdkGzjtoVf9avg%3D&amp;reserved=
=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4784"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4785&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DhE%2FDqgq2YnThAi%2B5aPHDazMfYbu9AhIAEPUa3jVeZLg%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4785"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4786&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DGtBnlO8chf45RHFjcGZ5e8GuLg%2B3BUADi283bRW%2BLDA%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4786"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4787&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Dcx4Dh6nHU8AsP%2BHhfzVFVh4cmdXFNjKM%2FYPdC%2Ff9Os4%3D&amp;reserved=
=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4787"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4788&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DgPVRvYk2K8bP4Iq%2BlzwoEXI9Sq0FdIeRG0jMxQ3WoyU%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4788"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4789&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D%2Faqxgw%2BzrkdZF22IqNlfCtOytxdGUlHxBdrD63wGmwY%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4789"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-4790&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Dyx4LmiWmmSJsauVeGAboNAFTEq3eLXwwLppy3le7Sk4%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2015-4790"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0682&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DGlpW%2BxkAayQz5bt%2FDzZ4fqB6HvbAlhph%2FLwcnkKlPeo%3D&amp;reserved=
=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2016-0682"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0689&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Ds7id2zjKiYECNybaLgx57ZkFXETtcbACJsKPqds4XC4%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2016-0689"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0692&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956486911%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DziBoqN8lkMsYyzlBPd0DjLfUW9lFC5%2BM5YyeopPdrVM%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2016-0692"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-0694&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Dl0K3eeT4sfU0cDEib8%2BT3FTGqKhQx6V2qmcAbocnGAA%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2016-0694"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-3418&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Da9iUyPv%2FV6su%2FYpfb5uiqXkzCkRXhmG4WB3qSzpZZ%2Bw%3D&amp;reserved=
=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2016-3418"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3604&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DRLM7HsHLAnJJ2oDMngOg9VslALP24bZasqZsmuRSuwY%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3604"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3605&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DlTX2UqWgRQH6XqUQ3hpzXgD1Cffpb4ystmu8VIjKslg%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3605"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3606&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DsTo3BMNf%2BDXPdLhSqfROCha6HiFZu2K%2BBOpWkoQImko%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3606"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3607&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D07mPl1AkFjBMKTgcEwkX%2FUZsESTKfwj2dYZxo6v2mas%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3607"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3608&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D6S7Qh5kgXhiKWCKlhqAEX3lBrPMo0%2Buqm3UK3r%2BJdCE%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3608"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3609&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DxM209vJ5hYrzko7xVEv%2FAToGI4VfJJYBXGrl6sNRMio%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3609"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3610&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DlLQpJgJhvnnKE%2FUpPcuFwfz%2BX1tG8tkn%2Byq0oDD2XHY%3D&amp;reserved=
=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3610"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3611&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DUkuqVmbT0olqjuQxHxk2n65LJQjIAv%2B2N1I3thqTkQQ%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3611"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3612&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DccrTxlAbNJ5IDd1h2nmFw%2FaQ1hHXpxO1VBCjah8ZWvQ%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3612"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3613&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DW%2BT3TMDHZZgbuFHhiBUHt%2BG0B9EWGXd8QzGjnxAn93Y%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3613"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3614&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956496902%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DZBQd4BtFG5xJPf4XhgAXaOT7%2BNGC92c8QRa%2FPuCzFDo%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3614"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3615&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DAIveZqlackZdBo%2Bk0OAyax79uIaI9abJ5vYIJovt2%2Fk%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3615"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3616&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DMYu07%2FXam457qEhuiCBPy%2FNX9llHyLVb628WXJvnwJc%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3616"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2017-3617&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DyqZ0FQqRl8G4H7nxS%2B4g%2BQXJ7iGO7qWem7d8mjZ5KqU%3D&amp;reserved=3D=
0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2017-3617"
> > > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-2981&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C467b50be2a1b49fb6bd008d976c79ac7%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637671421956506896%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Dguy1TMaaiYsbZDs6tlMIrQnvj80mKChvvukqWSlbRaw%3D&amp;reserved=3D0
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2020-2981"
> > > +
> > >  inherit autotools
> > >
> > >  # The executables go in a separate package - typically there
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > >
> >
> >
> >
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> Get Outlook for Android
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
