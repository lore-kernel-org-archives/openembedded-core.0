Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 613AC710EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 09:12:12 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id hq12so5175728vcb.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 01:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=i1TmPo8KpqZeumOf6pTu2eaCWLv3iZu2vxoOSyb5MOg=;
	b=azISPGW9JlfuQCJiB/yCTYmeTxtr78tvrs9tHJYC6aprY56ygv28YiBd4dhruT04mc
	MQ0cTPNQPpiq8me4zMeCP+7NreQ/fjuHUlRLhbx5g8+Zu55gf7Rbgg0Ff3y3pw/29FdU
	SJqS0gYBLGlg9wyY0yAoQlC1LA2x3GkQj3xT+e0DcHb93UIHurIDFmNLt7QfugHKS9s1
	2wHatvSUpRkXZzIJiMwcK9Wdx07Tvk/RnuGFIe3xOGxjd8Vg4YG/41vzEeEcWRU1Aj7m
	z82Qhh4kENlesHUmpeD29WrK4h+VeEWEZMhSZsE4E8476zT/K/pBk6nHMPECN8bmAu3H
	lrpg==
MIME-Version: 1.0
X-Received: by 10.220.205.2 with SMTP id fo2mr18946059vcb.8.1418634733091;
	Mon, 15 Dec 2014 01:12:13 -0800 (PST)
Received: by 10.52.237.165 with HTTP; Mon, 15 Dec 2014 01:12:13 -0800 (PST)
In-Reply-To: <1417610456-788-1-git-send-email-schnitzeltony@googlemail.com>
References: <1417610456-788-1-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 15 Dec 2014 10:12:13 +0100
Message-ID: <CALbNGRTv-=z03aXhJBcQp3iUi3py+GfwVY+cTQ6+8RW+St56ZQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2 1/3] pythonnative: set PYTHON_EXECUTABLE so that cmake can find it
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
X-List-Received-Date: Mon, 15 Dec 2014 09:12:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2014 at 1:40 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> | CMake Error at /home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/=
usr/share/cmake-2.8/Modules/FindPackageHandleStandardArgs.cmake:108 (messag=
e):
> |   Could NOT find PythonInterp (missing: PYTHON_EXECUTABLE)
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/classes/pythonnative.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnativ=
e.bbclass
> index fdd22bb..9fccee9 100644
> --- a/meta/classes/pythonnative.bbclass
> +++ b/meta/classes/pythonnative.bbclass
> @@ -2,5 +2,6 @@
>  inherit python-dir
>
>  PYTHON=3D"${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
> +PYTHON_EXECUTABLE=3D"${PYTHON}"
>  EXTRANATIVEPATH +=3D "${PYTHON_PN}-native"
>  DEPENDS +=3D " ${PYTHON_PN}-native "
> --
> 1.8.3.1
>
ping

