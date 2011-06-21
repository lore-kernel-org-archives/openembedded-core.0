Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QZ5vV-0002UV-Gt
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:43:53 +0200
Received: by fxm19 with SMTP id 19so163028fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 11:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=eRGSYl2Ws4TApPK4xo8QhzAF0LJbq945iaNa/vfayiQ=;
	b=l+0xBXgCuEq60+c7dBBK0c4Qi4ozpCLBcRSwqWl4Ck1v+Ia58JDlcfYPk6tYWxezpV
	rTeyi5h+OyOARwZddJMWvWmfjzr1IQ4gXvSna8zRrmurBuWUxAlMGicbOvp4QMZIHiju
	qy4iTHEcIT3XrBpigEIKbk6wdhGjt0QRAKtqk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=U1a0qfN/9ump+zgY6ROw9HUUM96lHOIwbt1LNc5n/jBT+t4ZhwLEwexvfKJtBEllfI
	KulzZVgOzFhoPP0LK7JI2/DvbqGm+a3OJFYuUQ2OhJY+7JpYGA1mtq+LQCqXZndYu7Xs
	aEelJpb3bp3aWL/0O2GQ6kRvGhu4ELCrvqosw=
MIME-Version: 1.0
Received: by 10.223.76.219 with SMTP id d27mr223287fak.87.1308681619721; Tue,
	21 Jun 2011 11:40:19 -0700 (PDT)
Sender: anders.darander@gmail.com
Received: by 10.223.114.1 with HTTP; Tue, 21 Jun 2011 11:40:19 -0700 (PDT)
In-Reply-To: <A5CA482F-DAA6-407C-ADA1-CEA2A5D91D57@dominion.thruhere.net>
References: <cover.1308680000.git.anders@chargestorm.se>
	<8e57843c8775752059dc6acacdbd7751b1ed7082.1308680000.git.anders@chargestorm.se>
	<A5CA482F-DAA6-407C-ADA1-CEA2A5D91D57@dominion.thruhere.net>
Date: Tue, 21 Jun 2011 20:40:19 +0200
X-Google-Sender-Auth: BXDVY-p958paMRTyistW0P-0AWw
Message-ID: <BANLkTi=gfDxJSRif91-j+-zKd7rQjZeL+g@mail.gmail.com>
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 2/5] module-init-tools-cross: add provides for depmod-3
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
X-List-Received-Date: Tue, 21 Jun 2011 18:43:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 21, 2011 at 20:22, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Don't you need at least 3.13 (or better 3.16) for proper 3.0 support? This one was added after 3.12:
>
> http://git.kernel.org/?p=utils/kernel/module-init-tools/module-init-tools.git;a=commitdiff;h=3328d178247017affd90b7897393699f2f45227d

That's of course true...

I'll send a version 2 at some time.

Regards,
Anders


