Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SJtWg-00062I-GE
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 23:31:58 +0200
Received: by qafl39 with SMTP id l39so8260784qaf.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 14:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=g703MZ4tOMl+PTuJUCKb0aAswXpv7sMzzj/Z/S02Yk0=;
	b=PrxaDta/T8Bs/6Hn+AbAT0s9x2TMlab08O/hUMpMyyQmWNfgqSO3Z5RAOsfM/ZXg9X
	WfNOiTpU2mjRHs8MS/GeToeFyFLKzC4yRmHf95RdcZxnVt3Y1MURfQ+R67I9B7RKWiAV
	0nCRyk1R839sJj9YVCdpkkG4swwg3QTIs9t1gvqNYaLCh8yGSD6cOxG7SffGDd4YdhYV
	dTnWUnjnh1t6/p1YmgoenUoQ5sS1OvX7SrQowBTYOW951KGyRkQzMzh7U4zHE34f8OdV
	E/E7Y+dc5B1cAhNo60b3mJBmX/m41tq474xzVJa4RDCrhGggZCXyzuF8516CblT9eqK2
	82dQ==
Received: by 10.224.180.1 with SMTP id bs1mr17771144qab.2.1334611352948; Mon,
	16 Apr 2012 14:22:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.79.79 with HTTP; Mon, 16 Apr 2012 14:22:12 -0700 (PDT)
In-Reply-To: <cover.1334608810.git.kergoth@gmail.com>
References: <cover.1334608810.git.kergoth@gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Mon, 16 Apr 2012 14:22:12 -0700
Message-ID: <CABcZANnTcip0cUUw+tTY6LoX5YcD1Ms4EK=y04ORH+Sx1qRmdA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] External csl toolchain improvements
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
X-List-Received-Date: Mon, 16 Apr 2012 21:31:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 16, 2012 at 1:43 PM, Christopher Larson <kergoth@gmail.com> wro=
te:
> This cleans up the recipe and simplifies it, fixes up locale handling,
> silences QA packaging warnings, and includes toolchain version in the met=
adata
> checksums for target recipes. Obviously this is intended for after the fi=
nal
> release.
>
> The following changes since commit 4e1a8ed1ab7e7bd950e511c79ddfe072cb280a=
6e:
>
> =C2=A0bitbake.conf: Include abi_version.conf in a early stage (2012-04-16=
 12:51:50 +0100)
>
> are available in the git repository at:
> =C2=A0git://github.com/kergoth/oe-core external-csl-improvements

Ignore this one, a v2 is on the way with another commit to fix the
SUPPORTED handling.
--=20
Christopher Larson


