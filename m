Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id D35716BC92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:31:57 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id wo20so1853569obc.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 03:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=AxlUtfneCcRrSleS11jVDfEvp9w2a9VD1sZxiC/gCxU=;
	b=YGyXu9VBLNQubALizXAEjJWSuMEU8JFPupxQcZDuluXqKvlVXmwxu/pmSS6CkP4G4Q
	G2HC/KnfOMY6wwWUuPbSbFW4zqwsuUU3F9zhisxM3OxIrMkCio25sNaaSp7Kaybc0ydd
	+V9VYKRwZCCTgD2q4iMo+FMjSG/Q5JtyVo8aPQh68MADcDW9oSvW6H85oqVEtm29sagF
	SPyEGpGxOqImOOaVnoqzZWHr8VBYqDVYb9fv+f6ou0Y+hkHUMGVFk98gQJNx65M0XLRk
	xqyIBLEa5C88VhKAEKb02zgP4KSEv/LkzyKUULyPBMqe+575rL0kvF28TBovxBdX7cYB
	cGTg==
MIME-Version: 1.0
X-Received: by 10.60.98.40 with SMTP id ef8mr5389980oeb.13.1390476718926; Thu,
	23 Jan 2014 03:31:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 03:31:58 -0800 (PST)
In-Reply-To: <1390467988-25693-1-git-send-email-koen.kooi@linaro.org>
References: <1390467988-25693-1-git-send-email-koen.kooi@linaro.org>
Date: Thu, 23 Jan 2014 09:31:58 -0200
X-Google-Sender-Auth: x3tsjDkFzsH-ouIg9OH9psOhk60
Message-ID: <CAP9ODKoU+va9SbCJAfZ4HMkz+==Ec9va0KjJX07c4d4cZ90bjg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 23 Jan 2014 11:31:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 7:06 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> This failure was masked by having lz4 installed on the host system :(
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>

Couldn't it inherit autotools?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

