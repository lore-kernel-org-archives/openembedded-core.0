Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pw0er-0004dx-7w
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Mar 2011 00:13:09 +0100
Received: by fxm8 with SMTP id 8so3164968fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Mar 2011 15:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/qCEjQfuVQih7Yv1YZmuOeEocUAUb5fph6yNNrje3GU=;
	b=RzlCx5S4P+DOcu/ixCJL3P8nTAOfukOw8jlhIxs1MeoKfMecZjpyfdgDaF2Y5duFqG
	rWC6ot//ew/13/3RWt5f+sJU5F+vcKULd4NuLNj5pEoyoVY3vwfRONHfAV3opZd0wY4p
	DW+gJDEgTtCJ69QLoZ3Su+mB5ijTqNZ/BWWB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=QYm577A4IxA8SMcO/opH/bW2gKmJ3LF7MzfpqxK6rse2R1QgfiglzGT+rWOjURXDDY
	nir8fDApPlwrwLji7Ayj/TknjE21MNGx0s4wJXmY3MI+GBaJBx42olnWdUUDDLk4ppC+
	JrREFnPu9GALwdKCQEpyxx0GxNw3gQfezKPOw=
Received: by 10.223.5.3 with SMTP id 3mr511919fat.0.1299366698099; Sat, 05 Mar
	2011 15:11:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Sat, 5 Mar 2011 15:11:08 -0800 (PST)
In-Reply-To: <F22AC2B7-708D-4036-A493-B95E87C4012B@dominion.thruhere.net>
References: <F22AC2B7-708D-4036-A493-B95E87C4012B@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Mar 2011 15:11:08 -0800
Message-ID: <AANLkTi=TKgiw9X3azhre2b1k3CXVNg0=8XFqQEFPN8Jk@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Please keep patchwork up to date
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
X-List-Received-Date: Sat, 05 Mar 2011 23:13:09 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 3, 2011 at 7:30 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Hi,
>
> When applying something to oe-core, please update the patch state to 'accepted' and archive it so we can only see outstanding patches when visiting http://patches.openembedded.org/project/oe-core/list/
>
> I went throught the list today and archived a bunch of patches, but more people looking after it would be better in the long run :)
>

There is a post-receive.hook script available which would
automatically update patch status after the push. I dont know if it
works well but we certainly
can use it in our git hooks and configure it if interest is there

> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


