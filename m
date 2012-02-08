Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Ruz3m-0005oO-Ey
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:23:10 +0100
Received: by qadz30 with SMTP id z30so3555941qad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 20:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ikIEq1hSkBSdANPXCajA9LOGev7Jl6+sqHsOiw8+SFA=;
	b=amdSVwOW70MSCT04J9ctdt9oWUFJ9rdn8bu6/GL7o9BsNxeMeHoPI+YmooQR50BjF9
	L6CyihkO7LHpu/Ww7xSgewYo10hW+G1WWnAlHwtmmdA0btzOUBd8ECmKnOnIFqJfKVi6
	RyVjjQ04xwQKJq83Qv9f2opPUi6Abc5lkUnbw=
Received: by 10.229.75.138 with SMTP id y10mr10553883qcj.110.1328674507239;
	Tue, 07 Feb 2012 20:15:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.33.68 with HTTP; Tue, 7 Feb 2012 20:14:47 -0800 (PST)
In-Reply-To: <cover.1328674343.git.chris_larson@mentor.com>
References: <cover.1328674343.git.chris_larson@mentor.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 7 Feb 2012 21:14:47 -0700
Message-ID: <CABcZANn9r1q-qMdqrC6FFoqhDFBGNtxQuQ-0qsYksnx4S3iinw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/2] Resolve parsing hang issues
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
X-List-Received-Date: Wed, 08 Feb 2012 04:23:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Bah, sent to the wrong list. Hate when I do that.

On Tue, Feb 7, 2012 at 9:13 PM, Christopher Larson <kergoth@gmail.com> wrot=
e:
> From: Christopher Larson <chris_larson@mentor.com>
>
> *** BLURB HERE ***
> The following changes since commit db689a99beffea1a285cdfc74a58fe73f16669=
87:
>
> =C2=A0Revert the switch to futures for now (2012-02-03 08:12:56 -0700)
>
> are available in the git repository at:
> =C2=A0git://github.com/kergoth/bitbake.git hang-issue-fix
> =C2=A0https://github.com/kergoth/bitbake/tree/hang-issue-fix
>
> Christopher Larson (2):
> =C2=A0cooker: roll our own process pool
> =C2=A0knotty: shut down more cleanly
>
> =C2=A0lib/bb/cooker.py =C2=A0 =C2=A0| =C2=A0155 +++++++++++++++++++++++++=
+++++++++++++++++---------
> =C2=A0lib/bb/ui/knotty.py | =C2=A0 15 ++---
> =C2=A02 files changed, 136 insertions(+), 34 deletions(-)
>
> --
> 1.7.7
>
--=20
Christopher Larson


