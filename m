Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UCdrE-0001qu-5j
	for Openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 23:27:59 +0100
Received: by mail-oa0-f44.google.com with SMTP id h1so9970794oag.3
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 14:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=an050c0QMtI+8JtpmwR/TYYDCnxo3letG1O24k+q9jw=;
	b=O2yMO1yiHEIP4KV8V3PYIKEhrm6zpuJ2ZOZAtZVG5ARfuPisL/AXCcfXHrmYDTYZZc
	9bjhzTE2XSZAsSuvXIEbmgh5hBdHh/LL5kUEx/RPTSB6AhW9Z+WLdC74FRm80DRTTGmn
	/T+afUUsZEQMdZ33s8qe6Luq0DRzoc/8nGfzDlY3rJvI6WvPDpnLhFb51x2d4gxI3F5I
	iQ0ufGm6gZgPjq0dPACq28FFxTOz3mUZSC54PW/ClArj4Ts3jDk9+MZf2vItmWvWuGtw
	zOlWMoqxfLlsuG5Eu955sUipo7eJOEL+d1G9qS4iePcjdJ0G/8k3GbBqBocKd6mCLepw
	s7fA==
MIME-Version: 1.0
X-Received: by 10.60.172.18 with SMTP id ay18mr16815660oec.126.1362435075447; 
	Mon, 04 Mar 2013 14:11:15 -0800 (PST)
Received: by 10.76.173.138 with HTTP; Mon, 4 Mar 2013 14:11:15 -0800 (PST)
In-Reply-To: <5135189F.5070203@windriver.com>
References: <1362432115-43230-1-git-send-email-jason.wessel@windriver.com>
	<5135189F.5070203@windriver.com>
Date: Mon, 4 Mar 2013 17:11:15 -0500
Message-ID: <CAHUNapQ6frnbBJKXU1KuhZCik5x4OGDv1aD1zib-5RdMLgWc2Q@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses, busybox, cml1.bbclass: Fix menuconfig display corruption
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
X-List-Received-Date: Mon, 04 Mar 2013 22:28:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Is this a proposed fix for bug 3898?
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3898


