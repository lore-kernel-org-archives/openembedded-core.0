Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1R2SCC-00066H-KE
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 20:22:28 +0200
Received: by yxj17 with SMTP id 17so2331420yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=e4yHEkLcFYzrLew8d0UC5zw7aEpAD96BOZiSeYgfNPg=;
	b=pEuy1Nyr8GnL+f4FihJd5q8/rqDBbgqp7YEFPt8AiI0/hhbjQs64435ZJPvw4hWEj7
	+efyCywO5U58L0znCxP9lagP5EvOnGeiRM6FN1A72ApgSt04xA6gBeSETSBCdM+X2Axp
	Mz1/CU70MGdNrlwoueBPJ/cL5kAnvOrS+XNiQ=
MIME-Version: 1.0
Received: by 10.236.190.193 with SMTP id e41mr18484410yhn.118.1315678641057;
	Sat, 10 Sep 2011 11:17:21 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.236.111.35 with HTTP; Sat, 10 Sep 2011 11:17:21 -0700 (PDT)
In-Reply-To: <4E6BA2E2.7090301@eukrea.com>
References: <CA+2YH7vrG5b5ZH+_YSG6-F_fJT54rL_0B7JCjr9UiHRSiXdmJQ@mail.gmail.com>
	<4E6BA2E2.7090301@eukrea.com>
Date: Sat, 10 Sep 2011 20:17:21 +0200
X-Google-Sender-Auth: 7Uh9H820wowVSu7_pKGvHnyYwik
Message-ID: <CA+2YH7uhXW=i+P1UMJRC6WLK_SNQnpoDFVi2dMUnveofKpHOWw@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: udev mirror
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
X-List-Received-Date: Sat, 10 Sep 2011 18:22:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2011 at 7:48 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> git://mirrors.arsc.edu/kernel/scm/linux/hotplug/udev.git;protocol=3Dhttp
> worked here yesterday

uhm it doesn't work, i have no errors in do_fetch but the git
directory is empty (and do_configure fails of course). But if i do a
git clone http://... it works.

I did a bitbake -c cleanall udev but nothing changes.

I'll manually copy the files to go on but i'd like to understand
what's happening.

Enrico


