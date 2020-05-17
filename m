Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web10.16187.1589677556083143667
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 18:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cykApckb;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: aehs29@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id a9so4944441lfb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 16 May 2020 18:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vrMjrMwFyWRug7XSrH/Ba+Rohh8X6s+LFWMykcK3SnA=;
        b=cykApckbFOXDPw4UR10zcy9wdLJlK0A+0RFi84dHUxhvyoV463pSkT5GvimjMLsCDV
         55rogKAU1p0L06FmPu2HnT5QzLJhoA3b1U3aXU9IldUuTa6K3rWdl9nMjKJRGYngDz/4
         biyr0eKurDLM+fpyE0Q2maQmLOHzE4by2nuRaBVNLxhMCAC8ndsMg3oIRCAfZ8Ue5GIa
         EM/lv4GYzhWOgsC4Pi/GURRX0JnO3PUmWByYW0nwKveduTpmjeysZ+F2qOaUueDXGKlC
         ZROeOJ9fT67ZQ2F1rhxYlv8y3Gw0hs7in0ZP9U93pKKKq6ECwoHrM62iUJOjJX1kn+Tn
         kX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vrMjrMwFyWRug7XSrH/Ba+Rohh8X6s+LFWMykcK3SnA=;
        b=YBbALR0tWS+PLWqv821eX+avxUR/fpHL3/5KA7jEpyxsVpKCaMjZ5jagICgkKWD5xh
         ntAh7hUyFUvHRz5JprwMKuskUiUPh+Viodpy23l0PrYU+/tXH2gjgir1rxX+ifWQMGed
         Qbuge+EJZfDtpSDJltS++/G/0zd8EWFgxkJUd6kVvVVldVRXIBo+NSgm4Cvk3hYBWO3e
         /0Ftnw1thgjFGsyHh7x7fs/t553JY6qEhIlDLtp/3b4AUnXRqcEaJg5YBx7a8rdc6z/D
         nqtdK6kjy7b9jBVrcC7u+06IQweXR7Cf68E8rtsVixvP8pUm289qt4xUVpqBWq5FkR5i
         E3qQ==
X-Gm-Message-State: AOAM530kI8dDjWuPdjwP43cju+BDI4ecZkoP4alosK7I+PoWrKFX2Flq
	TB6a4YEWI5qAO6bwG5tUlC7gNHQ4rGgFN4miHNI=
X-Google-Smtp-Source: ABdhPJxCeH+8G+cVOGEXzRDN1Q+pLP5tydYICEQGqQtP+2zGX3m4+qAu99xvfA3T9kX+VQsFpwndCCf/6vPK3gygYGU=
X-Received: by 2002:a19:2358:: with SMTP id j85mr6408213lfj.182.1589677554214;
 Sat, 16 May 2020 18:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200514210458.33543-1-JPEWhacker@gmail.com> <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <faff3240-ecfa-2f3a-4601-a7ad41952b99@gmail.com> <d8d2af4f-9fa6-d27c-41fd-6d214012736d@gmail.com>
In-Reply-To: <d8d2af4f-9fa6-d27c-41fd-6d214012736d@gmail.com>
From: "Alejandro Hernandez" <alejandro@enedino.org>
Date: Sat, 16 May 2020 19:05:41 -0600
Message-ID: <CAHMutrarBehDLv_L1qB9emm7YRw8Wt6VsXEgP3YKJACBy9RzsA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Khem Raj <raj.khem@gmail.com>
Cc: Joshua Watt <jpewhacker@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko <denis@denix.org>, 
	openembedded-core@lists.openembedded.org, jdmason@kudzu.us
Content-Type: multipart/alternative; boundary="000000000000ed2b4c05a5cda520"

--000000000000ed2b4c05a5cda520
Content-Type: text/plain; charset="UTF-8"

On Fri, May 15, 2020, 1:32 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 5/15/20 12:12 PM, Joshua Watt wrote:
> >
> > On 5/15/20 2:05 PM, Richard Purdie wrote:
> >> On Fri, 2020-05-15 at 14:53 -0400, Denys Dmytriyenko wrote:
> >>> I see Richard has merged these to master-next, thanks!
> >>> And thanks Joshua for volunteering to maintain these recipes :)
> >>> I submitted removal patches to meta-python.
> >>>
> >>> So, it is good we are getting this extra dependency resolved in
> >>> master. The
> >>> question is - can we get these backported to dunfell, does it qualify?
> >>>
> >>> Otherwise Jon wanted to finally branch off meta-arm into dunfell
> >>> today and
> >>> we'll have to live with it until gatesgarth.
> >> I put them into -next so we could test them, see if the autobuilder had
> >> any surprises. Good news is there weren't any.
> >>
> >> The question still remains whether this is the best approach or not and
> >> some people I talked to were not convinced that a consensus had been
> >> reached.
> >>
> >> The question I guess is how widely used is optee and does it warrant
> >> adding this? Its a little ironic the thing people want is trusted-
> >> firmware...
> >
> > FWIW, after having gone through the exercise of pulling in TF-A into
> > qemuarm64, I think I've been convinced that op-tee and TF-A belong
> > together since they are sometimes tightly integrated together (something
> > I didn't realize before). As such, having both in the same layer makes
> > sense. Even if TF-A was in oe-core, you'd probably want op-tee also,
> > which means the python modules would have to be there anyway. I think we
> > can still have the discussion about moving the whole lot over there, but
> > we don't need to do that now, and moving the python recipes at least
> > cuts out the meta-python dependency.
> >
> > My last concern was testing of optee, since there was no platform that
> > could build it by default, but I fixed that by implemented support for a
> > qemuarm64-based machine that's defined in meta-arm which uses TF-A +
> > optee + u-boot and can successful boot using TF-A and passes the op-tee
> > unit tests, so I don't have any concern about that anymore.
> >
>
> I think getting oe-core qemuarm64 boot with uboot+TF-A as an option
> sounds good, and if thats more common solution that armv8 devices are
> following then perhaps would make sense to have this tested in core too.
> But I guess that can be ironed out. As such python deps I think are good
> for dunfell too, we have to ensure meta-python removal happens in
> dunfell as well.
>

+1 on keeping testing this in core as the end goal, I also agree that this
would qualify for the Dunfell changes in both oe-core and meta-python since
its the first step in that direction

Alejandro


> >>
> >> Cheers,
> >>
> >> Richard
> >>
> 
>

--000000000000ed2b4c05a5cda520
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 15, 2020, 1:32 PM Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><br>
<br>
On 5/15/20 12:12 PM, Joshua Watt wrote:<br>
&gt; <br>
&gt; On 5/15/20 2:05 PM, Richard Purdie wrote:<br>
&gt;&gt; On Fri, 2020-05-15 at 14:53 -0400, Denys Dmytriyenko wrote:<br>
&gt;&gt;&gt; I see Richard has merged these to master-next, thanks!<br>
&gt;&gt;&gt; And thanks Joshua for volunteering to maintain these recipes =
:)<br>
&gt;&gt;&gt; I submitted removal patches to meta-python.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; So, it is good we are getting this extra dependency resolved =
in <br>
&gt;&gt;&gt; master. The<br>
&gt;&gt;&gt; question is - can we get these backported to dunfell, does it=
 qualify?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Otherwise Jon wanted to finally branch off meta-arm into dunf=
ell <br>
&gt;&gt;&gt; today and<br>
&gt;&gt;&gt; we&#39;ll have to live with it until gatesgarth.<br>
&gt;&gt; I put them into -next so we could test them, see if the autobuild=
er had<br>
&gt;&gt; any surprises. Good news is there weren&#39;t any.<br>
&gt;&gt;<br>
&gt;&gt; The question still remains whether this is the best approach or n=
ot and<br>
&gt;&gt; some people I talked to were not convinced that a consensus had b=
een<br>
&gt;&gt; reached.<br>
&gt;&gt;<br>
&gt;&gt; The question I guess is how widely used is optee and does it warr=
ant<br>
&gt;&gt; adding this? Its a little ironic the thing people want is trusted=
-<br>
&gt;&gt; firmware...<br>
&gt; <br>
&gt; FWIW, after having gone through the exercise of pulling in TF-A into =
<br>
&gt; qemuarm64, I think I&#39;ve been convinced that op-tee and TF-A belon=
g <br>
&gt; together since they are sometimes tightly integrated together (someth=
ing <br>
&gt; I didn&#39;t realize before). As such, having both in the same layer =
makes <br>
&gt; sense. Even if TF-A was in oe-core, you&#39;d probably want op-tee al=
so, <br>
&gt; which means the python modules would have to be there anyway. I think=
 we <br>
&gt; can still have the discussion about moving the whole lot over there, =
but <br>
&gt; we don&#39;t need to do that now, and moving the python recipes at le=
ast <br>
&gt; cuts out the meta-python dependency.<br>
&gt; <br>
&gt; My last concern was testing of optee, since there was no platform tha=
t <br>
&gt; could build it by default, but I fixed that by implemented support fo=
r a <br>
&gt; qemuarm64-based machine that&#39;s defined in meta-arm which uses TF-=
A + <br>
&gt; optee + u-boot and can successful boot using TF-A and passes the op-t=
ee <br>
&gt; unit tests, so I don&#39;t have any concern about that anymore.<br>
&gt; <br>
<br>
I think getting oe-core qemuarm64 boot with uboot+TF-A as an option <br>
sounds good, and if thats more common solution that armv8 devices are <br>
following then perhaps would make sense to have this tested in core too. <=
br>
But I guess that can be ironed out. As such python deps I think are good <=
br>
for dunfell too, we have to ensure meta-python removal happens in <br>
dunfell as well.<br></blockquote></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
</blockquote></div></div><div dir=3D"auto">+1 on keeping testing this in co=
re as the end goal, I also agree that this would qualify for the Dunfell ch=
anges in both oe-core and meta-python since its the first step in that dire=
ction</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alejandro</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Richard<br>
&gt;&gt;<br>
<br>
</blockquote></div></div></div>

--000000000000ed2b4c05a5cda520--
