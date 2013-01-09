Received: from mail-ia0-f182.google.com ([209.85.210.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TszQJ-0001kL-E6
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 18:26:47 +0100
Received: by mail-ia0-f182.google.com with SMTP id x2so1674042iad.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 09:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=O9EPuWN9LrOcF78yPVN26XkDzw1hF/FL7JkBB3alhqQ=;
	b=rIVF7fxSNyTBSdEJ7snJXgBsrLf1wEvZej+WofNeNiKZIcbAWCUiM8nabHKg0tmC1s
	sPxQtwQvL5ZL4fWBuNaQFyXGT7A7QN/Gmd1YQJHeudvEl5JBZUfVVu/7k8qGCcWr1qvj
	QP+XmODKfPC+YhST+wmJbBbUuCcDfaWS6BX3QQWIcdoNsYw1xv1Fc42Fcq8Mmm2q2qS+
	KOJmds71ih+hVwLnnGXratlxMajszFnycmzH1Qzp2WoBH57OVcioCeIzs3JrwQWEAJOR
	s9uhKalpBD8yYw8g/HbUKDDq/IAf38xvlgw2lJEfZs52qFguJJE3ead0NuIddOG9UBkJ
	F7Mg==
X-Received: by 10.50.184.199 with SMTP id ew7mr2341336igc.84.1357751490344;
	Wed, 09 Jan 2013 09:11:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Wed, 9 Jan 2013 09:11:00 -0800 (PST)
In-Reply-To: <50EDA000.9000505@linux.intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<50EDA000.9000505@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jan 2013 09:11:00 -0800
Message-ID: <CAMKF1spFjKYqr-w-=2nKhmVypJXNr2WHFgBE36d2RHrv-72S1w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
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
X-List-Received-Date: Wed, 09 Jan 2013 17:26:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 9, 2013 at 8:51 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> | ./.libs/libsystemd-daemon.so: undefined reference to `mq_getattr'
>> | collect2: error: ld returned 1 exit status
>> | make[2]: *** [test-daemon] Error 1
>> | rm units/console-shell.service.m4
>> src/core/org.freedesktop.systemd1.policy.in units/rescue.service.m4
>> units/console-getty.service.m4
>> | make[1]: *** [all-recursive] Error 1
>> | make: *** [all] Error 2
>> | ERROR: oe_runmake failed
>> | ERROR: Function failed: do_compile (see
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/systemd/git-r12/temp/log.do_compile.7045
>> for further information)
>> NOTE: recipe systemd-git-r12: task do_compile: Failed
>> ERROR: Task 9123
>> (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-core/systemd/systemd_git.bb,
>> do_compile) failed with exit code '1'
>
>
>
> This was with the eglibc 2.17, so I am not sure that's related or not, I
> have cc'ed Khem, since none of the other AB build systemd code this is the
> first time it's seeing it.

I dont see this error when I use systemd from meta-systemd so
something is missing here. Secondly I did see this with udev_182 which
has a fix in my eglibc series. You need same fix here too but I would
first like to find out why this is not needed in meta-systemd but
needed with this patchset.


