Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1S4sOR-0001D7-3v
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 12:17:23 +0100
Received: by obqv19 with SMTP id v19so6122564obq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 03:08:46 -0800 (PST)
Received-SPF: pass (google.com: domain of slapinid@gmail.com designates
	10.60.4.162 as permitted sender) client-ip=10.60.4.162; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of slapinid@gmail.com
	designates 10.60.4.162 as permitted sender)
	smtp.mail=slapinid@gmail.com;
	dkim=pass header.i=slapinid@gmail.com
Received: from mr.google.com ([10.60.4.162])
	by 10.60.4.162 with SMTP id l2mr11645970oel.3.1331032126967 (num_hops =
	1); Tue, 06 Mar 2012 03:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=pNMNBJe3gzYjojiCR0H5hljn31FlQ0w7Ph6OWsw7Bn8=;
	b=NC6Rkc8LTUZ9SgUc7e/hH8vJYyk1BnQ6Y6lPaKMLCJyXLfPhVJq939cMEQ3T6g8leF
	jg6QwaVWtlq2RJCEye6pZodVTkORGRlDLJtU6cKAawd245MicCoyo1Jv85gRQ8clLj2D
	2hBdo4Lr34nRqEBH/U0dNi0A7XUQplbIiKFwbPtpnnSFn0RtdGt3Daa5OAYU/QHwOoV0
	YrkrlfsE80OOtJY+6uu6FllwW00EqhhxcR9NfimfB5Ma009wIZO/7PtkGkoCyn0wKwdt
	ZRAXjXfpXqEgJNBkGKsdbBIBVEetZpVecLI49MdTGp2GyBWxtYIgEaXLG0Xy/VrSrgaQ
	C4fQ==
MIME-Version: 1.0
Received: by 10.60.4.162 with SMTP id l2mr9885006oel.3.1331032126859; Tue, 06
	Mar 2012 03:08:46 -0800 (PST)
Received: by 10.60.39.39 with HTTP; Tue, 6 Mar 2012 03:08:46 -0800 (PST)
Date: Tue, 6 Mar 2012 14:08:46 +0300
Message-ID: <CAFZPMoaRKkELBmd1u5SnWF5UDQiHawi9aRJFw72UqGrKLJQNHw@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: broken ncurses support for python
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2012 11:17:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

commit dd05e06b89906002f68d616a6326c962e725bc54
Author: Christopher Larson <chris_larson@mentor.com>
Date:   Tue Jan 10 13:51:18 2012 -0600

    ncurses-native: install to libdir, not base_libdir

breaks python ncurses support.

Any ideas on proper fixing? For myself I revert this locally and
everything works perfectly.
(I think .so files and .a archives should be in usr/lib while .so
can go to /lib which is not the case with current ncurses.)
so mv in do_install should be sufficient, not --libdir=${base_libdir}.

All the best,
S.


