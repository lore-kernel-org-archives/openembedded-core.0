Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
	[209.85.217.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5567BD72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 11:06:23 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id y16so895976vsc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 04:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/B/xv2y5R71LUisxrQRa6nA0BfZTq6AY2VKdVpejqtk=;
	b=aUSCd0qxASUcpARtEnbldu8OlQTWGQZ05/L3e297mVD9yemmajgp+GcIwtHPVe6/kH
	lLxWSZS6jR4HEzXqRLYiHKQnAzXKC3LKK5dGuu7MIhFCU2nlh5gY1VCSoLMKI7KHwJIz
	nkhioMEFPaKIPQxtC7RV5TUTOyzXCW20hySETZCVvx4bCdogRV/79ge+ByZOdB8GUKb8
	OGG2dI+ci3AwZCwSsQ3nxVtD4RYtzAyzPEXYOfg7xThxacjfHZtNS4qPTifux4l/OQJL
	NfwQqf6n8mccD4cCmmsYlDM05ZkjHXSYqlIW+4uDH6sv4GoU9HDVmQzUmxe7gaLzaWGq
	ru8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/B/xv2y5R71LUisxrQRa6nA0BfZTq6AY2VKdVpejqtk=;
	b=iYI0KhPCsqJoEKDBlbKvJPlP/JXFS0NHxLIHvT2fIN9S4rg8MaaeKUq/MbgPtBf9yk
	i/KpX6hsZ7zZCrUkSu88P6ZOnkl404pF32Kv2dQ7TqJHH9JzWe+fA7H3KSArrpxX97kI
	ecMGG9oO1ocM7Sh/ecDeu4slPeB+PMrtpNSpdfANHR6tKLSL/NhB9vjeW6Z9Ucrd5qjW
	YneQ3jF/be+NVDK2ld5PxEsQgi/NNw7fkuIv6SscL4h6+wyVr3ATGZS6W6BBAJtU35uQ
	X5naaMn79Ph+NgPmnkI7stD1KHx/vE7nO/A245udj0AYPOa8JStiuu61Wygv6dGxmCle
	AsFg==
X-Gm-Message-State: APjAAAWYAnGWCSmvL1MWT12tkxgMDlGZUo/vbaVPSZ0jlkK2TZ2DyDAm
	oJzriNDg9EzlJ3GYC1BoQQ7zqWYh3N+fZuXSHjA=
X-Google-Smtp-Source: APXvYqyW5B3Sk0N5psW/bjzNeoe0Zq+dk8s1gmhMdZDFzctxLmB2iQsdggNm4cp4Ks3SiQ0LfnaR0Koz8z2aWVJVFUE=
X-Received: by 2002:a67:fd66:: with SMTP id h6mr14080758vsa.83.1566212784018; 
	Mon, 19 Aug 2019 04:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190817153954.15805-1-otavio@ossystems.com.br>
	<CANNYZj-RD8zN7o7mX61MuATaO_7NSHY8DXAUR6TuU50M85r7Ag@mail.gmail.com>
	<CAP9ODKoaJt-TH7kg7oiqWTfB6r4gqhZdZezJCW69Zj_y=NpLtQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoaJt-TH7kg7oiqWTfB6r4gqhZdZezJCW69Zj_y=NpLtQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2019 13:06:12 +0200
Message-ID: <CANNYZj8WUO221KPbbnmehukcrNW8RBN9-y9-vJNtzkCFH6Z64g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: Upgrade 19.1.1 -> 19.1.4
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
X-List-Received-Date: Mon, 19 Aug 2019 11:06:23 -0000
Content-Type: multipart/alternative; boundary="000000000000a25ac1059076549b"

--000000000000a25ac1059076549b
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Aug 2019 at 20:49, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> I tried but couldn't figure out how to fix it and as I am not a meson
> expect, I preferred to rather revert it and succeed with the upgrade.
>
> Can you send a patch fixing it?
>

Can you try adding 'python3' to DEPENDS of mesa, and see if that helps
please?

Alex

--000000000000a25ac1059076549b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 17 Aug 2019 at 20:49, Otavio Salv=
ador &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvado=
r@ossystems.com.br</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">I tried but couldn&#39;t figur=
e out how to fix it and as I am not a meson<br>
expect, I preferred to rather revert it and succeed with the upgrade.<br>
<br>
Can you send a patch fixing it?<br></blockquote><div><br></div><div>Can you=
 try adding &#39;python3&#39; to DEPENDS of mesa, and see if that helps ple=
ase?</div><div><br></div><div>Alex<br></div></div></div>

--000000000000a25ac1059076549b--
