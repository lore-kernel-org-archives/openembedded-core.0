Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ6Ko-0007H2-4n
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:42:18 +0100
Received: by bkbzt4 with SMTP id zt4so3389429bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=9iGmwlC0I27xilBy7IOnLcjXVwsrYlj1mQ1JW1RaBG4=;
	b=OOcK5tW63kghCLeR7mUIdkzK8CgTDEeIydSo9VgMUxzGcl7bjntctB60uNtPXkd9zl
	efMN8OeqL63sqvYpcgUFD71N5pnSA6wGjCi4C/1fd2vt8qHyWE2zxApiY5W4YFIOoQgG
	4sewMW7pZc36k3LUPUU9jx9iwfb0kVLLbKMiY=
MIME-Version: 1.0
Received: by 10.205.142.4 with SMTP id jg4mr4756915bkc.119.1323459323715; Fri,
	09 Dec 2011 11:35:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Fri, 9 Dec 2011 11:35:23 -0800 (PST)
In-Reply-To: <4EE25FA0.2050500@linux.intel.com>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<e27fba3b38877fb7420c58a3e35cdbcef1cb767a.1323358819.git.otavio@ossystems.com.br>
	<4EE25E38.3060704@linux.intel.com>
	<CAP9ODKpr=xgxfJcrzsbv8q+VQh8oQOdKjQurev7hVjiMAv1PkA@mail.gmail.com>
	<4EE25FA0.2050500@linux.intel.com>
Date: Fri, 9 Dec 2011 17:35:23 -0200
X-Google-Sender-Auth: WBkQ2bqbxjFaUlyr5LywRYvJd8k
Message-ID: <CAP9ODKrMGQbcQaNiwcDKUv6q06Bn5Cy7MEvJ4nMipsG9UOAhSA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] dosfstools: update native to 2.11
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
X-List-Received-Date: Fri, 09 Dec 2011 19:42:18 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe3052dd60cd04b3ade2bb

--e0cb4efe3052dd60cd04b3ade2bb
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 17:21, Darren Hart <dvhart@linux.intel.com> wrote:

> So pulling this in would mean we can't build live images when building
> non GPLv3 images? We are looking to revamp the image creation, but until
> then I can't agree to this.


NO. This is 2.11 release.

The GPLv3 versions are the 3.0.x (now it is at 3.0.12).

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e0cb4efe3052dd60cd04b3ade2bb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 17:21, Darren Hart <span =
dir=3D"ltr">&lt;<a href=3D"mailto:dvhart@linux.intel.com">dvhart@linux.inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">So pulling this in would mean we can&#39;t build live ima=
ges when building</div>
non GPLv3 images? We are looking to revamp the image creation, but until<br=
>
then I can&#39;t agree to this.</blockquote><div><br></div><div>NO. This is=
 2.11 release.</div><div><br></div><div>The GPLv3 versions are the 3.0.x (n=
ow it is at 3.0.12).</div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--e0cb4efe3052dd60cd04b3ade2bb--
