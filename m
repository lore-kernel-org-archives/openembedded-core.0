Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.8363.1620302625019000271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 05:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gqm4vtxM;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id 33so1622448uaa.7
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DyLja72FHv9Frs2ZbDVYTpTn8oAGcL5G7D4Hn3PcQVA=;
        b=Gqm4vtxMasoVJ7NjjbrjKQCDgvLYJlf+KZG/6Yusn1QHO1RG0pXjOwbis8F+hMqXqI
         kfmXCbO6CBSz6EKwVGxQSEmkfLS18U27Ov/gdCFbiguX1TXGo0psZaupMIfpV6BP9Ev6
         ohuUQyhHsvHdwPBSR33CMwKHS4O+vPRMOqMTAjcwYx4nRfhtgKuKRb/oJOqakod/JPKH
         huKMb+0Y/uJu7Uaxk6wPhGnzMl71ozKamy/U6Kuf1ltRkXSxhGEG9FFW3gcZWpIfpjwG
         rsyUcYilt8vNRjffWVZ8YwPhwUbRnt9QXwvugIJ0KFqXSyMe9LLhDF2O4Pd28X2oGH1z
         gROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DyLja72FHv9Frs2ZbDVYTpTn8oAGcL5G7D4Hn3PcQVA=;
        b=m/wszGMnP5ZxzzBuaMSIbv4mWHImKyHesIyy5w3swV44Jm8oADNfu75OUok0IHPzrt
         RWUc0UztNC3bzwG5tf9un++zB/hW/o6bjmhHocs6nvnP+1BnK9WR1Esj3H385DofHYW/
         q9FStpMkQrafyGy07/HlVEh+bqsy0uItttncsHXwkLdwwKO8yf/Z9yppOeASNXtlfFXL
         FeXvSNcbGKDaxnUOjBegBH8owRzso3LzspDDNh7P/sziBUwch58Thqzgh1WUP9RCCDUW
         hmXXHYmKLSWukD5z7muGvemH5fna5cIsnTHbd9aobvVl/as6mnAZJX9lx6jYMITWZxm3
         gKdw==
X-Gm-Message-State: AOAM531W0oC2NsiCUuzzS+WYzGD5p9zck7z3NXSIk87gvnS9kBxMTgOn
	5+lDEtYLfVcw0trq9FaYFEl9nX+isHYlpgLMcLY=
X-Google-Smtp-Source: ABdhPJzsPvn1CVMSlE96kAYEH3Epa9WT3eFqsyRhP8mDUwGHtzc+ykyQ4XfArk84XwZ0ZfzoaimqWcFR09rhbIR0pyU=
X-Received: by 2002:a9f:2465:: with SMTP id 92mr2950650uaq.71.1620302624191;
 Thu, 06 May 2021 05:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-6-alex.kanavin@gmail.com> <e08e70ad086f413733bf5ba3cabdd558926a9868.camel@linuxfoundation.org>
 <167C4C9FDBAB97AF.3326@lists.openembedded.org>
In-Reply-To: <167C4C9FDBAB97AF.3326@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 6 May 2021 14:03:32 +0200
Message-ID: <CANNYZj8+5nJYToT83ARf1MoG7VUdPnmYa_o_yqqAkwLOqrtG6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/61] expat: upgrade 2.2.10 -> 2.3.0
To: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000057f77105c1a81a8f"

--00000000000057f77105c1a81a8f
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 May 2021 at 00:36, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Thu, 6 May 2021 at 00:32, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> Doesn't removing this degrade the accuracy of the ptest reporting?
>>
>
> I'll check the outputs before and after.
>

Right. There are no outputs either before or after: ptest support was added
to the recipe, but never included into either fast or slow set in
ptests-packagelists.inc.
http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=147db377

So it's unknown if it even works at all or ever did. I've CCd the author,
so that he can complete the work, and rebase any needed patches, until then
I guess we can take the update as is?

Alex

--00000000000057f77105c1a81a8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 6 May 2021 at 00:36, Alexander Kanavin via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a h=
ref=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, 6 May 2021 at 00:32, Richard Purdie &lt;<a href=3D"mail=
to:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@lin=
uxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Doesn&#39;t removing this degrade the accuracy of the ptest=
 reporting?<br></blockquote><div><br></div><div>I&#39;ll check the outputs =
before and after.</div></div></div></blockquote><div><br></div><div>Right. =
There are no outputs either before or after: ptest support was added to the=
 recipe, but never included into either fast or slow set in ptests-packagel=
ists.inc.</div><div><a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/co=
mmit/?h=3Dmaster-next&amp;id=3D147db377">http://git.yoctoproject.org/cgit.c=
gi/poky/commit/?h=3Dmaster-next&amp;id=3D147db377</a></div><div><br></div><=
div>So it&#39;s unknown if it even works at all or ever did. I&#39;ve CCd t=
he author, so that he can complete the work, and rebase any needed patches,=
 until then I guess we can take the update as is?<br></div><div><br></div><=
div>Alex<br></div></div></div>

--00000000000057f77105c1a81a8f--
