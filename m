Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UN5Y6-0000jg-MT
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 20:03:10 +0200
Received: by mail-oa0-f51.google.com with SMTP id g12so649965oah.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 10:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=nx150IvVrhlYwokIW+iKmO6dU6wuvUyBVAPH1ZhB5Os=;
	b=OweEnrL8HVWEaK+q4z4gJhNOj7gFSx0f3hOH+PHzIgiJNyDuikaHH+rpAnSt4RPpeU
	gq1nrkOJ53J/v8AGK/lcIJU/1zUVDsCe9mBdLyb2wN5eqyby6nvUc3x/87RDBbOh5yyY
	0dklldVBs5efQEMalA1caJq3mTjjXzmp8li/GQM7Y52b+UdWgITlaHvVuaw8w1BN2orP
	K4UOUqVvCjXKgHDQF8UJtAzADLl/cgp53MvLW6D+KTR/Jhv1Q/sCXz/2gt8oa+ORvkSg
	GgYzY3+hdRTtCGH13mdv1eVyyA6NApW8CkWJ/uGUAbu3GIdx4p9vYr5LlDtGx9WuCAce
	E33w==
MIME-Version: 1.0
X-Received: by 10.60.19.129 with SMTP id f1mr5742809oee.82.1364924760156; Tue,
	02 Apr 2013 10:46:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 2 Apr 2013 10:46:00 -0700 (PDT)
In-Reply-To: <515B004C.8060202@intel.com>
References: <1363140541-13440-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
	<969F26A8BAB325438E7EB80D3C3134FB16216497@IRSMSX102.ger.corp.intel.com>
	<CABMQnVKVnoMH1B1Ri-Qmjec30BFX1TaosGq0b1Hc641m3490hA@mail.gmail.com>
	<CAHUNapSwkvRWD13RK_x2cu-1Q9CdYSKhw9OQFcek7vYjR0UFfA@mail.gmail.com>
	<515B004C.8060202@intel.com>
Date: Tue, 2 Apr 2013 14:46:00 -0300
X-Google-Sender-Auth: DMRFaMpKnUedF8E4cI4WWBAOiO8
Message-ID: <CAP9ODKrY08krCHWiL+5C4+2o4oE1-GnVbECBq4yhUvi0y3unJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <saul.wold@intel.com>,
	Rogerio Nunes <rogerio.nunes@freescale.com>
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: Update autotools.patch
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
X-List-Received-Date: Tue, 02 Apr 2013 18:03:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 2, 2013 at 12:59 PM, Saul Wold <saul.wold@intel.com> wrote:
> On 03/29/2013 06:18 AM, Trevor Woerner wrote:
>>
>> I'm seeing this exact same error when I perform a "bitbake world", and
>> have been for the last couple days
>>
> I believe this is a real problem, and I suggested to Nobuhiro that using
> PACKAGECONFIG with gtk+ would be a better solution, but have not see a
> follow-up patch for this.
>
> Patches welcome!

Rogerio (added to Cc) was working in a patch for this; I think he
should have it ready for submitting it soon.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


