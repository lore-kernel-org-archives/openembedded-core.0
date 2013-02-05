Received: from mail-ob0-f171.google.com ([209.85.214.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2oSQ-00056P-Io
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 20:45:32 +0100
Received: by mail-ob0-f171.google.com with SMTP id x4so444958obh.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 11:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=tMoP8JSrFGOHOhUEidyFNPG/5NtVzK+cpMzAfr1RNJ4=;
	b=vpIQ4rRbp7HdEt8i3c4vZkkoLVY9tztTgPtNlaSFC+sApe55x2N6N6UxRJPhS3Epge
	VhvADxct7HmSZFEDWdSRSl2y82Hj6btLEHckLFln/fxjX0CxrF1QS6avKXnGDXRghHpJ
	t3Lfl8YpDH3l45JT1CUujFGBNrJqkBXvjfyqYTe9YwwxxvcOmEN2LDf3rBrOplkgqbe5
	gN0Xtv5Jprz97665yV7C9JcSTlGzwnDD14VDFBq1FOuv4RglLNXruOGD6Yx9JiNPFxIt
	rhO6WsoiDhrNwU8Fr7ZFTCGlFmalMzlee+OEPCaNhr0eSQjWT0SEXaJrbujNFaBuazsd
	wCCg==
MIME-Version: 1.0
X-Received: by 10.60.28.8 with SMTP id x8mr9745030oeg.40.1360092580196; Tue,
	05 Feb 2013 11:29:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 5 Feb 2013 11:29:39 -0800 (PST)
In-Reply-To: <51115B09.9090607@linux.intel.com>
References: <cover.1360059615.git.dvhart@linux.intel.com>
	<41381da878685b601c62d446795c38119f08941b.1360059615.git.dvhart@linux.intel.com>
	<ly7gmn57tl.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51113140.5050600@linux.intel.com>
	<lytxpq4t0n.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<511144EC.1030704@linux.intel.com>
	<CAP9ODKr1qz6=k7xC84h0Try0HsydDhNyERPzuW-FhuaLRbYajQ@mail.gmail.com>
	<lyhalq4lz0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51115B09.9090607@linux.intel.com>
Date: Tue, 5 Feb 2013 17:29:39 -0200
X-Google-Sender-Auth: U3AKK4c3TvenkBeLLpcBFuEQu8Q
Message-ID: <CAP9ODKpQ0xVrdBZ-ExmHwfgYsWTZJFHphGGA8VAC7eQjSmKA1Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Darren Hart <public-dvhart-VuQAYsv1563Yd54FQh9/CA@plane.gmane.org>
Subject: Re: [PATCH 7/8] oe-git-proxy.sh: Add a new comprehensive git proxy script
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
X-List-Received-Date: Tue, 05 Feb 2013 19:45:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 5:18 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>
> On 02/05/2013 11:08 AM, Enrico Scholz wrote:
>> Otavio Salvador <otavio@ossystems.com.br> writes:
>>
>>> Please give it a try in dash as well.
>>
>> fwiw, what's the point in writing such scripts plain sh?  I guess. every
>> machine where this script is running has /bin/bash and performance is
>> not critical for it. Using '#! /bin/bash' shebang fixes the problem
>> where sh is non bash.
>>
>> Some constructs in the scripts can be expressed mor efficiently in bash
>> (e.g. the '... | sed' statements, or using arrays for the arguments).
>
> Indeed, in fact I had to remove the bash parameter expansions
> (substrings, etc) I had in my original script in order to make it
> dash-able. I hate dash and personally find it to be completely
> pointless, but for better or worse, people like it and there is an
> expectation that scripts run in both dash and bash in OE-core.
>
> If RP tells me a #!/bin/bash is acceptable, I'll restore the bashisms in
> a heartbeat.

Please drop the .sh than; I'd promptly call it as:

sh oe-git-proxy.sh

And in my system /bin/sh is dash.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


