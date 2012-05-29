Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZUkt-0007Tt-Rb
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 00:19:08 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga01.intel.com with ESMTP/TLS/RC4-MD5; 29 May 2012 15:07:34 -0700
Received: by qcmv28 with SMTP id v28so2189236qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 15:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=peT8eMRpVcSFecUXJZslIn8dEREo83jFvSkhkKNOujE=;
	b=W3ZmDCzLAXDObFC2DQzL3ccY1Ov7FAP1pl6Bbh1jrl/NLuNy9lmCXEFnrIl8tKyH3P
	J7jA1F9o+gT8EjHdix7toC7bg31i2QKKbKR+yhlTFY2imhh3FC6xSpvUv7DtrL8h5tKO
	+/boSFw0KXHVpv8pTwm6lMZYKqxhLKMJqhMhiBaiiawf9sr9FoEeMHwPxprqSXFnwm58
	EQWBskb8aNM+Nhn0itXQKUaGAHJDRPSmcRjwjChhp4YjoHvBwICe4dwRTPaQ3NJoBn7C
	XiElCYKpMdVpV4SuR2WmjfRBl2WHcGW21l1xkMRlPQcjCrxCKFR+pFqnI5iwgQXUcgYA
	X4yQ==
Received: by 10.224.110.70 with SMTP id m6mr13686893qap.69.1338329253206; Tue,
	29 May 2012 15:07:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.162.12 with HTTP; Tue, 29 May 2012 15:07:12 -0700 (PDT)
In-Reply-To: <CAP9ODKotiqYtyY9sZ_9TqA3V2OoFRpkMpQLsR9sFSQqLaWf9iA@mail.gmail.com>
References: <cover.1338323483.git.ross.burton@intel.com>
	<73870ed1649a9fae2e44ed6299bfb068217b9e9c.1338323483.git.ross.burton@intel.com>
	<CAP9ODKotiqYtyY9sZ_9TqA3V2OoFRpkMpQLsR9sFSQqLaWf9iA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 May 2012 23:07:12 +0100
Message-ID: <CAJTo0LbdMKOmz_+n4a6+zCWf1qudCVYkXg2NT07HiMf24FRecw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkZv2ClW/0zj/yIUig8x6+w9OFFXbsulUoLX56Epl5/cP1Lc1l8Y14P7c3T80PWpN9vYcJm
Subject: Re: [PATCH 4/4] connman: upgrade to 1.0
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
X-List-Received-Date: Tue, 29 May 2012 22:19:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 May 2012 22:08, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Tue, May 29, 2012 at 5:43 PM, Ross Burton <ross.burton@intel.com> wrot=
e:
>>
>> =C2=A0.../connman/connman/disable_alg-test.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 46
>> ----------------
>
>
> This will make the build fail with old kernels.

commit d9724d24b091a9412992cc6883ca6a225fa1a88c
Author: Marcel Holtmann <marcel@holtmann.org>
Date:   Sat Apr 21 22:04:29 2012 +0200

    build: Remove useless alg-test example program

>> =C2=A0.../connman/connman/ethernet_default.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 22 --------
>
>
> Did you check the network is started by default?

commit 091347cc83aa28a2395630274b6f1334fcab4f88
Author: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Date:   Fri Apr 27 16:01:48 2012 +0300

    technology: Enable ethernet by default

As I said, irrelevant patches were dropped.

Ross


