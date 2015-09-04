Return-Path: <eu@felipetonello.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id CE59D77016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 09:05:10 +0000 (UTC)
Received: by lamp12 with SMTP id p12so9022355lam.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 02:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=DiI84axCwZ/romqYRhn2trmTa1rIExauFk517veGHS4=;
	b=X2kL9j3oWRFWDQyT6ie8SbT0snboyx96VK5Cq9zOZ7MhaWsFuje3C5Keni+U32lMYt
	XQfk2/vtA8rZLEjwXrh07gGa4uctCh/Z5Rds0TD7d82IScnlP4WaLA6Rogzv98cjgQw1
	YfTKJycRlesob88G+g4pFEAMwrYKsHd5VXQfMFTyhlSjrKDHlBVpoE/cnffrGDXIqmil
	n8+FuVXxX4YvYb7lHGS2hcfFFUnSBImMbCXMsTPlOkN8qvc+42WIi6cHyADvhlI2VqMl
	rinEbN82AkAfQIsZ1nNX+8Iq1UbycoB4YKbAtB9oRGHJYeI0c8OGqcQDUPM3skWFOEey
	xa9A==
X-Gm-Message-State: ALoCoQmEcwQdXLI/NamEewQYd8z7hfI80Bh0FBdstnzf/XPcTSIo+sOibK3iYYpKDIpP8Kjt8qVF
MIME-Version: 1.0
X-Received: by 10.152.45.69 with SMTP id k5mr2643441lam.13.1441357509722; Fri,
	04 Sep 2015 02:05:09 -0700 (PDT)
Received: by 10.25.60.193 with HTTP; Fri, 4 Sep 2015 02:05:09 -0700 (PDT)
Date: Fri, 4 Sep 2015 10:05:09 +0100
Message-ID: <CAGrhNMy9tDeSecYg3avrzem+tZt0Sh3mmOrG6J2JqBhaj-C53g@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Remove oprofileui-server
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
X-List-Received-Date: Fri, 04 Sep 2015 09:05:11 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

oprofileui-server is obsolete since it uses legacy OProfile's
'opcontrol'  commands to record a session, instead of operf. It
doesn't work on fido builds.

Anyone familiar with the code base can tell if it is too much work to
update it to use operf?

Felipe

