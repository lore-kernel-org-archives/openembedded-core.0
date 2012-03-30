Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDk4u-00084l-HP
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 00:13:52 +0200
Received: by qafl39 with SMTP id l39so946585qaf.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=8W8F9+XfzQ/ZoBl/i0I6cI/cPIrryFfoYTzpHmmH9mg=;
	b=bjDnlTgdTriJNLCki4P81z00ZHPO9bOnfTkiCwxqnqn8D5m9AdPOFWxfFD0A1DGcZL
	RShNUwQhoEvLtOoI1pjRTUiCtkQIJLJhe35DPYkOqm74GSbVta7nFQasM/yu69zjxK6z
	2Sn15Oe1JnYQ/Y/+O4osNiRXXPZBLXyAmta4KjyVpsTnGqxEKvnmgNt8CgeTUl9pnL6F
	I6jm3aNUfGWYLs3dsrMZqXfNoF9J9XWJzPPCFovNZyxkLXGVxgMfIC59pZWN7J4pwsQp
	tQavKgLIkoVZWabu/LhP99bE69H2mbbAeeWcLAwgXEjoQz6KyNX1GUIuMUyFIw0OPeHG
	cr6Q==
Received: by 10.229.111.210 with SMTP id t18mr7679qcp.145.1333145087320; Fri,
	30 Mar 2012 15:04:47 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Fri, 30 Mar 2012 15:04:27 -0700 (PDT)
In-Reply-To: <025E8263-4786-499A-A57D-BF1D677452CC@dominion.thruhere.net>
References: <CABcZANnPwgsCz=f8_UhM3TZsBotBZ26FYp5Fbxjq_kYqqBs3cQ@mail.gmail.com>
	<025E8263-4786-499A-A57D-BF1D677452CC@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Mar 2012 15:04:27 -0700
X-Google-Sender-Auth: 3ZkScYAXwH89nnm9ZJwpwBoFDFk
Message-ID: <CABcZANkeOEKabbLRhgT3Qup1tnY77jhncf-4zYOfS_VzkOu_Lg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@openembedded.org
Subject: Re: [RFC] One shared state reuse solution
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
X-List-Received-Date: Fri, 30 Mar 2012 22:13:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 3:02 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Op 30 mrt. 2012, om 14:54 heeft Chris Larson het volgende geschreven:

>> I'm looking for questions, comments, testers, and in particular,
>> thoughts on whether this will meet the needs of others with similar
>> requirements (e.g. others shipping metadata with associated shared
>> state).
>
> This is not strictly related to your patchset, but has anyone thought abo=
ut license based blacklisting of sstate? I can imagine that an autobuilder =
will build everything, includes things like evil 3d drivers, but no want an=
yone to access the sstate for those builds.

Oh, that's a very good point. I hadn't considered that aspect. I
haven't seen any implementation in that regard (actually, I have no
idea how one goes about disabling sstate period -- it'd be nice if
there was an easy variable rather than having to go deleting tasks and
the like).
--=20
Christopher Larson


