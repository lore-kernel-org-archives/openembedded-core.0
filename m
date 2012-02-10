Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rvxjl-0000YB-Tz
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 22:10:34 +0100
Received: by lahc1 with SMTP id c1so2862621lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 13:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=iEPqq/nwe4pj38hJYj9AR579XNALmksv1cCR/y9Yes8=;
	b=WPKAfsW395ezgBUZIK960yehcyjJpY3gUrmzhwZDgBDY9W0B36amMUnc+f365WBtRR
	HFpH8558o3JntcKg/enO44ZRB+kq0hHIR8srpPjp6qSHQOWgM9LV24dZM34GEEq02RrR
	1n0nhNFrHQ/g/95aLyzQ1oViw1of1wqI1BNSE=
Received: by 10.152.123.68 with SMTP id ly4mr5166149lab.13.1328907747628; Fri,
	10 Feb 2012 13:02:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Fri, 10 Feb 2012 13:01:56 -0800 (PST)
In-Reply-To: <1328862631-30998-1-git-send-email-sgw@linux.intel.com>
References: <1328862631-30998-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Feb 2012 13:01:56 -0800
Message-ID: <CAMKF1srORv1Wjoo3AzwGpkUuPWky6wxKSWSdSvbD_WoQPwq+0w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: Update checksum, fix configure and compliation issues
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
X-List-Received-Date: Fri, 10 Feb 2012 21:10:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2012 at 12:30 AM, Saul Wold <sgw@linux.intel.com> wrote:
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +
> +Index: gnupg-1.4.7/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnupg-1.4.7.orig/configure.ac
> ++++ gnupg-1.4.7/configure.ac
> +@@ -827,7 +827,6 @@ else
> + =C2=A0 AC_SUBST(USE_NLS)
> + =C2=A0 AC_SUBST(USE_INCLUDED_LIBINTL)
> + =C2=A0 AC_SUBST(BUILD_INCLUDED_LIBINTL)
> +- =C2=A0AM_PO_SUBDIRS
> + fi
> +

could you describe the error ?


