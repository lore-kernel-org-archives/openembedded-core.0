Received: from mail-lb0-f173.google.com ([209.85.217.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Tu6mx-00033j-Cu
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Jan 2013 20:30:44 +0100
Received: by mail-lb0-f173.google.com with SMTP id c1so2034925lbg.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2013 11:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=VT/CIFZL2RKCLKn1qf5Xo8+upmlfKPPI8XkCmOZkxGY=;
	b=zbcRvv75N/+HvXc9vLz4O+vI8Q9sRYZnYpVMnibGpLE1j9LI1EvkuD5ZDixIXta8xN
	8TrVpQOS4h+KymD8YlH5+tRSemVK1VWfOqAWi3zkdhwKOP9EXzpQJ15cUJAW5YNepu+r
	WpcXdKOJVnF5qdSaSMEYHab04AeDnpD7nKV2SQN5xopQxP7XkiWoXXdN82Gcgma6U636
	82c1BX42sdbcFtUHAGYnR8TSi+7E9zDUeu+ynXauduDYq79RrOlvTAkjGHxuV85PJF0T
	rF1Ook+OkxFkrqd9jQIVNqyFSdCPmS//FppzX6D6JC9+0DT80aBw7+Ns60+re4S7Jnwh
	x8Ww==
Received: by 10.152.103.99 with SMTP id fv3mr75785439lab.16.1358018126681;
	Sat, 12 Jan 2013 11:15:26 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Sat, 12 Jan 2013 11:15:06 -0800 (PST)
In-Reply-To: <1357995930.4072.134.camel@ted>
References: <alpine.DEB.2.02.1301120618220.15410@oneiric>
	<1357995930.4072.134.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 12 Jan 2013 12:15:06 -0700
X-Google-Sender-Auth: EgliVZXAPqTzzwMyhmLK-Mq6vrs
Message-ID: <CABcZAN=T+GS=H_PuyusNYJNmjbVraoz1u_OdCHq3Nr8s=hqBHw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: image_types.bbclass: what's with "elf" and "cpio.gz"?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Jan 2013 19:30:44 -0000
Content-Type: multipart/alternative; boundary=f46d040716550a15c504d31c3c95

--f46d040716550a15c504d31c3c95
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 12, 2013 at 6:05 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > i was going to trivially fix that comment (it's now "alltypes", not
> > "types"), but i was distracted by the code above that -- what the heck
> > is going on there?  what's the rationale for removing elf, then adding
> > cpio.gz and elf back on at the end?  if someone can clarify that, i
> > can add that as more comment, as well as a few other tweaks in that
> > file for more documentation for anyone reading TFS.  thanks.
>
> Order is important. The elf image depends on the cpio.gz image already
> having been created so a) it must be created and b) it must happen
> before elf.


I'd think we could implement a data-driven method for this, rather than
hardcoding this knowledge. Either declare the deps via a flag, or have one
directly call the other.
-- 
Christopher Larson

--f46d040716550a15c504d31c3c95
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sat, Jan 12, 2013 at 6:05 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">&gt; i was going to trivia=
lly fix that comment (it&#39;s now &quot;alltypes&quot;, not<br>
&gt; &quot;types&quot;), but i was distracted by the code above that -- wha=
t the heck<br>
&gt; is going on there? =C2=A0what&#39;s the rationale for removing elf, th=
en adding<br>
&gt; cpio.gz and elf back on at the end? =C2=A0if someone can clarify that,=
 i<br>
&gt; can add that as more comment, as well as a few other tweaks in that<br=
>
&gt; file for more documentation for anyone reading TFS. =C2=A0thanks.<br>
<br>
</div>Order is important. The elf image depends on the cpio.gz image alread=
y<br>
having been created so a) it must be created and b) it must happen<br>
before elf.</blockquote></div><br>I&#39;d think we could implement a data-d=
riven method for this, rather than hardcoding this knowledge. Either declar=
e the deps via a flag, or have one directly call the other.<br>-- <br>

Christopher Larson</div></div>

--f46d040716550a15c504d31c3c95--
