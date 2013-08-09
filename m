Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 65C6A6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 17:47:38 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wd6so6731157obb.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 10:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=HIBA/iFFM/xNd3we4QWYOt+w95jEHC2yyvzBTnCKz/s=;
	b=g467fw/hleFPcc0UOjazUF9qlaj2dhXaeln4+00eGN98mY7Q/5Jtkv9pHfnUNxQ4sE
	AC59LnhpgCNtV5Gl+8Uc8JWbNfQr2fIuhhuxwHnPCuZqfRbsro43JsxNomZSNAz8acaR
	NHDFXuJqf4SkaMO2d66sRRWC6CTHN7KxyzTMRAJi2LzkLPSTu9WOcQWQ45KPPXdr549a
	gG5oA2TJtiA5AzSg9bghp513xMTQmlH7E3NmIc4wP/g7d9j5dzf8nD7f00vCx/Kz/8yp
	MEmUAjTp0B6KFzGwtWPq8YVcz4RO2FGdLz0bZClLpKUHEyGyNuLIDPObvINmBcJ8fOnW
	wwLw==
MIME-Version: 1.0
X-Received: by 10.182.225.134 with SMTP id rk6mr1411733obc.40.1376070459019;
	Fri, 09 Aug 2013 10:47:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 9 Aug 2013 10:47:38 -0700 (PDT)
In-Reply-To: <cover.1376060231.git.sgw@linux.intel.com>
References: <cover.1376060231.git.sgw@linux.intel.com>
Date: Fri, 9 Aug 2013 14:47:38 -0300
X-Google-Sender-Auth: VRO7Fve2JC1ZNfQzz-tsCJS5-PQ
Message-ID: <CAP9ODKp=32o2C4h76kC5dRE4bhg76N+eQRAKnmW3jG7fDQNZ2Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/17] Review & ACK
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
X-List-Received-Date: Fri, 09 Aug 2013 17:47:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 9, 2013 at 12:03 PM, Saul Wold <sgw@linux.intel.com> wrote:
...
> Otavio Salvador (1):
>   blacklist.bbclass: Avoid blacklist specific handle in base.bbclass

Please drop this one. Paul found my typo (did when I was testing it).
I will send a v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

