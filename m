Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S38Zn-0002WS-9k
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 17:09:55 +0100
Received: by vcbfl13 with SMTP id fl13so598814vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 08:01:24 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.66.228 as permitted sender) client-ip=10.52.66.228; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.66.228 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.66.228])
	by 10.52.66.228 with SMTP id i4mr8883469vdt.12.1330617684842 (num_hops
	= 1); Thu, 01 Mar 2012 08:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ttDQIYvlL7hRt4uuAe8FNY4PcJjZPExO7mrdlhVv7/0=;
	b=ZeETW4xk1B/FX1eZQEnmrqWzMLvAN3QK8ygH8XRHCFngbIClkXTlcM06/05ZBYNKnF
	97qp9UdWydLoBhJq8v+Q7MHHTLXBzEx2LDwsfymdcHDIwRTeLQ+HxDh5hShNJHgdJO0g
	JTNx7MQOjbLmji8XbR20ZnqbwrbKShOIPaT9Y=
MIME-Version: 1.0
Received: by 10.52.66.228 with SMTP id i4mr7495011vdt.12.1330617684796; Thu,
	01 Mar 2012 08:01:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Thu, 1 Mar 2012 08:01:24 -0800 (PST)
In-Reply-To: <4F4F9552.8040107@mlbassoc.com>
References: <1330612994-26329-1-git-send-email-gary@mlbassoc.com>
	<1330613948.31767.12.camel@ted> <4F4F918B.4010404@mlbassoc.com>
	<4F4F9552.8040107@mlbassoc.com>
Date: Thu, 1 Mar 2012 13:01:24 -0300
X-Google-Sender-Auth: aNY7E2baLPN4xokDoxP_lyftp2c
Message-ID: <CAP9ODKrxXj4MMe7SaHo9H17Q6AwsZ6f+HuTzHkWWHhq2zJA3Tg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: Properly handle new timestamp format
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 16:09:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 1, 2012 at 12:27, Gary Thomas <gary@mlbassoc.com> wrote:
> I think the best thing would be to turn CONFIG_FEATURE_DATE_COMPAT back
> on along with my reformatting change.
>
> I can make an updated patch if you agree.

This is indeed the better solution.

Please send an updated patch in meanwhile so Richard can apply it once
he has some time and restore the right behavior.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


