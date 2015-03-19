Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 20F6B65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 18:40:01 +0000 (UTC)
Received: by ykek76 with SMTP id k76so31822805yke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 11:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=M+h1sJI7bnP9Y34cptM6HftKTs+cRjt+SI4OHDcQFPI=;
	b=Wj+QwGRi1WHsKs6z1ZGXUjkexYIZ7gtqywKXJx456lR2z8ND6MlZhrHpmNnongaXO6
	1Gv0LW/FzbQs9HQEkgNdqRK0ehq1EF5TwV8d9zG+vuUwxDL/WkN5bDfqIHCpgp9MCyWy
	+kCAxOqelGxfSv0nui0kv/AGVuIAUPUjZoLdaKhxgpXTs6XoMWZpGXwFNQ+MYZ6WXf4n
	5WrQ5T52ywZbGXg1fYOYaVKgaiX49t7e7kXtHCFCsLAM41669zX9EW3nC3KJNbfBhK+2
	ZCM21BT0HTK7SlRdIOsMwbgQ6D0ZOuumRM0ZENC7q3UuOc0e3DUsB7W6tzL8osWIIjY/
	fK8A==
MIME-Version: 1.0
X-Received: by 10.236.222.138 with SMTP id t10mr72090310yhp.102.1426790403199; 
	Thu, 19 Mar 2015 11:40:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Thu, 19 Mar 2015 11:40:03 -0700 (PDT)
In-Reply-To: <0beb60149642c6811c8b650bb24412ae82e0aa1d.1426758356.git.anibal.limon@linux.intel.com>
References: <cover.1426758356.git.anibal.limon@linux.intel.com>
	<0beb60149642c6811c8b650bb24412ae82e0aa1d.1426758356.git.anibal.limon@linux.intel.com>
Date: Thu, 19 Mar 2015 15:40:03 -0300
X-Google-Sender-Auth: FN7Co2ATb0RGfpXKh3zGXdCiu_w
Message-ID: <CAP9ODKoMKr5w_dtfPX7f5W_hA2ivOqM-xzqvhgx8nZNCrfq4sQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] sysvinit-inittab: Fix no tty in runlevel 1.
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
X-List-Received-Date: Thu, 19 Mar 2015 18:40:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2015 at 6:47 AM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> When switch to runlevel 1 (Single user mode), tty was not
> re-spawn and appears to be a machine hang.
>
> [YOCTO #5336]
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

