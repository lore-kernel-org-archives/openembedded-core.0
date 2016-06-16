Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5109475C60
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 22:07:29 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id w130so6759251lfd.2
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 15:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G7+KURjqJO4keaoB7VpfAqZ5pLfp958/iR8cZ6ogccg=;
	b=W7bA4hPZ37RW2Jc5xyEJq7wu4i+IMalamFrcmHqw727LunZlG4WSrptbH6P3Ybmtsf
	SEdC5UsuNuRbNx4oK2H5wnWWTIXZcITQYW//XGqmC8ERxbEB04j7oolgmonNVfCNO0IR
	BSwOOeB2CDEFur3AcwuT92m3uuHNgx/vg+oAtHZWZ7Ne8Bbbh5uwgDaSyrEX3jWcgBm8
	EUNyGDCL/FO5S347BKqxKpXsIiccVGA8ZXdh6wtlicqwcbvpRQq3dnNVlJmVQ19nLMuo
	h0jl/DFEqZk0PCcBUA4+76jbaytIkQ7BLs+yzKnF0/8XUJhYAUqLwtfwDvUfh1/qAQVL
	hCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G7+KURjqJO4keaoB7VpfAqZ5pLfp958/iR8cZ6ogccg=;
	b=e88oEoKdUomsEsyPpJePlu379fEFObHJQQkslB/FBDTX1vOLsk4h3kEgdEfrgmCz5t
	cnZpJlaOsJfBesv6cKczH9o2u9eMXrZR+KSPCoITNUxDL4LOne9aZLkcJuzQbBjInChp
	qNLWJjWu/D8/Rz3RcJl4Z/vQtz6oSvMRI8D6rZzhDBr3DRxL859FMEp7QJgnvHSN3tp4
	ZKuUZI6rMJD7Z47M5gdc19CHAEmCS45+fKPsRTQZCKXDZYRxsYvDTFEi2c9u3lJ+oHM0
	YpQJlzbWRIj1xs3uT0azpkMTFrjJBkss+2NAu9xgXz7sf8tGsifik7TM3NezO3HiTHq7
	IFGg==
X-Gm-Message-State: ALyK8tKNk4Y2Aomq7dwC/s4i3T2hfCrOjrpNT8CdlbMhceOsGp/N2BEGem3Rn8mJK+GzNdNxb3ykSJ8vasZ8hg==
X-Received: by 10.25.16.96 with SMTP id f93mr1973082lfi.114.1466114849448;
	Thu, 16 Jun 2016 15:07:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.208.199 with HTTP; Thu, 16 Jun 2016 15:07:28 -0700 (PDT)
In-Reply-To: <CAJTo0LaEQgDLM2vxL7tGW8oefR6Jc1gEkWoHz4J7DkAD7N=sEA@mail.gmail.com>
References: <1466099108-25355-1-git-send-email-mark.asselstine@windriver.com>
	<1466110195-5473-1-git-send-email-mark.asselstine@windriver.com>
	<CAJTo0LaEQgDLM2vxL7tGW8oefR6Jc1gEkWoHz4J7DkAD7N=sEA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 Jun 2016 00:07:28 +0200
Message-ID: <CA+chaQfKBEH-cTpv8N2NrTpuBHiaOpsDAWifoYFmod+fk8WizA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] vte: bring back old version to support xfce4-terminal
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
X-List-Received-Date: Thu, 16 Jun 2016 22:07:31 -0000
Content-Type: multipart/alternative; boundary=001a113fb988cd28e505356c76bc

--001a113fb988cd28e505356c76bc
Content-Type: text/plain; charset=UTF-8

meta-xfce4, right?

On Thu, Jun 16, 2016 at 11:47 PM, Burton, Ross <ross.burton@intel.com>
wrote:

>
> On 16 June 2016 at 21:49, Mark Asselstine <mark.asselstine@windriver.com>
> wrote:
>
>> While waiting to hear back about my inquiry I did take some
>> time to put together this patch that allows things that
>> require the older vte to continue to build. Since xfce4-terminal
>> lives in meta-openembedded this might make more sense to carry
>> over there. I am sure folks will have an opinion so sending this
>> out as an RFC.
>>
>
> That's certainly a good argument for putting the old vte in meta-oe.
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a113fb988cd28e505356c76bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">meta-xfce4, right?</div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Thu, Jun 16, 2016 at 11:47 PM, Burton, Ross <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank=
">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br><div =
class=3D"gmail_quote">On 16 June 2016 at 21:49, Mark Asselstine <span dir=
=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_bl=
ank">mark.asselstine@windriver.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div>While waiting to hear back about my inquiry I did take=
 some<br>
time to put together this patch that allows things that<br>
require the older vte to continue to build. Since xfce4-terminal<br>
lives in meta-openembedded this might make more sense to carry<br>
over there. I am sure folks will have an opinion so sending this<br>
out as an RFC.</div></blockquote></div><br></span>That&#39;s certainly a go=
od argument for putting the old vte in meta-oe.</div><span class=3D"HOEnZb"=
><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></font></span></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div>

--001a113fb988cd28e505356c76bc--
