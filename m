Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBlas-0001mk-5W
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 13:58:58 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 12 Sep 2012 04:46:24 -0700
Received: by oagn9 with SMTP id n9so908335oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 04:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=NHixnkSoLqsMlObUkuvGChAPsEj0mKI3tLlFpMAfQ9E=;
	b=THb94tZ8bUWa2SwsED4df1QyVM3OsW82IqUp7I7ldTtE8ON8GpLIMeaMddgQrb6XsN
	iHR3wKkmSafGM2OL8ia5pO+58Ev7dhnuAqVaF3vn/ouvzvaCDU4sVehHtznn1YuTb+0H
	gfJ479m6YjaR4Xs8oRSFPEsTEUBvpHCQojGOFZZThJJPCMCnFL9tSQ785+6K8OwgcJ4J
	35QyH1z18CFWKsDPQI13V3SnxiUxtCP0uqfV2atVbzjQmWcAJ5ZJqj5Pooz0yJkqozcx
	5Dp/nSuYaWTOjC/+S8kwMSYX0uIqpYzTACDTuFreN25xnefAF/cmdeyjceRb8CMGJp2X
	ctBQ==
Received: by 10.60.19.132 with SMTP id f4mr2254001oee.17.1347450382666; Wed,
	12 Sep 2012 04:46:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 12 Sep 2012 04:46:02 -0700 (PDT)
In-Reply-To: <1347391088-30390-13-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
	<1347391088-30390-13-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Sep 2012 12:46:02 +0100
Message-ID: <CAJTo0LYVeNZ5==q97TOj=Fhhznvkej9F6UiGdV1xW-se6yu_Pg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQnhnLBIyqfHfgV8c2a+qDlp9iYKEWPnR+CHpMZST7Twh+L+hI55dcYLjyoyT/R2SIkiXKWZ
Subject: Re: [RFC 13/18] libx11-trim: remove, it's the same as libx11 now
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
X-List-Received-Date: Wed, 12 Sep 2012 11:58:58 -0000
Content-Type: text/plain; charset=UTF-8

This is the only patch in the series that isn't ready for merging as
far as I'm concerned.

Are there sufficient users of libx11-trim on non-debian-renaming
systems that use package feeds to add conflicts/replaces for this?

Ross


