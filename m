Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UAQpG-0008Im-Sb
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 21:08:37 +0100
Received: by mail-oa0-f46.google.com with SMTP id k1so6030408oag.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 11:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Z9w8rKcAVb7qYKpkKDpku3EoUt2ImxRoHWsfIj5sMA0=;
	b=tL3TzDaAQ/VtvjSUhHb8ZVOZaIwrngZX08+BS8CgqivfBzEfTrAGuTdMI8x6sfXsNN
	GZc7nKPGM+0Lg6QbIGVKm5SXJeyYkkn6sI//3vc3t9FFsYV233jiriQo+Qj8WNPaCxh+
	DirtZTDkr3lsbVfgOKTPsBmIx/zHF91yV1i5+OXkfLKsrWzxAimC+Eilo/jkZ0hNlRDN
	+EMMh03OJNJFRefhVwM7QaCKGwSKqJm/AeFyGQaKm/YY0vNwGuHHVCvTmzIFhAtooZJq
	GsE9nnJMwy48HLUTtbeA2V6z8RDcNHG7VoG+YfvnnQNisKeP8OTSFYZ7JAFw3lyjV2CZ
	x3IA==
MIME-Version: 1.0
X-Received: by 10.182.157.104 with SMTP id wl8mr12725317obb.79.1361908334811; 
	Tue, 26 Feb 2013 11:52:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Tue, 26 Feb 2013 11:52:14 -0800 (PST)
In-Reply-To: <1361901233-23197-1-git-send-email-ross.burton@intel.com>
References: <1361901233-23197-1-git-send-email-ross.burton@intel.com>
Date: Tue, 26 Feb 2013 16:52:14 -0300
X-Google-Sender-Auth: tHNjH6MpbfkHjy65UZdGGIVzuro
Message-ID: <CAP9ODKqbNMMA1o0hjRiKn3Sen4F6uAU4kK8VhFK5RvdZixvCxA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] systemd: set the location of the kill binary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 20:08:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 2:53 PM, Ross Burton <ross.burton@intel.com> wrote:
> Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
> work on the target.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


