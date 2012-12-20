Received: from mail-ob0-f177.google.com ([209.85.214.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TlfQ1-0003S7-3O
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 13:40:12 +0100
Received: by mail-ob0-f177.google.com with SMTP id uo13so3229411obb.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Trxp+wc2jO7SbeNTXObMJlDHMoR8etTPFbzCMPyHg1U=;
	b=rJ71g5m3VzL1ipY+idTDJftW8QmTXzgau7Oc6sgW8biYQTMsQW1+1PMZplglPFXO7W
	6yRH1J2xrFYEkIlf1XN1QCoR9awjztxDvIwHh4TfoxNjMjKyd+/b83ZrT/rbW95RXPfG
	TVsG0I7SODlWV6M2KmWysoGPrOvQKKVqXrB0U74HK6qQPmZd6eyRjYHkm7NGG0jW93mN
	aFRMJBmfssr6/xq9p5NoKILfBzMGiZRdYxnpgePGok4bsPsgiwU8vgM8LaVIgHM9xvMM
	vWmQiRQKCJQHXIAT80J81gOhuolJ7NiV98chvzsywhvMB3l2RYgNleg22jJKkZCTwvgv
	n+0Q==
MIME-Version: 1.0
Received: by 10.182.131.3 with SMTP id oi3mr3372084obb.13.1356006324132; Thu,
	20 Dec 2012 04:25:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Thu, 20 Dec 2012 04:25:24 -0800 (PST)
In-Reply-To: <1356003444-22171-1-git-send-email-noor_ahsan@mentor.com>
References: <1356003444-22171-1-git-send-email-noor_ahsan@mentor.com>
Date: Thu, 20 Dec 2012 10:25:24 -0200
X-Google-Sender-Auth: eyvI7-znypbpAve2z9AuuIjBzgw
Message-ID: <CAP9ODKqw5pGY8GqQPVB=tBrVmW7ePCww1uxuTS2WLd94Egk-Gg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Noor, Ahsan" <noor_ahsan@mentor.com>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] freetype: Update EXTRA_OECONF to use host gcc.
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
X-List-Received-Date: Thu, 20 Dec 2012 12:40:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 20, 2012 at 9:37 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> * It uses host gcc in its configure script. When IA32
> toolchain is installed it starts using its binaries instead
> of native gcc. Modified EXTRA_OECONF so that host gcc is used.
>
> Signed-off-by: Noor Ahsa <noor_ahsan@mentor.com>

Ross, I think this could be evaluated for danny too.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


