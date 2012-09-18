Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TE0ve-0005k0-1E
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 18:45:42 +0200
Received: by pbcwy7 with SMTP id wy7so323582pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=KPNUXIGtG33ivaGMu1FZe4iXtF6ln6D1rRNIiIBj+08=;
	b=fY8pYg2k1SAHe5x8haOZpbJnA6qzVJW7e7xpQ8BBhC1kGHMPfkVp+Wr2prMFPh5qwg
	ejFobCB6wRZizxZ0MjBDBNN6qfOG/hAkmL36/byZSb3K2zhgLUygLibu3F0/PhNM90eW
	leZ0wep9MydJ2TaH6I8LZFlEpBJLmyV0TkPcXmqEv9HsJ5BTO+cio7wR9Iw2lssqQE15
	Q/bf6Ont9TlMYlsCl1/5Do4n7XmN97vskdBB0XNzJs2rxvAEr8ctbukoboX0GCRnZxos
	oKqECew8EWFL04sQNwwd9hRToMEsNMHZthJCXIH2liiDRWsmEm0hGL5Sae0RQht7mksj
	CT/A==
MIME-Version: 1.0
Received: by 10.68.202.193 with SMTP id kk1mr435426pbc.136.1347985981067; Tue,
	18 Sep 2012 09:33:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Tue, 18 Sep 2012 09:33:00 -0700 (PDT)
In-Reply-To: <CAJTo0LYkBhODB+C-0p1O=ZCK2QjusORkr1MmGMVsZoaTxCwjHQ@mail.gmail.com>
References: <1347962498-756-1-git-send-email-constantinx.musca@intel.com>
	<4D914278-5082-4B59-9162-CE561159AAF7@dominion.thruhere.net>
	<20120918152216.GD3498@jama.jama.net>
	<CAP9ODKoDtFJF+m9h2YGEvgjCYGTir4xHgP==NZAB+sPgEiCJkg@mail.gmail.com>
	<CAJTo0LYkBhODB+C-0p1O=ZCK2QjusORkr1MmGMVsZoaTxCwjHQ@mail.gmail.com>
Date: Tue, 18 Sep 2012 13:33:00 -0300
X-Google-Sender-Auth: X4RKGtG_yK_EdY3XqO58765itU0
Message-ID: <CAP9ODKpBRkAUT-u-7heW=An4hiHyyLWBeCzbSxWz=gNiJEVtEw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>,
	Constantin Musca <constantinx.musca@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] netbase: split up in netbase and init-ifupdown
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
X-List-Received-Date: Tue, 18 Sep 2012 16:45:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 18, 2012 at 12:39 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 September 2012 16:31, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> It seems netbase needs to bump it's version so the RCONFLICTS can be like:
>>
>> RCONFLICTS_${PN} = "netbase (< 5.0.1)
>
> But we're not upstream for netbase -- it's downloaded from Debian.
>
> Of course it's so simple that forking it is an option.

You don't need to fork it but you can append something in the version
just for this.

You could use 5.0+yocto for example. Another option is to change epoch
and be done with it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


