Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 531C66BBCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 06:15:41 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so5852019pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 23:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=hC3PMiE5uhiYlXBHGEp1U37YGEKyhkEjOZIMlvnCFXQ=;
	b=O8ZiOAD8dNybJDeUkXHjWIrTlnGscPtx+l4Em+d4W7mf+lU1Eilc2eS7tw51IdposA
	gnHQYK0fznSq7A43KyFUJ6kerJzJ9LWNwVfdB2ndDkWTSsFQETs32/4VhfLS9sMxel02
	Y7CXDHaLeFf0A6GPTuKLQNaOvClAyN8lWGAbHgldNqkOXn0SrB7cN+Tuw0YRbzovXAUi
	rev+9mEq7PZtC3KyxVRiCXToQmSn4tdhRysrW4p0k0AIbrcAIPEOBoRk38bR11aQB045
	EBe5h/QcocabEyhkABsi++3higIDoVha4aXjtQ6U7A89k5L6wh+eoAQE0jtnkUFHFyeO
	T5Lg==
X-Received: by 10.68.48.166 with SMTP id m6mr25245108pbn.105.1377670541823;
	Tue, 27 Aug 2013 23:15:41 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	hx1sm28992267pbb.35.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 23:15:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1377629276.4083.101.camel@x121e.pbcl.net>
Date: Tue, 27 Aug 2013 23:15:41 -0700
Message-Id: <9B0060D8-B431-4C5E-BF00-3660F48C7636@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
	<621ba27fe578346e2feae489fba4d576148299fc.1377623208.git.raj.khem@gmail.com>
	<1377629276.4083.101.camel@x121e.pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/20] package_rpm.bbclass:Make the regexp less greedy
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
X-List-Received-Date: Wed, 28 Aug 2013 06:15:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 27, 2013, at 11:47 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Tue, 2013-08-27 at 10:15 -0700, Khem Raj wrote:
>> This causes issues when postinstalls have ERROR keywords
>> its interpreted as error and image build is cancelled
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> As I mentioned before, "the regexp" isn't a very satisfactory
> description of the locus for this change, given that the file contains
> many regexps.  I'm also not entirely convinced that this patch really
> makes the regexp "less greedy" in any meaningful way: it makes it less
> prone to unintended matches, but that's a different issue to =
greediness.
>=20

Thanks Phil, I have reworded it to make it more clearer hopefully. The =
commit it pushed to the pull branch here

=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/pyt=
hon3&id=3D5ddf816178a72b685039ce5b1ab161c5c751ad5e

> p.
>=20
>=20


