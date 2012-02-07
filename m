Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuplG-0004mR-U2
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 19:27:26 +0100
Received: by lahc1 with SMTP id c1so4327535lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 10:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=JsUeX1iqMUG4MiqP28TazUCy0cGeKFofKKQYCZF23GA=;
	b=XxppBxZGOYQEy4dpYweRYmzfoFddkY6f7b/QoVERrr8hzITsaF4xhW4UgT2oJMufJx
	N2odqgnqnh83cMFCekZX8u8Cctkp0Fo4hs4D0qA95dg/troNBdJOATmEm2KWGUbgWM4M
	H6fQbm3oUUOyzWdYH6tIYEkvYeNj/3RGY3BHE=
Received: by 10.112.32.1 with SMTP id e1mr6860564lbi.3.1328638764314; Tue, 07
	Feb 2012 10:19:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 7 Feb 2012 10:18:54 -0800 (PST)
In-Reply-To: <CAP9ODKozBCcoddJ1PKPOKJAy_OWerS+qvxPe9qGmR3SLT=RdqQ@mail.gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
	<04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<2f04aa9f17c455c3d42ecb81975e425746973bef.1328510189.git.raj.khem@gmail.com>
	<CAP9ODKozBCcoddJ1PKPOKJAy_OWerS+qvxPe9qGmR3SLT=RdqQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2012 10:18:54 -0800
Message-ID: <CAMKF1sqPAeYohBX5nvM831FWaoj3ZaYENbZAq=S3m1H_Yrc5qQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 19/20] gcc-cross-testing: Fix evaluation of user and target name
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
X-List-Received-Date: Tue, 07 Feb 2012 18:27:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 7, 2012 at 9:49 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
> There're any reason to not use grep -q and drop the pipe?

yes. I dont need to know stderr along with stdio just return value is enough


