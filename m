Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8927B6077D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 16:53:10 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so4448032obq.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=jhB8rasnE9VNPam59j7rYT94EXh42wUQ4yTLCqDgml0=;
	b=aBi5FxLMh6cIUH2Ng/RXL0AcoCIpfy4zkB6RCgKnBjrwi5LDacjmBisg3aIUVfSMWJ
	tuwLVrP4YLw/n/EQkib8w5m1LoP/XEBdMDIfwd++laDH7hQ1oWhXoIDVnHLEcyMaUdEN
	CR9B881fYY3QCKz8RL5V4e5RlF1NgrpJ0HIzV4zKAhMhf+eUJvU4WvJuq6laLh4wIbyc
	hnVsOMAH3WXM4QlA2QR6E0lBcnKYsHH8breQVX4a3msmNaZjw9/heSwG+HLqQgnwJCvq
	S6f8PbgfrRp+/ugEWL90ByUyh/N4bzQrFSsGIRBSmi4ENvA2JAFx7x4meJfQLKtGtPCa
	u9OA==
MIME-Version: 1.0
X-Received: by 10.60.38.199 with SMTP id i7mr9999939oek.36.1372697591050; Mon,
	01 Jul 2013 09:53:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 1 Jul 2013 09:53:10 -0700 (PDT)
In-Reply-To: <1372556176-25711-1-git-send-email-Martin.Jansa@gmail.com>
References: <1372556176-25711-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 1 Jul 2013 13:53:10 -0300
X-Google-Sender-Auth: dEQ87JeytWZcCQrWWNjS1X-rnqM
Message-ID: <CAP9ODKpDn+V1=ehsQ0RjEPHUojChhiNXx1yFwq_d9sWrxw9T2A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] buildhistory: Record size of installed package not compressed archive
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
X-List-Received-Date: Mon, 01 Jul 2013 16:53:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jun 29, 2013 at 10:36 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * usually it's more important to know how much space will each
>   package take on target device then size of compressed package
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I fully agree; this is a more useful information indeed.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

