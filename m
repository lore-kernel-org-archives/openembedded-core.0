Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RmnKZ-0001OC-JT
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 15:14:39 +0100
Received: by obcwo8 with SMTP id wo8so1802203obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 06:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CaRZI9FidTHq3BGU9oBm9Tg2yGxtUi/GRwk9kjjcs0Q=;
	b=UDNXbtueGsaW+r4KQGQmb/7bsuWsZ1ZxhsEhLLKK4Xg4fwKHMuU/TZ8qkzgOK/YOJD
	ZY3CCey57qMjhcKwFEQRBzUvHEsdhLrlST8sdtMbVcyvo6F6+sG8pZ+A7kPvYpw279DY
	woY7oOsqMQJgFlGgWCLmzt8/PnGwRwoi1lc5Y=
MIME-Version: 1.0
Received: by 10.182.225.9 with SMTP id rg9mr11229315obc.4.1326722823099; Mon,
	16 Jan 2012 06:07:03 -0800 (PST)
Received: by 10.60.34.138 with HTTP; Mon, 16 Jan 2012 06:07:03 -0800 (PST)
In-Reply-To: <1326395831-5121-1-git-send-email-koen@dominion.thruhere.net>
References: <1326395831-5121-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 16 Jan 2012 06:07:03 -0800
Message-ID: <CAGDS+nkBPfOKsw_w5UpEtk2h4QOqAAt7DocUcpA31BcupEpQ3A@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [Patch v3] gconf: enable gtk+ 2.0 support to build gconf-sanity-check-2
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
X-List-Received-Date: Mon, 16 Jan 2012 14:14:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 12, 2012 at 11:17 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> This is needed for e.g. gnome-session:
>
> gnome-session[424]: WARNING: Failed to run gconf-sanity-check-2: Failed to execute child process "/usr/libexec/gconf-sanity-check-2" (No such file or directory)
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Tested-by: Steve Sakoman <steve@sakoman.com>


