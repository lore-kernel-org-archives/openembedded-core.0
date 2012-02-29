Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S2lKb-00053S-6C
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 16:20:41 +0100
Received: by obqv19 with SMTP id v19so2471231obq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 07:12:10 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.182.75.102 as permitted sender) client-ip=10.182.75.102; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.182.75.102 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.182.75.102])
	by 10.182.75.102 with SMTP id b6mr301441obw.9.1330528330408 (num_hops =
	1); Wed, 29 Feb 2012 07:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=BMQW0Ofk3KaL0vMTRmvxIXGPwNalbCxRG2PtwEvKvuw=;
	b=mZhgPP1kEvnzyGz1d4JZ5G5qRNae5lDs3BYQgGwMiEd8g+0FcDCcL+QrCPEC7MBrfn
	6Qsc3BFqj3YotaQLAoagI2v25c4grns927rSp5FAp9iO0TCZylF5be5EEAT1VrQP1dR7
	cpuu3ZcVZ3rcVvrt7nL7/ctDOKuUTMIXjgkNo=
MIME-Version: 1.0
Received: by 10.182.75.102 with SMTP id b6mr259993obw.9.1330528330327; Wed, 29
	Feb 2012 07:12:10 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Wed, 29 Feb 2012 07:12:10 -0800 (PST)
In-Reply-To: <CAGDS+nnW6QBngHLVVn7AS=HU_DAdc6JQr9k=mrpu9mx=dLRLOQ@mail.gmail.com>
References: <CAGDS+nmNeyC3P+x+mk0g-qOKhkJ5pMNhX-ckBXr4F273poq2yw@mail.gmail.com>
	<4F4DB40B.6000300@windriver.com>
	<20120229084544.GH21882@ibawizard.net>
	<CAGDS+nnW6QBngHLVVn7AS=HU_DAdc6JQr9k=mrpu9mx=dLRLOQ@mail.gmail.com>
Date: Wed, 29 Feb 2012 07:12:10 -0800
Message-ID: <CAGDS+nnd_hZnxgX1JfKMksxmfREYjqEYFYN+Yhj=sgffUsCXNA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: psuedo-native strangeness on 64 bit build machine
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
X-List-Received-Date: Wed, 29 Feb 2012 15:20:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 29, 2012 at 6:22 AM, Steve Sakoman <sakoman@gmail.com> wrote:
> On Wed, Feb 29, 2012 at 12:45 AM, Petr =C5=A0tetiar <ynezz@true.cz> wrote=
:

>> Now it's impossible to finish the build, the most noticeable failure is =
gcc,
>> which fails for me in patching task due to the parallel build settings.
>> Changing the parallel settings back to 1 helps here also.
>
> I just tried building gcc and can confirm that it fails for me on the
> 64 bit build machine.

For me, a -c cleansstate gcc and then a rebuild resulted in a
successful gcc build.  I did not need to turn off parallel builds.

Steve


