Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFLi6-0003I2-Od
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 10:41:31 +0100
Received: by mail-vc0-f182.google.com with SMTP id fl11so300093vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 02:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=GLkvX/ZrvpmMEs8OM1iHevEV4aRWN/O9kJYOYQAZM34=;
	b=gdHsBbmfyiet5kdUT5lSWF+md34LfZwklitk43ivPazb7q6Iay5WYHAr2CHd0+yURE
	0mwePf69DMm36+kn1BsiyN5+bHZUagRK7YClV7grIrvTqYID2QcZoD7AneRxbwsMs+e7
	Ad5Lgr/KH+iL6Yf8GzbLQP3R0DYmGrp0ywLbBH6zGaHG+HLHMfBhtqrCmvGZ3RW2wOXp
	7GAlVzGERyHMAG8xsbhhJvGNedrPYqat5l9y10bbP1oy0FioCpNPG/7i6QKaa6M0kqDr
	SQ7Rio8W7nGISep8MdSx6pN4ufiDF48tgi3pQVG1lQ9mIeM6olqDV0RlQXro/6dt+17z
	vc9Q==
X-Received: by 10.52.27.17 with SMTP id p17mr5140413vdg.0.1363080291279; Tue,
	12 Mar 2013 02:24:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Tue, 12 Mar 2013 02:24:30 -0700 (PDT)
In-Reply-To: <20130312070053.GE9724@jama.dyndns-home.com>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
	<1363010209-18220-3-git-send-email-cristian.iorga@intel.com>
	<20130312070053.GE9724@jama.dyndns-home.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Mar 2013 02:24:30 -0700
Message-ID: <CAJTo0LZtUg+fUrLd6sVfSk1gQrauyq60ukMg5jh-_kcgeaK0Lg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnPgT7dsht6stxUfgpml1vLMTNvnQ64SNudoSV0vJvM1JmxB3+cI6jmfzmNItad3dat4F3P
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] bluez5: new package for v5.3
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
X-List-Received-Date: Tue, 12 Mar 2013 09:41:34 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

On 12 March 2013 00:00, Martin Jansa <martin.jansa@gmail.com> wrote:
> And is that correct? I guess some files on target will conflict between
> bluez4 and bluez5, so how is user/distro supposed to upgrade from 4 to
> 5?

You can't just upgrade from bluez4 to bluez5 like you'd upgrade from
glib 2.10 to glib 2.12 - the API was totally rewritten and the reason
that we're maintaining both is because removing bluez4 would mean
removing bluetooth support is most of the integration points (connman
being the notable exception).

A distro upgrades from 4 to 5 when they've made the explicit decision
to do so, and changes all of their dependencies to reflect this.

Ross


