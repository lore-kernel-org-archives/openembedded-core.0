Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TPE2a-0006ST-08
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 16:59:12 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so704321ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SuURhdDMzR2mawr3sxpl+PcP41aaz50tdy6I4EvUvgU=;
	b=tLUphcl9k9Dh0RTGWUtMdTPreU2AkVcZdLcDpekrtSiecSGd6LtEpUtOE6K4nrEr1p
	MGrQxzsbtZh0R2fWV4cE4Qy5FAX+9iofPz813rl8GYNxkg5J/Puw8+8emClnC6VwMHOO
	mtaBBw1kuh2B0LOxRmZ6Dd4xDg6+4vO7nHq6HYYsjf5FCAlqrCdo6C1xPpbRYCY63QH3
	a4HT0HBsvLI+TP/eYNz21WG7FjPf9xzlM26SYCOPbTduX6Ukjl/vKBKzQFwESVLIsXv2
	Gf25xWZJxGni1AJBvuPBC99I48ncoibMzkRg6v4f/jkWZtBtTchCByUZxPc/ZpiAFsHe
	9nBA==
Received: by 10.50.187.202 with SMTP id fu10mr8749292igc.59.1350657950529;
	Fri, 19 Oct 2012 07:45:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.103.104 with HTTP; Fri, 19 Oct 2012 07:45:17 -0700 (PDT)
In-Reply-To: <508120A5.1050404@opendreambox.org>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<508063AF.9030400@linux.intel.com>
	<70CC66F5C30A414DADDA6973E4CA391A70949E@039-SN1MPN1-002.039d.mgd.msft.net>
	<508068BA.8070301@linux.intel.com>
	<70CC66F5C30A414DADDA6973E4CA391A709A30@039-SN1MPN1-002.039d.mgd.msft.net>
	<508120A5.1050404@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Oct 2012 07:45:17 -0700
Message-ID: <CAMKF1sow_TKiUXZ=e6G7XDh_xJZFVvAYWc1abBRE7BOikW8UiQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cryptodev kernel module recipe
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
X-List-Received-Date: Fri, 19 Oct 2012 14:59:12 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 19, 2012 at 2:43 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> That's not an option for cryptodev, though, because unlike most recipes
> inheriting module.bbclass, cryptodev not only installs modules, but also
> header files.

for such exceptions you can always use do_install_append and do the necessary


