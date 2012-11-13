Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TYQOj-0006xS-0c
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 01:00:05 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so3691199lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 15:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=9GXXX19X9WOMSqbx9YB+it/oEJLi0Wh29VN1/O9auP8=;
	b=EY6wE3bsY3zhL/4CySJwaJcX04DCuHpjdW0Ze0ChzSQzucLqu4AmJsOu5cRw9s7FIp
	8togHJBINWAgRuaXUCtSDY1k69t3av7zBujyfRMdeErlXBbQ5RGr2WwsQAykj5yrn1IM
	TCFsA5ly96NkfvQj2peCLd1KlKHbDWoryiWCJN2UJgNuiRGjyvD//n6W6suNDW19VAO5
	I4vviQDaTrJxDSZn6eZz27Gn6V84fZ76IMbpgani0sAQZ08QQemSS/ipo0ktG5XC1bH2
	8tFNy0LY8RjA0ZfgtkZ34R7WNx2YRDI1AEQw6ztKJtG7VW37ZJ1Wk9zcSKeio5UUJw8Q
	HKvA==
Received: by 10.152.108.197 with SMTP id hm5mr23213837lab.45.1352850370229;
	Tue, 13 Nov 2012 15:46:10 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.18.239 with HTTP; Tue, 13 Nov 2012 15:45:50 -0800 (PST)
In-Reply-To: <1351894551-15670-1-git-send-email-yashpal.dutta@freescale.com>
References: <1351894551-15670-1-git-send-email-yashpal.dutta@freescale.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 13 Nov 2012 16:45:50 -0700
X-Google-Sender-Auth: WyTe5reYBtWpRI9YI10HmENfW-8
Message-ID: <CABcZAN=KvmuF49yw-NdCXmd9nTDg40=Fae7gOVNoC4rbwn=Sxw@mail.gmail.com>
To: Yashpal Dutta <yashpal.dutta@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] cryptodev kernel module recipe
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
X-List-Received-Date: Wed, 14 Nov 2012 00:00:05 -0000
Content-Type: multipart/alternative; boundary=bcaec54fbd3ac076dd04ce6905de

--bcaec54fbd3ac076dd04ce6905de
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 2, 2012 at 3:15 PM, Yashpal Dutta
<yashpal.dutta@freescale.com>wrote:

> This is a /dev/crypto device driver, equivalent to those in OpenBSD or
> FreeBSD.
> The main idea is to access of existing ciphers in kernel space from
> userspace,
> thus enabling re-use of a hardware implementation of a cipher.
>
> Signed-off-by: Yashpal Dutta <yashpal.dutta@freescale.com>
>

I would think that patches which add recipes to oe-core would do more than
describe what it is, but also provide justification for its inclusion in
oe-core vs some other layer. If that was already covered in a previous
thread, that's fine, but I wanted to make sure it was explicit.
-- 
Christopher Larson

--bcaec54fbd3ac076dd04ce6905de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri, Nov 2=
, 2012 at 3:15 PM, Yashpal Dutta <span dir=3D"ltr">&lt;<a href=3D"mailto:ya=
shpal.dutta@freescale.com" target=3D"_blank">yashpal.dutta@freescale.com</a=
>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>This is a /dev/crypto device driver, eq=
uivalent to those in OpenBSD or FreeBSD.<br>
The main idea is to access of existing ciphers in kernel space from userspa=
ce,<br>
thus enabling re-use of a hardware implementation of a cipher.<br>
<br>
Signed-off-by: Yashpal Dutta &lt;<a href=3D"mailto:yashpal.dutta@freescale.=
com" target=3D"_blank">yashpal.dutta@freescale.com</a>&gt;</div></blockquot=
e></div><br>I would think that patches which add recipes to oe-core would d=
o more than describe what it is, but also provide justification for its inc=
lusion in oe-core vs some other layer. If that was already covered in a pre=
vious thread, that&#39;s fine, but I wanted to make sure it was explicit.<b=
r>


-- <br>Christopher Larson<br>
</div>

--bcaec54fbd3ac076dd04ce6905de--
