Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJsRQ-0000tc-R2
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 21:17:56 +0200
Received: by wwb17 with SMTP id 17so6000414wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=i+hihtaAUHgSrstf565ctTVGxV3Spp7xiA4jNk5Hf7k=;
	b=a60UGt16Z9z2/yZMd0bbs/aLKDM8VqNEZInZ4tvZF8yKCGqQn6yByZjniD8uW4ZPH7
	kYBq9CgUoYIPm/7p8STZBGswkhY2Vq4EsXHZxoNE0LartG8FpVYUuvMqaBBVj2W6olDn
	9uhomIdg38tbVR+Wf2PIolweKSy1jPwK/rpd8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=fi4myiEBclajUJoZtX0ORJu+tj0aB2qVnoKgDia8d86Vkc2rnuwPFTsKy+0jmDejBs
	escv65MILdET5V6Y1papNry84Xao+UWfxqYtcbtxRZH441/E9ekyrdYQauPkPn08whsz
	qCy3tDJvA1DgMIy3TCIGVfnDwcE2TpEbYNnMU=
MIME-Version: 1.0
Received: by 10.216.232.8 with SMTP id m8mr1785603weq.22.1305054910477; Tue,
	10 May 2011 12:15:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Tue, 10 May 2011 12:15:10 -0700 (PDT)
In-Reply-To: <1305054238.30391.283.camel@rex>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
	<4DC8CA7E.4020302@linux.intel.com>
	<BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>
	<4DC97D27.9080602@linux.intel.com>
	<20110510181314.GF3673@jama.jama.net> <4DC98507.6070103@mentor.com>
	<1305054238.30391.283.camel@rex>
Date: Tue, 10 May 2011 16:15:10 -0300
X-Google-Sender-Auth: HfusVmpPZ7tj-6qcuKOaaYI6EL0
Message-ID: <BANLkTinT7bN=-QfQg24GtrOaRW4U3vv-zQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Pull request with misc changes
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
X-List-Received-Date: Tue, 10 May 2011 19:17:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 16:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> Hmmm. =A0I'm going to take a stab at making this a create-pull-request
>> option...
>
> Martin/Tom: Serious question - why not use the contrib repo for this?
>
> I have nightmares about all the development being spread to all the
> corners of the globe and people not being able to see what is being
> worked on. For short lived branches its not so much of a problem but as
> we take on longer lived feature development it will be a problem. I'd
> therefore like to understand why the dislike of it...

Welcome to Distribute Source Control Management World; this is the
beauty of it and I see no reason to restrict or enforce people to use
a repository.

In my personal case we have been using GitHub as a central place to
put projects that O.S. Systems is contributing and this is good to
gather us some visibility so OE will be there too.

So I won't use contrib to share patches. I can send them to mailing
list (as I have been doing). A merge on a topic branch is a git pull
command from you so I see not much problem for you or whom is doing
the pull job.

As an example:

 git checkout -b otavio-20110510-review
 git pull git://github.com/OSSystems/oe-core.git master
 git shortlog origin/master..

Is that so difficult?


--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


