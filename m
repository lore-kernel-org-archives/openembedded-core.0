Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UAOob-0001yC-NT
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:59:48 +0100
Received: by mail-wi0-f171.google.com with SMTP id hn17so5209561wib.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=U8fCak/NE12ru6fnZKE02ZshZE7r44I/gRvspOU2+7s=;
	b=pSd6/tagOOQSsdDQJuQYlKRFZYwCyIMG6CVuRwv5WDJbeEOwJ+UpCxwRR440blAIet
	6ILPvSQDlziS6W7C47DBCOJgmWqnVCJf5zhFXwBlGYDouhdl68PoO4XS27tQn9hHTR4M
	L3Zr05dzXeFMxD2yJMrLz3vvC8Ee7joy+JEv5Bm2v1uOS+vqnWhgNCpYmgXFS9VUMJ6v
	rGiOtAY9x67I2hSiAH8SoJugusUoGwC+NMnUa1nYYEcp2rBRPHjNp/LtO9LIbubJyQKd
	3IpmznaPbAjB/bmXWx1QrrXjcdHhk4XxzyegtwqGmZ/JOCVCLCuDX1DQbNkc9Gv7ZRmX
	raZg==
MIME-Version: 1.0
X-Received: by 10.180.77.9 with SMTP id o9mr21207023wiw.16.1361900606516; Tue,
	26 Feb 2013 09:43:26 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Tue, 26 Feb 2013 09:43:26 -0800 (PST)
In-Reply-To: <e62df3d50df79849ea916095fd028b688b75df52.1361862860.git.liezhi.yang@windriver.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
	<e62df3d50df79849ea916095fd028b688b75df52.1361862860.git.liezhi.yang@windriver.com>
Date: Tue, 26 Feb 2013 12:43:26 -0500
Message-ID: <CAHUNapS=YynAbkmtj3NGha9vu2V_k1bDqW1gtPPe586N=shkUw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] mkdebugfs.sh: several fixes
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
X-List-Received-Date: Tue, 26 Feb 2013 17:59:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 4:24 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Fix mkdebugfs.sh:
>
>          *)
>              echo "Unknown file $FILE" 1>&2
>              ;;
>          esac

I know this doesn't come from your work, but since you're making
changes, I think it would make for a better error message if the above
said something along the lines of:

    echo "Unknown/unhandled file type '$(stat -c "%F" $FILE)' file:$FILE"


