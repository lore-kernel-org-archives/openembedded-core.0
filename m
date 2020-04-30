Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
 by mx.groups.io with SMTP id smtpd.web12.10845.1588264392927975945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 09:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H7/D4M9o;
 spf=pass (domain: gmail.com, ip: 209.85.221.195, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f195.google.com with SMTP id i185so1932100vki.12
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mDni+MvnmZDQT8GCyxNNfqWEza/Gsa/Zbmg8zSnrLQM=;
        b=H7/D4M9oSvvZ5kxrRSPhIVPyo98MYfzKvsg4/a8/WH5SM+xbFyMqoitJ/qcNE2x4ep
         I4t9a4IsvLRHqX/tas8nQJQ60C9BntovfYBjIBqTe4TExdUmt0SNjQGwp6B9AAWc/E75
         wtchcKiWLn9XgD64kbIbL19xK7bmFaNeYte8kJEYpfTr+aCpUpcDrnkBS4tazOyKLbC1
         01Zad9zf1xuw2XKaH2BVa4sQsqgDliB0uEpa3zBzkLBsc1igtbpTQi7FJugPlzpyrzQo
         FpviQ2ETNu1wpasL35GUKbbA2RgPoHuLUOQXuy8omxrDraasLGD8apWBJ/VmwZ9yvjqx
         ExPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mDni+MvnmZDQT8GCyxNNfqWEza/Gsa/Zbmg8zSnrLQM=;
        b=RDkX8xTEE15cA1IKpsgalbE1O9Hf+Ue90JQIuQ8WysoisqctNerT4B3xDybYnhJZTU
         WMLSvZGkgYr/Qn1CeCVfsWvZf3e6/GsChHdnG5DfuYqeAU/c69vXBGLAOjV9cOHFJ+VY
         mXVmfGRB5q6NZ/+umNTkbnQuNaGe84cOXdt9RNnLRCmwJ4PLVn0eN7fSxrRqOidWAcuE
         130iJ0ZInAHM8yR7s5FC8WzbzJT04MJf8MxNbCgdFptPqslGkskgaDWIAYKrQ4OMNkdC
         G++1M73FfwQ1ldatSbLICkM4IdpA4q6MNQacCxTqHi7WLphxzYuwRl3OIqL5aVcb9dnT
         RczA==
X-Gm-Message-State: AGi0PuYwduEIzFf05c0/CxZWCMyAkEvCyN3GSk6CR1mRiuW6KpCJsE+7
	umDOMfiYDdZTA7HV0RNLOBas5Ruors6dId6Jg/Y=
X-Google-Smtp-Source: APiQypK88LeMwMOJEjtc/OFexzaA+zhmYJQmlHwZEG3ZGJeD9ddvfDUL3ihYS+4DMdfcXlfud43fhONCbRKL4h59KOw=
X-Received: by 2002:a1f:c643:: with SMTP id w64mr3682879vkf.0.1588264392102;
 Thu, 30 Apr 2020 09:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095815.2824-1-alex.kanavin@gmail.com> <20200430095815.2824-5-alex.kanavin@gmail.com>
 <3bf99c3f-7ab1-d4ad-e8e1-c462222c34a8@gmail.com>
In-Reply-To: <3bf99c3f-7ab1-d4ad-e8e1-c462222c34a8@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 30 Apr 2020 18:33:00 +0200
Message-ID: <CANNYZj90=e_zRbAcUT5zNZ-S5StHgPTJg_EJwp_4jdQ15ykWuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/17] kmscube: update to latest commit
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e6957805a4849ea6"

--000000000000e6957805a4849ea6
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2020 at 17:46, Khem Raj <raj.khem@gmail.com> wrote:

> Does this mean it wont work with systems with mali gpu drivers any more?
>
> if so, then its a regression, we should not drop patches just like that
> perhaps.
>

The patch is unmaintained, hasn't worked since kmscube was switched to
meson, and there is no way for me to test it or even understand it. Anyone
with an interest in mali should do the work of getting it upstream, just
tossing custom things into oe-core does not mean they will be kept there
forever.

Alex

--000000000000e6957805a4849ea6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 30 Apr 2020 at 17:46, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">

Does this mean it wont work with systems with mali gpu drivers any more?<br=
>
<br>
if so, then its a regression, we should not drop patches just like that <br=
>
perhaps.<br></blockquote><div><br></div><div>The patch is unmaintained, has=
n&#39;t worked since kmscube was switched to meson, and there is no way for=
 me to test it or even understand it. Anyone with an interest in mali shoul=
d do the work of getting it upstream, just tossing custom things into oe-co=
re does not mean they will be kept there forever.<br></div><div><br></div><=
div>Alex<br></div></div></div>

--000000000000e6957805a4849ea6--
