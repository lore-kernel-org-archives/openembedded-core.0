Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id E576B610DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 14:07:29 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id if17so2233549vcb.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 07:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Lb2N/rs0wrkSveJe9hqekJxzdfEB/BZ6exjtwa1AF6E=;
	b=keI5wzPm5fUQrprWemCH3Gen+XDtnFUZtzEUFR5orHIXZxGqmAbgjT5Ry7C3NcF7ON
	5hp65RiNHSyUuN4FsAXV3mUNxwlVBy/qljXYjgp9XylPrYOsyP6l39wCDSMoYoqQwXsd
	YNqV+YFzL1sY27qqoS9u8g6AmzRqzbk9tQikyrFwF8dF6ZsBEHfxV5Tqz9eRhBQHdqJp
	8Pwyb2Z28oYAA8pi5VQAsz8emdEg0U++/aJSSvcoZWus59IWmW+N7t3UURhUUCHnxBOC
	uW95168nXRNQV1hJdPR5gHotYyg9nyNmtBgV0eTVIjhXYclFgikP52uZz5IYiTP5OsXk
	Eb4Q==
X-Gm-Message-State: ALoCoQl3E5fedCBkZ/Rr3ZxquzIFEAebYX1Rp9txzjKPWoHcxEiTQRebPlfoPETTdbHcEpzKikM+
X-Received: by 10.52.157.134 with SMTP id wm6mr1573026vdb.26.1379945251538;
	Mon, 23 Sep 2013 07:07:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 23 Sep 2013 07:07:11 -0700 (PDT)
In-Reply-To: <620b9a68452878b620a520e585cf806db5e8d315.1379906677.git.liezhi.yang@windriver.com>
References: <cover.1379906677.git.liezhi.yang@windriver.com>
	<620b9a68452878b620a520e585cf806db5e8d315.1379906677.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Sep 2013 15:07:11 +0100
Message-ID: <CAJTo0LZJ7AgsHe3B9QCLWL8XBuBnmCBfpe6KnaxASykfMmT44w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] telepathy-mission-control: do_compile failed (race issue)
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
X-List-Received-Date: Mon, 23 Sep 2013 14:07:30 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2013 06:54, Robert Yang <liezhi.yang@windriver.com> wrote:
> This is a race issue, the _gen/gtypes.h and _gen/gtypes-body.h may
> write(remove/rename) _gen/gtypes.tmp at the same time, then there would
> be the error.

Looks good.  Can you submit that patch against the upstream bug at
https://bugs.freedesktop.org/show_bug.cgi?id=69446 too?

Acked-By: Ross Burton <ross.burton@intel.com>

Ross

