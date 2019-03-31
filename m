Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 395796011C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 20:20:01 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id d24so6635737otl.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 13:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BpaqXgYT+CNUi1+jTdupy7RjoJG4AhS1B/ga7ARD0pA=;
	b=q3kIS+ZsNGFCV3xL2yDQ8adh//d7Bt3MDBuFWp5qT37m8tnLPCBqSDhiRdJmGdxMyP
	EJFsAvgZ/SdTTBmgjbQcAO/u+I98XOT5OuV8I6CoCq1EcZWgonjCExS+jG/jm/mzugxW
	Oh2vOoPw/bRNB3yLrWo0NuP90mIOvZe/tsTB8RYo2IYL55lUWbmSRCcCmm3RWI2gyC+6
	QJcb7Q2Dzv/ui1Rl8G3gvVHAOLWRc3/9fMgoFilcFUy6BTk0WkMOCzDfRvLqNyI6dI4A
	f+cyoOg1BUi+QLvsdx3GGNkxPI+ramUueVpE2yof0va2vaz/lAaCB9oT4W4Z5EU/Pmul
	OgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BpaqXgYT+CNUi1+jTdupy7RjoJG4AhS1B/ga7ARD0pA=;
	b=gf3D05kPDtb/z24OGeMFyLG4a+KbnVkDfBZ4DkEeVTF7jcOXfqJ2EqiaBJQ0rCFTU2
	25nppe4kI3bosQjWtgVDwZxOAP/it2vQDFw3aQy/g27qwf7vNCDZFEE+kvSc50uW2JXS
	5XN+bCHKClJhf0RCw+RX8qbzp79x7WSE4+DvN++8+OjeV/Z9ppWyTej/6DAjEwq3ATb/
	/aHVaNRaYxcbSwcARu4OHGYyvQemBbs7Rl+ucs2bxaUy5VyOeixHvXuYXAzrDxn7Rar7
	mT/ZevrNzupYSV+J2Dxvyx9RKBX9XNTHmEcqpAhdvBazqKInlravJvINbOT+Pe/R+Re6
	jDOA==
X-Gm-Message-State: APjAAAW2+iLewoD/gXnaXEZ/TY6A6YR58t1Gk6sfUhONl6b32nwpeGJ9
	qYxUzvMoIMgrTL7nSGFs1JyU3iTZ976l6Nib4f/tpDHz
X-Google-Smtp-Source: APXvYqwl4hDRIlrL21e79Dy3OXzbgvkgAWAKziwUVWMcwg/2RZkli9+8rR7ks9Acnohq2nnDL8toZATkfUWP9Icnc+0=
X-Received: by 2002:a9d:4a9c:: with SMTP id i28mr27212256otf.326.1554063603049;
	Sun, 31 Mar 2019 13:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190331155012.3085-1-open.source@oleksandr-kravchuk.com>
	<20190331201141.GH18421@bill-the-cat>
In-Reply-To: <20190331201141.GH18421@bill-the-cat>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 31 Mar 2019 22:19:51 +0200
Message-ID: <CANNYZj9QeaLU8AC03CmtczcVJ_jbuaL7gQEQ6HQVnDB82z+taw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH v2] vim: update to 8.1.1097
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
X-List-Received-Date: Sun, 31 Mar 2019 20:20:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 Mar 2019 at 22:12, Tom Rini <trini@konsulko.com> wrote:
> Looks better, thanks.  Is there a particular fix / change you're doing
> this for?  I ask since every commit is a version bump we might want to
> set a guideline of once a month or so for bumping vim to the latest.

It's a bit insane upstream is doing that.
Should we set PV to something like PV = "8.1+git${SRCPV}"? That way
devtool/AUH/RRS will not be reporting a new version for each commit,
and will only do that when 8.2 is out.

Alex

