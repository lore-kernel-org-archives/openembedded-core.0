Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RDAD0-0000bh-9S
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 09:23:34 +0200
Received: by iadx2 with SMTP id x2so7552315iad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 00:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=dZrQnAGVVydfUC7wfvci4jKJ4dBi2KYDcfOuPwiNxeM=;
	b=YSrNHuxTB9JQzy2uZzBe1uDhF5zknUf7HIHwbrx7PX56JQOCh80YNc20vmIp46vXNQ
	rSEIwGNhAKRowwvl1EPO/ykf//dUQjYneG69c2v+24qLBI7bNwzvs3YXM11auJUGtYDH
	fiPZkf0j4JevXl2qqeW7culCqTpT7ZIu/uE1Y=
MIME-Version: 1.0
Received: by 10.42.244.137 with SMTP id lq9mr14599183icb.28.1318231072873;
	Mon, 10 Oct 2011 00:17:52 -0700 (PDT)
Received: by 10.42.226.10 with HTTP; Mon, 10 Oct 2011 00:17:52 -0700 (PDT)
In-Reply-To: <702d65b93492008812ac8778fc010f30e904383e.1318021323.git.kergoth@gmail.com>
References: <cover.1318021323.git.kergoth@gmail.com>
	<702d65b93492008812ac8778fc010f30e904383e.1318021323.git.kergoth@gmail.com>
Date: Mon, 10 Oct 2011 09:17:52 +0200
Message-ID: <CAGiJk9ceiROvLEL-FsT2kLR50rG16xCDo-__cRyqryfSAO0AOQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] oe.patch: drop bb.msg.domain reference
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
X-List-Received-Date: Mon, 10 Oct 2011 07:23:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
there was already a patch for this [1] (Yes I know, I should have
added more descriptions), according to the patch from Richard [2] the
message domain can be constructed dynamical now.
Since your patch seems a little bit different (dropping the message
domain completely) I can't tell if my resolution was inadequate.

For this patch I think it wouldn't make a big difference for the user,
feel free to apply the one that best suits in resolving the problem.


[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/0=
09474.html
[2] http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Da6c48298b17e6a58=
44b3638b422fe226e3b67b89

2011/10/7 Christopher Larson <kergoth@gmail.com>:
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
> =A0meta/lib/oe/patch.py | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 1406e19..9b0ff37 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -376,8 +376,8 @@ class UserResolver(Resolver):
> =A0 =A0 =A0 =A0 =A0 =A0 os.environ['SHELLCMDS'] =3D "bash --rcfile " + rc=
file
> =A0 =A0 =A0 =A0 =A0 =A0 rc =3D os.system(bb.data.getVar('TERMCMDRUN', sel=
f.patchset.d, 1))
> =A0 =A0 =A0 =A0 =A0 =A0 if os.WIFEXITED(rc) and os.WEXITSTATUS(rc) !=3D 0=
:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.msg.fatal(bb.msg.domain.Build, ("Cann=
ot proceed with manual patch resolution - '%s' not found. " \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+ "Check TERMCMDRUN variable.") =
% bb.data.getVar('TERMCMDRUN', self.patchset.d, 1))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.fatal(("Cannot proceed with manual pa=
tch resolution - '%s' not found. "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+ "Check TERMCMDRUN =
variable.") % bb.data.getVar('TERMCMDRUN', self.patchset.d, 1))
>
> =A0 =A0 =A0 =A0 =A0 =A0 # Construct a new PatchSet after the user's chang=
es, compare the
> =A0 =A0 =A0 =A0 =A0 =A0 # sets, checking patches for modifications, and d=
oing a remote
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Regards
Samuel


