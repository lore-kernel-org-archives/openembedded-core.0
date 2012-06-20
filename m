Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShND7-0001qJ-3M
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:52:54 +0200
Received: by eaal1 with SMTP id l1so2542717eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=J7WLU1DzLd4LvqNU6QBqW4CmHcVCt5UmiYungeTj0JI=;
	b=kwxNGsn1IpADGMuCu4JFh+8YcJpxle8BGIPJTFatzSZEqG8XsupJOrk/SlKf0hOZXw
	nT4TEOr06LAjtPC9bSVp9Xag8FOceeRj4xlhuAno4Z+8M0v9fbBWzYLpuVenH/+w8CYS
	nmISHLy0n9mwtyviPzZVFVzFVayQZuL5fdy2Uxvlx7ownnfIhw4nTZJBk8GMJT5r31ra
	pwRGf8yvgNwTBrhZ3nqG6SyC/NKojSpOa4isYE+HA1pWLzg7XZVmxyh6jKp7W2iyNq+5
	EWTCC8rjuOWzEa3TlOhXsFy+JvFzCQ4+o+93CSUK+hs/FnTtKCdaY8y9WlkugcZMuOaI
	rYoQ==
Received: by 10.14.95.138 with SMTP id p10mr5378641eef.110.1340206924311; Wed,
	20 Jun 2012 08:42:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Wed, 20 Jun 2012 08:41:34 -0700 (PDT)
In-Reply-To: <1340195059.14857.198.camel@phil-desktop>
References: <alpine.DEB.2.02.1206200807090.4904@oneiric>
	<1340195059.14857.198.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jun 2012 08:41:34 -0700
Message-ID: <CAMKF1soec-83D+yqBoy7TGHEN5hD2A=YLKp1rbWY1eKYgnPHfA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: oddities related to "_append" and "_prepend" in oe-core
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
X-List-Received-Date: Wed, 20 Jun 2012 15:52:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 5:24 AM, Phil Blundell <philb@gnu.org> wrote:
>> meta/classes/multilib.bbclass:PACKAGEFUNCS_append =3D "do_package_qa_mul=
tilib"
>
> That one is a bit weird. =C2=A0It looks broken but, presumably, it must w=
ork
> otherwise someone would have noticed. =C2=A0I don't know offhand what is
> making it work.

insane.bbclass:PACKAGEFUNCS +=3D " do_package_qa "

and it gets appended after that so it works, but I think adding a
space in the append
above is a wise thing to do.


