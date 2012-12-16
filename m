Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TkJd2-0000vU-3t
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Dec 2012 20:12:02 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so3092720pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=0r5qszXY7en76mWfdtGNrVcru7BQRRAZzYfFRL0Y2CI=;
	b=fG7klc8sPshoHJHm9nKOaFF7g3rob5bC209E7O9PPdGPDxrgmMMF0fbdja1rWV/eVe
	VDk9RMIDmSfzfaqX7MnaEARRlIZe75u8jWddkkjhO5PR+XPhTQKtcuyrnu5fYlGE4Zxm
	+C7OyxGIB+Qcl8aSrwsi8P7JhikjRZIB7RPM71mH9XCZEMwqe+0pg7AXCDsQzib+P6IW
	mIglyzD1uTz2t8O5uNzAfnnW53ocfF/fT7No49w2gpc/b3WDMChpSLuVWcXZQCROCsnb
	C30K67P6kEAdCTfW+iaTBSpHvCwTlahLFZ+uiaJDGtIOeQs+FiEmmusQn69yRTHvR7rp
	JOoQ==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr37018471pbc.24.1355684240013; Sun,
	16 Dec 2012 10:57:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Sun, 16 Dec 2012 10:57:19 -0800 (PST)
In-Reply-To: <20121216185215.GE3448@jama>
References: <CAP9ODKoRws=EzHxyNumYnj-F2S5h_66wkCfL42-yrJK7KGYBOQ@mail.gmail.com>
	<20121216185215.GE3448@jama>
Date: Sun, 16 Dec 2012 16:57:19 -0200
X-Google-Sender-Auth: 7FsG_3ULfzz3_EnfpqV0PvV5F9I
Message-ID: <CAP9ODKq7C0-Ntnehdo3qK7QsptD8B_8X0UCaMmjCR+jT8vxBAg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build fail in kconfig-frontends
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
X-List-Received-Date: Sun, 16 Dec 2012 19:12:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Dec 16, 2012 at 4:52 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Dec 16, 2012 at 04:16:40PM -0200, Otavio Salvador wrote:
>> Hello,
>>
>> Today I did a sync and kconfig-frontends fails to build. I submitted a
>> bug report (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3610).
>>
>> I am sending it here as well so people can confirm if it is
>> reproducable in some other environment?
>
> It failed exactly the same here, but only once (on Friday) after cleansstate
> it built OK.

Confusing ... it works here as well after cleansstate.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


