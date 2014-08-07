Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE136FE5C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 14:43:12 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so4396931wes.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 07:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yTWyPO3uey8B0Q6VOvVxWXi2tZa2TDd0+B67Jr8z9fQ=;
	b=vW8zceuSBM08pQlFE+4DbmQFmk95WZuVnzUY8tRIqz7H3kibcer8cova0IQFwDuftX
	PAG9ZLDrJ9GGkCbnQLUaOAf8UF4GqJ/eA7G7pixjv+/zmiWHMDamfGmXGEC4QwnEW9Q7
	7+QAnuRabBM26PZBf6v4bN4M2fFYpJDN8Z8q8hbFCIL38TbJlANZQCOrF76SCbJbatqM
	kUWywZn1maTDl9iJW45ftiwZg6WfttDEe9M12sYWbwtAefukJ702XFKFw6v+IFpXGQ2J
	J+56x2DOlbNu0tg/eW1eof+71ptdtkGKcTV88vcO2uInbpMEma4QvQhUeJZmn7y+3+lh
	jJjQ==
MIME-Version: 1.0
X-Received: by 10.180.92.104 with SMTP id cl8mr57847316wib.43.1407422593446;
	Thu, 07 Aug 2014 07:43:13 -0700 (PDT)
Received: by 10.194.164.165 with HTTP; Thu, 7 Aug 2014 07:43:13 -0700 (PDT)
In-Reply-To: <CAOHjBZt0MW329iM2UNFUs3bZuAR61tA1Y9k4dt--hDoy3fh=AQ@mail.gmail.com>
References: <CAOHjBZt0MW329iM2UNFUs3bZuAR61tA1Y9k4dt--hDoy3fh=AQ@mail.gmail.com>
Date: Thu, 7 Aug 2014 07:43:13 -0700
Message-ID: <CAOLEWZV=ifTbkm+0owRh404z5aakvGEqwPzjWo_i8pLYNy7qiw@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to force patch application
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
X-List-Received-Date: Thu, 07 Aug 2014 14:43:15 -0000
Content-Type: multipart/alternative; boundary=f46d0434bf16bb3ad105000b1b34

--f46d0434bf16bb3ad105000b1b34
Content-Type: text/plain; charset=UTF-8

Not sure if there's an easy way with quilt (check the quilt options) but a
relatively easy way would be to use your own patch routine (essentially
anything you want).  One thing you could do is disable the normal patch
application (add ";patch=0" to the end of the patch line in SRC_URI) and
then use your own do_patch to force it (if that's really what you want to
do).  I guess I would ask "why?" and if it were me I'd just reroll the
patch and fix it.  But I don't know what the real problem is, so...

Steve



On Thu, Aug 7, 2014 at 6:14 AM, Giuseppe Condorelli <
giuseppe.condorelli@gmail.com> wrote:

> Hi All,
>
> please can I know if is it possible, using the do_patch routine,
> to force the application of a given patch?
> I mean, like the patch --force command.
>
> Please let me know, I tried w/o good result.
>
> Best Regards,
> Giuseppe
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--f46d0434bf16bb3ad105000b1b34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Not sure if there&#39;s an easy way with quilt (check=
 the quilt options) but a relatively easy way would be to use your own patc=
h routine (essentially anything you want).=C2=A0 One thing you could do is =
disable the normal patch application (add &quot;;patch=3D0&quot; to the end=
 of the patch line in SRC_URI) and then use your own do_patch to force it (=
if that&#39;s really what you want to do).=C2=A0 I guess I would ask &quot;=
why?&quot; and if it were me I&#39;d just reroll the patch and fix it.=C2=
=A0 But I don&#39;t know what the real problem is, so...<br>
<br></div>Steve<br><br></div><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">On Thu, Aug 7, 2014 at 6:14 AM, Giuseppe Condorelli <span =
dir=3D"ltr">&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" target=3D"=
_blank">giuseppe.condorelli@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi All,</div><div>=C2=
=A0</div><div>please can I know if is it possible, using the do_patch routi=
ne,</div>
<div>to force the application of a given patch?</div><div>I mean, like the =
patch --force command.</div>
<div>=C2=A0</div><div>Please let me know, I tried w/o good result.</div><di=
v>=C2=A0</div><div>Best Regards,</div><div>Giuseppe</div></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div>

--f46d0434bf16bb3ad105000b1b34--
