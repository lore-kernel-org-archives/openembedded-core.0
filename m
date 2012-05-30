Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SZpCe-0006hH-2I
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 22:09:08 +0200
Received: by pbbrq2 with SMTP id rq2so430915pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 12:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=SA889J0tYMCvh54hShPijSUX+i3XfEwK24RJT8xpwHc=;
	b=I4shE+6i+49DXEV2aAajwkiHGFApbzrJjBUxm2VvJPAm2AEHg/o9XkJm2QE6OwuiV7
	5nDvgP6JfVNeR59uE8fboH2zMGXtDc4KtXqyrT3GmVaPlgoBsm0QNnsFCcLaPn17nroS
	aE6bNbYuRveRoLMz/DGX8ZXQPa5wQvbcebX5+kpmgjA44gY3ujS+aUfwYwO0dsH5lyMi
	YqNiNO5loA1qxFdz9sMTDeqyUdF6CwCy2roUXoCCaHSE952txn5VwwSs+PszWtaHOCml
	IDStIZbvKN/wzPnHSjvzXCLkUeaAQQG/tMWVTwrL6CkhikbenaXVWob0ZhjZJYZjGxxL
	Tkrw==
MIME-Version: 1.0
Received: by 10.68.217.135 with SMTP id oy7mr12132543pbc.10.1338407927968;
	Wed, 30 May 2012 12:58:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.25.42 with HTTP; Wed, 30 May 2012 12:58:47 -0700 (PDT)
In-Reply-To: <4FC66D1A.8050906@palm.com>
References: <4FC6686B.20904@palm.com>
	<CAP9ODKrFYmfAzt_ASAMxunp6MS_7O63_WZuDGkm7p3z7nJttuA@mail.gmail.com>
	<4FC66D1A.8050906@palm.com>
Date: Wed, 30 May 2012 16:58:47 -0300
X-Google-Sender-Auth: R8bPzvTJZKkzrKmT_TaEjB7r6h0
Message-ID: <CAP9ODKr9WX0AXFTpDVmrn5VymbMx5Q07W8uf1v3Sxt7o6NtzdQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: On the possibility of using upstart...
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
X-List-Received-Date: Wed, 30 May 2012 20:09:08 -0000
Content-Type: multipart/alternative; boundary=047d7b2e7c4c1c751c04c1466142

--047d7b2e7c4c1c751c04c1466142
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 30, 2012 at 3:55 PM, Rich Pixley <rich.pixley@palm.com> wrote:

> Current systemd classes can give you a good work base.
>
> At least in debian/ubuntu, the service scripts come with the components
> that use them.  I haven't looked deeply at oe-core in this regard, but
> wouldn't doing this in a separate layer involve a large number of
> append/overlay links to underlying components where the linkages were
> extremely fragile?
>

Yes and no; having it on a separate layer allow for easy work and avoid
problems to users not using or wanting to use it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b2e7c4c1c751c04c1466142
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, May 30, 2012 at 3:55 PM, Rich Pixley <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:rich.pixley@palm.com" target=3D"_blank=
">rich.pixley@palm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">

 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div class=3D"im"><blockquote t=
ype=3D"cite"><div class=3D"gmail_quote"><div>Current systemd classes can gi=
ve you a good work base.<br>
        </div>
      </div>
    </blockquote></div>
    At least in debian/ubuntu, the service scripts come with the
    components that use them.=A0 I haven&#39;t looked deeply at oe-core in
    this regard, but wouldn&#39;t doing this in a separate layer involve a
    large number of append/overlay links to underlying components where
    the linkages were extremely fragile?</div></blockquote><div><br></div><=
div>Yes and no; having it on a separate layer allow for easy work and avoid=
 problems to users not using or wanting to use it.=A0</div></div><div><br>
</div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.=
br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.=
ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b2e7c4c1c751c04c1466142--
