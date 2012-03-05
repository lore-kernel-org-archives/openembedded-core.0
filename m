Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4fwH-0006zp-E9
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 22:59:29 +0100
Received: by vcbfl13 with SMTP id fl13so4047366vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 13:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.95.74 as permitted sender) client-ip=10.52.95.74; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.95.74 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.95.74])
	by 10.52.95.74 with SMTP id di10mr37939216vdb.46.1330984254287
	(num_hops = 1); Mon, 05 Mar 2012 13:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=O3BKl5/5rk7Hf00nFERev0YMjwTf1REDjauVZDngigY=;
	b=qZYrIxV+r5V1x5Vwqqi+aJeuAib45ybspbgkAIRoBrHZz+eQFVbSH432YXHDlxduN4
	MUFgCqNVUUtisweY8zUZb3WB1W2j4eeqY8e3KlSGVmWDN7DEvPmxvICth46wP/8frE7j
	cjukK2XvHYTETj/72nYIn6jwsP4WjSeTRxAoomEPOeOuqr0gRp8joM90fbfOIOGGWTn5
	kZVe6EmErNTP2C/sgkR/UAnYEG5nUk79RoQgNMTmR6eRTp4YbGEv4rMAh9fbio5KuNId
	KanGZ8TRt22KjARaOmPJVQf8WGj4+Zn16cXjwyNrF6znM1tnx5mT+YPsb20UPzy9mMMJ
	r7bw==
MIME-Version: 1.0
Received: by 10.52.95.74 with SMTP id di10mr32471501vdb.46.1330984253750; Mon,
	05 Mar 2012 13:50:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Mon, 5 Mar 2012 13:50:53 -0800 (PST)
In-Reply-To: <CAOd_LFzmHn-V2MvvaiOhO0riY5L_Z=zs0qNWax39Ew7-COmzww@mail.gmail.com>
References: <CAOd_LFz2nUOW4D4Q9YuDHzwvs6qTwgS2TJZA5UnJbYaROCiSGg@mail.gmail.com>
	<CAP9ODKq_JrKF4LJwRt5Fcg79+xQfdVQqPBJZyq_=Lv7zu36koA@mail.gmail.com>
	<CAOd_LFzmHn-V2MvvaiOhO0riY5L_Z=zs0qNWax39Ew7-COmzww@mail.gmail.com>
Date: Mon, 5 Mar 2012 18:50:53 -0300
X-Google-Sender-Auth: DfjYHicSYNkvg7EDugKHfKu7s4c
Message-ID: <CAP9ODKqcLSB8p2q3k7w0TCokdRRhQQx+HrmSFucXCczDVpB9QQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: read only rootfs?
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
X-List-Received-Date: Mon, 05 Mar 2012 21:59:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 18:47, Cliff Brake <cliff.brake@gmail.com> wrote:
> Looking briefly at what this does, it appears its only a diagnostic
> feature that tells you if there are postinst processes that need to
> run?

In fact it checks if there're postinsts that *needs* to be run
"online"; if it does not, then it can be run in read-only mode.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


