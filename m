Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RSSgO-0000FV-OF
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 13:09:08 +0100
Received: by faat2 with SMTP id t2so5910928faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 04:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=XgKEsUJAvxxP7KG2Kl+QVjFVs/AWq2LrPsaDfA4bVAQ=;
	b=GpK6/ZHD6+0fHyAlzgeMNSb1Iflls5EamTdLJn+WkvHbd8e95p7mfY8Tkq2HL/eEMb
	iqIHCYmuZWP08oDnD4oJrlhTPzZDqoVWgfBHcmz73LsGt+NTIeQ9LlUIaRrjeOqalsZO
	boSnZtOjESI0OE2A5eK2rMfpu3Bu7WvEKLEPE=
MIME-Version: 1.0
Received: by 10.205.118.14 with SMTP id fo14mr14234308bkc.63.1321876959170;
	Mon, 21 Nov 2011 04:02:39 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.26.143 with HTTP; Mon, 21 Nov 2011 04:02:39 -0800 (PST)
In-Reply-To: <2673505.vfujBTNCRF@helios>
References: <cover.1321628513.git.paul.eggleton@linux.intel.com>
	<1707586.L5PGoRtkiK@helios>
	<CAP9ODKqe8r=PH=uRSo019drokB5qwPVHPrdBcnYWSJ82AkPqBQ@mail.gmail.com>
	<2673505.vfujBTNCRF@helios>
Date: Mon, 21 Nov 2011 10:02:39 -0200
X-Google-Sender-Auth: 1Xaai4nohy7nnSfZAAMa7uyYBOM
Message-ID: <CAP9ODKonPsF1J6cfyhX_oQQYEn4QrHjMPoyj0ZnD6wsSyEiXVA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/1] qt4: disable pulseaudio
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
X-List-Received-Date: Mon, 21 Nov 2011 12:09:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2011 at 09:46, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Saturday 19 November 2011 12:55:04 Otavio Salvador wrote:
>> I think this needs to be a distro option, not enforced.
>>
>> I agree this needs to be explicitly added or removed but I'd like it
>> to be optional ... many embedded systems now depends on pulseaudio and
>> if one is using it, phonon ought to use it too.
>
> So, is this a DISTRO_FEATURE? Or do we use PACKAGECONFIG?

I'd say it is a distro feature.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


