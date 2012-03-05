Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4WVX-0004yo-0h
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 12:55:15 +0100
Received: by vcbfl13 with SMTP id fl13so3384196vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 03:46:40 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.66.228 as permitted sender) client-ip=10.52.66.228; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.66.228 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.66.228])
	by 10.52.66.228 with SMTP id i4mr32996871vdt.12.1330948000217 (num_hops
	= 1); Mon, 05 Mar 2012 03:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZLYiy62oe0BMRzwVBXqu6MO2rkLr2M3rrjRp4OgSqqg=;
	b=TMQuWZVr8AHNBDMqUuoUc5AdUcryroZpAHAoYOzFOohhfWsqNH3fwY8esf2zJTbiHJ
	a+s7/i0RFAFmBkEd26KjyUg1aZ1nZRNsC68IZYMaCZ0MClgiykrLcTspEv4/7qLBebQ4
	Gzfe7fCQOM4RM6okK4I6aysXCoaGLUsqN7jLeweJXzOhN4JsRM/ZJWIh+bGyTztQJG3o
	544yvCu49xKJ8Z9GkD/asF1/x5DeB4tLoi5fB5y3LSwN6uBTBx9pNlN2w0dJzIwKtdKu
	bGwYWcDAKjTm+jWAJXH1gqygnnuLteuMOMDmkOEg1u5zb2ECS8OcYP0UpmBEdA3oyNCu
	cO/Q==
MIME-Version: 1.0
Received: by 10.52.66.228 with SMTP id i4mr28178712vdt.12.1330948000147; Mon,
	05 Mar 2012 03:46:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Mon, 5 Mar 2012 03:46:40 -0800 (PST)
In-Reply-To: <1330835499.3949.18.camel@ted>
References: <cover.1330796256.git.otavio@ossystems.com.br>
	<af77629ed96cb6c688540f19806558f6a8034771.1330796256.git.otavio@ossystems.com.br>
	<1330835499.3949.18.camel@ted>
Date: Mon, 5 Mar 2012 08:46:40 -0300
X-Google-Sender-Auth: 5pq8d_ltvcsIo2tqUQBwWeil0g0
Message-ID: <CAP9ODKozzmfAGWCwP3aOwkmO7Gnu4tS8-uBRWCtPrqW9ufa6wg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] rootfs_rpm.bbclass: rename postinst trigger script
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
X-List-Received-Date: Mon, 05 Mar 2012 11:55:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 4, 2012 at 01:31, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I find the consistency argument a little confusing when you had to
> rename this for all of the packaging backends from the same thing?

I did it because I used run-postinsts package for bootstrap in ipk.

> I understand you want a less confusing name though as configure is an
> overloaded word.

If you prefer I can change this; doesn't matter for me.

> Also, please do post the deb patch too. Saying you've just pushed an
> extra patch somewhere doesn't really work...

Right; once you reply if you want me to change wording I do.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


