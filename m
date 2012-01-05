Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RivcZ-0004RA-9f
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 23:17:15 +0100
Received: by werm13 with SMTP id m13so801489wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 14:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=VcDfhegjwX6/EOSLo4q5U/pgx/Fbcgm4+Pt1xUSTq5c=;
	b=mfWs9FWa3Fk5ZiTF2x2l6iL4OSiXdRu9IZY0r744xaQPZwMNdjMOZWM1T+Uxba6CKE
	4PLtbQNYZVTUEkCGi8mOi5d18CaLeUFU0LjuJagfStMb5QcRYlQwfRnZc9BV6bhLKz7m
	PE0xGFcPiM3qYwoswLnQKTwS78dAXqJgV5DZA=
MIME-Version: 1.0
Received: by 10.216.131.13 with SMTP id l13mr1826191wei.45.1325801390760; Thu,
	05 Jan 2012 14:09:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.216.73.67 with HTTP; Thu, 5 Jan 2012 14:09:50 -0800 (PST)
In-Reply-To: <4F061F34.9000606@linux.intel.com>
References: <cover.1325792209.git.otavio@ossystems.com.br>
	<6d7ee007b25cc878d07163fcc6be964781f68ca6.1325792209.git.otavio@ossystems.com.br>
	<4F061F34.9000606@linux.intel.com>
Date: Thu, 5 Jan 2012 20:09:50 -0200
X-Google-Sender-Auth: ivuxIDWZ7kQ9lEtkJXqa50c4mzw
Message-ID: <CAP9ODKqjJLh-UwZLv0pmKdqO-3=safuqnnJk7UcEStW1x1=DPg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/10] udev: drop depmod handling code as it ought to be done in kernel postinst
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2012 22:17:15 -0000
Content-Type: multipart/alternative; boundary=0016e6da98d3f0632604b5cf30d0

--0016e6da98d3f0632604b5cf30d0
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 5, 2012 at 20:07, Saul Wold <sgw@linux.intel.com> wrote:

> Just a PR Bump?
>

Sure not; I must have done something wrong when sending the patches to
github. I'll check it and send it again.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0016e6da98d3f0632604b5cf30d0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Jan 5, 2012 at 20:07, Saul Wold <span di=
r=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">Just a PR Bump?</div></div>
</blockquote></div><div><br></div><div>Sure not; I must have done something=
 wrong when sending the patches to github. I&#39;ll check it and send it ag=
ain.</div><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--0016e6da98d3f0632604b5cf30d0--
