Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1AD65C7C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 10:13:54 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s72ADiR6027204; Sat, 2 Aug 2014 11:13:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q3kue76s_pXv; Sat,  2 Aug 2014 11:13:44 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s72ADf70027085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 2 Aug 2014 11:13:42 +0100
Message-ID: <1406974421.6981.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sat, 02 Aug 2014 11:13:41 +0100
In-Reply-To: <alpine.LFD.2.11.1408020410230.13352@localhost>
References: <alpine.LFD.2.11.1408020410230.13352@localhost>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: any subtle uses for hardcoded /etc instead of ${sysconfdir}?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Aug 2014 10:14:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-08-02 at 04:13 -0400, Robert P. J. Day wrote:
>   occasionally, i run across stuff like this (here, under
> recipes-support):
> 
> $ grep -r "/etc" nss*
> nss/files/nss-CVE-2013-1740.patch:+ *
> (SSL_ForceHandshake/PR_Recv/PR_Send/etc.) needed to finish the handshake.
> nss/nss.inc:    mkdir -p ${D}/etc/pki/nssdb/
> nss/nss.inc:    certutil -N -d ${D}/etc/pki/nssdb/ -f ./empty_password
> nss/nss.inc:    chmod 644 ${D}/etc/pki/nssdb/*.db
> nss-myhostname/nss-myhostname_0.3.bb:		-i $D/etc/nsswitch.conf
> nss-myhostname/nss-myhostname_0.3.bb:		-i $D/etc/nsswitch.conf
> $
> 
>   is there any reason for hard-coding "/etc" into those filenames,
> rather than "${sysconfdir}"? i can submit a quick patch to tweak that,
> but i always wonder if there's something subtle going on underneath
> that i'm unaware of.

Not that I can think of offhand.

Cheers,

Richard


