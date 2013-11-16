Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id F28246DA11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2013 00:26:34 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id uy5so4617334obc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 16:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=l5DkkTwcm3JFdieVvmlPjIuh0wUTkYMh/zHJu5XwA0s=;
	b=ftwRviL4+CcmtI+mDuzLDvJBk4q115Diu9moNz5cZWHUk5OZNsda81GobLWTR45c1Y
	uVjwoZBu6xUCenIFxcmLq9T8/qFU/owsWpdedYqkduk5zpiFRd0ILilHC7kChT8wUrlc
	xJL+CecjdJclWDLyT2MXd5RYk93TcE9QENOHeFZGTe897TSz0ufYwRRXNjQrzdvg5aZF
	3fzH8Z0pt4dtH0fF0o5smPsv3zSfEX+pT44aiDzqa5VDP5R4UgzY7/Dq3F8yPWQYwEH4
	4HhAaTb5UrCquubBCgckqlQR2b7PK7dEfX1gS9bmW0ldDR+Dj9+3UzF0N5WSVneoEnMn
	64Hw==
MIME-Version: 1.0
X-Received: by 10.60.115.164 with SMTP id jp4mr9367539oeb.19.1384561596411;
	Fri, 15 Nov 2013 16:26:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 15 Nov 2013 16:26:36 -0800 (PST)
In-Reply-To: <1384559680-28033-1-git-send-email-ross.burton@intel.com>
References: <1384559680-28033-1-git-send-email-ross.burton@intel.com>
Date: Fri, 15 Nov 2013 22:26:36 -0200
X-Google-Sender-Auth: OIcOtoNK3VA1M1Ohq-vE6fNIycA
Message-ID: <CAP9ODKo1kQoT4LeP-spHHtb1NUSmx6ujswohvdpJT0EgbA9M6w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: remove reference to gles in PACKAGECONFIG
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
X-List-Received-Date: Sat, 16 Nov 2013 00:26:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 15, 2013 at 9:54 PM, Ross Burton <ross.burton@intel.com> wrote:
> The "gles" configuration was removed in the upgrade to 1.3.0, and it was enabled
> only if the unknown/rare opengles2 DISTRO_FEATURE was enabled.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Please don't remove this. We depend on this for use in meta-fsl-arm :)

Cairo should be fixed to bring it back :D

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

