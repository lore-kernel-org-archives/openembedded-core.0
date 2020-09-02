Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.13502.1599017306339002233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 20:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bh4t4TQo;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 109so3082131otv.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 20:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JU6nocUsxPnyVJhXya7EprohksESLAD5eDJWExQXDWk=;
        b=bh4t4TQov3A9wjPvEg1BZ+D/msXCjrcuqQZq11v/1xwHb6F7Hi9yYyU7jnZXBGned3
         kKkR5eSnkhSr42hAp37JVw9A5SFZ6qO4UPjDeZUd3fpoqNLbVUA1pHbnUjkNdbJjR+G6
         0S9I6NkqQJBS5WiZgWreAa4aBgF0BjF7xLt3u8Vx5HioFNDTVDr8dp3KJaO0GIihygWx
         p51N3QBQnGE/YvgQL94yKXrwXdb627fBRK9CaDpigLxS/Jm0W8+z0beSOVJrBsZXYLzb
         q7Ez0GvAr7PK9qpzKY6+ANz7yXabk2nSs8XTT7HgNwjelDfUs3OL7u0Ij2htJUXiPsTP
         ZWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JU6nocUsxPnyVJhXya7EprohksESLAD5eDJWExQXDWk=;
        b=PeNWb7a+gxhEBA6Kph59JEsTzCkgVUQhY8t+RHIo63F7F+MT2mdeUoIYmToZGb+tmw
         aDpbNbhscD/8biXQEzddidvqvm2Vla7L8WqPndPqJriGeQFe5JosQC+0l+BX8vo4MwU4
         m3falz3v4WL1s9UGpLfuJr8KwmHly05Bloa1H2wShw/8CvMt1GsDqNo1+TQqigVpfQNU
         +yWtpA7TshSXb0Den6nI6ClFnwSVD3sCnv4AZYXOAq8k5RlmGyun+kbrEr6lFLV5Wmc2
         xNtnqbnUIeFN2iUcyn0pqTP/S4KBVUw+CUKDTEwMzNMBiyk86445OKmPxTnPH/OniJoq
         /Gww==
X-Gm-Message-State: AOAM531fGOBRoRCbFrDM9keerR/smq7T7xpxao18ZF+CF08ta50ykyVb
	NSv4WwgtDTi9VOk0BrELnwxwT2mevb2rgl2BkQI=
X-Google-Smtp-Source: ABdhPJx+If26IhptuN3B6jgkYJPXpYtVjP+ubmZLXN70TeCjMDo4dQKzw6kKMeyxYH78rc73UIzkw+6FjCgF4thSiZI=
X-Received: by 2002:a9d:7f84:: with SMTP id t4mr3872267otp.192.1599017305607;
 Tue, 01 Sep 2020 20:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598810890.git.steve@sakoman.com> <19d9787f362e8ee4460964768ca9b5f093bd4f0f.camel@linuxfoundation.org>
 <CAOSpxdZ97Z3FwgE2G6Sd3gxbpnSBpi6U2Je_XNV7BfNJUg9Xwg@mail.gmail.com>
In-Reply-To: <CAOSpxdZ97Z3FwgE2G6Sd3gxbpnSBpi6U2Je_XNV7BfNJUg9Xwg@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 1 Sep 2020 20:28:14 -0700
Message-ID: <CACMJ4GbJSsU5hWnphDammJmirJk9+0DYyhYnyU43B7XMMt7gWg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/25] Patch review
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 1, 2020 at 7:06 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Tue, Sep 1, 2020 at 1:07 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Hi Steve,
> >
> > On Sun, 2020-08-30 at 08:15 -1000, Steve Sakoman wrote:
> > > Please review this next set of patches for dunfell and have comments
> > > back by end of day Tuesday.
> >
> > A few of these (e.g. devtool, RPROVIDES, kernel fragments) are what I'd
> > consider slightly riskier patches which only really just made master.
> > I'm not sure if we want to give a little extra time for some of those
> > in master before we backport?
>
> Certainly, I'll drop those patches from the pull request and let them
> bake for another week.

Steve: since you're looking at pulling in kernel fragment patches to
dunfell, please could you add this patch to your next round:

commit af687c9137a3e8efe48afa6fd12866cf656ae913
cml1: Move find_cfgs() helper to cml1.bbclass

https://lists.openembedded.org/g/openembedded-core/message/140493

It's needed in dunfell of oe-core to fix compatibility with
post-dunfell meta-virtualization, where the Xen recipe now inherits
cml1.bbclass to support config fragments. Without this patch applied,
parsing of meta-virtualization fails since find_cfgs is missing; with
it applied, the current master branch of meta-virtualization is
compatible with dunfell of oe-core, which enables use of newer Xen
versions with the stable dunfell core -- enabling this combination is
useful and would be appreciated.

thanks,

Christopher

>
> Steve
> 
