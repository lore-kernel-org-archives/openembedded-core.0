Received: from mail-ob0-f171.google.com ([209.85.214.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPJtq-0002jr-8r
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 23:46:53 +0200
Received: by mail-ob0-f171.google.com with SMTP id v19so3136673obq.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 14:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=+jfqqEqT+KxOr31/An+gr9xZufGQUOO0l0YlwQ6HG/Y=;
	b=IWJ9ut3iziMRliAiWfL82D+h9KT570CAAtaDMTgIbWL7ZLPWX3qAqbXCSdTQF+3iOQ
	kv/LFfl5xgOwfNTTKeM/TO9dImAlfXc6TadFPC+Q4bgRGIM9FYXhFvSG2COfhpQz610c
	Xgy0NlDZzun1gj8WjnHpYm3c+upEl4i71+za0JfEb/StBZVGl1+mB3DmHrrIir+rme2b
	j/WND567H/NzvjNketWBCW5jBmZ56fYyB1DR7TZXmMX9rLuhcct/pbGcdO/qXCPc8U5l
	Fi9V+JJSfIKDh1A9R327bj5gR9bCxKs+oWMRDEV9AvBulFunOz8z4qASWVIsTXuoGlu+
	acHg==
MIME-Version: 1.0
X-Received: by 10.60.63.73 with SMTP id e9mr16606748oes.87.1365456570692; Mon,
	08 Apr 2013 14:29:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Mon, 8 Apr 2013 14:29:30 -0700 (PDT)
In-Reply-To: <1365454686-951-1-git-send-email-otavio@ossystems.com.br>
References: <1365454686-951-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 8 Apr 2013 18:29:30 -0300
X-Google-Sender-Auth: _ZM0w-7b9W1ttSZxINJ5L4GcQUY
Message-ID: <CAP9ODKo+xmN1X4DMUX7v2Q+P=W6ON8j17a6XFBrzYiQ7aN1txw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v3] base.bbclass: Fix matching of MACHINEOVERRIDES in COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 08 Apr 2013 21:46:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 8, 2013 at 5:58 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> When a MACHINEOVERRIDES has more than one value, split by ':' as usual
> OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
> matching as we need to iterate over each SoC family and check if it is
> compatible or not.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
...
> +            compat_machines.extend((d.getVar('MACHINEOVERRIDES', True) or "").split(":"))
...

I did run it and it fails. I am fixing it and will send a new  version
well tested.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


