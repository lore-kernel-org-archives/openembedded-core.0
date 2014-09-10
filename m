Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id D326765C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 19:13:08 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id n8so824485qaq.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 12:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=xRCSXLq6B+L20CJLsn1pi+BzV9XzYbaddMP2XBHv1cE=;
	b=d1ZNOotgAtHgYCmzvTBFKdOJGUeuBV/hnv9DD3EYoJ4BTN3jlWspWRJliva7KqGjv0
	ROYlO5T9WrISczZpywMwsy1KaW7cX9YiQc9oNIFdaCklQrP9Pt9d8UwCdsSj189r8B2x
	M9jZz2qP8PW7mx8JtvK2+hi8OFs7876gX+kdNprwe7RYEz6kbcv2qFPrgjGK/MyJE+BE
	9iFnaCM6pIh1OyqnTmP3wK987s5acgju3WsnX7/nb8c6vN8aw7a4OnjZtFYSKQjWg4Yj
	GhV6TeNIbKn5I8K9BU4iZ2zQWqdQyEsrPJo2PI5mYQvR6jVbm6cQkjfO4X43Kp7AeUXZ
	mO2Q==
X-Gm-Message-State: ALoCoQnAJqMig8lCtP/TJ29qVP7P8zMZx99ALNefnO6VAdeOcHosZzJ+LkkXrE9DHUjB99KvYju6
X-Received: by 10.224.38.10 with SMTP id z10mr64209804qad.52.1410376389110;
	Wed, 10 Sep 2014 12:13:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 10 Sep 2014 12:12:49 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Sep 2014 20:12:49 +0100
Message-ID: <CAJTo0LYNAq45aF8dQKTiufrf-grUnZtJ1K9vDGpSvAUpF0cinQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Patchwork cleanup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Sep 2014 19:13:16 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I've started running the patchwork post-receive hook manually and
marking as submitted many patches in the queue, but as there's 132
patches of patches still (down from 140-odd!) in an attempt to restore
sanity to the oe-core I think we should just mark as obsolete every
patch that was submitted before a cutoff date, say 1st January 2014.
Any thoughts?  As much as I'd love to ensure we didn't drop an
excellent patch from 2012, I'm not going to manually check all the
patches that the tool can't find automatically...

Ross

