Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Swsfs-0004RR-Jd
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 12:30:36 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 03:18:41 -0700
Received: by yhpp61 with SMTP id p61so7537973yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 03:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=XhsqKHlBBC5jA2xAZXsjfUuIoQP4adnGUJwwbUI/9wI=;
	b=lPwxJ+jCuU9byDKwhbtEKK952zn/rW379zUypgO1ChC0JtNePi2b27WNCsWremnUue
	5oOJrIyRXEsTlFv7vQDHfkRTxDjC43tKLguxdF6SIpUfzWdNBTjrGsEwY4DGoal7HrMW
	wc/oh+fzbGjRNu5anKIE6CYhMMx5IK1ZthYkz/oAwUpAIXGGQ0nw0G8tao+yEYO2QMVD
	TgN3VBdYTf5ddMcmyKFRJAJNJJUNBoZURobAwslKT+aBU0x0aXJ+Q+7FjJB4cUdzZnb8
	pqW5ct7u6gmCpjyLOv3AO7QHLIN3s1frM1xN9FdrawmxDPa/G779NnkNW5KNNN65Pd8Z
	ft6A==
Received: by 10.43.92.71 with SMTP id bp7mr3212544icc.52.1343902720269; Thu,
	02 Aug 2012 03:18:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Thu, 2 Aug 2012 03:18:20 -0700 (PDT)
In-Reply-To: <db2dd38ac0b16d55f729f63010e38dda4dcfced5.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
	<db2dd38ac0b16d55f729f63010e38dda4dcfced5.1343899228.git.paul.eggleton@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Aug 2012 11:18:20 +0100
Message-ID: <CAJTo0LZ7QJtfzmsg2a++ay8YoNOptRFohWwQrKNT0JrHYkYRbw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkdpd7Ok6oKnimhKf65kg09w2+U77n49ZVsS2VTc0OhdznP9koxZL5FqlP6q4v0zTOf8cdc
Subject: Re: [PATCH 6/9] scripts: add buildhistory-tag script
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
X-List-Received-Date: Thu, 02 Aug 2012 10:30:36 -0000
Content-Type: text/plain; charset=UTF-8

On 2 August 2012 10:23, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> This trivial script determines BUILDHISTORY_DIR using bitbake and then
> passes the command line options to "git tag" on the buildhistory
> repository. This is useful for setting a tag before making some changes;
> even if the build takes a number of executions of bitbake (resulting in
> multiple commits to the buildhistory repository) you can still do the
> overall comparison easily.
>
> Suggested by Ross Burton <ross.burton@intel.com>.

I've since changed my local script to be "buildhistory" that just runs
git "$@", so "buildhistory log" etc work nicely.

Ross


