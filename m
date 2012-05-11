Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SSqlx-0001at-E4
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 16:24:45 +0200
Received: by wgbdr1 with SMTP id dr1so2387475wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 07:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=qBX439OFu5q0qZP68fuq5kCQM+gmYmfM8j6bH0E8KZI=;
	b=ceWoZwzrB8CgqzWT3/J8tO4wtUnSVHW9qOEOAyffB86WxZ7lWOtRiSB1xJboOHR/n2
	h0HI/NHHSe5DCAYUxy93a2ORQzAdFajNmcDVgtBVyO0812yG+lxWnLXANQu+ssBWEiYi
	Ls92b+0PSw9L3Yb0AUYrzLu2/9toSRz3EKlF6pIH1cL+N/0LmnKfTMX/097rmArbawG7
	oS/xypN4naHIiUvGtIrYMtow2/t3RnvMk+Ydftfma80Qq652RkD3LX9DRXn+oAZCHBJL
	sbAkuDiwICayQFKwH7DROvLEGH1pHXwGA1ciVf6pUmSiLeLLe8rxkCWrLM8qx2McNkUO
	JX7Q==
Received: by 10.180.104.137 with SMTP id ge9mr1504248wib.20.1336745690165;
	Fri, 11 May 2012 07:14:50 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.181.16 with HTTP; Fri, 11 May 2012 07:14:29 -0700 (PDT)
In-Reply-To: <cc7ee9609296b3a90147287817a0043da45b0c64.1336727342.git.xiaofeng.yan@windriver.com>
References: <cover.1336727342.git.xiaofeng.yan@windriver.com>
	<cc7ee9609296b3a90147287817a0043da45b0c64.1336727342.git.xiaofeng.yan@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 11 May 2012 07:14:29 -0700
X-Google-Sender-Auth: mxgCqmqwSYM5OL44Lad-JrMWab8
Message-ID: <CABcZANkNAkmLA72kaa=Dv0YExnji__tOJ16moRhDGRmfi0NaVw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] archiver.bbclass: Add default set
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
X-List-Received-Date: Fri, 11 May 2012 14:24:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2012 at 3:13 AM,  <xiaofeng.yan@windriver.com> wrote:
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
> index 59b58f4..a720db2 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -6,6 +6,10 @@ ARCHIVE_EXCLUDE_FROM ?=3D ".pc autom4te.cache"
> =C2=A0ARCHIVE_TYPE ?=3D "TAR SRPM"
> =C2=A0DISTRO ?=3D "poky"
> =C2=A0PATCHES_ARCHIVE_WITH_SERIES =3D 'TRUE'
> +SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?=3D 'logs_with_scripts'
> +SOURCE_ARCHIVE_PACKAGE_TYPE ?=3D 'tar'
> +export SOURCE_ARCHIVE_LOG_WITH_SCRIPTS
> +export SOURCE_ARCHIVE_PACKAGE_TYPE

I don't think you understand what 'export' does or why it exists.
Please fix that, and remove these lines. Thanks.
--=20
Christopher Larson


