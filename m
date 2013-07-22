Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9BC61EEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 13:44:34 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id g12so8887343oah.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=W7sOYh9ISLLkJI5SYuA+pIsIfp4xwg2oWY/z2hl4g4E=;
	b=uhL5lenvxY1KLXuitB6mVWXdXBIlRhuUFOm0U7ZBAD4ouJ4z1ZDL9opou52ElmRxdy
	vQe5nutLqNAcxxIetnIhxxITUDg3I6RAtJFG+lbbct7GkxWxaBC5kZ+xGMCPQBboXHf0
	wclYQwNghuBNHDVBljdA7Zi5vYZEWstppnfrBPjNXrnIyguFLCxlgsEshv7ki67Zly/t
	Ze6O/oIS6SzsnWzN+1FjAT2ZGtroVGELV0JAAzjzSHNZr7HTC5Cryo8lwnSoIr0R6Yzg
	AocxZcRIIdTAN1kTyasCi8XXVaVIoCPTlg40d1OYO3x+N4gE92qDfOhe+NEIuwLC9w5y
	fhfQ==
MIME-Version: 1.0
X-Received: by 10.182.27.74 with SMTP id r10mr20605445obg.63.1374500674739;
	Mon, 22 Jul 2013 06:44:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Mon, 22 Jul 2013 06:44:34 -0700 (PDT)
In-Reply-To: <1374496759.6719.88.camel@bril0118.bri.st.com>
References: <CAP9ODKoHGqwBXZVbEAtMgig=x6RVud1ZWo2oXFPcD8gUyqiVCg@mail.gmail.com>
	<1374496199.6719.87.camel@bril0118.bri.st.com>
	<CAP9ODKq2JNvmkr+P9Sw6MON8u=Q96mJO-7kMHTPzN=NVC8vOzA@mail.gmail.com>
	<1374496759.6719.88.camel@bril0118.bri.st.com>
Date: Mon, 22 Jul 2013 10:44:34 -0300
X-Google-Sender-Auth: UwDsA7OWJ8BRpFMOPBK6YDfHU4k
Message-ID: <CAP9ODKpUSf2utLa1tU5yYrH+ovadL_0fKUsApfERCyOWAy7Lsg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Andr=E9_Draszik?= <andre.draszik@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Handle of kernels which need dtc_cpp use
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
X-List-Received-Date: Mon, 22 Jul 2013 13:44:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2013 at 9:39 AM, Andr=E9 Draszik <andre.draszik@linaro.org>=
 wrote:
> Attached, but untested, as I'm not in a position to test master at the
> moment.

If I change the machine to have the filename.dtb, without the
fullpath, it works fine.

Can you send this for review? I think it'd be good to have more
feedback on this.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

