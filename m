Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U9tZe-0000cL-F5
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 09:38:27 +0100
Received: by mail-ve0-f172.google.com with SMTP id cz11so2023691veb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 00:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=GjRzB/NmyJBYCWVTnisOeh88Cpz1iTtRH9ywH/iVhtU=;
	b=lnIX16x57LZ0VGsNAutO1AbIYPf5kW6ziO+Ffie8CIKuWNi/LOvTFAn0KwrTVD0L1f
	bC4nM0FQGS0AlOew0cDtiT1LuSO2i4GIcV1rqp1oy12RRdhnvQq0lh+3kL23iQuSAJJh
	2+eZuSD18gbHx5E/RXp82I/hBDz9Nl4KBa99mEwxK+Kj0RWX0fH9KMrslao+QDU9vv8f
	ncfuJYMTKfnHW7OvGQbXAnF7En1WoWpAlv/ipkYNSRRZyIrSH0Ha/M6k6A67k7fTe0j9
	i5uqFKf/2zORhMH0E6cr3ORenG9m/9r+enNKjsxbrJF5S2N2W8PvtKGs0Emrko1lNAdv
	VdhQ==
X-Received: by 10.58.220.229 with SMTP id pz5mr9809934vec.30.1361780516723;
	Mon, 25 Feb 2013 00:21:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Mon, 25 Feb 2013 00:21:36 -0800 (PST)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16205BC1@IRSMSX102.ger.corp.intel.com>
References: <1361563821-7683-1-git-send-email-cristian.iorga@intel.com>
	<7EF31BEB21E340DBAFB08ABD4321A269@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16205BC1@IRSMSX102.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Feb 2013 08:21:36 +0000
Message-ID: <CAJTo0LZwFpRa=oz_UzkJrgB1YSnKMG5-QYCPe8NY0HEoB9jJpQ@mail.gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQnvpC1x+g5+6wUIK8IwJuZ1tDZ5QoPo9SvE68DEdK5gmKNzE4iA5zRBxS4C9m6Wk43RYDok
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: enable connman client
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
X-List-Received-Date: Mon, 25 Feb 2013 08:38:27 -0000
X-List-Received-Date: Mon, 25 Feb 2013 08:38:27 -0000
Content-Type: text/plain; charset=UTF-8

Hi Cristian,

On 25 February 2013 07:18, Iorga, Cristian <cristian.iorga@intel.com> wrote:
> 1. As far as I have seen, building the connmanctl is the default, there is no --enable-client.
>         Maybe I am wrong, I have extracted this info from the documentation.

With autotools if there's a --disable-something there's always a
--enable-something (actually, --disable-something is implemented as
--enable-something=no).

> 2. Like you said, at the moment, the client executable is produced directly in the source directory, hence my install command.
>         If I understand correctly, will be the same thing if I change into build directory?

The binary is produced in the build directory, it just happens that it
is the same directory as the source directory at present.

> Also, please note that tools-test and tools-wispr use also the ${S} dir in install, so my code is in accordance to previous code (prior artwork :-) ).

Yes, lots of code is wrong. I'm slowly working through all of oe-core...

Ross


