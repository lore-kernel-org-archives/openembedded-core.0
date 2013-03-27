Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UKt2j-0005Sw-Cy
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 17:17:42 +0100
Received: by mail-oa0-f45.google.com with SMTP id o6so9042790oag.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 09:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=PTvQLTwlr3c/LwccqIWsbk0O9i6sacFG1nKTEFwoA/U=;
	b=IVT/FmF8y/Z0y73FO5AM9guaaQg7XCFGUCvvF4QfwhYjH6iJQvDOhICZBggJuydQ0g
	LA9urYu7vTZj05MLlY/KDPT1ovltMuLl7YOR3vWQwdV7J/MqZpA9ml0jecP7xQT7usUk
	jjYt/yxYSrBlRm7/CbSE/JODE19m1QAASdSKt+FuhyPIqxaPkIgyzWI6oDJpGnPl/JRl
	MP5SA9UOJQ77u+o0LOnJeU54CVA60ikj4D3mCaBnecVV3XcGwWyTho3F5BWBcmOubuFQ
	dLfmHPdmVqYQ8p4ror07q6yEYvo6aZegZB9PWDrdyQ1djWgEl8b4MIAWB01z3X352VDy
	ZNQg==
MIME-Version: 1.0
X-Received: by 10.60.8.197 with SMTP id t5mr15980123oea.4.1364400039636; Wed,
	27 Mar 2013 09:00:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Wed, 27 Mar 2013 09:00:39 -0700 (PDT)
In-Reply-To: <CAJTo0LZsYpzRk_cfLctbpaZQQJKtgb7SSXUq3Zrn7je3HXkgQw@mail.gmail.com>
References: <1364386111-1734-1-git-send-email-ross.burton@intel.com>
	<5695994C-BB2C-427C-A551-1EA6D4C2AD9D@dominion.thruhere.net>
	<CAJTo0LZsYpzRk_cfLctbpaZQQJKtgb7SSXUq3Zrn7je3HXkgQw@mail.gmail.com>
Date: Wed, 27 Mar 2013 13:00:39 -0300
X-Google-Sender-Auth: PulViqCwjYVBh1QpAaMugRejeX0
Message-ID: <CAP9ODKpENAszHSQTHXsiTKpSwCHw1aP2esUYG1kdcXCQ0RZhcA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade to 198
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
X-List-Received-Date: Wed, 27 Mar 2013 16:17:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 27, 2013 at 12:11 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 27 March 2013 15:03, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Since 199 has been released a few days back, how about upgrading to that and drag in http://cgit.freedesktop.org/systemd/systemd/commit/?id=94243ef299425d6c7089a7a05c48c9bb8f6cf3da ?
>
> I'm about to disappear until the middle of next week, so I can do that
> next week unless a patch beats me to it.

In this case Koen, maybe you could prepare and send this patch? :-D

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


