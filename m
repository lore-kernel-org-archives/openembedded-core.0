Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 87B7565DA3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 16:12:03 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 10so5570825ykt.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 08:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=3/xIX9cbqgTIsL4XcDwdrjrzGT4PMNC9vAK8wk50M7Q=;
	b=jnDJTnUKj1Qo8Uiz8/1l1S8LaZS8yVyO8dNW6krEh5o04GJcFbpTDyjYicIMQbz2Jp
	WYydRDnrf0NUu8Q9WUtG6krs6DXLz/nIEmOpP+rrBpJMWa1NirWzEp4vN0UgeiVnBV8Q
	BYX/kVy2aJImzm2zvnezTtKqiQM/jGuaDEF6K4AnUCaFgLSgEnhQrdJd/r5hm0eloC98
	1xFMki7C3v/1p4b1PDz8qeBQMRir/7s7Z5uFM5zV5UrB8NWpObL3jvdsg3jIO50U1lew
	5gvmlcYDVIQQeh7Qwmau8ZeyACoZtBo1U5qqxb7BV3lo3NzHL8/ziZfmjQ+xGPelZ8aw
	Hdnw==
MIME-Version: 1.0
X-Received: by 10.170.160.9 with SMTP id b9mr4355579ykd.50.1415895123543; Thu,
	13 Nov 2014 08:12:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Thu, 13 Nov 2014 08:12:03 -0800 (PST)
In-Reply-To: <1415893736-52092-1-git-send-email-javier.viguera@digi.com>
References: <1415893736-52092-1-git-send-email-javier.viguera@digi.com>
Date: Thu, 13 Nov 2014 14:12:03 -0200
X-Google-Sender-Auth: G5xtmfC7GGuJanUJYZKWth4cz_Y
Message-ID: <CAP9ODKr_-OqyrjKhq=xiTmUrut8zT3tUx=HSHgLbEt0J_T4ygw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Javier Viguera <javier.viguera@digi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][dizzy][PATCH] shadow-securetty: add ttyAM[0-3] serial ports
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
X-List-Received-Date: Thu, 13 Nov 2014 16:12:09 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 13, 2014 at 1:48 PM, Javier Viguera <javier.viguera@digi.com> wrote:
> Old version of the ARM AMBA serial port driver creates those device nodes.
>
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

