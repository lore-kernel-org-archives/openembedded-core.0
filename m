Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U61AZ-00037d-Og
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 16:56:24 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so1526774vbm.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 07:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=XH5kY0zHtPf1ajc/U4rBIVUeLLEU1InAiSvmbPxldW0=;
	b=k9ETWhBtvRBlwaBtCqmc2grXnaPogozjNSa1VHu4RU3AHs8+smF8yLINK7qYQNa0En
	/B4viRsqZlSXES5j4iu0y08BumSs22JPyxtnK7oG4s8Y6XshpQf0XCl33A2L/WwPq1QV
	zbaViI5Ij4uFAi3O4uhUlTMh//bqELwH1x5I0jG43geCkuRt8/ii26PTusZtJYfM1COc
	J35oxhzELRmGROzRB0NeYSpXrUPRBfjD+VKe47guDAB/Nx3jYXv+lM2Ezx56XnXqKKeE
	YqdUEYYDAM+ec2utBf0zIJRAF545ZHZCr6v+TRAHbuh3MV91ekgUy2s4PzAi7Mtbsjgv
	mazw==
X-Received: by 10.52.179.136 with SMTP id dg8mr31184694vdc.81.1360856417108;
	Thu, 14 Feb 2013 07:40:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Thu, 14 Feb 2013 07:39:57 -0800 (PST)
In-Reply-To: <B57A220D1EE1644685BA9AD5C790D20526BE046387@SOUTHSIDE.devonintlgroup.com>
References: <B57A220D1EE1644685BA9AD5C790D20526BE046387@SOUTHSIDE.devonintlgroup.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2013 15:39:57 +0000
Message-ID: <CAJTo0LYfTJh0XrEi94s4AAyXVFa6X9SPdBiEh4H7VZHr1ZVVPg@mail.gmail.com>
To: Ian Geiser <igeiser@devonit.com>
X-Gm-Message-State: ALoCoQn0EKzr6gmrP2ucJeDu5zBzcvOgfJsxBGfcU5xJ5aOk0BDOiD6m6iQoNp/pKOsN8/0WixVO
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: state of systemd in oe
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
X-List-Received-Date: Thu, 14 Feb 2013 15:56:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 February 2013 14:02, Ian Geiser <igeiser@devonit.com> wrote:
> Hey, I noticed that systemd service files are going back into the oe-core=
 layer and not always compatible with meta-oe.  What is the official policy=
 on systemd right now?  Is it supposed to be confined to the meta-oe/meta-s=
ystemd layer?  Or what cases will they be pulled in and/or duplicated in oe=
-core?  Thanks!

I'm pulling as much as makes sense into oe-core, and the meta-systemd
maintainers are doing a sterling job at keeping up with changes we've
been making in oe-core, or deleting appends that have been merged into
oe-core.

Hopefully by the time 1.4 is released meta-systemd won't exist.

Ross


