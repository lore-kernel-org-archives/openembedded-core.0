Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QalYE-0002r0-SS
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Jun 2011 11:22:47 +0200
Received: by pwi1 with SMTP id 1so2659509pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jun 2011 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=DnpXZ50q1U7Hr8Eob3vEHOmL7TnzT/Hk/0h3wGddOeM=;
	b=rqZ4nStX5kRx0mNU6y9ifUvZkwi3Ow+0EazfDnTjvX1DTxtkn9vmf0azmPb5SfF7pX
	knR6VRt7JPtlfTLDtCLHOFXecKpDq8RAkTHrGuIiNVpBNnxLvQGAQpzafgSVuuBXHRh7
	9lDyQ4v53UsAril740g/43KdIw2nVWSPp/hYc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=E/XPJjmxYQQSx+SYQ1Nb5DqCQyU3ILWZ4gVEeurhDXNazGeoUpiYpnc7ZVjPTEJnU2
	VhAyOpH+AV5JakD3s7lTHYX0nwyrFvx3SPfUB8J4HMfH9ksljRmO3p6rXDULGSGsUaak
	nNz63cCkOZrzlMXyETtNFHLnoBwxmE+gYr6Rk=
Received: by 10.68.32.66 with SMTP id g2mr2749648pbi.26.1309079947143; Sun, 26
	Jun 2011 02:19:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Sun, 26 Jun 2011 02:18:37 -0700 (PDT)
In-Reply-To: <4E0699D1.9090308@gmail.com>
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
	<4E0699D1.9090308@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Jun 2011 02:18:37 -0700
Message-ID: <BANLkTi=_Vn+SqWKy0z9nOqpFV=-D0H48Bw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Sun, 26 Jun 2011 09:22:47 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jun 25, 2011 at 7:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
> change the install command like below in gcc-cross-kernel.inc
>
> install -m 0755 xgcc
> ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gcc-${PV}
>
>

here probably

install -m 0755 xgcc  ${D}${bindir}/${TARGET_PREFIX}gcc-${PV}

is needed instead


