Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1TLaNO-0004x6-5m
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 16:01:38 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so4719578pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2012 06:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to:x-mailer;
	bh=1J7EYSSRVKg6iZVvTUHWe+1oXkXbbrbLNA3p7jESu1Q=;
	b=lf2H33LH71exJps2vIfoyDeAkMJDjjdvUvcEoN+98BDigc8w7hnM5J3ZHtRXuk/pxs
	eDK+DeVbQc8lZOJBJjV0wyyJ0mOYd6DM1JrD2Qqu4pgF5Pq9Urd5Btgsz3haBrLeGFxw
	FUTJxelhu1jn7MH+RysXBgOwy7b7rP7r/WapiReeHp4Khz3XtQdZwru/OcZX1rATxZdK
	mYBqhcyo6nELPhp0OgMYA0N6z3ZayV70oRJmzpUvJVkoMMAsnUa1URXUAXd1c6uqPkXp
	ebkVYbDDTUh0LACgXi6cVmNkVwqAvm6kQaP8MUNhuIhSS+Hs3IqlyJKtNBQtRibnNXiD
	/gEA==
Received: by 10.68.225.34 with SMTP id rh2mr63707530pbc.78.1349790508936;
	Tue, 09 Oct 2012 06:48:28 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.106.112])
	by mx.google.com with ESMTPS id s9sm12616984paz.9.2012.10.09.06.48.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 06:48:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1283)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1sqJ==O+AO-Si-CWQSOoZZhppepLjVmjQnipiXuSHWXLMQ@mail.gmail.com>
Date: Tue, 9 Oct 2012 17:48:18 +0400
Message-Id: <F90052C7-AE0C-49EE-9471-29C8618432DD@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
	<8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
	<48919519-8CA2-41A8-96EA-F5D7F91DE33F@gmail.com>
	<CAMKF1sou8jjkoktbC4J1O+b-KbxZ43MyF3aPq68S74p8wC_qwQ@mail.gmail.com>
	<C309CEF1-33E5-4DD0-BA0E-8414EB53802C@gmail.com>
	<CAMKF1srk7SJSGiCDztiyx71NJZUgG530=QbhYCMm88t6ndgSbw@mail.gmail.com>
	<F0DDC3CE-D71C-4CBE-ACA4-B6E66DEDD4FC@gmail.com>
	<CAMKF1sqJ==O+AO-Si-CWQSOoZZhppepLjVmjQnipiXuSHWXLMQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1283)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
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
X-List-Received-Date: Tue, 09 Oct 2012 14:01:38 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2DE843CE-0DF6-416F-ACEE-743DE6F2744E"

--Apple-Mail=_2DE843CE-0DF6-416F-ACEE-743DE6F2744E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Khem,

On Oct 6, 2012, at 7:41 PM, Khem Raj wrote:

> On Fri, Oct 5, 2012 at 11:59 PM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:
>>=20
>>=20

=
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D48df3fe947c4d9=
00aa6b66d9d8352c0d9e59ebe4
eglibc: Fix eglibc-initial and let eglibc depend on it

>> I've narrowed down the init problem, to the application of the above =
patch,
>> but I'm unable to figure out why it is failing. Any suggestions?
>>=20
>=20
> is it eglibc 2.13 ? or 2.16 one thing  I see is that it is disabling
> ssp but otherwise it looks not to so much than changing eglibc to
> use gcc-initial


I was able to get past the error, with back porting the following patch:

=
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D42f0f96903ac31=
2881ef841ae4380b4d1c72980f
gcc-4.7: Backport libgcc fixes to appease the new build sequence

disabling ssp was not the problem, tested with both ssp enabled and =
disabled.

So, now I've got gcc-4.5.4 working with eglibc-2.13, upto the point =
where the kconfig infrastructure was added.

Next, to add the kconfig infrastructure to eglibc-2.13, and fast forward =
to the tip of the poky master branch, and
see if things are still ok, with the PowerPC440.

Best regards,

Elvis Dowson=

--Apple-Mail=_2DE843CE-0DF6-416F-ACEE-743DE6F2744E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">Hi =
Khem,<div><br><div><div>On Oct 6, 2012, at 7:41 PM, Khem Raj =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div>On Fri, Oct 5, 2012 at 11:59 PM, Elvis Dowson &lt;<a =
href=3D"mailto:elvis.dowson@gmail.com">elvis.dowson@gmail.com</a>&gt; =
wrote:<br><blockquote type=3D"cite"><br></blockquote><blockquote =
type=3D"cite"><br></blockquote></div></blockquote><br><div><a =
href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D48df3f=
e947c4d900aa6b66d9d8352c0d9e59ebe4">http://git.yoctoproject.org/cgit/cgit.=
cgi/poky/commit/?id=3D48df3fe947c4d900aa6b66d9d8352c0d9e59ebe4</a></div><d=
iv><div>eglibc: Fix eglibc-initial and let eglibc depend on =
it</div></div><br><blockquote type=3D"cite"><div><blockquote =
type=3D"cite">I've narrowed down the init problem, to the application of =
the above patch,<br></blockquote><blockquote type=3D"cite">but I'm =
unable to figure out why it is failing. Any =
suggestions?<br></blockquote><blockquote =
type=3D"cite"><br></blockquote><br>is it eglibc 2.13 ? or 2.16 one thing =
&nbsp;I see is that it is disabling<br>ssp but otherwise it looks not to =
so much than changing eglibc to<br>use =
gcc-initial<br></div></blockquote></div><div><br></div><div>I was able =
to get past the error, with back porting the following =
patch:</div><div><br><a =
href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D42f0f9=
6903ac312881ef841ae4380b4d1c72980f">http://git.yoctoproject.org/cgit/cgit.=
cgi/poky/commit/?id=3D42f0f96903ac312881ef841ae4380b4d1c72980f</a><br>gcc-=
4.7: Backport libgcc fixes to appease the new build =
sequence</div><div><br></div><div>disabling ssp was not the problem, =
tested with both ssp enabled and =
disabled.</div></div><div><br></div><div>So, now I've got gcc-4.5.4 =
working with eglibc-2.13, upto the point where the kconfig =
infrastructure was added.</div><div><br></div><div>Next, to add the =
kconfig infrastructure to eglibc-2.13, and fast forward to the tip of =
the poky master branch, and</div><div>see if things are still ok, with =
the PowerPC440.</div><div><br></div><div>Best =
regards,</div><div><br></div><div>Elvis Dowson</div></body></html>=

--Apple-Mail=_2DE843CE-0DF6-416F-ACEE-743DE6F2744E--
