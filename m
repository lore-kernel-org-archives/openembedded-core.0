Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1STzLN-0005tc-CZ
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 19:46:01 +0200
Received: by werg55 with SMTP id g55so2295299wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 10:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=IBPvd79MLHIsoUWaDlXBkUDRsZHEt+F2r34wh37iq9Q=;
	b=XLO/sqgYCGJvjZWQF1rUYyYH3bCSCmYY5gm444R12SD8T+yUnFtUjT7XttO+cYjs4a
	bQUXeBcww+vl/IYkjSCm+VxK3dEkW2x5tlZWSSAwYFdbavufcjY2MvSfXplnJgJuKrWz
	VWSopLCEFNeDBcuFPiohdOD7+S3xVhTzf74F62ONrBcFs7eS011/iIkhZnmUrDCSCFKd
	++/7yc36HhRx41/WNOyyV3IIiBW5ujqiZWx3UGxu0J1iddiGE2tn2JZVRjf60XpI7rvw
	WUPJNIEqKrEMl3M/FUxRvxqXFcqUDdr0xrM4VZ7stpAAgr4bY235Gxh0QW5Ai8+myJTN
	p6Rw==
Received: by 10.180.109.197 with SMTP id hu5mr21934379wib.8.1337016962401;
	Mon, 14 May 2012 10:36:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.181.16 with HTTP; Mon, 14 May 2012 10:35:42 -0700 (PDT)
In-Reply-To: <CAF6bG8dzui=doFHHDoWGYXt45utcPwjY81QQRKrCbgHEpaMBQQ@mail.gmail.com>
References: <1337011770-24297-1-git-send-email-jason.wessel@windriver.com>
	<CAF6bG8dzui=doFHHDoWGYXt45utcPwjY81QQRKrCbgHEpaMBQQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 14 May 2012 10:35:42 -0700
X-Google-Sender-Auth: E2iM4LlIVYAcVuKZW7rXw-ZlFE4
Message-ID: <CABcZANkgp87rv_1HbHVSVjQZsYMpPmzGJ_kat1BDyvHhcHfMYQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] bitbake.conf: gracefully work with ccache environment variables
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
X-List-Received-Date: Mon, 14 May 2012 17:46:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2012 at 10:18 AM, Marko Lindqvist <cazfi74@gmail.com> wrote=
:
>> I'll send a patch just to add CCACHE_DIR to the BB_HASHBASE_WHITELIST.
>
> =C2=A0External cache makes sense for anything being built by system
> compiler. Caching results of anything produced by OE-built compilers
> to user's normal cache is problematic. Rebuild of the compiler itself
> will invalidate any such cached files, but caching them in first place
> may push more valid results out from the cache. So you are proposing
> that user has to opt-out from that behavior (by unsetting his normal
> CCACHE_DIR before running bitbake) and no longer opt-in (by adding
> CCACHE_DIR to whitelist)

Whether you like or don't like ccache is irrelevant. I personally
don't use it, but regardless, obviously CCACHE_DIR doesn't belong in
the shared state checksums, and CCACHE is the var you use to opt in vs
out of ccache usage.
--=20
Christopher Larson


