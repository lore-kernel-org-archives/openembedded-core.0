Received: from mail-lb0-f179.google.com ([209.85.217.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TsNYL-0007Jw-9q
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 02:00:36 +0100
Received: by mail-lb0-f179.google.com with SMTP id gm13so2478822lbb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 16:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=7BqmDEICxT7WABhArQplEsWCFWp1ZClJLV4iNlQ5ohs=;
	b=BSrm/1zypeY2MRCqo9UE5UJUgGqEgsYjg9iBNb8cakl62PYQVJNPsTSUpK6ugAPOEl
	4fR2FTx0z+026ehY1s67xuM4fndHfO0hiDFA04bY8UBjdI288Xsm2CV2APZuST3HkMq3
	V7lOrn8fW7dY+RG7vKJAjHkHvUEd2eC/o8xdqtia9WRiddbop3jDnQ+fsW7+eHcf2yP6
	FATP5GjlOhlVx0iiizgSr97Oab0GcG/kAFKn3v6yztXq15id1XuL8J7FQocIpKa3n+sw
	0hOAwMsql+GNQbTrX5Ne82Td6X40G1i1rvc6fXdXFOS4/bFPQ50N+9LbmjDX8IDySuWJ
	bHgg==
Received: by 10.112.49.202 with SMTP id w10mr24514060lbn.2.1357605919165; Mon,
	07 Jan 2013 16:45:19 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Mon, 7 Jan 2013 16:44:58 -0800 (PST)
In-Reply-To: <50EB3FF4.60601@windriver.com>
References: <50EB3FF4.60601@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 7 Jan 2013 17:44:58 -0700
X-Google-Sender-Auth: jM-VZp94UO88E7LB9Bpae0nfwiQ
Message-ID: <CABcZAN=nVVoNxdu7tZKQ=uK5Q7jcCrhvFezX-YYpyWPZbTw9jg@mail.gmail.com>
To: Florin Sarbu <florin.sarbu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: alsaconf and bash
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
X-List-Received-Date: Tue, 08 Jan 2013 01:00:43 -0000
Content-Type: multipart/alternative; boundary=bcaec554daa28e8cc304d2bc4255

--bcaec554daa28e8cc304d2bc4255
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 7, 2013 at 2:36 PM, Florin Sarbu <florin.sarbu@windriver.com>wr=
ote:

> in alsa-utils_1.0.25.bb, I see this comment:
>
> # We omit alsaconf, because
> # a) this is a bash script
> # b) it creates config files not suitable for OE-based distros
>
> Trying out on master, I get a do_rootfs error because bash is not a runde=
p
> of alsa-utils, and there is nothing in the alsa-utils recipe that actuall=
y
> does the above mentioned removal of the alsaconf script. Looking in the g=
it
> log, I only see that the comment has suddenly appeared in an older
> alsa-utils recipe and has been carried along since with every update to t=
he
> recipe, and not left over there as an artifact of some older commit as I
> expected.
> Can anyone shed some light on this?
>


From some quick git log -S commands in the old openembedded classic
repository, it seems to have originated
with 7653e980f66b4bd147df308f9b04d6b197382d6a from 2005, and the line below
the comment was 'FILES_${PN} =3D ""', so presumably that was what left it o=
ut
=E2=80=94 none of the files patterns matched it.
--=20
Christopher Larson

--bcaec554daa28e8cc304d2bc4255
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On Mon, Jan 7, 2013 at 2:36 PM,=
 Florin Sarbu <span dir=3D"ltr">&lt;<a href=3D"mailto:florin.sarbu@windrive=
r.com" target=3D"_blank">florin.sarbu@windriver.com</a>&gt;</span> wrote:<b=
r><div class=3D"gmail_quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":10h">in <a href=3D"http://alsa-utils_1.0.25.bb=
" target=3D"_blank">alsa-utils_1.0.25.bb</a>, I see this comment:<br>


<br>
# We omit alsaconf, because<br>
# a) this is a bash script<br>
# b) it creates config files not suitable for OE-based distros<br>
<br>
Trying out on master, I get a do_rootfs error because bash is not a rundep =
of alsa-utils, and there is nothing in the alsa-utils recipe that actually =
does the above mentioned removal of the alsaconf script. Looking in the git=
 log, I only see that the comment has suddenly appeared in an older alsa-ut=
ils recipe and has been carried along since with every update to the recipe=
, and not left over there as an artifact of some older commit as I expected=
.<br>


Can anyone shed some light on this?<br></div></blockquote></div><br><br cle=
ar=3D"all"><div style>From some quick git log -S commands in the old openem=
bedded classic repository, it seems to have originated with=C2=A07653e980f6=
6b4bd147df308f9b04d6b197382d6a from 2005, and the line below the comment wa=
s &#39;FILES_${PN} =3D &quot;&quot;&#39;, so presumably that was what left =
it out =E2=80=94 none of the files patterns matched it.</div>

-- <br>Christopher Larson</div></div>

--bcaec554daa28e8cc304d2bc4255--
