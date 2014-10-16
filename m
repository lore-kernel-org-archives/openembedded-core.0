Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBA360DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 16:04:43 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id b6so3068471lbj.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=wZrKrg0PwBrjFuvquaeYiD79HHnsGZ3hlEsbJrl4lUQ=;
	b=T3cWXeS56dnAV91r5KgQ992T/1MM16V8J21RL+xzPDe4dpSUS+7ZwHNeJEmLx9FJe+
	3jdhbW3s8tW1wtDLxtBxJuHK6/DuQdrIkKy0zUBJmFlm3z68d7rZpeNFRxevL8MO1ucx
	/QtW6dDvm5NTco/VD+3tBU30+MDtwiIj0SzxMgNkHZXE0QfWjG8Y4QYQfT46nTwEc5wM
	W3eR9hid0h/DKf5aUpIpj43KXo0TDIV0X2IDEvkKuMq3hwx93LfLKGD2mA6EP1zAy7Hx
	Xw+fFXrzVVFCGiqIMNOM8Cw0Lx2mgWxKY9dZJWecfaADDhthEyJZ3mbPHKjkNSBlI0ae
	/fbw==
X-Received: by 10.152.7.233 with SMTP id m9mr2760536laa.32.1413475483957; Thu,
	16 Oct 2014 09:04:43 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.97.200 with HTTP; Thu, 16 Oct 2014 09:04:23 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1410160850380.6082@localhost>
References: <alpine.LFD.2.11.1410160850380.6082@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 16 Oct 2014 09:04:23 -0700
X-Google-Sender-Auth: Fda30IigHOflWLuHWK6zzHGIvRo
Message-ID: <CABcZANnVTqKYnE1o68qYjAqSWPUL__M4jzZQpCZaB=ZD+V0=JA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: isn't "do_install_append_pn-uclibc" partly redundant?
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
X-List-Received-Date: Thu, 16 Oct 2014 16:04:46 -0000
Content-Type: multipart/alternative; boundary=001a11c34e3e1ec04105058c680d

--001a11c34e3e1ec04105058c680d
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 16, 2014 at 8:54 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> meta/recipes-core/uclibc/uclibc.inc:do_install_append_pn-uclibc () {
>
> now, given that the above file is clearly the general include file for
> the uclibc package, could the task append definition:
>
>   do_install_append_pn-uclibc () {
>
> not have been written more simply as:
>
>   do_install_append () {
>
> as in, given that this task append is clearly only for the uclibc
> package, it seems unnecessary to add a package-specific override. most
> other recipes use the second, shorter form, so i was wondering if
> there was something subtle about the uclibc recipe that necessitated
> the first form.
>

uclibc.inc is included by both uclibc-initial and uclibc.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c34e3e1ec04105058c680d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Oct 16, 2014 at 8:54 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1kb"=
 class=3D"a3s" style=3D"overflow:hidden">meta/recipes-core/uclibc/uclibc.in=
c:do_install_append_pn-uclibc () {<br>
<br>
now, given that the above file is clearly the general include file for<br>
the uclibc package, could the task append definition:<br>
<br>
=C2=A0 do_install_append_pn-uclibc () {<br>
<br>
not have been written more simply as:<br>
<br>
=C2=A0 do_install_append () {<br>
<br>
as in, given that this task append is clearly only for the uclibc<br>
package, it seems unnecessary to add a package-specific override. most<br>
other recipes use the second, shorter form, so i was wondering if<br>
there was something subtle about the uclibc recipe that necessitated<br>
the first form.</div></blockquote></div><br>uclibc.inc is included by both =
uclibc-initial and uclibc.<br>-- <br>Christopher Larson<br>clarson at kergo=
th dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - T=
slib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a11c34e3e1ec04105058c680d--
