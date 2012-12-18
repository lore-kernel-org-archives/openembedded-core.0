Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkwIY-0007N7-9Y
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 13:29:42 +0100
Received: from mail-vb0-f69.google.com ([209.85.212.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 18 Dec 2012 04:14:43 -0800
Received: by mail-vb0-f69.google.com with SMTP id ff20so831796vbb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 04:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=b/ld+q2Mur7IOOZfCXAHVzsxIygz/87FnmMayt3bK8g=;
	b=hOg1mf4+w5AKFDSh6042ApYQy0vUXZiJNJtUwusvg+EI6OTr87J/MPI8btVWdjD6A2
	gCGJeCa/acZrhcBKMEUQhg18eBC972nAgc9G5KyiMGfnQX1nu6CHF7EIUzrAAi9itsgW
	UWkPer3rlYT9ZfOEM2SmJbm6E2NR6oFpdVplUsI9NVDhrKdoXeqfBuILKeJWsViHBYOk
	au69SLZo5tAT7anuLUx21qjj+EUJmYC5o3G5OIopvLeTmduj2xjh29GTcoo1SHoBA7cu
	8xo15Z0MLksVirA6i/BiUbkRrpzg3gvXLIiN2IywpH1bwuEpcOe+EFwzZygvXOdmitC/
	r1Vg==
X-Received: by 10.58.221.130 with SMTP id qe2mr2716145vec.14.1355832881763;
	Tue, 18 Dec 2012 04:14:41 -0800 (PST)
Received: by 10.58.221.130 with SMTP id qe2mr2716138vec.14.1355832881708; Tue,
	18 Dec 2012 04:14:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Tue, 18 Dec 2012 04:14:20 -0800 (PST)
In-Reply-To: <1355832412-1333-1-git-send-email-laurentiu.palcu@intel.com>
References: <1355832412-1333-1-git-send-email-laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Dec 2012 12:14:20 +0000
Message-ID: <CAJTo0LZbih0w_095=2=cCOpJENkk5YrVCHT_1NTO13yZnroFsg@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQm6yGxuY6qL2TWMyMySz/ZsSioDDO+6EsD8pJXoFGfsEfr9AzOjJgKGXUNxd99alUcLqAtpVRUxnri6dHKFbCGQb32MQt4dtB5kjOLWpfJhZqOQnA0ogMp+SgYycEtyhjtN6pjc8Y6DzusDgVhDxuX8xqZmR707ogbdm91IpM6j+VJ8cQnkRnQr8xwvk+sWDZ8E5l0i
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] matchbox-session-sato: use a proper schema file
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
X-List-Received-Date: Tue, 18 Dec 2012 12:29:47 -0000
Content-Type: text/plain; charset=UTF-8

On 18 December 2012 12:06, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Also, inheriting gconf.bbclass will allow for the schema registration to
> be done at do_rootfs time.
>
> [YOCTO #3603]
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


