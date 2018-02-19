Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 05E0E7873C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 19:01:30 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id f14so6266806wre.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 11:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FJMW4IeVHEhq20Ew3SADjUmws6jTPNjGECKAR/yTd2I=;
	b=th8inGrdcksSGvGRQ1cN5HRazKmbbR7qruTvLfsW3aIQG6b37xjddWwQpfsxpB6cte
	3dE7JionI5CVI+T5FPeh81w7WcNcEDzNZ4+4z+WfdUDsPea1lMsANXD/C8tQN+pYBW46
	zGLKWgueMHbWqBvlJPNkIg3xS51t1H2WfxJqdN6ZVF6AwkaA/Tw20ji3IS1zv03uk980
	MN8xHrmm7czZV64xNFTQRDde2zxfv6MdVK8f0MOR5/ZwzATv8lCn4hKtbJVZ5SvzqISY
	e6fSQPKWrIN0cj8Nth0fp7b/XgCg5lEXXoHZwQS1+CnWZADUFDeD1KPYTrD/yGyHSMes
	UDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FJMW4IeVHEhq20Ew3SADjUmws6jTPNjGECKAR/yTd2I=;
	b=tQ//FeyiveBszgmr0Qtb+6gpUMlpDOLeQ2uvTY0WiCUmxmX9ynTx3CKoqkSAuHkCka
	s+XoBsMb+R0e+Xqi4Z/Jcs2Q+5kTK1jHaIbvhg9oX1C4AjY+s5rahvGmHSc4+YVxQHJ+
	jM3urTskRryn3G9wuRfzLec57RcCjW8KZJnJY3B+GYjcdxmyBlndl9vltajHOgG0j4Nz
	qIUfiEtUF4h3BkUmZf4uAwrG9/xu3E7sYnbg2MeD3pxxXdYGeX25s17+I7w/9ppGwARs
	VkcOPuiqm9/yo/kWrJcxZt3XS8yPoyRsTUqYMhBBXWsjijryXN4ssD/TxAOcJbCHTBDM
	PlZw==
X-Gm-Message-State: APf1xPBMjkF9M97GVRuyjF3GFy6hrGVO6R820rGpAzp76oa77g0juySq
	jVh2DmaJHM7S2kXwy88qjFQLavleQsx6yWqcA9g=
X-Google-Smtp-Source: AH8x227Szd1Chitg8S+bliFdiUYM1beu7Lap07xOxTEB90yC/iRqxFYqQUHkt3d3rmg7f0rEd55HZJYO0ge152mGBpo=
X-Received: by 10.223.161.77 with SMTP id r13mr13778552wrr.230.1519066891852; 
	Mon, 19 Feb 2018 11:01:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Mon, 19 Feb 2018 11:01:31 -0800 (PST)
In-Reply-To: <20180219115538.5081767b@seebsdell>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
	<CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
	<20180216132531.3a1c2398@seebsdell>
	<60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
	<CA+chaQdGobLWVzZ_YSpdWozrF3ZrYzBNAVusUMFgGFbAX+w90w@mail.gmail.com>
	<CA+chaQeNhb=nPaYz3XZdh_ceQopFKJvEq5Ximu83PykTjoHJWA@mail.gmail.com>
	<bb8be581-a074-b05b-86c6-71e1ee19fdfa@linux.intel.com>
	<20180217141701.229759cf@seebsdell>
	<bb1b003e-9bd3-f438-8ae1-637500d970b5@linux.intel.com>
	<20180219115538.5081767b@seebsdell>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 19 Feb 2018 20:01:31 +0100
Message-ID: <CA+chaQd2-perimm0_Eey85TTniWx9BE5KJMAO69PveyBB9vQEQ@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: update to latest master
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
X-List-Received-Date: Mon, 19 Feb 2018 19:01:31 -0000
Content-Type: multipart/alternative; boundary="f403045e27f27aa39005659552a8"

--f403045e27f27aa39005659552a8
Content-Type: text/plain; charset="UTF-8"

I've bumped SRCREV to include your latest fix and re-enabled epoll and now
it doesn't get stuck for me, thanks!

I did quick check for UID/GID issue:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12434

without epoll disabled and SRCREV "b6a015a Handle O_TMPFILE more better" it
was still reproducible, now I'm testing with epoll enabled and latest
SRCREV "f3f4459 Epoll: use the correct client"

Regards,


On Mon, Feb 19, 2018 at 6:55 PM, Seebs <seebs@seebs.net> wrote:

> On Mon, 19 Feb 2018 11:27:56 +0200
> Alexander Kanavin <alexander.kanavin@linux.intel.com> wrote:
>
> > > Huh. It's possible that the initial "don't try to close fd 0" was
> > > correct, and the real problem is that the attempt is getting made
> > > mistakenly. I'll study that more; the epoll code was a contribution
> > > and I may not have fully understood it.
> >
> > To be honest, it would have been better to apply my epoll patch as it
> > is, and then do additional modifications as separate commits. That
> > would make it simpler to isolate the issue. We've used my epoll patch
> > for many months without problems on the autobuilder and elsewhere.
>
> ... Wow, you know, now that you *mention* it, that is a really good
> idea. *sigh* Sorry about that.
>
> Hmm.
>
> > if (clients[events[i].data.u64].fd == listen_fd) {
>
> Just a sanity-check: Should this be equivalent to:
>     if (events[[i].data.u64 == 0)
> ?
>
> The reason I ask is that, looking at the code, we should never, ever,
> be getting into close_client(0). The "<=" check was right.
>
> The only call to close_client anywhere in the epoll case is:
>
> > } else {
> >       int n = 0;
> >       ioctl(clients[i].fd, FIONREAD, &n);
> >       if (n == 0) {
> >               close_client(i);
> >       } else {
> >               serve_client(i);
> >       }
>
> And that's the else for clients... oh hey
>
>
> > if (clients[events[i].data.u64].fd == listen_fd) {
> ...
> > ioctl(clients[i].fd, FIONREAD, &n);
>
> do you see the error? I do.
>
> This gets back to "and one of the problems with testing is that
> if I don't actually check the logs, I often don't see problems",
> because pseudo does enough internal disaster recovery that things can
> explode horribly without observable failures.
>
> Now extracting the data.u64 value and using that consistently as the
> index. Pushed fix to master.
>
> -s
>

--f403045e27f27aa39005659552a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve bumped SRCREV to include your latest fix and re-e=
nabled epoll and now it doesn&#39;t get stuck for me, thanks!<div><br></div=
><div>I did quick check for UID/GID issue:</div><div><a href=3D"https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D12434">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D12434</a><br></div><div><br></div><div>without epo=
ll disabled and SRCREV &quot;b6a015a Handle O_TMPFILE more better&quot; it =
was still reproducible, now I&#39;m testing with epoll enabled and latest S=
RCREV &quot;f3f4459 Epoll: use the correct client&quot;</div><div><br></div=
><div>Regards,</div><div><br></div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Mon, Feb 19, 2018 at 6:55 PM, Seebs <span dir=3D=
"ltr">&lt;<a href=3D"mailto:seebs@seebs.net" target=3D"_blank">seebs@seebs.=
net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">On Mon, 19 Feb 2018 11:27:56 +0200<br>
Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">=
alexander.kanavin@linux.<wbr>intel.com</a>&gt; wrote:<br>
<br>
&gt; &gt; Huh. It&#39;s possible that the initial &quot;don&#39;t try to cl=
ose fd 0&quot; was<br>
&gt; &gt; correct, and the real problem is that the attempt is getting made=
<br>
&gt; &gt; mistakenly. I&#39;ll study that more; the epoll code was a contri=
bution<br>
&gt; &gt; and I may not have fully understood it.<br>
&gt;<br>
&gt; To be honest, it would have been better to apply my epoll patch as it<=
br>
&gt; is, and then do additional modifications as separate commits. That<br>
&gt; would make it simpler to isolate the issue. We&#39;ve used my epoll pa=
tch<br>
&gt; for many months without problems on the autobuilder and elsewhere.<br>
<br>
</span>... Wow, you know, now that you *mention* it, that is a really good<=
br>
idea. *sigh* Sorry about that.<br>
<br>
Hmm.<br>
<span class=3D""><br>
&gt; if (clients[events[i].data.u64].<wbr>fd =3D=3D listen_fd) {<br>
<br>
</span>Just a sanity-check: Should this be equivalent to:<br>
=C2=A0 =C2=A0 if (events[[i].data.u64 =3D=3D 0)<br>
?<br>
<br>
The reason I ask is that, looking at the code, we should never, ever,<br>
be getting into close_client(0). The &quot;&lt;=3D&quot; check was right.<b=
r>
<br>
The only call to close_client anywhere in the epoll case is:<br>
<br>
&gt; } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int n =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ioctl(clients[i].fd, FIONREAD, &amp;n);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n =3D=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close_client(i);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serve_client(i);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
And that&#39;s the else for clients... oh hey<br>
<span class=3D""><br>
<br>
&gt; if (clients[events[i].data.u64].<wbr>fd =3D=3D listen_fd) {<br>
</span>...<br>
&gt; ioctl(clients[i].fd, FIONREAD, &amp;n);<br>
<br>
do you see the error? I do.<br>
<br>
This gets back to &quot;and one of the problems with testing is that<br>
if I don&#39;t actually check the logs, I often don&#39;t see problems&quot=
;,<br>
because pseudo does enough internal disaster recovery that things can<br>
explode horribly without observable failures.<br>
<br>
Now extracting the data.u64 value and using that consistently as the<br>
index. Pushed fix to master.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-s<br>
</font></span></blockquote></div><br></div>

--f403045e27f27aa39005659552a8--
