Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TkIzg-0008Hm-U7
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Dec 2012 19:31:21 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3039522pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=Hf2uIJj5XQhjnxd2P69CophuRGadOdOo8+Fu9ECzNHw=;
	b=Es6hQ8QzzU43AIZNhktx5gSdXUypuCNTwVOCLjLrK5Qw45YBvvjqXWB7fgZh4+9+9f
	rvf3enkKb9dbhLT25rzPAWKKd5DMNVqvgJ1U6q3vLQ7tV3ShzEPCBt+xd4cMQGpXQctw
	F6nkedlR6JKUrxFp6BYch8jAqHdAHh32xG+3WvT8kKk/oo51aBt/b1eOc2K9ilONMir/
	EHsSFCHUhMzzLekIsvdgdYi5gM0ilJetOIhVNfe/mAcNVLCQ05lmRB/5MqErT2G3Zohz
	3+WrZlayIYOGXJh/HqKsBCVyuL8YYjDxxU+4UlsMfvPXkxp5xrLdwi6TPoEAKdpiE+5h
	IP1A==
MIME-Version: 1.0
Received: by 10.66.87.133 with SMTP id ay5mr35282942pab.59.1355681800774; Sun,
	16 Dec 2012 10:16:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Sun, 16 Dec 2012 10:16:40 -0800 (PST)
Date: Sun, 16 Dec 2012 16:16:40 -0200
X-Google-Sender-Auth: rLEGH9s19Nvpk_aMvp3zRWOdhPM
Message-ID: <CAP9ODKoRws=EzHxyNumYnj-F2S5h_66wkCfL42-yrJK7KGYBOQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Build fail in kconfig-frontends
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
X-List-Received-Date: Sun, 16 Dec 2012 18:31:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Today I did a sync and kconfig-frontends fails to build. I submitted a
bug report (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3610).

I am sending it here as well so people can confirm if it is
reproducable in some other environment?

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


