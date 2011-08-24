Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QwJbn-0007Ne-HR
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 21:59:31 +0200
Received: by yia28 with SMTP id 28so1116135yia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 12:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Ruqa7I007cvTSmsFV3PoMqszRVmyTSFHpD0wkWBvR6A=;
	b=q6ofTDANRQwkaH3WLKG19o1X83nzggpQWzoKzABjuYTc8KzJ41b8QVc5Xxw+R3SJVK
	5Uw2OgwhWVDOVhendEehHt1Y/mVvRtzoTrkBF85sIStyNiELDbKRyOcCmeDedRNnCuOH
	d8iSYkiZaBnAQxIFY94CxVXuIL4iZtCzfsof4=
Received: by 10.236.9.106 with SMTP id 70mr32753165yhs.105.1314215684546;
	Wed, 24 Aug 2011 12:54:44 -0700 (PDT)
Received: from [172.23.8.121] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id r28sm7292yhm.24.2011.08.24.12.54.42
	(version=SSLv3 cipher=OTHER); Wed, 24 Aug 2011 12:54:43 -0700 (PDT)
Message-ID: <4E555700.1090907@gmail.com>
Date: Wed, 24 Aug 2011 12:54:40 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CABcZANn8NZYnA3dPzakgfMguaVV9EQ7isusAGMOQUQzHx_UV3w@mail.gmail.com>
In-Reply-To: <CABcZANn8NZYnA3dPzakgfMguaVV9EQ7isusAGMOQUQzHx_UV3w@mail.gmail.com>
Subject: Re: [ANNOUNCE] Devshell Usage Change
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
X-List-Received-Date: Wed, 24 Aug 2011 19:59:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/2011 12:49 PM, Chris Larson wrote:
> Saul reminded me that I never sent a proper email to let people know about the
> usability change to devshell, so only those who reviewed the commits
> know about it.
>
> In the new implementation, a single OE_TERMINAL variable controls the behavior.
>
> When using 'auto', or requesting an unsupported terminal, we attempt to spawn
> them in priority order until we get one that's available on this system (and
> in the case of the X terminals, has DISPLAY defined).  The 'none' value is

is it 'none' or 'noop' ?

> used when we're doing things like automated builds, and want to ensure that no
> terminal is *ever* spawned, under any circumstances.
>
> Current available terminals (in addition to 'noop' and 'auto'):
>
>      gnome
>      konsole
>      xterm
>      rxvt
>      screen
>
> Examples:
>
>      OE_TERMINAL = "xterm"
>      OE_TERMINAL = "noop"



