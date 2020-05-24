Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.11603.1590316232744012195
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 03:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GivmJ/gY;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: gzatko@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id j16so2108666wrb.7
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=0AeY/2ZRollwB8LnE/yxYcIRzvAHpYWAEJ1D1YonAxQ=;
        b=GivmJ/gYMu0SLH6UjIKzCF/Es0rL05qJzN0hH9KziW/sGFezTLpEO1p2atVXENTWfY
         JGpOivLb1BGkrDBmc9NsTl0Eg6phSv38y0hG5gMYqIKv/KHkwVmuN9OjBbd03t3sR9+V
         LMOxoTGEAywTzKa2Q47U/o4tPSYofX9a8bhnclltRuBUq9Jl0BsGzomME02wuB+mchZv
         /NdAtewkndJNMstmLB7JzFwigNYAU6+QRinysEdltyg9o0vmzdn8HTN55x3DNVhOx7JM
         PBHElKqmwS4OgTHRYwJbjf23WouFmTJFrYxSkt434aNVsGCUhgTrxWH+JexbtMAWJdAn
         TGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=0AeY/2ZRollwB8LnE/yxYcIRzvAHpYWAEJ1D1YonAxQ=;
        b=Rt3Nxez82ngJAgPD/5/qpsgZ8DbxHKiOJZYdHNfxdtuIV9SEB5lTJ7QAp2hrwRAW8q
         Mez78cmIP7Yz8iBzAx19xcE3FOkHnh0sComeUFSjMYdn3zHGTFWOqxrC5xYbvJXKlN6N
         LWHYqGhzzjmyhQgu8qfoKDT7eREiuBuG/jnjvoQLWbOJTdrfNejJoG71Qv99jlDoLvHb
         TpEuYr/KjgjxbrUfOqsWB2Ws0a9fp5t9KQnaIbY+3yoaDbCx1y/HZA1nL7T1hRB+U5xQ
         DyZT/NVvwOhFzTzp1odCn84+tl6whBpBaWpF7m74eLanv1O7q2h9W//oeUEYzEa5vRfU
         3JsQ==
X-Gm-Message-State: AOAM533Um8cuAfhdzfk5+mg1rDYf7Mm9kSyNvi3/LdrJ8eT5K695COt0
	T5Vj3HpOsBMBFMht4C+fGiY=
X-Google-Smtp-Source: ABdhPJxX6O+0IdgTUvi31zT2S8E7SWmu9XIM7rf/9Eh+IwK1aXTa+0rQacaelychGlIfvyMlN0sf8g==
X-Received: by 2002:adf:e588:: with SMTP id l8mr8357092wrm.255.1590316231034;
        Sun, 24 May 2020 03:30:31 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.lan (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id r14sm19106838wmb.2.2020.05.24.03.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 03:30:30 -0700 (PDT)
Message-ID: <5cf984985a156967c072ac7bed70603e67fce134.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: Detect and fail if 'inherit' is used in conf file
From: "Gregor Zatko" <gzatko@gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 24 May 2020 12:30:29 +0200
In-Reply-To: <CAM9ZRVv-kww8P5SEpkcq77Z-VxzUNAat+5AWgKJLEBu-29Gpnw@mail.gmail.com>
References: <20200524102404.3931276-1-gzatko@gmail.com>
	 <CAM9ZRVv-kww8P5SEpkcq77Z-VxzUNAat+5AWgKJLEBu-29Gpnw@mail.gmail.com>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-orQ+8RspbgURNUiYgNt6"

--=-orQ+8RspbgURNUiYgNt6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ok, thanks for the info.I shall read the guidelines again as I started
to contribute in the beginning of the year but was 3 months off then.
I'll add that next time.
On Sun, 2020-05-24 at 11:27 +0100, Paul Barker wrote:
> On Sun, 24 May 2020 at 11:24, Gregor Zatko <gzatko@gmail.com> wrote:
> > 'inherit' directive may not be used in conf files as it's
> > supposedto be used for the inheritance of classes.Correct form in
> > conf file is INHERIT.
> > This commit adds:- a sanity check to find whether the wrong case
> > exists- fail the build if so- tell user about the difference in
> > directives
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=5426
> > 
> > Signed-off-by: Gregor Zatko <gzatko@gmail.com>---
> > meta/classes/sanity.bbclass | 6 ++++++ 1 file changed, 6
> > insertions(+)
> > diff --git a/meta/classes/sanity.bbclass
> > b/meta/classes/sanity.bbclassindex 292c5591dd..e021b9d240 100644---
> > a/meta/classes/sanity.bbclass+++ b/meta/classes/sanity.bbclass@@
> > -784,6 +784,12 @@ def check_sanity_everybuild(status, d):     if
> > "." in paths or "./" in paths or "" in
> > paths:         status.addresult("PATH contains '.', './' or ''
> > (empty element), which will break the build, please remove
> > this.\nParsed PATH is " + str(paths) + "\n")
> > +    # Check whether 'inherit' directive is found (used for a class
> > to inherit)+    # in conf file it's supposed to be uppercase
> > INHERIT+    inherit = d.getVar('inherit')+    if
> > inherit:+        status.addresult("Please don't use inherit
> > directive in your local.conf. The directive is supposed to be used
> > in classes and recipes only to inherit of bbclasses. Here INHERIT
> > should be used.\n")+     # Check that the DISTRO is valid, if
> > set     # need to take into account DISTRO renaming
> > DISTRO     distro = d.getVar('DISTRO')--2.26.2
> 
> From 
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded:Please
> substitute "PATCH" with "PATCH v2" if you are submitting arevised
> version after addressing feedback (or v3, v4 etc.).
> I've seen several versions of this patch today and it would be easy
> tolose track of which one is the latest if they arrive in
> someone'sinbox out-of-order.
> No need to re-send just for this but please add a version next time.
> Thanks,

--=-orQ+8RspbgURNUiYgNt6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Ok, thanks for the info.</div><div>I shall read the guidelines aga=
in as I started to contribute in the beginning of the year but was 3 months=
 off then.</div><div><br></div><div>I'll add that next time.</div><div><br>=
</div><div>On Sun, 2020-05-24 at 11:27 +0100, Paul Barker wrote:</div><bloc=
kquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf so=
lid;padding-left:1ex"><pre>On Sun, 24 May 2020 at 11:24, Gregor Zatko &lt;<=
/pre><a href=3D"mailto:gzatko@gmail.com"><pre>gzatko@gmail.com</pre></a><pr=
e>&gt; wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bo=
rder-left:2px #729fcf solid;padding-left:1ex"><pre><br></pre><pre>'inherit'=
 directive may not be used in conf files as it's supposed</pre><pre>to be u=
sed for the inheritance of classes.</pre><pre>Correct form in conf file is =
INHERIT.</pre><pre><br></pre><pre>This commit adds:</pre><pre>- a sanity ch=
eck to find whether the wrong case exists</pre><pre>- fail the build if so<=
/pre><pre>- tell user about the difference in directives</pre><pre><br></pr=
e><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5426"><pre=
>https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5426</pre></a><pre><br=
></pre><pre><br></pre><pre>Signed-off-by: Gregor Zatko &lt;</pre><a href=3D=
"mailto:gzatko@gmail.com"><pre>gzatko@gmail.com</pre></a><pre>&gt;</pre><pr=
e>---</pre><pre> meta/classes/sanity.bbclass | 6 ++++++</pre><pre> 1 file c=
hanged, 6 insertions(+)</pre><pre><br></pre><pre>diff --git a/meta/classes/=
sanity.bbclass b/meta/classes/sanity.bbclass</pre><pre>index 292c5591dd..e0=
21b9d240 100644</pre><pre>--- a/meta/classes/sanity.bbclass</pre><pre>+++ b=
/meta/classes/sanity.bbclass</pre><pre>@@ -784,6 +784,12 @@ def check_sanit=
y_everybuild(status, d):</pre><pre>     if "." in paths or "./" in paths or=
 "" in paths:</pre><pre>         status.addresult("PATH contains '.', './' =
or '' (empty element), which will break the build, please remove this.\nPar=
sed PATH is " + str(paths) + "\n")</pre><pre><br></pre><pre>+    # Check wh=
ether 'inherit' directive is found (used for a class to inherit)</pre><pre>=
+    # in conf file it's supposed to be uppercase INHERIT</pre><pre>+    in=
herit =3D d.getVar('inherit')</pre><pre>+    if inherit:</pre><pre>+       =
 status.addresult("Please don't use inherit directive in your local.conf. T=
he directive is supposed to be used in classes and recipes only to inherit =
of bbclasses. Here INHERIT should be used.\n")</pre><pre>+</pre><pre>     #=
 Check that the DISTRO is valid, if set</pre><pre>     # need to take into =
account DISTRO renaming DISTRO</pre><pre>     distro =3D d.getVar('DISTRO')=
</pre><pre>--</pre><pre>2.26.2</pre></blockquote><pre><br></pre><pre>From <=
/pre><a href=3D"https://www.openembedded.org/wiki/How_to_submit_a_patch_to_=
OpenEmbedded"><pre>https://www.openembedded.org/wiki/How_to_submit_a_patch_=
to_OpenEmbedded</pre></a><pre>:</pre><pre>Please substitute "PATCH" with "P=
ATCH v2" if you are submitting a</pre><pre>revised version after addressing=
 feedback (or v3, v4 etc.).</pre><pre><br></pre><pre>I've seen several vers=
ions of this patch today and it would be easy to</pre><pre>lose track of wh=
ich one is the latest if they arrive in someone's</pre><pre>inbox out-of-or=
der.</pre><pre><br></pre><pre>No need to re-send just for this but please a=
dd a version next time.</pre><pre><br></pre><pre>Thanks,</pre><pre><br></pr=
e></blockquote></body></html>

--=-orQ+8RspbgURNUiYgNt6--
