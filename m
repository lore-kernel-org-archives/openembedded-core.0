Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id B652060958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 06:10:54 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hr7so936911wib.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2013 23:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=KW6Qv0eQo2eSNjgCHJnYiLHE0QTBw7E4WKmiyfTpQjg=;
	b=l/NT0+TS4vCWhTBSA0K4UBKJgAIt5IsfygDiehJKyAId0EYONKubSRZXlwL7TXFzpr
	pgZ2NZy9wWzkvgmusp2hwwOs7n1lenmDld8z4xk1qY0HkSvd739QlIciDr/m/DatJvqH
	M1tgZkmSDPBOAn5roO/YgBgpy9sRQA+kEwgyYV3YjvQ+TrMc46z0T5KV3I1T0dOL8GnW
	HCfjaNco5zykzkVWm0BAsFBowzGCI85Dv9oQYC2l8px50VEAkKVInmn+nN4cPlEcwuLM
	n0lAWyCE4myBpOaz3QmUL/vU0537PR+il5k9g6jqAAz8Iiiprpe4ewLV6aL2oCLre4Uj
	zBaA==
X-Received: by 10.180.36.238 with SMTP id t14mr6051522wij.29.1375078254581;
	Sun, 28 Jul 2013 23:10:54 -0700 (PDT)
Received: from ?IPv6:2001:610:612::fcb0:ae2c:ca5c:8512?
	([2001:610:612:0:fcb0:ae2c:ca5c:8512])
	by mx.google.com with ESMTPSA id
	s19sm20092838wik.11.2013.07.28.23.10.52 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 28 Jul 2013 23:10:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZddy=dtdm_wdqg+GJQmxmt24uhmNe8J6hM6gnK_ikocw@mail.gmail.com>
Date: Mon, 29 Jul 2013 08:10:56 +0200
Message-Id: <EF1B5F37-0C9D-4804-BF7C-6C95A25E0091@dominion.thruhere.net>
References: <cover.1374822498.git.sgw@linux.intel.com>
	<CAJTo0LZddy=dtdm_wdqg+GJQmxmt24uhmNe8J6hM6gnK_ikocw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1508)
X-Gm-Message-State: ALoCoQky4B8ZmvtSk8Xn2YJkEGtdULXMSJ1zipDwthSTmNZ7j1RlbYj8c7OfkHVHGnLtGWuxbeg6
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/78] Review & ACK
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
X-List-Received-Date: Mon, 29 Jul 2013 06:10:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2013, om 11:35 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 26 July 2013 08:14, Saul Wold <sgw@linux.intel.com> wrote:
>> Emilia Ciobanu (12):
>>  babeltrace: fix recipe name
>>  build-appliance-image: fix recipe name add GIT revision to PV =
variable
>>  chkconfig-alternatives-native: fix recipe name and add GIT revision =
to
>>    PV variable
>>  connman-gnome: fix recipe name add GIT revision to PV variable
>>  docbook-sgml-dtd-3.1-native: fix recipe name
>>  docbook-sgml-dtd-4.1-native: fix recipe name
>>  hwlatdetect: fix recipe name and add GIT revision to PV variable
>>  lttng-ust: fix recipe name and add GIT revision to PV variable
>>  mtd-utils: fix recipe name and add GIT revision to PV variable
>>  neard: fix recipe name
>>  rt-tests: fix recipe name add GIT revision to PV variable
>>  update-rc.d: fix recipe name and add GIT revision to PV variable
>=20
> I meant to chime in on this yesterday but was... tied up.  For
> packages where the SRC_URI is a git repo *but* we're only ever
> checking out release tags do we really need to rename the package to
> _git?  The _git version to me implies "a mostly working snapshot of
> the development release" not "a stable release".

That matches my expextations as well.

regards,

Koen=

