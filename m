Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1T78m9-0005LM-DG
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 19:43:29 +0200
Received: by qadc11 with SMTP id c11so469708qad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=FPJz+KKNOKm/aYAEiF2tT1oOr1rlj+iUhuvH8gvxom4=;
	b=Rr894cgevfxBeJNNK9+MryPmV+eWgY+Y/1RI2rlF6UKObDGBXW0o8J25+EU84ClWF1
	KvhWzmlElJBc0oG79zGYIA1U14pDiMtN47D25aWwr6POrvzMd+QdCcJGfy+xR5T9XfVe
	GeGtvzI86sygr9e+cteUq+7IAuLkx/ppZOHZS93FUbSJr6njFIOHTc1ad/MlYkRiWZh5
	l5ITZVyOQLVbUX1u2g6tFMK4NCGz2Jj4KrBae8wh01OiWS1JkdstfSwFaVVuSc+6lM+l
	Uz6oxbAK0ZklmiWzYGyBDk841ufKZXEIpNpwS9XegqRVhRph6d/pEPmIjRv+Go2UHQC8
	dNpQ==
Received: by 10.224.189.83 with SMTP id dd19mr12700418qab.45.1346347873384;
	Thu, 30 Aug 2012 10:31:13 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id k6sm3105434qac.0.2012.08.30.10.31.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 10:31:11 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Thu, 30 Aug 2012 13:31:42 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: Saul Wold <sgw@linux.intel.com>
References: <1346340161-2649-1-git-send-email-ferlandm@sonatest.com>
	<503F9CBB.90808@linux.intel.com>
Date: Thu, 30 Aug 2012 13:31:42 -0400
In-Reply-To: <503F9CBB.90808@linux.intel.com> (Saul Wold's message of "Thu, 30
	Aug 2012 10:02:51 -0700")
Message-ID: <87ehmo8ewx.fsf@sonatest.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3] sysstat: Explicitly disable sensors support.
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
X-List-Received-Date: Thu, 30 Aug 2012 17:43:29 -0000
Content-Type: text/plain

Saul Wold <sgw@linux.intel.com> writes:

> On 08/30/2012 08:22 AM, Marc Ferland wrote:
>> Since no lmsensors recipe exists by default in oe-core, explicitly disable
>> support for it in sysstat. In my case sysstat would fail linking complaining
>> about undefined references when adding my own lmsensors recipe.
>>
>> Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
>> ---
>>   meta/recipes-extended/sysstat/sysstat.inc       |    2 ++
>>   meta/recipes-extended/sysstat/sysstat_10.0.3.bb |    2 +-
>>   2 files changed, 3 insertions(+), 1 deletions(-)
>>
> You seem to be a little behind the master branch as it's on sysstat_10.0.5
>
> Please rebase your patch to master.
>
I failed to mention that this patch is based on denzil. I will send
another patch this time for master.

BTW, what is the preferred "--subject-prefix" to use to identify where the
patch should be merge?

Marc


