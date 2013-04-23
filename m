Received: from mail-qe0-f45.google.com ([209.85.128.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UUeSQ-0004qI-Uv
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 16:44:37 +0200
Received: by mail-qe0-f45.google.com with SMTP id 1so411019qee.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=5S3a+/MeOEwZw4VgqYQ6K0/sWB1lMNDfhyViU58nozI=;
	b=jOftD7SVN9g4AgcqF5v9QOUh8zhQ6svNrbCsxUqVcSdDKR4aoBMxNb5Qd+vlBjQPjt
	EO0HoCn/+4csKKwKeyoN0fUf4QEEfw4LPFdj9gOfSQxYL78UowkSAoPqtXNBOMdAStgN
	z0LSsWpxIrpzQ+uUMa6nHfJLZeESUqPbgnNDhoMlRO82dXVXRaRWmttQWThZPEgIAssE
	yuq8U9NB6SMJ2RRp80NIFqsvBc8KmddgxNhUtQV7DhIyZVrLSOYNjkKTEbUXhFHCvtjK
	uy+aNXZNw0nHgkzuS7XRvYKebXeywcnCEdQqomBHoy1ffDhzRnbdJGrAknAOw2gn8HxW
	/xog==
MIME-Version: 1.0
X-Received: by 10.224.58.76 with SMTP id f12mr26442975qah.12.1366727214180;
	Tue, 23 Apr 2013 07:26:54 -0700 (PDT)
Received: by 10.49.4.170 with HTTP; Tue, 23 Apr 2013 07:26:54 -0700 (PDT)
In-Reply-To: <1366725166.23738.63.camel@ted>
References: <1366708403-45429-1-git-send-email-kirgene@gmail.com>
	<CAJTo0LZsrvMLioXtKtZHmnRExnLVOqy9QmHOXUKJLEKNP4fXzw@mail.gmail.com>
	<1366725166.23738.63.camel@ted>
Date: Tue, 23 Apr 2013 17:26:54 +0300
Message-ID: <CADV-EXH6gLETd1-1uMX5e2KSdyw_ph_OGG9cveFy4ysf8Fq_NA@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 23 Apr 2013 14:44:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/4/23 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Tue, 2013-04-23 at 14:41 +0100, Burton, Ross wrote:
>> On 23 April 2013 10:13, Yevhen Kyriukha <kirgene@gmail.com> wrote:
>> > +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives pythonnative python-dir
>>
>> Does this really need pythonnative?  That's adding a python-native
>> dependency to build systemd.
>
> To handle python modules correctly, I suspect the answer is yes. It
> would be better if we could make this inherit conditional somehow. I'm
> also sceptical about the separate -dev/=dbg packages for the python
> pieces, this isn't the standard practise.
>
> Cheers,
>
> Richard
>

It isn't a pure python package but a combination of C library and
python therefore -dev and -dbg are needed.

Best regards,
Yevhen


