Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TtJ9d-0008D5-2M
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 15:30:50 +0100
Received: by mail-la0-f41.google.com with SMTP id em20so637861lab.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 06:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=+FNIb6fVZfDiCXu3ED9ahCREOItDKH+4qglU1hZtLAA=;
	b=sG5R2fDXmYsDOnK2QHA45q3o840oHRaCAvi9jH4T+OimfUHFLyXlo4FqicvdZx2qvH
	OeMlhYxlZ7Is/ClqMYMoCJNE1NGjBPhebMKPVY3mX+rtwJrtLBWrYEcmNB9KCN4vxJOL
	3x8UwOT6at++gWN3eS7J9+B+9bzYDqTfEwDEVQ8bwNRwkC/xYKUDd+rlnppnlmWV75YT
	mr1nrVuZTUNBsXSkaXAMnh80mQYQC0O/+AibqsJgz9I4IzD9r7wh1MSDhhTMrOW/HBuZ
	mnNTA5K8t/IZVYI+EGf8yZ69tcTKimlhxmKelObVfRu8LDWg2FK5YIGJxHI+Ulpq70iZ
	seCg==
Received: by 10.112.99.2 with SMTP id em2mr20838076lbb.11.1357827335658; Thu,
	10 Jan 2013 06:15:35 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Thu, 10 Jan 2013 06:15:15 -0800 (PST)
In-Reply-To: <1357807806-31720-4-git-send-email-martiert@gmail.com>
References: <1357807806-31720-1-git-send-email-martiert@gmail.com>
	<1357807806-31720-4-git-send-email-martiert@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Jan 2013 07:15:15 -0700
X-Google-Sender-Auth: beth_uPJelUEs_aK2OonVC_Qfyo
Message-ID: <CABcZANkEeDdxgrb-2JqU19aofCgGor79wqKhvqktg+M34kenBg@mail.gmail.com>
To: Martin Ertsaas <martiert@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] lib/oe/path.py: Use shutil.rmtree if the path we wish to remove is a directory.
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
X-List-Received-Date: Thu, 10 Jan 2013 14:30:53 -0000
Content-Type: multipart/alternative; boundary=f46d0401f971021d8204d2efd006

--f46d0401f971021d8204d2efd006
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 10, 2013 at 1:50 AM, Martin Ertsaas <martiert@gmail.com> wrote:

> On mac, os.unlink can not be done to remove directories, and so we have to
> explicitly use shutil.rmtree instead to support mac.
>

As pointed out for the bitbake patch, the functions can already handle this
case if you pass recurse=True, and mac isn't at all special in this context.
-- 
Christopher Larson

--f46d0401f971021d8204d2efd006
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jan 10, 2013 at 1:50 AM, Martin Ertsaas <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:martiert@gmail.com" target=3D"_blank">martiert@gmail.com</a>&g=
t;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":1lu">On mac, os.unlink can not be done to remo=
ve directories, and so we have to<br>


explicitly use shutil.rmtree instead to support mac.<br></div></blockquote>=
<div><br></div><div style>As pointed out for the bitbake patch, the functio=
ns can already handle this case if you pass recurse=3DTrue, and mac isn&#39=
;t at all special in this context.</div>

</div>-- <br>Christopher Larson</div></div>

--f46d0401f971021d8204d2efd006--
