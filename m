Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UT77D-0006v5-L7
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 10:56:20 +0200
Received: by mail-vc0-f177.google.com with SMTP id hr11so3507355vcb.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 01:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Y4fdkKe/U99fvNq433tfRZ+QUG6G0kfPLW1ipKPaNAo=;
	b=AnoEO6HJoAWPAJ92Bv2ne9flsk+ePmS4LwA5yExXBDVz7nZBRQdMFVqQm/qLRUnPA2
	ywJaEjUgPoPdcgtaRdWILgrGgbj/yFyL7yoOtkX79gH9JpT3Uw+579A3bR8WJaIQTYas
	+lMET34lLyRWi93hd0YHdDfcUjygnl7SqMGbWoqGo+1R3+Yt6xtQn1aOeo5l54T30xTm
	diSjatG5Qz3HbtJm89eaS2lm1aBDJiJoGmcebHBSVq05xwb7a7SjUr4vjev2MZpkNS4N
	Op9v66F1ws7aJbJAXlDkO9h0bJBuwXEg+JknZVjymRVInTt1o8fjGjW1DtUmtQ77nI2r
	qDvQ==
X-Received: by 10.52.108.10 with SMTP id hg10mr9105184vdb.34.1366360724986;
	Fri, 19 Apr 2013 01:38:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 19 Apr 2013 01:38:24 -0700 (PDT)
In-Reply-To: <6BD1F316-C3AE-41BD-B9ED-296278CEF5A7@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
	<CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
	<6BD1F316-C3AE-41BD-B9ED-296278CEF5A7@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Apr 2013 09:38:24 +0100
Message-ID: <CAJTo0LYeJwW-Lbf9bEZogCh1e97bwj7PTgFZV=3NbwN=PMWENg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlrr/YVk1kI2xd5ByZA5IGc+c5/WE3pycHVXvD6VwqhHbGYDlIxFA75Z9whF69+N0tnYlLC
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Fri, 19 Apr 2013 08:56:31 -0000
Content-Type: text/plain; charset=UTF-8

On 18 April 2013 19:45, Koen Kooi <koen@dominion.thruhere.net> wrote:
> [koen@rrMBP 1.0-r0]$ grep "configuration required on target" temp/log.do_rootfs
> gdk-pixbuf-loader-png.postinst returned 1, marking as unpacked only, configuration required on target.
...

This is "usual" for postinsts that are intercepted and handled in a
single go - scroll further down the log and you should see the package
manager running the intercept scripts (i.e. fontcaches once, gconftool
once).  I expect you'll see there that the gconftool intercept is
breaking for some reason.

Ross


