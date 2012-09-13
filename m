Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TC9K8-00055t-R6
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 15:19:17 +0200
Received: by pbcwy7 with SMTP id wy7so3721653pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/e9aLeklu53UA5mP8Hbpg5T7sV5uyj7p/QpJze+KnQ8=;
	b=TD+K9KmOmc/xPfPXBLHRjazD3ysU1Sko244eNWhtuQ8J8U2BvTDfv4/bhlmZpxTxRt
	kDOHvrZ54DTBPqYIiAHF24t3OVXe/DQGUfY5rthJSdJg/KhsDsbWHcX815VG8VMCsm07
	7JvPKo0f7bqU+bY9kZGoPjOKJCOn+kzWJuPLoPLP09cLyIbQeqQUqDvTejtSuFFKVQXQ
	J9x6DmL7/CHSRlktUqhjCk3aDRCFOjloC+o7MKkTS8ZwO6WfMaOqighrS27S8f2PmO0b
	zSCZn0EDpAjp6+uCfMdoDq7WJTKl5PYWxzN2Kt9jfXMTtMpeSTJkEYeIxcN1Z59H/qY/
	cBNQ==
MIME-Version: 1.0
Received: by 10.68.229.138 with SMTP id sq10mr4636435pbc.126.1347541602723;
	Thu, 13 Sep 2012 06:06:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Thu, 13 Sep 2012 06:06:42 -0700 (PDT)
In-Reply-To: <20120913121935.GC18675@giant>
References: <cover.1346905978.git.raj.khem@gmail.com>
	<5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
	<504FF70B.7060701@mlbassoc.com> <1347458928.11710.21.camel@ted>
	<CAMKF1so6qUDFMw_aOZTdC4W_Dh=rDiiC1O7pvjaUQS2xkG8xWg@mail.gmail.com>
	<20120913121935.GC18675@giant>
Date: Thu, 13 Sep 2012 10:06:42 -0300
X-Google-Sender-Auth: pzaE8j9qZijvmgP5lChuNz1An20
Message-ID: <CAP9ODKp8sKpVMi9MwdFxwZTq2-VMiRGzDzD=bBrFu8r4hZ0xMA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Bj=F6rn_Stenberg?= <bjst@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Thu, 13 Sep 2012 13:19:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 13, 2012 at 9:19 AM, Bj=F6rn Stenberg <bjst@enea.com> wrote:
> Khem Raj wrote:
>> I agree but then 1.7 GB is noticeably huge too and it will only become
>> larger in future so I don't think fetching from git will be a good solut=
ion
>> for gcc ever.
>
> Can we use shallow clones? A quick test of gcc-4.7 gave me a 308 MB tar.g=
z when cloned with --depth 1.

I did not check if the fetcher has this support  but it would be a
nice solution.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


