Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZfkl-0007Tz-71
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 12:03:44 +0200
Received: from mail-qa0-f49.google.com ([209.85.216.49])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 30 May 2012 02:53:23 -0700
Received: by qabj40 with SMTP id j40so2343631qab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 02:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=1ULAuV1BSO2yqmazXvy+mkkcD+kJtxJwLW/UA0E5gt0=;
	b=OIXIivXw9VabYZiD650Yv1XqVBuurBDFVSdTI6Vi8LGyRlshJllfkT7O2me8iJvk4W
	avYQuua9pAjOAwlnmyhy8YM1Yvl+sUGbfmKXO/Po+iMkqp6c/JPk2MAVatRRflX0pcwt
	lmLHjgddyv0N5yd7XFmpUTrgJafCNqyFCwNsfa7Kj8wjP+UPm1JCIl07+CnV0oREDo31
	lXLCjrXpRzrPLj1owJ6HFv0NlqhB/rDmO1Kw0h/GamaAmWsVEL1o3xTfkQSziTjoKIrc
	tP/mAM5zfvmULlQIit6fVbpl9e/nw491PvSU64cIo5O1JrES4ooCcf8/hrroREirgFSj
	nzTA==
Received: by 10.224.174.205 with SMTP id u13mr2743129qaz.57.1338371602575;
	Wed, 30 May 2012 02:53:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.53.212 with HTTP; Wed, 30 May 2012 02:53:02 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1614CE73@IRSMSX102.ger.corp.intel.com>
References: <cover.1338323483.git.ross.burton@intel.com>
	<41C46607-08A4-46F1-8572-3320B7FD2615@dominion.thruhere.net>
	<CAJTo0LaFHe1jGQLoNkS6MkHwsM58iLJiRXpSSEKo-UqNQwjJCA@mail.gmail.com>
	<002D9B74-3B1E-42A8-A355-BC33847EB54F@dominion.thruhere.net>
	<CAJTo0LazLoue3YJndWA3Jd+QyS2HBiQqWUm+o8kaZcvWQK7w7w@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB1614CE73@IRSMSX102.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 May 2012 10:53:02 +0100
Message-ID: <CAJTo0LZd33YnV5xGeQxUn5ufOgsvN8fhjHxPudGQNbKO_2Dw=Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkFV+SqpENy7E2SZ3F+HdpuSc/qfwA4yMr+IxU/ad9WOvY8hVv09wJqgU95rfBY0/J2Cr+u
Subject: Re: [PATCH 0/4] Upgrade connman to 1.0
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
X-List-Received-Date: Wed, 30 May 2012 10:03:44 -0000
Content-Type: text/plain; charset=UTF-8

On 30 May 2012 04:53, Iorga, Cristian <cristian.iorga@intel.com> wrote:
> Hi Ross,
>
> As far as I have seen from the code, between the previous version of connman and version 1.0, the way the default connection is set has changed.
>
> Right now, the default connection is established through an external file.
> Before 1.0, the default connection was established via the code (and a patch was added in the recipe against this, and it needs to be adapted).

With 1.0, if there is no global configuration the technology is
enabled if ethernet, otherwise disabled.

Ross


