Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UWNOU-0003Mm-UB
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Apr 2013 10:55:39 +0200
Received: by mail-ea0-f180.google.com with SMTP id q16so2034316ead.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2013 01:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=i8oPFGd8uX0PCtTuTNZ7HfE1CUBosVhsPs2rkPyREUo=;
	b=Y9YT3jz3ensGTve70kJ2np7iymLUoJT2JoOlNn1zyT03LgpA0hYGaf4uj+5Sm5XDyw
	k4A8jejXJFHtKS3Xa+y61P9uMrCbD/ngwZcVcc9jxIGfWcEJDAuMuFP+CxMDS3A/A/WW
	4ALta9pOmUk2RSoixBbWtsdQDe+ykYP72KPMaLlng5YNScRn3tV/vqhFU+mZ5QFXhV6n
	QPsS/Gj6l6HMTqZcrntHgbDikBFiHflXad1JLUI/r/kGa0zICaEN7KOlAIgkP4yzhsXT
	qBHbjiL+N+F+mW1WHvCNY0ckpl/C3mR2iNpTCYsPscUG0E6/9pJNC8MXZKnAZlHxLFnM
	LZ3A==
X-Received: by 10.14.9.71 with SMTP id 47mr64249528ees.21.1367138271635;
	Sun, 28 Apr 2013 01:37:51 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id w52sm4568956eev.12.2013.04.28.01.37.49
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 28 Apr 2013 01:37:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKpcvnH8m75kACbaWGXPs=3d_nq5ncfMiuU91piuqrXg8g@mail.gmail.com>
Date: Sun, 28 Apr 2013 10:37:51 +0200
Message-Id: <E71189B9-BEE7-44EF-B19D-EEDFBA00DECB@dominion.thruhere.net>
References: <1367075749-6702-1-git-send-email-Martin.Jansa@gmail.com>
	<CAP9ODKpcvnH8m75kACbaWGXPs=3d_nq5ncfMiuU91piuqrXg8g@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmOlhlupX5gZOqYIyUcySD3VjivyphNk0J6aKjWWmQtQAOAYZImi0G73wIVQrO37HIQJvsT
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory: change default BUILDHISTORY_DIR to TOPDIR
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
X-List-Received-Date: Sun, 28 Apr 2013 08:55:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 apr. 2013, om 01:27 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:

> On Sat, Apr 27, 2013 at 12:15 PM, Martin Jansa =
<martin.jansa@gmail.com> wrote:
>> * like PERSISTENT_DIR I find BUILDHISTORY_DIR more persistent
>>  then tmp-eglibc directory
>> * WARN: people with existing checkouts in TMPDIR/buildhistory
>>  need to move it to new location first (in order to save history)
>>=20
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> I've been doing it locally all the time; thanks by sending this :-)
>=20
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Same here :)

Acked-by: Koen Kooi <koen@dominion.thruhere.net>=


