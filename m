Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id ABA1D6A441
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 10:37:37 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id b1so1200405otp.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 03:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oztxYyfWIcW0EAp2JK6tVppYjmepwLAjrtP0KCN8A58=;
	b=RyzYSU7COrrTN/mtQMkdV2PboqrSn3kYVvjfI5qPwHhiBh7v5ZohpvZD59qz4isQNU
	4EGwBS/7z9N0USf8fKV+Cq7LRHrH9jv5TzKBeJyvLDKu9K+Rlq9vLkODkKEnHnpoyfnd
	VlpM1dd2k5EYCIIsIXNS7fdTk7+HBHCAFNmnuE8nKNrHv/Z5KCG9AujSy9BrbIypEijN
	PfckP6rvVdkbX9je5cbB6B2zvJ+J9IZXVU734KIKANl0X1EM4TeUlIVAZ1zrFKfb2RLo
	BBjlXuOtRv6dM8Kla3YxBi0IshvElENGRiCt1k6AkdQslOV9diuH7vmO5GWN1tnkND8R
	zbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oztxYyfWIcW0EAp2JK6tVppYjmepwLAjrtP0KCN8A58=;
	b=n1GSRFvjnKetyKDE64AYw0bbb2EcLA7OTysn/Wg0EwKxaEJ545CHjTWzS/kVxTws4n
	oRqAvDtXE5P6KCpED/N22ZHzwENjdxJXAB3dEfNfHaZt0AJ26j4IK4aAN+or/9M1mxLS
	yqplTLLtrYgO/ihuCzBJu05N0/ZIMDNj4y9aS7kdRpJMy1bqYqXn8tQ8aEUEIV9nKi4P
	WCwWS3EVLETGcHfQjeJcjTyKeTgL8IOyyMIX945Kzu9ICLCyMqa3xdkETQ7RSrqcj7aG
	F0hhDi5HI+54gSxHx9VwkDcES5YzbZ2KwU7vtvSbfPQ9ymxIDhjAkOhD0JTeaQiujExa
	riAg==
X-Gm-Message-State: APjAAAVsGT1cYxfYkwStyKji1pyFnV1Zq22tncelQ+7jXPN8EX5V4/Rs
	B82dPH+w7aSEduiGYqBiG0IIlqMhw8kq+Q==
X-Google-Smtp-Source: APXvYqw1ztBRAEqIcPVdlMegkxOGjeMC8bSHmaP2Ieq5ZC21M1PG135Bu9x3sbJDt6NINFjZ2gfrpA==
X-Received: by 2002:a05:6830:1143:: with SMTP id
	x3mr17644438otq.19.1566211058177; 
	Mon, 19 Aug 2019 03:37:38 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
	[209.85.210.50]) by smtp.gmail.com with ESMTPSA id
	h25sm2833329oih.22.2019.08.19.03.37.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 19 Aug 2019 03:37:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f50.google.com with SMTP id g17so1209605otl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 03:37:37 -0700 (PDT)
X-Received: by 2002:a9d:7a42:: with SMTP id z2mr17880823otm.345.1566211056645; 
	Mon, 19 Aug 2019 03:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAP9ODKqnJX-fLme5JUQF8XAHr2hDzJ31auZPQGOUQCehuTb4XA@mail.gmail.com>
	<b3e14a93-8d27-c5f4-0895-8122a030d451@windriver.com>
In-Reply-To: <b3e14a93-8d27-c5f4-0895-8122a030d451@windriver.com>
Date: Mon, 19 Aug 2019 07:37:23 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqWyAG5Zigqcwi7JEgxreaGfSYgBKQG23fhHrHi81QVcQ@mail.gmail.com>
Message-ID: <CAP9ODKqWyAG5Zigqcwi7JEgxreaGfSYgBKQG23fhHrHi81QVcQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conflict of systemd and sysvinit
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
X-List-Received-Date: Mon, 19 Aug 2019 10:37:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2019 at 11:00 PM Kang Kai <Kai.Kang@windriver.com> wrote:
> On 2019/8/18 =E4=B8=8A=E5=8D=883:27, Otavio Salvador wrote:
> Would you like to give more detailed steps how the error occurred? And
> what's extra settings in you local.conf please?

I had sysvinit and systemd enabled.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

