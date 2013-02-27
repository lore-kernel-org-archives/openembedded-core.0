Received: from mail-ve0-f174.google.com ([209.85.128.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAhdT-0002oA-SO
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:06:43 +0100
Received: by mail-ve0-f174.google.com with SMTP id pb11so566057veb.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 05:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=3PMt2zp/nC96Z+FN9BqQJtpjoleuZ0Aucgf72ixxgp0=;
	b=AStbzq9jZ3Hfm0iVLyhe6n0DqSd3xsKNcLmDBuKIXoH+6DZJyl5iBxgp9Nb321mIOz
	FMOsitdgIVHOXU0pRMs9PoC8xqPxaV1GcBYl3ZuTPus+PIoJMd15pICvKWlT0Cgcwbwk
	01hlRCuzWT9oMBQhzKClYTofRpY2K7hT5ABhwJhTuDMTkUYf1wZM7CezdI8neIZgsejh
	XMBYJqCkgQiu9hxva99IvEcfPzENOL5/gtlwjYgBvtbvPrLxWg5bk9RV3DjIGMsB0SCi
	myC1dvPYQGFteXCWsiYWGQ5TvhJrp1VzCjD5dqwVPd3uag9hRIfnkHEOlh0JIwXfDIX6
	xyLw==
X-Received: by 10.52.91.39 with SMTP id cb7mr774803vdb.71.1361972950919; Wed,
	27 Feb 2013 05:49:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Wed, 27 Feb 2013 05:48:50 -0800 (PST)
In-Reply-To: <512CEFBE.4010901@digi.com>
References: <1361372957-38860-1-git-send-email-javier.viguera@digi.com>
	<512CEFBE.4010901@digi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 13:48:50 +0000
Message-ID: <CAJTo0LZAswRvvPvYchc2m-M0N1JA-6c0v30QzBKumyi5pCkf5Q@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
X-Gm-Message-State: ALoCoQnBazmMTMsVZbkH6Iou/teCgGpNOzomKe2ldDfeN7+oOM4iM9d/O2e3uaXD1RFlomx/ud85
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: fix 'dash' expanding '\n'
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
X-List-Received-Date: Wed, 27 Feb 2013 14:06:44 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 17:24, Javier Viguera <javier.viguera@digi.com> wrote:
> Any chance that this patch gets cherry-picked to 'danny' on
> openembedded-core and poky repos?

Integrated into the danny-next branch but unless the current 1.3.1 RC
goes terribly wrong this will have to wait until 1.3.2.

Ross


