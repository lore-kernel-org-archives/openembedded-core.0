Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1Qbz94-0000DG-To
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 20:05:50 +0200
Received: by fxh10 with SMTP id 10so1668811fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 11:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=IBDh7/FCCsVJAEIRXq5CQgQIl79v0UnM5uh2na0S5rA=;
	b=RRth+m/xkHgUB9T3FFIklLTSenvERfKMF5cDusXnPIJRI9kSAyBi+pHL33DeoCfRCA
	HTOdYDWqChKel01OPLnHDL6bh/ol3gVpIcwlBgyQ019Fr6VcNNCYL/nTXzp9MlpPU/nU
	s0NZX1xfboCE8f47DX9L6cGNuKcaJX4YJvz+8=
MIME-Version: 1.0
Received: by 10.223.99.153 with SMTP id u25mr1562934fan.112.1309370527012;
	Wed, 29 Jun 2011 11:02:07 -0700 (PDT)
Sender: anders.darander@gmail.com
Received: by 10.223.111.130 with HTTP; Wed, 29 Jun 2011 11:02:06 -0700 (PDT)
In-Reply-To: <cover.1309370038.git.anders@chargestorm.se>
References: <cover.1309370038.git.anders@chargestorm.se>
Date: Wed, 29 Jun 2011 20:02:06 +0200
X-Google-Sender-Auth: iAUSoHfYjVBgalRLw3tq2M5ajPQ
Message-ID: <BANLkTi=9ngg0yFnggOKLuccsdA7jTwTaZw@mail.gmail.com>
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Subject: Re: [RFC v3 PATCH 0/9] Linux 3.0 build support
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
X-List-Received-Date: Wed, 29 Jun 2011 18:05:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 29, 2011 at 19:54, Anders Darander <anders@chargestorm.se> wrote:
>
> v3: - task-base.bb: fix a problem that *pcmia26 couldn't be found.

This third version fixes a bug introduced in v2. (task-base-pcmcia26
weren't found). The fix is incorporated in patch 0008 (task-base).

Sofar, I've only got positive feedback on v2. (some feedback off-list
(including some that probably should have been on-list if it hadn't
been for some gmane problems).

Unless I find some more problems, or get such reports, I plan to send
a pull request towards the end of this week.

Regards,
Anders


