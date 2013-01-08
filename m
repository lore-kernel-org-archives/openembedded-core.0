Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TscGO-0004lP-0k
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 17:42:58 +0100
Received: by mail-vc0-f175.google.com with SMTP id fy7so566374vcb.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 08:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=YfDxaMfNYRaztRG10XMswbRHKcLMB6tXmVP7320EJTM=;
	b=PKSpuUa4rDleu1tmDna/Z56cb0UVS2XAJUMcnfUyVGKFd7C8Uyt5fqZZDYQRfebidF
	bclypG9/4nUX0RzXpxgrw2aR0zu5tCzl0/dXP99MiwEc3ntrdR8TXoteaT6wa7Q/4qrB
	xVWoCY3bEVXv1q79B5a6aY01KVZ+OjRmJxa1EuezhndV+FQxvyamDq/B/QgITRPY9r+I
	029uy+sz6u7R1k+wqX/E6WSDoIS2Kc2iShAT10vBz3b5tZnxEUzZJh3B3TUFp9OhD6YY
	dmpL541TuTjRRD88VN1O6oG2eoKFe9HhXpB+iiFsmzwl0R34Lst93Uh/nustV4OdaPEE
	Uo8Q==
Received: by 10.52.66.71 with SMTP id d7mr76005450vdt.121.1357662464699; Tue,
	08 Jan 2013 08:27:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.102.132 with HTTP; Tue, 8 Jan 2013 08:27:24 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <50EC29E9.7000500@windriver.com>
References: <50EB3FF4.60601@windriver.com>
	<CABcZAN=nVVoNxdu7tZKQ=uK5Q7jcCrhvFezX-YYpyWPZbTw9jg@mail.gmail.com>
	<50EBB80A.2090704@windriver.com> <50EC29E9.7000500@windriver.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 8 Jan 2013 18:27:24 +0200
Message-ID: <CAK18fxHUuzTMsBGVPZYYFnEcVwop78OHsqhqoT1V6jAYKVHdrg@mail.gmail.com>
To: Florin Sarbu <florin.sarbu@windriver.com>
X-Gm-Message-State: ALoCoQn2xnLCOmGPAr2+9ZnIyoZSKAe/wiaWo85/WT/YhLEwG5NTOU9PB4paIZzLqUknlTT3UESm
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: alsaconf and bash
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
X-List-Received-Date: Tue, 08 Jan 2013 16:42:59 -0000
Content-Type: multipart/alternative; boundary=20cf30781366eeedf904d2c96c76

--20cf30781366eeedf904d2c96c76
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 8, 2013 at 4:15 PM, Florin Sarbu <florin.sarbu@windriver.com>wrote:

>  Would you guys suggest we add bash as a dependency for alsa-utils?
>

Alsaconf is a bash script - obviously add a RDEPENDS to bash.

ag

--20cf30781366eeedf904d2c96c76
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr">On Tue, Jan 8, 2013 at 4:15 PM, Florin Sarbu <span dir="ltr">&lt;<a href="mailto:florin.sarbu@windriver.com" target="_blank">florin.sarbu@windriver.com</a>&gt;</span> wrote:<br><div class="gmail_extra"><div class="gmail_quote">

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
  
    
  
  <div bgcolor="#FFFFFF" text="#000000">
    <div>Would you guys suggest we add bash as a
      dependency for alsa-utils?</div></div></blockquote><div><br></div><div style>Alsaconf is a bash script - obviously add a RDEPENDS to bash.</div><div style><br></div><div style>ag</div></div></div></div>

--20cf30781366eeedf904d2c96c76--
