Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBBUf-0004SI-Iw
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 22:21:38 +0200
Received: by qyk4 with SMTP id 4so1030295qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 13:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=5MDysxBWFEFqnjPjfTlBRAHg8t1EJ0W9HNHpjXFDnsg=;
	b=tCa5XPmz80Mkns2DZrB6YsJ19CHQD8ka6jcsrjPwdVITptKquA5WRWQF95s6ZwTGkB
	oVBYw4mQyMr1F10AYO41otZfmfxb1INeg7A+Mqyao0OFKKZ2PdO/pWiTNVNpIAW8AG+H
	z34W6NHDmUYuLFjbRlq9Zz65WbLiBkKZSHSbs=
Received: by 10.68.31.199 with SMTP id c7mr12505670pbi.73.1317759361082; Tue,
	04 Oct 2011 13:16:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Tue, 4 Oct 2011 13:15:31 -0700 (PDT)
In-Reply-To: <4E8B6564.4090002@balister.org>
References: <4E8B6564.4090002@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Oct 2011 13:15:31 -0700
Message-ID: <CAMKF1srfms3w3AYPL=EF-XxTEGx4B40KwE7jz8C7qiLQEcr5pg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bringing an image from OE to OE-Core
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
X-List-Received-Date: Tue, 04 Oct 2011 20:21:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 4, 2011 at 12:58 PM, Philip Balister <philip@balister.org> wrote:
> I'm about to start bringing some images I use from OE to OE-core. The first
> issue I saw is there is no task-proper-tools in oe-core (where oe-core means
> the set of layers created by the Angstrom setup scripts).
>
> Should I add task-proper-tools to meta-oe, or is there a better way to add a
> full features set of tools to an image? Basically, the image is more desktop
> like than embedded.

there are meta stuff like tools-debug, tools-sdk in oe-core. See if
you can use them
to construct your image. If it seems a common enough subset that can be used in
multiple images then you could add the task to meta-oe like we have
for task-cli-tools
but a good judgment would be appropriate.

>
> Philip
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


