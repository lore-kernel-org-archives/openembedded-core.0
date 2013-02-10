Received: from mail-la0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1U4fLn-0006Dr-66
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 23:26:20 +0100
Received: by mail-la0-f45.google.com with SMTP id er20so5330323lab.32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2013 14:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=A4AO8rAyjUItk1bJRm3Dz24QHjjpwRs5EpYjNzCSBAw=;
	b=M2bN5B+4EIJIjxpT/vRXhpdHAa0wLBRII6d4QZq/UsYt3UKD6KTJR3aV2kLz1ThRfw
	FbztmEn5G0JHpAb2MlHd4ArauSILL2fUdj5rebxMmM66g9nFS5SHuE39GEd2Z1E2FjoD
	4mPYL398mqRLwn/YrnfJ/6Q0a2iRyr61H3IlTxA9B3OtUuoxXSZP3PKrysq5yzgAWjlF
	A0uolSVlaOcVwN8g2AjBKhchtld3sJ+ZZVnJHxp3SechotQkBghM56mNimz/jtIqpR2s
	ikKGuLNQnRICz+txR0Pdb/zvh2UECV0Jo5G/sPnbr8tmozFX0Jn+gyskCfIiHSNK+kMe
	yzCw==
X-Received: by 10.112.103.168 with SMTP id fx8mr4966236lbb.32.1360534221723;
	Sun, 10 Feb 2013 14:10:21 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Sun, 10 Feb 2013 14:10:00 -0800 (PST)
In-Reply-To: <20130210123255.51643nyx1esfqeck@crashcourse.ca>
References: <20130210123255.51643nyx1esfqeck@crashcourse.ca>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 10 Feb 2013 15:10:00 -0700
X-Google-Sender-Auth: IPN2A8vy6eAvQo4AlakAX8FBi-g
Message-ID: <CABcZANmangf8M-xj6N656LrE-rewBW7jWxrRShSJRvZMhLmV5g@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: any way to list *all* possible sources across the current layers?
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
X-List-Received-Date: Sun, 10 Feb 2013 22:26:20 -0000
Content-Type: multipart/alternative; boundary=f46d04016a99fd98a804d5660ee7

--f46d04016a99fd98a804d5660ee7
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 10, 2013 at 10:32 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>   hoping this question makes sense -- i use own-mirrors.bbclass to point
> at a sizable directory of tarballs (almost 12G worth) that i've been
> collecting over many months and, after every OE layer upgrade, whatever
> newer sources are pulled in, will generate the corresponding tarball and
> i'll copy that into my tarballs directory.
>
>   predictably, at this point, there's a *lot* of old, irrelevant cruft in
> that directory, but i know of no automated way to get rid of any of it.
> for instance, i currently have five versions of automake (1.11.2, 1.12.1,
> 1.12.3, 1.12.5 and 1.12.6) taking up space.  doesn't hurt, of course, but
> it would be handy to be able to generate a list of all possible,
> potentially necessary versions of a source -- that is, any version for
> which any recipe still lists it as PREFERRED_VERSION.
>
>   does that make sense?  obviously, that would have to be done in the
> context of a given set of layers and all the corresponding recipes in
> those layers.  is there a way to do that already?  if not, i'm sure i
> could whip up a simple script that would do the job.  thanks.
>

You could likely write a class that adds a task which writes the localpaths
for all sources in SRC_URI to a file, add that to INHERIT, and build that
task (don't forget to set recrdeptask) for the 'universe' target (like
world, but hits all versions, iirc).
-- 
Christopher Larson

--f46d04016a99fd98a804d5660ee7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Feb 10, 2013 at 10:32 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse=
.ca</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":64">=C2=A0 hoping this question =
makes sense -- i use own-mirrors.bbclass to point<br>
at a sizable directory of tarballs (almost 12G worth) that i&#39;ve been<br=
>
collecting over many months and, after every OE layer upgrade, whatever<br>
newer sources are pulled in, will generate the corresponding tarball and<br=
>
i&#39;ll copy that into my tarballs directory.<br>
<br>
=C2=A0 predictably, at this point, there&#39;s a *lot* of old, irrelevant c=
ruft in<br>
that directory, but i know of no automated way to get rid of any of it.<br>
for instance, i currently have five versions of automake (1.11.2, 1.12.1,<b=
r>
1.12.3, 1.12.5 and 1.12.6) taking up space. =C2=A0doesn&#39;t hurt, of cour=
se, but<br>
it would be handy to be able to generate a list of all possible,<br>
potentially necessary versions of a source -- that is, any version for<br>
which any recipe still lists it as PREFERRED_VERSION.<br>
<br>
=C2=A0 does that make sense? =C2=A0obviously, that would have to be done in=
 the<br>
context of a given set of layers and all the corresponding recipes in<br>
those layers. =C2=A0is there a way to do that already? =C2=A0if not, i&#39;=
m sure i<br>
could whip up a simple script that would do the job. =C2=A0thanks.</div></b=
lockquote></div><br>You could likely write a class that adds a task which w=
rites the localpaths for all sources in SRC_URI to a file, add that to INHE=
RIT, and build that task (don&#39;t forget to set recrdeptask) for the &#39=
;universe&#39; target (like world, but hits all versions, iirc).<br>

-- <br>Christopher Larson</div></div>

--f46d04016a99fd98a804d5660ee7--
