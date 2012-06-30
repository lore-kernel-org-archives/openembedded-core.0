Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sl6fb-00067t-7J
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Jul 2012 01:01:39 +0200
Received: by eaal1 with SMTP id l1so1711949eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2012 15:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=itWnFDkL04fsy5LfZzPBQH/G6ZAMYPl5GHBrGN1F2tQ=;
	b=ze4cOuj5SDYgsDecowTv3xgj8PKO46CZvD6pSP9ltolDGzPl9tm1Lhe/Fs+9vtatmS
	agI63rI+IrLj7bAckJ4Jq028I19fIT4NlzWbGNBcFmb4Ego8q9furEqwoUpcymyUlNAN
	Pag8Igp7suYstci9fiwCr3zYZHwH6CMGVDy7tsd8cca9zIM/0qGRNGoECzdhe80GCp4z
	H76DMkEPyFWATm8kCnkPRBF78g9dcRScDlH47JBrdnQhTQL5LegR12JvgeveIpb5MBfm
	f5UQpMRT69+yyvinPBfGbm3jaxp2p4cTk0Rh2b5q6EYT0G17SFHmk4eyczLho1X3ktZo
	8/FQ==
Received: by 10.14.37.76 with SMTP id x52mr1903004eea.102.1341096640827; Sat,
	30 Jun 2012 15:50:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Sat, 30 Jun 2012 15:50:10 -0700 (PDT)
In-Reply-To: <cover.1341090544.git.paul.eggleton@linux.intel.com>
References: <cover.1341090544.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Jun 2012 15:50:10 -0700
Message-ID: <CAMKF1spg1BYBkM=txx22jKsGsqkJ9_j0D_esE7qwm6M8YfH3BQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] apr fixes v2
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
X-List-Received-Date: Sat, 30 Jun 2012 23:01:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 30, 2012 at 2:11 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Since v1, rebase on latest master (removing now merged patch to add
> libtool) and use site file to set pid_t type.
>
>

thanks for second iteration. Looks good now

> The following changes since commit 54429dfcca0e35a3aeaa78e509240b87d6a8f4=
ac:
>
> =C2=A0mklibs-native: Upgrade to 0.1.34 (2012-06-29 13:21:19 +0100)
>
> are available in the git repository at:
>
> =C2=A0git://git.openembedded.org/openembedded-core-contrib paule/apr-fixe=
s
> =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log=
/?h=3Dpaule/apr-fixes
>
> Paul Eggleton (2):
> =C2=A0apr: add util-linux to DEPENDS for libuuid
> =C2=A0site/common-linux: fix incorrect size of pid_t for apr
>
> =C2=A0meta/recipes-support/apr/apr_1.4.6.bb | =C2=A0 =C2=A03 ++-
> =C2=A0meta/site/common-linux =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A02 files changed, 3 insertions(+), 1 deletion(-)
>
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


