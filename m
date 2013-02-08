Received: from mail-ia0-f174.google.com ([209.85.210.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U3m13-0004qV-00
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 12:21:16 +0100
Received: by mail-ia0-f174.google.com with SMTP id o25so3993447iad.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 03:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=1c7KeCBhQpAuC1GH1FJywFzdlaHpmJKmzZJRUz+500E=;
	b=iKLtZvVNSpIIYx0dU6Jxqv62Wov3SWPJeTF+QEZg5DxRMraRZ0BEf+slkK3h0PWmx0
	T5x9YuRufi8lp0FN5s9ckHixBr5xarIr9Xg1P+68S0RTHddr2ptd2D7PjXIoXaixyyi5
	YZpZRo1MRVZxTC8EQ4lFZO9qXwFpBA8oH9cB7dmgVAL4kUIZ2yMSDXeD4I6kkTibaUf/
	SPFXqC8brvLZ4jGHs7EAWsKiKWXJ6EMsUgiQ+gGAk93fnjRivxQRdkTQTiwyi9NNKS4X
	h/JHjhwityik+kf6mE/tlV3msayiwTQqwyIB968g1/MmlcpVxEXjv4u9O7ZzpouooLvo
	3Pcw==
MIME-Version: 1.0
X-Received: by 10.50.222.201 with SMTP id qo9mr1311485igc.111.1360321518837;
	Fri, 08 Feb 2013 03:05:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.64.10.105 with HTTP; Fri, 8 Feb 2013 03:05:18 -0800 (PST)
In-Reply-To: <5112D7D3.6020304@felipetonello.com>
References: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
	<51115E97.1080404@linux.intel.com>
	<511182A9.2060702@felipetonello.com>
	<0CB2DDB0E2D34358AAD3481B8F78E9F1@intel.com>
	<5112D7D3.6020304@felipetonello.com>
Date: Fri, 8 Feb 2013 09:05:18 -0200
X-Google-Sender-Auth: lrS9fDL954-rDyUD8NeF1dzD458
Message-ID: <CAP9ODKrBmqnOgRH0FhvuEvS-narJuQA_RLOLfBjjOsSPZa07ig@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Felipe Ferreri Tonello <eu@felipetonello.com>
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Fri, 08 Feb 2013 11:21:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 6, 2013 at 8:23 PM, Felipe Ferreri Tonello
<eu@felipetonello.com> wrote:
> On 02/05/2013 02:58 PM, Ross Burton wrote:
>>
>> On Tuesday, 5 February 2013 at 22:07, Felipe Ferreri Tonello wrote:
>>>
>>> I chose this path because there is also a front-end library for connman
>>> for gnome in the same directory.
>>
>>
>> It's not a library, it's a UI.  To be honest, I'd happily see it move to
>> recipes-gnome and connman-qt be in recipes-qt.
>>
>
> So what was decided? Should I re-send the patch with what path?

Until something inside OE-Core uses it I would prefer it in meta-oe. Ross?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


