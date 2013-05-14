Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UcMlT-0005cK-Df
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 23:28:15 +0200
Received: by mail-ob0-f174.google.com with SMTP id un3so1160983obb.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 14:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=5oxHhUPS8i+RONPCXzMZjprkjanHlIr0q6eV5honKK0=;
	b=zA3BhVdDkh3luUlonDlElaxiSRkkgyXBTNpv9NCfjKt6n8LpRPKal5QRK0yMuXbVaZ
	ybjAVngucvSwg+kz7QVbfEox9iW7N5vWaQg5Xoys0shyXIQChtYXjyAL4cCQQ8g+h66U
	Ygh9Q2oW5T7p34/PsBFhS/6LVdeEDTA5R5QxnhUpacgFx8QAH9buFCqE6f0cmdD2wDmh
	gX5PBRBIv0PtkOYFqLEmStoxGidN/1V6QJ5WDlWfYfKFE5+NuwXewK/w9+b9202Ww6os
	ZsTsZPeDZM5WkiHY2nmUKAgtmK7HWt0vfCxMjshlkhPo/6L3b0F72wm+vRXHHtL0/9ck
	ZVDQ==
MIME-Version: 1.0
X-Received: by 10.60.116.3 with SMTP id js3mr15431902oeb.142.1368565792319;
	Tue, 14 May 2013 14:09:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Tue, 14 May 2013 14:09:52 -0700 (PDT)
In-Reply-To: <1368513794-20427-1-git-send-email-b40527@freescale.com>
References: <1368513794-20427-1-git-send-email-b40527@freescale.com>
Date: Tue, 14 May 2013 18:09:52 -0300
X-Google-Sender-Auth: f39JbXTk2YywPOcTBSyVYzQn3wU
Message-ID: <CAP9ODKqvTauWrg3QAwuJvwHMWKDXwPDLdXP_xb9Fu44SKNqPaA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: b40527@freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchain-scripts.bbclass:Add CROSS_COMPILE variable to environment-setup file
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
X-List-Received-Date: Tue, 14 May 2013 21:28:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 14, 2013 at 3:43 AM,  <b40527@freescale.com> wrote:
> From: Zongchun Yu <b40527@freescale.com>
>
> when compiling the linux kernel manually. users need to set CROSS_COMPILE separately.
> adding the CROSS_COMPILE variable will be nice for using.
>
> Signed-off-by: Zongchun Yu <b40527@freescale.com>

I agree; it makes it easy to use with many make based projects (kernel
and u-boot, for example).

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


