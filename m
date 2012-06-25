Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SjGnV-0007Pq-OO
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 23:26:13 +0200
Received: by eekd49 with SMTP id d49so1506678eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 14:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=MeqmXLpsDlRyA/RGHCVSSi0VAKtNRU22xD+OsKr2s50=;
	b=AInZHWanYCsl1YOlstaC9dH2tk4Po/G9Cfg7YN+XMkm1fm031zpXjxGlY5VHrWDvcY
	TMkHC2hhqvhdPCHJO4tDwONYQ7OCuk8Y11Gi+VosE904yYcd0/reZ3BMq8IEky/pswoG
	kVzEz9QuBJWCfAZ1lEfzEXoP97NjDZs+z1hxw9gpawMLkQAos9dwyz38kuedQTjAN/Wk
	eUjXfFSpA7sNBOCVlkA2V2Wrb3qQR+mSmwLmcVvOx9I7O/b4GTMQGKb/ua6fy/EGPF2Y
	eCcnQUDltn/pkdEIgv9I28uu3u6O4rLZ9ctIBGmhFQ0ir6XZoYbtI8p13lHSgr39DcpM
	SVng==
Received: by 10.14.37.132 with SMTP id y4mr2463168eea.142.1340658922347; Mon,
	25 Jun 2012 14:15:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Mon, 25 Jun 2012 14:14:52 -0700 (PDT)
In-Reply-To: <1340639719.23146.1.camel@ted>
References: <cover.1340402353.git.sgw@linux.intel.com>
	<1340639719.23146.1.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Jun 2012 14:14:52 -0700
Message-ID: <CAMKF1soWzVQO2Y0gQAS_wi9ng3TyyFhMQqBEZiQN4SNCmy6RUA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/17] Misc Fixes & Updates
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
X-List-Received-Date: Mon, 25 Jun 2012 21:26:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 25, 2012 at 8:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> =C2=A0 qemu-git: Move to tip of git
>> =C2=A0qemu_git: set empty PACKAGECONFIG
>
> I have said no to this until the patch set gets updated. It will just
> get ignored/forgotten about otherwise.
>

qemu git recipe as we have today is probably useless and its older
than 0.15 even and in any case set to D_P =3D "-1", forward porting
those gl patches is non trivial
intention of this recipe is to have support/fixes for machines that
had been since added and gl patches are x86 specific.

I feel its a unnecessary restriction you are imposing for a recipe
which is not used by default even.

-Khem


