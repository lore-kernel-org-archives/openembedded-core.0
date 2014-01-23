Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 66E146C742
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:36:08 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wm4so1864216obc.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 03:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=U9DzP8/R/pUK2XkeSr8S2x+papjnL+vEaW0vn/JyKTc=;
	b=VEfHVGf36OzFSCyx3iQ6U8gOmiyBa8I04lPC4WXDN3XHZ2w831zZxz9PVzhBCPgTA4
	g+chzeIcvwdYzWueuPlcAcrE3Kf+VfA53u0CjVXGc86owYS1HlndUJOKvmJ0YQPcFWCV
	YMXIppeRBxIpgyXV2RYGOf0xtyUK0aKQ9vBynyvaF5jZ5azFmHptRkq5LaPpE+/utR9P
	KIjEUbwk98BWhamn79nKQXyc0GUQ+qHd9jn58K/VswoWPgSP+X/YRKtNT8WoMKsI0Lzc
	cZHMhaAhGULerPq0A/zDeusRSmA+SQ7Nr3SfARgYrEWUiP4L2MmarXF5qrL3FfcWRgOM
	KZyQ==
MIME-Version: 1.0
X-Received: by 10.182.250.163 with SMTP id zd3mr6429312obc.20.1390476969476;
	Thu, 23 Jan 2014 03:36:09 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 03:36:09 -0800 (PST)
In-Reply-To: <17C27E68-3F62-414D-A02A-8AD06ACE0B66@dominion.thruhere.net>
References: <1390467988-25693-1-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKoU+va9SbCJAfZ4HMkz+==Ec9va0KjJX07c4d4cZ90bjg@mail.gmail.com>
	<17C27E68-3F62-414D-A02A-8AD06ACE0B66@dominion.thruhere.net>
Date: Thu, 23 Jan 2014 09:36:09 -0200
X-Google-Sender-Auth: MzS1ABA9ru0Uy-EqKg6Qsjcp_5w
Message-ID: <CAP9ODKrUBJJJHTTBkRmq9j+yOrgGyUfX3TC5L69-ynaDbefo0A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: actually install things
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
X-List-Received-Date: Thu, 23 Jan 2014 11:36:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 9:35 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 23 jan. 2014, om 12:31 heeft Otavio Salvador <otavio@ossystems.com.br> het volgende geschreven:
>
>> On Thu, Jan 23, 2014 at 7:06 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
>>> This failure was masked by having lz4 installed on the host system :(
>>>
>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>
>> Couldn't it inherit autotools?
>
> It's a handcrafted Makefile, not autotools :(

No problem, it works as well.

The do_configure checks for configure.ac/configure.in and it avoid you
to handcraft do_install and like.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

