Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsyiJ-00079s-Tg
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 17:41:17 +0100
Received: from mail-qa0-f69.google.com ([209.85.216.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 08:26:01 -0800
Received: by mail-qa0-f69.google.com with SMTP id o19so2324730qap.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 08:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=h3IuoSWbD92cD/AuzC6REfMePRW2QZyFjJrQMqVBho4=;
	b=kHlnAtErkhSnsvK9M7b5Y4FjEi3QjJ+QJGkvyArXUFW56fVsUQq7dyPtrlkqYPdSwi
	5gopZHwt8nidT8AtTOeBwkvFMmpO3uM9SwNjfAxM93MLgfZbpOzk0plBX6WhAgOLGmkq
	aRFFC/xIruIV/cBw54YzYyNfbzSno1xxesvupkB298oHV1M92gr5ZG4S+8Xr33YAb2mV
	BUJgEXhlu4xBlseLIxnCe3ahMVphYii+eCCD9/bn/cPXhcfkI0yxWgW3tF4pp2latqHT
	II9/acLz6urWKn8xA0TElXnC3RT2F2HnBZx/VCSMmHF1q4jN7678LMdaYy05C0E47Hu+
	iCuw==
X-Received: by 10.220.247.136 with SMTP id mc8mr10937465vcb.44.1357748760812; 
	Wed, 09 Jan 2013 08:26:00 -0800 (PST)
Received: by 10.220.247.136 with SMTP id mc8mr10937460vcb.44.1357748760724;
	Wed, 09 Jan 2013 08:26:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Wed, 9 Jan 2013 08:25:40 -0800 (PST)
In-Reply-To: <CALbNGRTEiLQ8JkN1PvRc6k2rbuvnozP79ywYudMaUyXNViGpSg@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20121223201634.GN8988@jama.palm1.palmone.com>
	<20121224091242.GS8988@jama.palm1.palmone.com>
	<20130109132813.GJ3722@jama.palm1.palmone.com>
	<CALbNGRTEiLQ8JkN1PvRc6k2rbuvnozP79ywYudMaUyXNViGpSg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Jan 2013 16:25:40 +0000
Message-ID: <CAJTo0LZT_b4mRrYJOVJzfTzgU4-ipZhswQme-=FqFNGD6q845g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQnEnrpNQ7BUBe6FPgXyrw6ddv8W9+XsoH0dlmlyR8QZicbnG6AByypNSPEtYvhjLHemFqKzMPEsOFzNvK7vFGKzRr3LkRCO29ZREoWEiBz019Us+JuW68SCBi7ltfdutgSOK6ps/kPb/4ZYCzkmJJUNoBzXdfP1m/jvEdhDINMeM0xXl38swxjHOirqyz2YysciwF6K
Cc: openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Wed, 09 Jan 2013 16:41:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 January 2013 15:17, Andreas M=C3=BCller <schnitzeltony@googlemail.com>=
 wrote:
> 2. bitbake libnotify3 -> Tons of: 'WARNING: The recipe libnotify3 is
> trying to install files into a shared area when those files already
> exist. Those files and their manifest location are:
>    /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/lib/libnotify.a
>    Matched in manifest-overo-libnotify

The current libnotify doesn't actually depend on GTK+ 2 or GTK+ 3
(well, the tests do, but that's trivially resolved with an
upstreamable patch to add --disable-tests), so we don't need two
recipes.

Speaking of GTK+ 3, I'm about to start pushing a series to add it to oe-cor=
e.

Ross


