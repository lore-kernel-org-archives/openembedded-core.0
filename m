Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9C94F6AB81;
	Thu, 27 Jun 2013 01:46:18 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id xn12so149556obc.20
	for <multiple recipients>; Wed, 26 Jun 2013 18:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=wtR2dE0eXYmz6A7RbtTFs2hdagqIYxJmBaIakqH/pjc=;
	b=RWj3m03+0WVtHunI9+DzpSGh3TV78wInKYACgaz0buhJ2/f1q3z/+9C4XWtSfSi6TW
	/9OX9HZ/W86RK1viAjkn5KTNdpxpwX3CkiHzLiVg0n2UYZN9YeZhMsX/qiTwFWy+M+BR
	BHdaTdLs47hpD9PrAihd8s6kPw1SWJfTFOu8Aaa+67RMr0izK2rt/FfQ8COpCWM/6Otq
	lDoYuwFEndb/uEc8TxeRsE+mzYDWuDn1kGTN6Bv877DH5wP12xDFNc0/02L8worW1/64
	askjP5L953qK94p/K4svrjMsv4c4GuOwtD0PR82MqH+YSQp0Ncz50Ja9boPsc60EliWn
	cqTg==
MIME-Version: 1.0
X-Received: by 10.60.97.74 with SMTP id dy10mr1799502oeb.27.1372297579120;
	Wed, 26 Jun 2013 18:46:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Wed, 26 Jun 2013 18:46:19 -0700 (PDT)
In-Reply-To: <1831F7C6-54BC-4E5F-BC00-1B8C17E8D1FD@gmail.com>
References: <1831F7C6-54BC-4E5F-BC00-1B8C17E8D1FD@gmail.com>
Date: Wed, 26 Jun 2013 22:46:19 -0300
X-Google-Sender-Auth: 9cvKmBZ-CkSCx5ViWVnYk_JNCCI
Message-ID: <CAP9ODKqVqLxQ8QNY_1DDJGjRSrW=6YsiHdwPjpzE9EKmybQ4+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org \(yocto@yoctoproject.org\)"
	<yocto@yoctoproject.org>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: eglibc (would be 2.18) recipes
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
X-List-Received-Date: Thu, 27 Jun 2013 01:46:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 26, 2013 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi All
>
> I have put together eglibc recipes for upcoming 2.18 release and pushed to a contrib tree here
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/eglibc-2.18
>
> They built angstrom/systemd-images fine and booted OK on all supported qemu machines
> on OE-Core
>
> Please test them out in your configurations and machines and provide feedback, lets weed out
> the issue early

Could you also make a tree based on poky?

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

