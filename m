Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id D8C1971F4C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 23:19:03 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id dc16so6045863qab.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 16:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bQ6YLOmMTspdAX2GUEHIdVZMPn7BXS9joefF2zZrojU=;
	b=UKvlnkqtJ+rbKOiZFkDhjmXLudXxYHWC+YreEH6kcW20/ZDz48sPyQaLnE/ssA5CMn
	z/ChcuI4MuOW0HgqfuyUQNnrrUNFWy414ReejMTXpnTjIGmkZrDU9DmLl76eraXohYIx
	2KObNTz1uMXNVUUX8j46kDQDJI7tmhD3I44vPc68aaGuFsNmGWBR2mpWeQSP4rJ69/UT
	UE6/iVFHU7F7Q3bcFwGivvJudvRWxUSHCcuesu3FLPa8i5fiqA3aVS4T+dEDETRx1KhG
	GZPZOAHVL7FUx1U3siGNYbDd7cG3cdLJVt9kUUAfnSyv1sXU/WkQypkfSbX3kJ5X4047
	fYcg==
X-Gm-Message-State: ALoCoQmZ3p+EF4gHHYycvtO/9cMFfcLKzpFt5NuoINNooJnO/BLjNnwuEFw/ESqLoVl3tIYZPGcc
X-Received: by 10.140.17.67 with SMTP id 61mr39263334qgc.59.1414797543534;
	Fri, 31 Oct 2014 16:19:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 31 Oct 2014 16:18:43 -0700 (PDT)
In-Reply-To: <1414687599-36822-1-git-send-email-alexandra.safta@enea.com>
References: <1414687599-36822-1-git-send-email-alexandra.safta@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Oct 2014 23:18:43 +0000
Message-ID: <CAJTo0LbneXWPk67XSZMJGiFhM8WGQOZE_nP5i4apOL7rDi_xfQ@mail.gmail.com>
To: Alexandra Safta <alexandra.safta@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Valgrind: Remove test apps not building with ppc64 and PTEST
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
X-List-Received-Date: Fri, 31 Oct 2014 23:19:08 -0000
Content-Type: multipart/alternative; boundary=001a11c0fa28030dcd0506c03928

--001a11c0fa28030dcd0506c03928
Content-Type: text/plain; charset=UTF-8

On 30 October 2014 16:46, Alexandra Safta <alexandra.safta@enea.com> wrote:

>  .../valgrind/remove-ppc64-tests-failing-build.patch      | 16
> ++++++++++++++++
>  meta/recipes-devtools/valgrind/valgrind_3.9.0.bb         |  3 ++-
>

This patch doesn't apply to master, please rebase and re-test.

Ross

--001a11c0fa28030dcd0506c03928
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 October 2014 16:46, Alexandra Safta <span dir=3D"ltr">&lt;<a href=3D"=
mailto:alexandra.safta@enea.com" target=3D"_blank">alexandra.safta@enea.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":15l" c=
lass=3D"a3s" style=3D"overflow:hidden">=C2=A0.../valgrind/remove-ppc64-test=
s-failing-build.patch=C2=A0 =C2=A0 =C2=A0 | 16 ++++++++++++++++<br>
=C2=A0meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.9.0.bb" t=
arget=3D"_blank">valgrind_3.9.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 ++-<br></div></blockquote></div><br>This patch doesn&#39;t apply t=
o master, please rebase and re-test.</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--001a11c0fa28030dcd0506c03928--
