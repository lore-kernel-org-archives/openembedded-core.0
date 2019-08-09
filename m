Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4327F34D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 09:26:34 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id h28so64994964vsl.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 02:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LezF964jLw/uke5Hs9gCZR/NZbjFcToAq9A/+4WOKcs=;
	b=Ue4RqvKJRjJ5ddZcjVraz2yJasMpZK9xRUpxGNALuvs6biwdt/cOnEEZrNhs2iU795
	qVG8zRcUxtncQKh6m4oDqKddsx95wMJYDxsA5pN+LCevPKeyve2YtBkwjd0jqYOrn2ZF
	89J/VLdVgtYPNNkddMPl2rAkTTkWqVcG6cPlpaf8ZCZ+S7HdgDU7DQ9gL3LUYYGfxhfc
	0lmHpl5kQnTqCtU0smf8zKj8w4YScJrQSODud0b057VtuEoawTbUv+a+A+MRiNdBKxPT
	/1telT0uT1+GZ9ItF5iEWkilkAKORHEK7vAuEAr5OleHfIOWmxI69p34/EUlDZXs1dK2
	9p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LezF964jLw/uke5Hs9gCZR/NZbjFcToAq9A/+4WOKcs=;
	b=dW2lKQOX66OiaUuzvBW86xCuFmOKaYm0mJ4o9D9RAIdL3/dDIXd8Ib0JNRoVYIWDmK
	j2ewAWGLlI5mby+JfZlezU0Lee4yk3oBZfJKX9hLxQ4C+XvWg/gektLedp1ZG6PDN7HM
	+oEPD5bEGbFKCtTR2Hm7g6083gtPw73XpKTGZWTIoj6MbZN3dd4UIyR0WF6TC2WQfGUT
	+/Ie+rmALRnJAY3tS8wrcOvnJqpAuKfJc0rh00aZJKIcyXzskkQJZgLVoL92A06rnpgh
	AGR/iIGRPlMLdWyoG1ZlXKDLIYtpKQuPtQeU81cfLyzyXAo12lz9SWQXzIfY/nf1QtKN
	vXDQ==
X-Gm-Message-State: APjAAAUCRw9HnR3kdv7ZVUYJ5GT1NR9FpB5NH2hqYlqywS8XBIYAqtTo
	w2aRHQBPtKSarA7t/9wtTcNADSMis8PdYHweTX4=
X-Google-Smtp-Source: APXvYqw0T+KJdf64XU+S2OoKP6usQZVDHubYzXpFzfCLzfsEN9EE1xYzxYpjGDooe4Rb7WrZo8b+XXNc8Vr3QQHSfA4=
X-Received: by 2002:a67:e8c3:: with SMTP id y3mr12436790vsn.94.1565342795027; 
	Fri, 09 Aug 2019 02:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <1565333257-171001-1-git-send-email-hongzhi.song@windriver.com>
	<CANNYZj9vnr9Gx=guzr9426JqSd3w5AUSXvgzbmJ2ppC+s4TgMA@mail.gmail.com>
	<37f5c4f7-43bf-ddf3-ce17-494d8324195d@windriver.com>
In-Reply-To: <37f5c4f7-43bf-ddf3-ce17-494d8324195d@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Aug 2019 11:26:21 +0200
Message-ID: <CANNYZj_d2GnP1+B7U=WitOVaNHKeT7aZBEOnvKP2_wMJxuOyoQ@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-tools: enable manpages option for configure
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
X-List-Received-Date: Fri, 09 Aug 2019 09:26:34 -0000
Content-Type: multipart/alternative; boundary="0000000000003fda44058fabc55f"

--0000000000003fda44058fabc55f
Content-Type: text/plain; charset="UTF-8"

You do not need to. The recipe is already inheriting 'manpages' class which
does the right thing.

You only need to enable 'api-documentation' in your distro config or local
config.

Alex

On Fri, 9 Aug 2019 at 10:42, Hongzhi, Song <hongzhi.song@windriver.com>
wrote:

> Hi Alex,
>
> Sorry, I will send v2 using 'api-documentation' .
>
>
> --Hongzhi
>
>
>
> On 8/9/19 4:32 PM, Alexander Kanavin wrote:
> > On Fri, 9 Aug 2019 at 08:49, Hongzhi.Song <hongzhi.song@windriver.com
> > <mailto:hongzhi.song@windriver.com>> wrote:
> >
> >     If disable this option, production will prompt "No manual entry for
> >     lttng-help" when execute "lttng --help" series commands.
> >
> >     Enable the option will make lttng-tools compile manpages and then
> >     package them into lttng-tools-doc/.
> >
> >
> > Enabling manpages is generally subject to 'api-documentation'
> > DISTRO_CONFIG option. Why make an exception here?
> >
> > Alex
>

--0000000000003fda44058fabc55f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You do not need to. The recipe is already inheriting =
&#39;manpages&#39; class which does the right thing.</div><div><br></div><d=
iv>You only need to enable &#39;api-documentation&#39; in your distro confi=
g or local config.</div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 9 Aug 201=
9 at 10:42, Hongzhi, Song &lt;<a href=3D"mailto:hongzhi.song@windriver.com"=
>hongzhi.song@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hi Alex,<br>
<br>
Sorry, I will send v2 using &#39;api-documentation&#39; .<br>
<br>
<br>
--Hongzhi<br>
<br>
<br>
<br>
On 8/9/19 4:32 PM, Alexander Kanavin wrote:<br>
&gt; On Fri, 9 Aug 2019 at 08:49, Hongzhi.Song &lt;<a href=3D"mailto:hongzh=
i.song@windriver.com" target=3D"_blank">hongzhi.song@windriver.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:hongzhi.song@windriver.com" target=3D"_bl=
ank">hongzhi.song@windriver.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0If disable this option, production will prompt &quo=
t;No manual entry for<br>
&gt;=C2=A0 =C2=A0 =C2=A0lttng-help&quot; when execute &quot;lttng --help&qu=
ot; series commands.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Enable the option will make lttng-tools compile man=
pages and then<br>
&gt;=C2=A0 =C2=A0 =C2=A0package them into lttng-tools-doc/.<br>
&gt;<br>
&gt;<br>
&gt; Enabling manpages is generally subject to &#39;api-documentation&#39; =
<br>
&gt; DISTRO_CONFIG option. Why make an exception here?<br>
&gt;<br>
&gt; Alex<br>
</blockquote></div>

--0000000000003fda44058fabc55f--
