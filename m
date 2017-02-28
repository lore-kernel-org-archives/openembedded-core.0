Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 2626E72FC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:33:27 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v1SGXQ5R006240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 17:33:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1488299607;
	bh=d9maJhjg4M8iVGSMyOvmMyTXHy7zNsUcbuyn6GxTskQ=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=piWmbmCdwfGA9YlQhaSAUxY6Z2mg0CxXrLz9nnYrnlw7YpP3cb26ti5pg1d+XnoAL
	08EiAlumcOwa5cNaD/cF7s40XcyV1teYaKs8RwFd+60yxMndRYIongEmEb9I7mJsXG
	7hfRWEcsq+dwGp6m39XO7cq6vjtha8Sdi6tFMyA4=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v1SGXJuN006253 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 28 Feb 2017 17:33:20 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 5C01007412F;
	Tue, 28 Feb 2017 17:32:41 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v1SGXHkU006250
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Tue, 28 Feb 2017 17:33:17 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>) id 1cikiD-0002pS-Hf
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2017 17:33:17 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1702280518430.30803@localhost.localdomain>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 28 Feb 2017 17:33:17 +0100
In-Reply-To: <alpine.LFD.2.20.1702280518430.30803@localhost.localdomain>
	(Robert P. J. Day's message of "Tue, 28 Feb 2017 05:28:16 -0500
	(EST)")
Message-ID: <lymvd6e0mq.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.6
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Subject: Re: how to *securely* do a remote install of an OE image?
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
X-List-Received-Date: Tue, 28 Feb 2017 16:33:29 -0000
Content-Type: text/plain

"Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
writes:

>   here's a puzzler someone just presented me with ... given an
> established OE build, and a way to download and install it to a
> remote system, how would one set up root and/or non-root accounts
> and passwords to then allow an *authorized* someone to log in to the
> newly-installed system and configure it?
>
>   as in, if the installed image contains a "root" account and default
> password, there is the potential of someone sneaking in there in the
> interval between installation and when the "authorized" user connects
> to do the configuration, even if the first act of the authorized user
> is to change the root password.

I do not think that this can be prevented.  When an attacker gains root
access, he can do everything with the system.  E.g. he can replace your
intrusion detection system with a custom one which does not report his
login.

You could use hardware features like burning fuses, or erasing keys in
TPM chips or increasing login counters there.  But again, an attacker
can alter the underlying login mechanism to report an untouched system.

So, you should try to prevent that an attacker can login to the systsem.


>   my immediate reaction was to use SSH keys, where the
> newly-installed system would require SSH logins, and would have to
> match the corresponding private key.

Yes; public key authentication is the way to go... You will never get
the system secure with a static default root password.

For SSH keys we are using [1] for ages.

OpenSSH supports CA keys[2]; e.g. you do not need to add every allowed
pubkey to 'authorized_keys' but only a CA pubkey.  This CA signs user
keys which are allowed to login.

Alternatively, you can implement something which sets the default
root password based on some serial number of the device.  But this is
difficultly to implement and brute force attacks might be very simple
(serial numbers are usually predictable).

Or, you can implement an OTP mechanism based on DSS or so.  E.g. device
contains a public key and presents a random number at login.  You have
to sign it with the corresponding secret key and enter it as a password.

 


Enrico

Footnotes: 
[1]  https://github.com/sigma-embedded/elito-de.sigma-chemnitz/blob/master/meta/classes/elito-image.bbclass#L56

[2]  https://www.digitalocean.com/community/tutorials/how-to-create-an-ssh-ca-to-validate-hosts-and-clients-with-ubuntu

-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz

