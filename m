Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id EA542732DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 18:26:01 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 131so10890511ykp.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 10:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=8MLtQg3rAWPrK8NZviqpLT0Sv7i7ktgTPvFB01HB7z4=;
	b=BQHa/91tOPUYVegeH49G+rxnukbD/bYyJe5XRPP6k+3X+O5WkH8FJ4RDZF5wW5MONv
	/NOKQNzJgCLBkgG4BJ5PRUaJPqlFYsyoTK5DHfB2/dL+Q+xkEITzlNAj42OUGUZZLvfg
	cZSH7WMR56Korwm96puXtsjRdych7AMUXFyfrQL+uADnO7g0HiP/Vb2X3QQ4pNa30uPp
	C9KqiAyDIe9GWDY/gOLn3zy5dn5M+Z9igI3u/Gs+ZiEhx+e8D0dIDoWNIIc82+pcN3KC
	Nl1INqJsmtGonbgb6d+wL5OuQopO7XvoPNJsQCWZzNnPDweARQz2sIrcOOPDeYnTzLlv
	67ZA==
MIME-Version: 1.0
X-Received: by 10.170.162.135 with SMTP id e129mr10923510ykd.110.1423592762503;
	Tue, 10 Feb 2015 10:26:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Tue, 10 Feb 2015 10:26:02 -0800 (PST)
In-Reply-To: <c888dbe63fda7e3d0923f7660f7321bf906cb054.1423588562.git.anibal.limon@linux.intel.com>
References: <cover.1423588562.git.anibal.limon@linux.intel.com>
	<c888dbe63fda7e3d0923f7660f7321bf906cb054.1423588562.git.anibal.limon@linux.intel.com>
Date: Tue, 10 Feb 2015 16:26:02 -0200
X-Google-Sender-Auth: nMCxLGHey0RnRjtMgNXFOpOp3p0
Message-ID: <CAP9ODKpc1un53bh9e3ETU9ng8W_7CTc3kJ-HanamEK-1T5nyCg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] xserver-xorg: Update to 1.16.3
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
X-List-Received-Date: Tue, 10 Feb 2015 18:26:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2015 at 3:17 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> Add packageconfig for systemd-logind instead of hard disable in
> EXTRA_OECONF this allows users to use packageconfig also add
> dependency of dbus because systemd-logind require it for communicate
> with systemd.
>
> Update checksums.
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>

Please split  the update and config changes. Those are two clearly
separated things.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

