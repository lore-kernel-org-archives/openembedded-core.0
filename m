Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 336837DBC0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 15:37:53 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id h18so8209657lfj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 08:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aKnrd3VTs/bzLSCA2+C9/ULlVPlSA59XYb1YVpk6Ob4=;
	b=tJI2Y0jaWyGH6wtM5hlXqjm/lrfepiWISY1AY1HPG22WDN1MqlUeuSicyVMa5wYcct
	2gra2mn8f5CwUWlwbxSESN2M6nFj6hk655jF6WU7v5hfYcZoyTOZKiXyzbu+sfKEo2wj
	s9vvkzRPvVN1C74R1X3ZuEHHs0mtlpYYdvcvn8J5yRoJLbJKRcJgdl1+DRYLY8TtUoME
	xXppLO77zk5y2tN5DQK9s8V3YVhZoBK2hrW9Bhvs3+r6odC5Z5n/cyGpcLv5YUGeLT9k
	ChWKlGs1R3fCBUuqLeJv/gVnJQVd3191UJc2R++lZXluOSmfx2IW9dxiADIxs8q6vzV2
	eHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aKnrd3VTs/bzLSCA2+C9/ULlVPlSA59XYb1YVpk6Ob4=;
	b=aAQc3GJYzDzIR+UIyqF3cT/pg/6acevcS3tNJIjQTSYTU3ufneozLcJP4mEZ05L7Xo
	JAdgWDVlP1K1XDkUdE7FU+U/dfjil8TRBsWjSvBgWPf6HTMF6e6Vp4BJLGH7HoQnNoae
	LSLoPDWfCPBUykQ+ipI0BgeCnYhnb0kv9/olJbGKG9gd6O/SPgKqHPzKr2O2wN9YBHPH
	IhPetnkFmKP2wTiYCqGvLT+CPfoBKcYGbAisht9ZwY6XuWudNfHi9O6JQLCjJyxQ2XCh
	Ccj5S1z3WOv/N8QH6BW8wjMYcvezLZp+nIJhvd3gCrEJCbZC5ka36RXc59YxL9N5xjTC
	BBzA==
X-Gm-Message-State: APjAAAVlop2ck8zwaVk9JT5dSRhoyaG9ACM7nvDuRbBjtwdQ/r2B/ppI
	bGo8NoXBXyYEAKN4E7ALcXlvaTYLAYBFBkSeSMD+q6nm
X-Google-Smtp-Source: APXvYqxG3/Ou8oXJduhahYwiPPP4ps4eywmKteJuwAEayUy0o+/oQK583H0koA0qMiY/QOOXMYv/SScIeQDdmmSonvI=
X-Received: by 2002:a19:7406:: with SMTP id v6mr8899257lfe.9.1556552273626;
	Mon, 29 Apr 2019 08:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <1556546164-28522-1-git-send-email-f.suligoi@asem.it>
	<1556546164-28522-2-git-send-email-f.suligoi@asem.it>
	<CADkTA4MjV8eMW5BZxze4midXnrhVmwMC9wA-gvfTGQFbNoNcVw@mail.gmail.com>
	<30d121834e24400695cabab95cb0ce56@asem.it>
In-Reply-To: <30d121834e24400695cabab95cb0ce56@asem.it>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Apr 2019 11:37:41 -0400
Message-ID: <CADkTA4PeUCNUDMJewAApvq52sgOv9SSsnULh86CcsP2z3k=iog@mail.gmail.com>
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: check for empty .config file after merge_config.sh
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
X-List-Received-Date: Mon, 29 Apr 2019 15:37:53 -0000
Content-Type: multipart/alternative; boundary="000000000000580ea40587ad1178"

--000000000000580ea40587ad1178
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 29, 2019 at 11:02 AM Flavio Suligoi <f.suligoi@asem.it> wrote:

> Hi Bruce,
>
> > Sometimes, for example in case of missed dependecies, after the
> > execution of:
> >
> > merge_config.sh
> >
> > the resulting file ".config" can be empty.
> > This is the reason why is necessary test it and, in case, display
> > the "Could not configure ..." error message.
> >
> > This doesn't belong here. Auditing of the final .config is done in a
> separate task, and we could pickup that issue there.
> >
> > That being said, there are already checks for inputs that could result
> in something like this. How were you triggering this issue ? I'd like to
> reproduce it here, and perhaps come up with a different solution.
> >
> > Bruce
>
> I encountered this problem of the empty .config when I integrated
> the kernel 4.19 in my custom meta-layer based on a poky "rocko" (2.4)
> version.
>
> The kernel 4.19 requires the following dependencies in the kernel recipe:
>
> do_kernel_configme[depends] +=
> "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
> do_kernel_configme[depends] +=
> "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
> do_kernel_configme[depends] += "bc-native:do_populate_sysroot
> bison-native:do_populate_sysroot"
>
> (in the thud version of poky these dependencies are already integrated in
> the
> kernel-yocto.bbclass, but not in rocko)
>
> Without these dependencies the merge_config.sh fails without any error
> messages,
> the distro build process proceeds, but the built kernel is completely wrong
> (no modules and only default config).
>
>
Thanks for the info. I'll poke around a bit, and either queue these
directly or do something
similar in the kconfig audit step.

Cheers,

Bruce



> For this reason I added the additional error log:
>
> ${meta_dir}/cfg/merge_config_build-errors.log
>
> and the check for the empty .config
>
> Flavio
>
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000580ea40587ad1178
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 29, 2019 at 11:02 AM Flavio Suligoi &lt=
;<a href=3D"mailto:f.suligoi@asem.it">f.suligoi@asem.it</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bruce,<br>
<br>
&gt; Sometimes, for example in case of missed dependecies, after the<br>
&gt; execution of:<br>
&gt; <br>
&gt; merge_config.sh<br>
&gt; <br>
&gt; the resulting file &quot;.config&quot; can be empty.<br>
&gt; This is the reason why is necessary test it and, in case, display<br>
&gt; the &quot;Could not configure ...&quot; error message.<br>
&gt; <br>
&gt; This doesn&#39;t belong here. Auditing of the final .config is done in=
 a separate task, and we could pickup that issue there.<br>
&gt; <br>
&gt; That being said, there are already checks for inputs that could result=
 in something like this. How were you triggering this issue ? I&#39;d like =
to reproduce it here, and perhaps come up with a different solution.<br>
&gt; <br>
&gt; Bruce<br>
<br>
I encountered this problem of the empty .config when I integrated <br>
the kernel 4.19 in my custom meta-layer based on a poky &quot;rocko&quot; (=
2.4) version.<br>
<br>
The kernel 4.19 requires the following dependencies in the kernel recipe:<b=
r>
<br>
do_kernel_configme[depends] +=3D &quot;virtual/${TARGET_PREFIX}binutils:do_=
populate_sysroot&quot;<br>
do_kernel_configme[depends] +=3D &quot;virtual/${TARGET_PREFIX}gcc:do_popul=
ate_sysroot&quot;<br>
do_kernel_configme[depends] +=3D &quot;bc-native:do_populate_sysroot bison-=
native:do_populate_sysroot&quot;<br>
<br>
(in the thud version of poky these dependencies are already integrated in t=
he<br>
kernel-yocto.bbclass, but not in rocko)<br>
<br>
Without these dependencies the merge_config.sh fails without any error mess=
ages,<br>
the distro build process proceeds, but the built kernel is completely wrong=
<br>
(no modules and only default config).<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Thanks for the info. I&#39;ll poke around a bit, and eithe=
r queue these directly or do something</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">similar in the kconfig audit step.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
For this reason I added the additional error log:<br>
<br>
${meta_dir}/cfg/merge_config_build-errors.log<br>
<br>
and the check for the empty .config<br>
<br>
Flavio<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000580ea40587ad1178--
