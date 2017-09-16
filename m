Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2F67878525
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Sep 2017 00:06:50 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id b1so3548761qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 17:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zadgugitPXuYloeErP+cpMidf2F73XYvcX6ryOICBic=;
	b=ZOdH3QNG1qi41KyMPMBAX1SBvcnXFVvcNSpz8kR0FQh9D03tejqXAcr5u16Qs/Dohv
	TvYDVQ23tp9dzPkFoSzi+zy+V4bYYaTgi2oVutANO5WlGi8Me7XRJVgOq28j7jTw5Vav
	bfuXnEaZssD/KgXOUgM4f6cWNcAOTxXgVWCbPizd9bPIWgaur8kj6PEipAku7pUFgbPC
	Lxr4n/76Dfy/MAukraZ+esMU10nUK+ppk7hFMOz0v4Oy48VpJ2S8I2YSdbMUOVbErrlm
	XVFSvMct1QVY223JLtJwZgi5+wxl6Fg3Lsq91azFkPtwYJLBVN+sTx2N0UqjPWiUVgbQ
	eMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zadgugitPXuYloeErP+cpMidf2F73XYvcX6ryOICBic=;
	b=iwQF4v0IxyVqmwtPBkVxZswzE2ffXgvWkz8vIph+oqB0v0BQ451gtpr8OV95mHsJdM
	xFx9f0oDx2VR/amHQ6CNMGiCrW2JjfJUFDTxx1pZC/Sv+vI+pObCYvjy2utmA7Da0mLf
	Sqs4VcC5GPwqiWZ9h0ubMoC612mzeePzVMK8EPVv/eL/j6HcDFs8Bi8ji51nNiA0+G0a
	niSxlZLULNcdW9+/xh+Gz26DuZNUhkKfoh2GTkLOSBzWy7qGJTubmJk0g6KIzRnXnZwB
	yL798ImKmOq4YkmN+l6aO0+gLPSPcCjqVl3WA5Y1tncW5vm6dGsOJ2iXJFJoE+R7KDAu
	4ejg==
X-Gm-Message-State: AHPjjUhYx+p/6bKiwK7y3fOV+aEpHe5S/++y6XpUGMR8nOaJzZizErkc
	vWvSMWwao0PN+ZQ8y4n3HV+tFSxt9VgbJsR2Odk=
X-Google-Smtp-Source: AOwi7QDRznT8ge6VhZPcuXMor+VA/JNLkrunO/AzHcJcOIuMvHSZwlWDo8DqedzcnUdykEK1KJ4x17zPfzVsWF/pgw8=
X-Received: by 10.200.26.249 with SMTP id h54mr38259662qtk.41.1505520411959;
	Fri, 15 Sep 2017 17:06:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Fri, 15 Sep 2017 17:06:51 -0700 (PDT)
In-Reply-To: <bde8ed04-c337-e6ff-2ced-7997b64c6519@linux.intel.com>
References: <20170915142039.4855-1-alexander.kanavin@linux.intel.com>
	<bde8ed04-c337-e6ff-2ced-7997b64c6519@linux.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 15 Sep 2017 17:06:51 -0700
Message-ID: <CAHUNapQmRab5qoOYLiPbKapkunAfwkxUOak5PRw1bxYHvFTn_w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: use epoll API on Linux
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
X-List-Received-Date: Sat, 16 Sep 2017 00:06:51 -0000
Content-Type: text/plain; charset="UTF-8"

So, my understand is that pseudo is looking for a new maintainer.
Maybe that person has been found? ;-)

