Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TDLjY-0006YE-ND
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Sep 2012 22:46:28 +0200
Received: by lagv3 with SMTP id v3so3468975lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2012 13:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=FrrAsBLLT9VhQmvD8Z1alE18yHdVQ2Ql9aUe7qhMY+8=;
	b=r7+xHefrgFPLJSRUg3KNPyPWK0H18p+l8bwEgiQUNTysskI6mm0WwU1cf9yid6lhh3
	rXwk6X9WervIPv06c6t68gDNf8hGQQIL+d1AmcUorXKNo6+070hPDCP4nsMYHVXQbQ/c
	JfFzXS0QlSgurfQwZ+L9cWhkdpLEWA65Xjf0sCz8h/BzivYMGw6LzDUJnABAClVGq3TX
	0aqk06NDQTOa9/HBfspxdSbWgVkBcjDmBvoqvl8pseDbaNDaMtmTQTm9MGTNDSccPB0N
	SIc3P+LhpFH50Mh04UKEnb6GE6OkbUcEuRY8Kx8Pk9jL5vPha92B8M6dd/JPQeDWDodE
	u0kw==
Received: by 10.112.51.174 with SMTP id l14mr3280804lbo.24.1347825902074; Sun,
	16 Sep 2012 13:05:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Sun, 16 Sep 2012 13:04:41 -0700 (PDT)
In-Reply-To: <1347632702-16313-1-git-send-email-constantinx.musca@intel.com>
References: <1347632702-16313-1-git-send-email-constantinx.musca@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 16 Sep 2012 13:04:41 -0700
X-Google-Sender-Auth: WuRTSOuhNjtVLu-10h1uwiKl03k
Message-ID: <CABcZAN=_Oaeyr77A1Puem86XvX28PgZJf-pNonEO4g_=+gE8Ag@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] patch.bbclass: increase security
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
X-List-Received-Date: Sun, 16 Sep 2012 20:46:28 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 14, 2012 at 7:25 AM, Constantin Musca
<constantinx.musca@intel.com> wrote:
> -            shutil.rmtree(process_tmpdir)
> +            bb.utils.remove(process_tmpdir, True)

In the future, I'd suggest leveraging the ability to pass arguments by
name to clarify the meaning of the boolean argument:

    bb.utils.remove(process_tmpdir, recurse=True).

This makes it a bit more clear when reading the code in the future.
-- 
Christopher Larson


