Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWAC4-0006H1-Hj
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 18:40:52 +0200
Received: by bwz5 with SMTP id 5so4568558bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 09:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=0PYJ40q5T0HHpIluKpFWs5lBTqnU+V7w5ZvrgEgA7sQ=;
	b=h7GFU4sBPQOZVTwO3ipxUjdH5XWOgTeTUGyqv33V1a/u5dH1aGG7+UysSP7SRy8J97
	4aNGZ9jmd50650DnBzDzkMhQKV9barSyLf+O4FM0/D0J57TDbBeku/hbRc/lYWVoAGMa
	XhvLHhnkZYq/B9ktgRTgh8oADNThoUEDzDMQw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=CaH0CCyb8cYP2CINQGfXVhDmKeZ+Ce3uYLDBZkCwY8TFMVziRQ+RcnBYG4dM0U760R
	Wvmb+DSfF0KqXAApzyIfhBYKb97xv+lDFGUd+Z6RlGCfTLxq8U+77j2UEpaQpac7G+fJ
	cAPItHitqhx6BYd3ChUIMh/HahgaSBm03z6B8=
MIME-Version: 1.0
Received: by 10.204.74.9 with SMTP id s9mr2239236bkj.184.1307983048076; Mon,
	13 Jun 2011 09:37:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Mon, 13 Jun 2011 09:37:28 -0700 (PDT)
In-Reply-To: <201106131700.37382.paul.eggleton@intel.com>
References: <33AB447FBD802F4E932063B962385B3554AE4989@shsmsx501.ccr.corp.intel.com>
	<BANLkTikZxd4Gg0b0nanMupmdYBf-3LUp7g@mail.gmail.com>
	<201106131700.37382.paul.eggleton@intel.com>
Date: Mon, 13 Jun 2011 16:37:28 +0000
X-Google-Sender-Auth: nw17i-gs1dBVgd47osyHkqIez4w
Message-ID: <BANLkTikCsx_dWk85Cih3cdFox6-vudWYHg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] RFC - combo layer repo tool
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
X-List-Received-Date: Mon, 13 Jun 2011 16:40:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2011 at 16:00, Paul Eggleton <paul.eggleton@intel.com> wrot=
e:
> On Monday 13 June 2011 16:33:47 Otavio Salvador wrote:
>> I think it is duplicating many features of git submodule. It seems
>> more logical to put a script above git submodule rather then use a
>> full repository for it.
>
> You're right in that git submodule provides a lot of these things. Howeve=
r,
> submodules don't give us the ability to split out and maintain just certa=
in
> subdirectories / files; this allows us to bring in parts of external laye=
rs
> where the parts of that layer we want are not split out neatly into a
> subdirectory.

I will give the script a try and see how it behave to us.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


