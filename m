Received: from mail-ob0-f181.google.com ([209.85.214.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UVL8J-0000ND-J7
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:18:40 +0200
Received: by mail-ob0-f181.google.com with SMTP id ta17so2396995obb.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 05:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=6Fb9MR6bTuao7n+Q9SuNYtcbiAuzah/nilyIGeVfLE8=;
	b=pk+c8ioQMJdiJaieH3cgAdsogrvqjEQ9vDYDSsKiZJu7f/Z9bECtRE+Hbk5X9/9Afz
	82OO/dlBNM3A7m2HlxLkVlOrirEFr0j1N5SF/JLztkiZAiys/Yx0LVciSjxfhy186AVY
	y+A57fD59PI5gp6okevXSncghsC9XmwUbga2SXqlWrGc9Q1UZ2lv7JW65MUu+Fe9OAcf
	IcWenUCMJKZGsnqo797KiYJZaEEHBvnule3+5HUQjkPhGXD004mDZgwGd4S2Px7wCocT
	aiBsjbPndQ9kdJ0xamvJnJfgF3g8I+9RG0Kl7x5RwG0En+ZRY82qQWu4b2pEP+gbM5UG
	h6FA==
MIME-Version: 1.0
X-Received: by 10.60.35.197 with SMTP id k5mr20337684oej.138.1366891255772;
	Thu, 25 Apr 2013 05:00:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Thu, 25 Apr 2013 05:00:55 -0700 (PDT)
In-Reply-To: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540D1@GBTWK10E001.Technology.local>
References: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540CC@GBTWK10E001.Technology.local>
	<1366820905.23738.153.camel@ted>
	<AAE0766F5AF36B46BAB7E0EFB927320630E4A540D1@GBTWK10E001.Technology.local>
Date: Thu, 25 Apr 2013 09:00:55 -0300
X-Google-Sender-Auth: AZ4D1OuRlk03JjCJPQIuX8G36LU
Message-ID: <CAP9ODKra5FDPMw9AnGhxVijp43_0SnVZVxhfPGwnBpeEaaWUaw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Lewis, Nick" <nick.lewis@usa.g4s.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problems with PACKAGE_CLASSES = "package_tar"
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
X-List-Received-Date: Thu, 25 Apr 2013 12:18:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 25, 2013 at 7:21 AM, Lewis, Nick <nick.lewis@usa.g4s.com> wrote:
> I have tried cherry picking from Dylan but it also seems to be missing populate_sdk_tar.bbclass and rootfs_tar.bbclass
> Does Dylan support PACKAGE_CLASSES = "package_tar" without these classes?

As it seems you're early in the release cycle of the product, dylan
would be a better base for your work as danny maintenance should end
when 1.5 is released.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


