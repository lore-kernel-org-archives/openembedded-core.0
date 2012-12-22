Received: from mail-ob0-f177.google.com ([209.85.214.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TmDPm-0004Bh-7A
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Dec 2012 01:58:10 +0100
Received: by mail-ob0-f177.google.com with SMTP id uo13so5069029obb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 16:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=/+hcUm4PwXPvKfYYYpTH3F/4TtgRYotbcD2YsLMpEEk=;
	b=ewTPx/0k8eLvLf4vi7oICbPMDDQox+ARRHptxNP8cOauSzbC7io6PD6Eth0szdDMWk
	bLTe221LIvy467dQ2Kjuw54znosi2qcq9741nTy7EOeat2UCrxhRZFydrY13WzrNybkK
	oFiniqR7XMmNWWIxtUk0qHM8xa/dHlCobH4bvTlGXSu9BNt2wbLLCdyh11oH7XzBxwtm
	CrPKqaZpZnIV5DuVYuIMaSW4wjVEnUWwfRfvaIPgg45QP2kwFfp1It7qsTW6Y2rsV/yZ
	ZQDO73uwu9VpwhLQYi6y+J8/Un5cNzqVTPb+bpDmgY37iiLZrM9ygplp69B5d/dxZua/
	kq0A==
MIME-Version: 1.0
Received: by 10.60.1.42 with SMTP id 10mr1021430oej.125.1356137003154; Fri, 21
	Dec 2012 16:43:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Fri, 21 Dec 2012 16:43:22 -0800 (PST)
In-Reply-To: <CAJTo0Lb0AyeZwC6R4M+YjzGxm21d4Q-goSMQ1x0EMAFvCtO6iA@mail.gmail.com>
References: <cover.1356022882.git.radu.moisan@intel.com>
	<50D38B3E.30003@linux.intel.com> <50D42D58.4010703@intel.com>
	<CAJTo0Lb0AyeZwC6R4M+YjzGxm21d4Q-goSMQ1x0EMAFvCtO6iA@mail.gmail.com>
Date: Fri, 21 Dec 2012 22:43:22 -0200
X-Google-Sender-Auth: G6gtBRppcZYk-jSRCbIgTZPykts
Message-ID: <CAP9ODKq=JF3JnjQ-rjxBFQbYEPpRhftDaY0NjcmTpseUVKOg-Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/28][RFC] systemd Integration
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
X-List-Received-Date: Sat, 22 Dec 2012 00:58:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 21, 2012 at 10:15 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 21 December 2012 09:35, Radu Moisan <radu.moisan@intel.com> wrote:
>> Wouldn't it be harder to review? I can do it anytime, if you think it is the
>> right way to go.
>
> It's much harder to review a patch which has corrections later.

Sorry but it is not clear what you mean; do you prefer him to squash
all changes in a single patch or have an initial patch and queue
patches above this with the fixes?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


